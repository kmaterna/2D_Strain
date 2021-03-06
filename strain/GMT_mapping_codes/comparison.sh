#!/bin/bash
# GMT plotting of several strain results

range=$1
projection="M2.0i"
out_strain="second_invariant.ps"
gmt set MAP_FRAME_TYPE plain
gmt set FORMAT_GEO_MAP D

strain1="delaunay/"
strain2="gps_gridder/"
strain3="visr/"
strain4="huang/"

# Delaunay Strain
gmt makecpt -T-1/5/0.5 -Cbatlow.cpt > mycpt.cpt
gmt grdimage $strain1"I2nd.nc" -R$range -J$projection -BWeSn -Bp1.0 -Cmycpt.cpt -K > $out_strain
gmt pscoast -R$range -J$projection -Wthick,black -Df -Sgray -K -O >> $out_strain
echo "-120.8 42.3 Delaunay" | gmt pstext -R$range -J$projection -F+f15p,Helvetica-bold -N -K -O >> $out_strain
gmt psvelo $strain1"positive_eigs.txt" -Se0.003/0.68/0 -A+e+pthick,blue -Gblue -R$range -J$projection -K -O >> $out_strain
gmt psvelo $strain1"negative_eigs.txt" -Se0.003/0.68/0 -A+b+pthick,black -Gred -R$range -J$projection -K -O >> $out_strain
# Rotation
gmt makecpt -T0/300/50 -Cmagma.cpt > mycpt.cpt
gmt grdimage $strain1"rot.nc" -R$range -J$projection -BweSn -Bp1.0 -Cmycpt.cpt -X5.5 -Y0 -K -O >> $out_strain
gmt pscoast -R$range -J$projection -Wthick,black -Df -Sgray -K -O >> $out_strain
gmt psvelo $strain1"tempgps.txt" -Se0.03/0.68/0 -A+e+pthick,black -Gwhite -R$range -J$projection -K -O >> $out_strain


# Huang Strain
gmt makecpt -T-1/5/0.5 -Cbatlow.cpt > mycpt.cpt
gmt grdimage $strain4"I2nd.nc" -R$range -J$projection -BWeSn -Bp1.0 -Cmycpt.cpt -X7.0 -Y0 -K -O >> $out_strain
gmt pscoast -R$range -J$projection -Wthick,black -Df -Sgray -K -O >> $out_strain
echo "-120.8 42.3 Huang" | gmt pstext -R$range -J$projection -F+f15p,Helvetica-bold -N -K -O >> $out_strain
gmt psvelo $strain4"positive_eigs.txt" -Se0.003/0.68/0 -A+e+pthick,blue -Gblue -R$range -J$projection -K -O >> $out_strain
gmt psvelo $strain4"negative_eigs.txt" -Se0.003/0.68/0 -A+b+pthick,black -Gred -R$range -J$projection -K -O >> $out_strain
# Rotation
gmt makecpt -T0/300/50 -Cmagma.cpt > mycpt.cpt
gmt grdimage $strain4"rot.nc" -R$range -J$projection -BweSn -Bp1.0 -Cmycpt.cpt -X5.5 -Y0 -K -O >> $out_strain
gmt pscoast -R$range -J$projection -Wthick,black -Df -Sgray -K -O >> $out_strain
gmt psscale -DjTR+w4.5/0.5+o-1.1/1.5 -R$range -J$projection -B50:"Rotation":/:: -Cmycpt.cpt -K -O >> $out_strain
gmt psvelo $strain4"tempgps.txt" -Se0.03/0.68/0 -A+e+pthick,black -Gwhite -R$range -J$projection -K -O >> $out_strain


# Visr Strain
gmt makecpt -T-1/5/0.5 -Cbatlow.cpt > mycpt.cpt
gmt grdimage $strain3"I2nd.nc" -R$range -J$projection -BWeSn -Bp1.0 -Cmycpt.cpt -X-18 -Y9 -K -O >> $out_strain
gmt pscoast -R$range -J$projection -Wthick,black -Df -Sgray -K -O >> $out_strain
echo "-120.8 42.3 VISR" | gmt pstext -R$range -J$projection -F+f15p,Helvetica-bold -N -K -O >> $out_strain
gmt psvelo $strain3"positive_eigs.txt" -Se0.003/0.68/0 -A+e+pthick,blue -Gblue -R$range -J$projection -K -O >> $out_strain
gmt psvelo $strain3"negative_eigs.txt" -Se0.003/0.68/0 -A+b+pthick,black -Gred -R$range -J$projection -K -O >> $out_strain
# Rotation
gmt makecpt -T0/300/50 -Cmagma.cpt > mycpt.cpt
gmt grdimage $strain3"rot.nc" -R$range -J$projection -BweSn -Bp1.0 -Cmycpt.cpt -X5.5 -Y0 -K -O >> $out_strain
gmt pscoast -R$range -J$projection -Wthick,black -Df -Sgray -K -O >> $out_strain
gmt psvelo $strain3"tempgps.txt" -Se0.03/0.68/0 -A+e+pthick,black -Gwhite -R$range -J$projection -K -O >> $out_strain


# GPSgridder Strain
gmt makecpt -T-1/5/0.5 -Cbatlow.cpt > mycpt.cpt
gmt grdimage $strain2"I2nd.nc" -R$range -J$projection -BWeSn -Bp1.0 -Cmycpt.cpt -X7 -Y0 -K -O >> $out_strain
gmt pscoast -R$range -J$projection -Wthick,black -Df -Sgray -K -O >> $out_strain
echo "-120.8 42.3 gps_gridder" | gmt pstext -R$range -J$projection -F+f15p,Helvetica-bold -N -K -O >> $out_strain
gmt psscale -DjTR+w4.5/0.5+o-6.6/1.5 -R$range -J$projection -B1.0:"log(I2)":/:: -Cmycpt.cpt -K -O >> $out_strain
gmt psvelo $strain2"positive_eigs.txt" -Se0.003/0.68/0 -A+e+pthick,blue -Gblue -R$range -J$projection -K -O >> $out_strain
gmt psvelo $strain2"negative_eigs.txt" -Se0.003/0.68/0 -A+b+pthick,black -Gred -R$range -J$projection -K -O >> $out_strain
# Rotation
gmt makecpt -T0/300/50 -Cmagma.cpt > mycpt.cpt
gmt grdimage $strain2"rot.nc" -R$range -J$projection -BweSn -Bp1.0 -Cmycpt.cpt -X5.5 -Y0 -K -O >> $out_strain
gmt pscoast -R$range -J$projection -Wthick,black -Df -Sgray -K -O >> $out_strain
gmt psvelo $strain2"tempgps.txt" -Se0.03/0.68/0 -A+e+pthick,black -Gwhite -R$range -J$projection -K -O >> $out_strain

rm gmt.history
rm gmt.conf
rm mycpt.cpt

open $out_strain
