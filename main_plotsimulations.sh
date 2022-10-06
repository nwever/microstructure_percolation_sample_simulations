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
echo "set key at graph 0.978, graph 0.2" >> ${plotfilename}
echo "set label 100 \"(e)\" at graph -0.32, graph 1.01 center front tc \"#000000\" font \"Helvetica,24\"" >> ${plotfilename}
echo "pl \"<(awk '(NR==101) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g1}_gs.dat)\" w l lw 2 lc rgb 'black' title 'Above transition'\\" >> ${plotfilename}
echo ",  \"<(awk '(NR==102) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g1}_gs.dat)\" w l lw 2 lc rgb 'red' title 'Below transition'" >> ${plotfilename}

echo "set rmargin at screen RMARGIN_R" >> ${plotfilename}
echo "set lmargin at screen LMARGIN_R" >> ${plotfilename}
echo "set yl 'Grain size (mm)'" >> ${plotfilename}
echo "set label 100 \"(f)\" at graph -0.32, graph 1.01 center front tc \"#000000\" font \"Helvetica,24\"" >> ${plotfilename}
echo "pl \"<(awk '(NR==101) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g2}_gs.dat)\" w l lw 2 lc rgb 'black' title 'Above transition'\\" >> ${plotfilename}
echo ",  \"<(awk '(NR==102) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g2}_gs.dat)\" w l lw 2 lc rgb 'red' title 'Below transition'" >> ${plotfilename}

echo "unset multiplot" >> ${plotfilename}
gnuplot ${plotfilename}






plotfilename=plots/sensitivity_study

echo "set term pdf size 7,8 font 'Helvetica,16.5'" > ${plotfilename}
#echo "set encoding iso_8859_1" >> ${plotfilename}
echo "set datafile missing \"-9999\"" >> ${plotfilename}
echo "set output '${plotfilename}.pdf'" >> ${plotfilename}
echo "set multiplot layout 3,2" >> ${plotfilename}


# Normal
g1=forcing_REQ_sample1
g2=forcing_REQ_sample2
#echo "set rmargin at screen RMARGIN_L" >> ${plotfilename}
#echo "set lmargin at screen LMARGIN_L" >> ${plotfilename}
echo "set title 'Default simulation" >> ${plotfilename}
echo "set xl 'Time (hours)'" >> ${plotfilename}
echo "set yl 'Grain size (mm)' offset 0.9,0" >> ${plotfilename}
echo "set ytics autofreq" >> ${plotfilename}
echo "set ytics 0.1" >> ${plotfilename}
echo "set yrange[0.5:1.4]" >> ${plotfilename}
echo "set key at graph 0.74, graph 0.94 font ',15'" >> ${plotfilename}
echo "set label 100 \"(a)\" at graph -0.19, graph 1.14 center front tc \"#000000\" font \"Helvetica,22\"" >> ${plotfilename}
echo "pl \"<(awk '(NR==101) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g1}_gs.dat)\" w l lw 2 lc rgb 'black' title 'FC above transition' \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==102) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g1}_gs.dat)\" w l lw 2 lc rgb 'red' title 'FC below transition' \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==101) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g2}_gs.dat)\" w l lw 2 dt 2 lc rgb 'black' title 'CF above transition' \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==102) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g2}_gs.dat)\" w l lw 2 dt 2 lc rgb 'red' title 'CF below transition'" >> ${plotfilename}


# Low density
g1=forcing_REQ_sample1_lowdensity
g2=forcing_REQ_sample2_lowdensity
echo "set title 'Density 400 kg/m^3" >> ${plotfilename}
echo "set yl 'Grain size (mm)' offset 0.9,0" >> ${plotfilename}
echo "set ytics autofreq" >> ${plotfilename}
echo "set ytics 0.1" >> ${plotfilename}
echo "set key bottom right" >> ${plotfilename}
echo "set label 100 \"(b)\"" >> ${plotfilename}
echo "pl \"<(awk '(NR==101) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g1}_gs.dat)\" w l lw 2 lc rgb 'black' notitle \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==110) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g1}_gs.dat)\" w l lw 2 lc rgb 'red' notitle \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==101) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g2}_gs.dat)\" w l lw 2 dt 2 lc rgb 'black' notitle \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==110) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g2}_gs.dat)\" w l lw 2 dt 2 lc rgb 'red' notitle" >> ${plotfilename}


