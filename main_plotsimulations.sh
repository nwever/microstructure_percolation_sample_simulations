source plot_settings


# yrange in pixels
yr=$(echo ${yrange} ${res} | awk '{print int($1/$2+0.5)}')
# where to put 0?
sl=$(echo ${res} | awk '{print int(0/$1+0.5)}')
# determine y labels, based on scaling
ylabels=$(echo ${yrange} ${res} | awk -v yr=${yrange} -v res=${res} 'BEGIN {printf "set ytics ("} {for(i=0; i<=yr; i+=10) {if(i>0) {printf ", "}; printf "\"%.1f\" %f", (0 + i)/100, i/res}} END {printf ")\n"}')






g1=forcing_REQ_sample1
g2=forcing_REQ_sample2
plotfilename=plots/topublish1

echo "set term pdf size 7,8 font 'Helvetica,18'" > ${plotfilename}
#echo "set encoding iso_8859_1" >> ${plotfilename}
echo "set datafile missing \"-9999\"" >> ${plotfilename}
echo "set output '${plotfilename}.pdf'" >> ${plotfilename}
echo "set multiplot layout 3,2 title 'Fine over coarse                               Coarse over fine' font ',24'" >> ${plotfilename}


echo "set cbrange[0:10]" >> ${plotfilename}
echo "set palette model RGB" >> ${plotfilename}
echo "set palette defined (0 \"#999999\", 0.000001 \"#EFF3FF\", 2 \"#C6DBEF\", 4 \"#9ECAE1\", 6 \"#6BAED6\", 8 \"#3182BD\", 10 \"#08519C\", 20 \"#BA21C2\")" >> ${plotfilename}
echo "set xrange[0:*]" >> ${plotfilename}
echo "set xtics out nomirror" >> ${plotfilename}
echo "set ytics out nomirror" >> ${plotfilename}
echo "set yl 'Depth (m)'" >> ${plotfilename}
echo "set xtics 200" >> ${plotfilename}
echo "set xl 'Hours'" >> ${plotfilename}
echo "set cbl 'LWC (%)" >> ${plotfilename}
echo "set obj 1 rectangle from graph 0, graph 0 to graph 1, graph 1 fc rgb \"white\"" >> ${plotfilename}
echo "set label 100 \"(a)\" at graph -0.32, graph 1.01 center front tc \"#000000\" font \"Helvetica,24\"" >> ${plotfilename}
echo "${ylabels}" >> ${plotfilename}
echo "pl '<(tac postprocess/${g1}_lwc.dat)' matrix with image notitle \\" >> ${plotfilename}
echo "" >> ${plotfilename}

echo "set cbrange[0:10]" >> ${plotfilename}
echo "set palette model RGB" >> ${plotfilename}
echo "set palette defined (0 \"#999999\", 0.000001 \"#EFF3FF\", 2 \"#C6DBEF\", 4 \"#9ECAE1\", 6 \"#6BAED6\", 8 \"#3182BD\", 10 \"#08519C\", 20 \"#BA21C2\")" >> ${plotfilename}
echo "set xrange[0:*]" >> ${plotfilename}
echo "set xtics out nomirror" >> ${plotfilename}
echo "set ytics out nomirror" >> ${plotfilename}
echo "set yl 'Depth (m)'" >> ${plotfilename}
echo "set cbl 'LWC (%)" >> ${plotfilename}
echo "set obj 1 rectangle from graph 0, graph 0 to graph 1, graph 1 fc rgb \"white\"" >> ${plotfilename}
echo "set label 100 \"(b)\" at graph -0.32, graph 1.01 center front tc \"#000000\" font \"Helvetica,24\"" >> ${plotfilename}
echo "${ylabels}" >> ${plotfilename}
echo "pl '<(tac postprocess/${g2}_lwc.dat)' matrix with image notitle \\" >> ${plotfilename}
echo "" >> ${plotfilename}







