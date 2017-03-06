# Cusps come in many different kinds
# Here are graphs of a couple that came from Wikipedia's article on
# Singular Points of a Curve
# https://en.wikipedia.org/wiki/Singular_point_of_a_curve

# Cusp, also called a Spinode
implicit_plot(y^2 == x^3,
              (x,-.5,1.5),
              (y,-1,1),
              rgbcolor=Color("#94c7c3"),
              linewidth=15,
              frame=False,
              axes=True,
              fontsize=20)

# Crunode
implicit_plot(y^2 == x^3+x^2,
              (x,-1.1,.9),
              (y,-1,1),
              rgbcolor=Color("#F1D4AF"),
              linewidth=15,
              frame=False,
              axes=True,
              fontsize=20)

# Acnode
implicit_plot(y^2+x^2-x^3==0,
              [x,-3,5],
              (y,-4,4),
              rgbcolor=Color("#87CEEB"),
              linewidth=15,
              frame=False,
              axes=True,
              fontsize=20) + points([0,0], size=300, rgbcolor=Color("#87CEEB"))

# Tacnode
implicit_plot((x^2 + y^2 - 3*x)^2 - 4*x^2*(2-x)==0,
              (x,-1.5,3.5),
              (y,-2.5,2.5),
              rgbcolor=Color("#EF9DB6"),
              linewidth=15,
              frame=False,
              axes=True,
              fontsize=20)