# Low infiltration
g1=forcing_REQ_sample1_lowinfiltrationrate
g2=forcing_REQ_sample2_lowinfiltrationrate
echo "set title 'Water input rate 0.12 mm/hour" >> ${plotfilename}
echo "set yl 'Grain size (mm)' offset 0.9,0" >> ${plotfilename}
echo "set ytics autofreq" >> ${plotfilename}
echo "set ytics 0.1" >> ${plotfilename}
echo "set key bottom right" >> ${plotfilename}
echo "set label 100 \"(c)\"" >> ${plotfilename}
echo "pl \"<(awk '(NR==101) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g1}_gs.dat)\" w l lw 2 lc rgb 'black' notitle \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==102) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g1}_gs.dat)\" w l lw 2 lc rgb 'red' notitle \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==101) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g2}_gs.dat)\" w l lw 2 dt 2 lc rgb 'black' notitle \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==102) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g2}_gs.dat)\" w l lw 2 dt 2 lc rgb 'red' notitle" >> ${plotfilename}


# Cooling flux
g1=forcing_REQ_sample1_cooling
g2=forcing_REQ_sample2_cooling
echo "set title 'Bottom temperature fixed at -1 {\260}C" >> ${plotfilename}
echo "set yl 'Grain size (mm)' offset 0.9,0" >> ${plotfilename}
echo "set ytics autofreq" >> ${plotfilename}
echo "set ytics 0.1" >> ${plotfilename}
echo "set key bottom right" >> ${plotfilename}
echo "set label 100 \"(d)\"" >> ${plotfilename}
echo "pl \"<(awk '(NR==101) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g1}_gs.dat)\" w l lw 2 lc rgb 'black' notitle \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==102) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g1}_gs.dat)\" w l lw 2 lc rgb 'red' notitle \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==101) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g2}_gs.dat)\" w l lw 2 dt 2 lc rgb 'black' notitle \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==102) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g2}_gs.dat)\" w l lw 2 dt 2 lc rgb 'red' notitle" >> ${plotfilename}


# Cold snow with temp gradient
g1=forcing_REQ_sample1_drysnow
g2=forcing_REQ_sample2_drysnow
echo "set title 'Firn at -25 {\260}C with -25 {\260}C/m gradient" >> ${plotfilename}
echo "set yl 'Grain size (mm)' offset 0.9,0" >> ${plotfilename}
echo "set ytics autofreq" >> ${plotfilename}
echo "set ytics 0.1" >> ${plotfilename}
echo "set xtics 2000" >> ${plotfilename}
echo "set key bottom right" >> ${plotfilename}
echo "set label 100 \"(e)\"" >> ${plotfilename}
echo "pl \"<(awk '(NR==101) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g1}_gs.dat)\" w l lw 2 lc rgb 'black' notitle \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==102) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g1}_gs.dat)\" w l lw 2 lc rgb 'red' notitle \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==101) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g2}_gs.dat)\" w l lw 2 dt 2 lc rgb 'black' notitle \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==102) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g2}_gs.dat)\" w l lw 2 dt 2 lc rgb 'red' notitle" >> ${plotfilename}


# Cold snow
g1=forcing_REQ_sample1_drysnow2
g2=forcing_REQ_sample2_drysnow2
echo "set title 'Firn at -5 {\260}C" >> ${plotfilename}
echo "set yl 'Grain size (mm)' offset 0.9,0" >> ${plotfilename}
echo "set ytics autofreq" >> ${plotfilename}
echo "set ytics 0.1" >> ${plotfilename}
echo "set xtics 2000" >> ${plotfilename}
echo "set key bottom right" >> ${plotfilename}
echo "set label 100 \"(f)\"" >> ${plotfilename}
echo "pl \"<(awk '(NR==101) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g1}_gs.dat)\" w l lw 2 lc rgb 'black' notitle \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==102) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g1}_gs.dat)\" w l lw 2 lc rgb 'red' notitle \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==101) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g2}_gs.dat)\" w l lw 2 dt 2 lc rgb 'black' notitle \\" >> ${plotfilename}
echo ",  \"<(awk '(NR==102) {for(i=1; i<=NF; i++) {print \$i}}' postprocess/${g2}_gs.dat)\" w l lw 2 dt 2 lc rgb 'red' notitle" >> ${plotfilename}


echo "unset multiplot" >> ${plotfilename}
gnuplot ${plotfilename}