echo "set cbrange[0.6:1.2]" >> ${plotfilename}
echo "set palette defined ( 0 '#8C510A', 1 '#BF812D', 2 '#DFC27D', 3 '#F6E8C3', 4 '#C7EAE5', 5 '#80CDC1', 6 '#35978F', 7 '#01665E' )" >> ${plotfilename}
echo "set xtics out" >> ${plotfilename}
echo "set yl 'Depth (m)'" >> ${plotfilename}
echo "set cbl 'Grain size (mm)" >> ${plotfilename}
echo "set obj 1 rectangle from graph 0, graph 0 to graph 1, graph 1 fc rgb \"white\"" >> ${plotfilename}
echo "${xlabels}" >> ${plotfilename}
echo "${ylabels}" >> ${plotfilename}
echo "set label 100 \"(c)\" at graph -0.32, graph 1.01 center front tc \"#000000\" font \"Helvetica,24\"" >> ${plotfilename}
echo "pl '<(tac postprocess/${g1}_gs.dat)' matrix with image notitle \\" >> ${plotfilename}
echo "" >> ${plotfilename}
echo "TSCALE=20; RMARGIN_L = TSCALE*GPVAL_TERM_XMAX/(1.0*GPVAL_TERM_XSIZE); LMARGIN_L = TSCALE*GPVAL_TERM_XMIN/(1.0*GPVAL_TERM_XSIZE)" >> ${plotfilename}

echo "set cbrange[0.6:1.2]" >> ${plotfilename}
echo "set palette defined ( 0 '#8C510A', 1 '#BF812D', 2 '#DFC27D', 3 '#F6E8C3', 4 '#C7EAE5', 5 '#80CDC1', 6 '#35978F', 7 '#01665E' )" >> ${plotfilename}
echo "set xtics out" >> ${plotfilename}
echo "set yl 'Depth (m)'" >> ${plotfilename}
echo "set cbl 'Grain size (mm)" >> ${plotfilename}
echo "set obj 1 rectangle from graph 0, graph 0 to graph 1, graph 1 fc rgb \"white\"" >> ${plotfilename}
echo "${xlabels}" >> ${plotfilename}
echo "${ylabels}" >> ${plotfilename}
echo "set label 100 \"(d)\" at graph -0.32, graph 1.01 center front tc \"#000000\" font \"Helvetica,24\"" >> ${plotfilename}
echo "pl '<(tac postprocess/${g2}_gs.dat)' matrix with image notitle \\" >> ${plotfilename}
echo "" >> ${plotfilename}
echo "TSCALE=20; RMARGIN_R = TSCALE*GPVAL_TERM_XMAX/(1.0*GPVAL_TERM_XSIZE); LMARGIN_R = TSCALE*GPVAL_TERM_XMIN/(1.0*GPVAL_TERM_XSIZE)" >> ${plotfilename}


echo "set rmargin at screen RMARGIN_L" >> ${plotfilename}
echo "set lmargin at screen LMARGIN_L" >> ${plotfilename}
echo "set yl 'Grain size (mm)' offset 0.9,0" >> ${plotfilename}
echo "set ytics autofreq" >> ${plotfilename}
echo "set ytics 0.1" >> ${plotfilename}
echo "set key bottom right" >> ${plotfilename}
echo "set label 100 \"(e)\" at graph -0.32, graph 1.01 center front tc \"#000000\" font \"Helvetica,24\"" >> ${plotfilename}
echo "pl \"<(awk '(NR==101) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/forcing_REQ_sample1_gs.dat)\" w l lw 2 lc rgb 'black' title 'Above interface'\\" >> ${plotfilename}
echo ",  \"<(awk '(NR==102) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/forcing_REQ_sample1_gs.dat)\" w l lw 2 lc rgb 'red' title 'Below interface'" >> ${plotfilename}


echo "set rmargin at screen RMARGIN_R" >> ${plotfilename}
echo "set lmargin at screen LMARGIN_R" >> ${plotfilename}
echo "set yl 'Grain size (mm)'" >> ${plotfilename}
echo "set label 100 \"(f)\" at graph -0.32, graph 1.01 center front tc \"#000000\" font \"Helvetica,24\"" >> ${plotfilename}
echo "pl \"<(awk '(NR==101) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/forcing_REQ_sample2_gs.dat)\" w l lw 2 lc rgb 'black' title 'Above interface'\\" >> ${plotfilename}
echo ",  \"<(awk '(NR==102) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/forcing_REQ_sample2_gs.dat)\" w l lw 2 lc rgb 'red' title 'Below interface'" >> ${plotfilename}


echo "unset multiplot" >> ${plotfilename}
gnuplot ${plotfilename}








