def ec_to_poly(E):
    # In Sage, an elliptic curve is always specified by (the coefficients
    # of) a long Weierstrass equation
    #                  y^2 + a_1 xy + a_3 y = x^3 + a_2 x^2 + a_4 x + a_6.
    # This function simply returns the corresponding polynomial

    ainvs = E.ainvs()
    var('x, y')
    polynomial = -y**2 - ainvs[0]*x*y - ainvs[2]*y + x**3 + ainvs[1]*x**2 + ainvs[3]*x + ainvs[4]
    return polynomial

    from sage.plot.line import line2d


def point_double(E, pt, n):
    '''
    Take a point pt on an elliptic curve E and multiply it by n
    '''

    # start an array for saving points
    # everything saved in pts will be cartesian (x,y) pairs
    pts = []
    all_pts = []
    all_pts.append(pt.xy())
    pts.append(pt.xy())
    pt = pt.xy()


    # plot our curve and add the first point
    P = points([pt], pointsize=150, color='brown', zorder=3)
    P += text(r"$P$", (pt[0]-.3, pt[1]), rgbcolor='brown', fontsize=15)
    E_eq = ec_to_poly(E)

    for i in xrange(n):

        new_pt = E(pts[len(pts)-1]) + E(pt)
        new_pt = new_pt.xy()
        pts.append(new_pt)
        all_pts.append(new_pt)



        new_pt_y_sols = solve(E_eq.subs(x==new_pt[0]), y)
        if len(new_pt_y_sols) > 1:
            if new_pt_y_sols[0].right_hand_side() == new_pt[1]:
                new_intermediate_pt = (new_pt[0], new_pt_y_sols[1].right_hand_side())
            else:
                new_intermediate_pt = (new_pt[0], new_pt_y_sols[0].right_hand_side())

            all_pts.append(new_intermediate_pt)
            P += line2d([new_intermediate_pt, new_pt], linestyle='dashed', color='blue', zorder=2)
            P += line2d([pts[0], new_intermediate_pt], linestyle='dashed', color='blue', zorder=2)
            # P += line2d([pts[0], new_pt], linestyle='dashed', alpha=.3)
            P += points([new_intermediate_pt], pointsize=150, color='brown', zorder=3)
        P += points([new_pt], pointsize=150, color='brown', zorder=3)
        P += text(r"%sP"%(i+2), (new_pt[0]+.3, new_pt[1]), rgbcolor='brown',fontsize=15)


    pts_x, pts_y = zip(*all_pts)
    P += E.plot(thickness=5, rgbcolor=Color("#F1D4AF"), xmin=-3.8, xmax=4.1, zorder=1)
    return P

E = elliptic_curves.rank(3)[0]
P = point_double(E, E.integral_points()[2], 3)
P.show(axes=False)
