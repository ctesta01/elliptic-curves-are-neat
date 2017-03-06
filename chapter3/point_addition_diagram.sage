E = elliptic_curves.rank(3)[0]
pts = E.integral_points()
pts = [p.xy() for p in pts]
P = E.plot(thickness=5, rgbcolor=Color("#F1D4AF"), xmax=4)
P += points([pts[0], pts[3]], pointsize=150, color='brown', zorder=3)
P += points((31/9, 116/27), pointsize=150, color='brown', zorder=3)
P += points([((31/9), (-143/27))], pointsize=150, color='brown', zorder=3)
P += line([(-3.5,-1/3), (4, 14/3)], linestyle='dashed')
P += text(r' $P$', (pts[0][0]+.1, pts[0][1]-.4),horizontal_alignment='left',color='brown', fontsize=15 )
P += text(r' $Q$', (pts[3][0], pts[3][1]+.6),horizontal_alignment='left',color='brown', fontsize=15)
P += text(r'  $PQ$',(31/9+.1, 116/27-.4),horizontal_alignment='left',color='brown', fontsize=15)
P = P + line([(31/9, 7), ((31/9), -8)], linestyle='dashed')
P += text(r'  $P+Q$',(31/9+.1, -143/27),horizontal_alignment='left',color='brown', fontsize=15)
P.show()
