mad(8)          g11<1>F         g4.7<0,1,0>F    g4.3<0,1,0>F    g9<4,4,1>F { align16 1Q };
mad(8)          g17<1>F         g6.7<0,1,0>F    g6.3<0,1,0>F    g13<4,4,1>F { align16 2Q };
mad(8)          m4<1>.xyzF      g9<4,4,1>.xyzzF g6<4,4,1>.xyzzF g30<4,4,1>.xyzzF { align16 NoDDClr 1Q };
mad(8)          m3<1>F          g20<4,4,1>F     g5<4,4,1>.wF    g22<4,4,1>F { align16 1Q };
mad.le.f0.0(8)  g5<1>F          g3<4,4,1>F      g4.2<0,1,0>F    g21<4,4,1>F { align16 1Q };
mad.le.f0.0(8)  g4<1>F          g2<4,4,1>F      g6.2<0,1,0>F    g24<4,4,1>F { align16 2Q };
mad(8)          m2<1>F          g26<4,4,1>F     g10<4,4,1>F     g18<4,4,1>F { align16 2Q };
mad(8)          g5<1>F          -g3.0<0,1,0>F   g2.3<0,1,0>F    g2.0<0,1,0>F { align16 1Q };
mad(8)          g5<1>F          -g3.0<0,1,0>F   g2.3<0,1,0>F    g2.0<0,1,0>F { align16 2Q };
mad.sat(8)      m4<1>F          g26<4,4,1>F     g4.7<0,1,0>F    g10<4,4,1>F { align16 1Q };
mad.sat(8)      m4<1>.xyzF      g109<4,4,1>.xyzzF g100<4,4,1>.xyzzF g107<4,4,1>.zF { align16 NoDDClr 1Q };
mad(8)          g42<1>F         g41<4,4,1>F     g4.2<0,1,0>F    -g64.0<0,1,0>F { align16 1Q };
mad(8)          g58<1>F         -g57<4,4,1>F    g53<4,4,1>F     -g53<4,4,1>F { align16 1Q };
mad(8)          g76<1>F         -g56<4,4,1>F    -g64.1<0,1,0>F  -g53<4,4,1>F { align16 1Q };
mad.sat(8)      g44<1>F         g43<4,4,1>F     g41<4,4,1>F     g26<4,4,1>F { align16 1Q };
mad(8)          g4<1>F          g2<4,4,1>F      g6.2<0,1,0>F    -g12.0<0,1,0>F { align16 2Q };
mad(8)          g2<1>F          -g22<4,4,1>F    g14<4,4,1>F     -g14<4,4,1>F { align16 2Q };
mad(8)          g43<1>F         -g20<4,4,1>F    -g12.1<0,1,0>F  -g14<4,4,1>F { align16 2Q };
mad.sat(8)      g12<1>F         g4<4,4,1>F      g68<4,4,1>F     g14<4,4,1>F { align16 2Q };
mad(8)          m2<1>F          g11<4,4,1>F     g9<4,4,1>F      -g18.1<0,1,0>F { align16 1Q };
mad(8)          m4<1>F          g2<4,4,1>F      g15<4,4,1>F     -g64.1<0,1,0>F { align16 2Q };
mad(8)          m3<1>F          -g11.1<0,1,0>F  g2<4,4,1>F      g9<4,4,1>F { align16 1Q };
mad(8)          m3<1>.xF        g1<4,4,1>.xF    g9<4,4,1>.xF    g2<4,4,1>.xF { align16 NoDDChk 1Q };
mad(8)          g30<1>F         g44.4<0,1,0>F   -g44.5<0,1,0>F  g27<4,4,1>F { align16 1Q };
mad(8)          g2<1>F          g45.4<0,1,0>F   -g45.5<0,1,0>F  g5<4,4,1>F { align16 2Q };
mad.sat(8)      m4<1>.xyzF      -g9<4,4,1>.xyzzF g8<4,4,1>.zxyyF g6<4,4,1>.yzxxF { align16 NoDDClr 1Q };
mad(8)          g3<1>.yF        g17<4,4,1>.yF   g6<4,4,1>.xF    g19<4,4,1>.xF { align16 NoDDClr 1Q };
mad(8)          g2<1>F          -g2<4,4,1>F     (abs)g8<4,4,1>F g17.0<0,1,0>F { align16 1Q };
mad(8)          g13<1>F         -g5<4,4,1>F     (abs)g3<4,4,1>F g17.0<0,1,0>F { align16 2Q };
mad(8)          m2<1>F          -g64.0<0,1,0>F  g64.1<0,1,0>F   g10<4,4,1>F { align16 2Q };
mad(8)          g5<1>F          -g20.0<0,1,0>F  g11<4,4,1>F     (abs)g6<4,4,1>F { align16 1Q };
mad(8)          g13<1>F         g20.1<0,1,0>F   g5<4,4,1>F      (abs)g6<4,4,1>F { align16 1Q };
mad(8)          g3<1>F          -g25.0<0,1,0>F  g6<4,4,1>F      (abs)g10<4,4,1>F { align16 2Q };
mad(8)          g4<1>F          g25.1<0,1,0>F   g3<4,4,1>F      (abs)g10<4,4,1>F { align16 2Q };
mad(8)          g7<1>.zF        g79<4,4,1>.xF   g36<4,4,1>.xF   g1.3<0,1,0>F { align16 NoDDClr,NoDDChk 1Q };
mad(8)          g8<1>.wF        g92<4,4,1>.xF   g52<4,4,1>.xF   g1.3<0,1,0>F { align16 NoDDChk 1Q };
mad(8)          g5<1>.xF        -g16<4,4,1>.xF  g2.2<0,1,0>F    g1.5<0,1,0>F { align16 NoDDClr 1Q };
mad(8)          g6<1>.yF        -g23<4,4,1>.xF  g2.2<0,1,0>F    g1.0<0,1,0>F { align16 NoDDClr,NoDDChk 1Q };
mad(8)          g5<1>.zF        -g26<4,4,1>.xF  g1.6<0,1,0>F    g1.1<0,1,0>F { align16 NoDDChk 1Q };
mad.nz.f0.0(8)  g13<1>F         -g23.0<0,1,0>F  g9<4,4,1>F      g12<4,4,1>F { align16 1Q };
mad.nz.f0.0(8)  g19<1>F         -g30.0<0,1,0>F  g10<4,4,1>F     g17<4,4,1>F { align16 2Q };
