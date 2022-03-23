> main_postprocess_to_exec.lst

# This script cannot accept soil layers, as then z[0]=0 cannot be assumed
# This script also doesn't consider possible surface hoar when plotting gt

yrange=40	# Plotting range in cm
res=0.2		# Plotting resolution in cm

# Export plot settings, so that the main_plotsimulations.sh script can read them
echo "yrange=${yrange}" > plot_settings
echo "res=${res}" >> plot_settings

for f in output/*pro
do
	g=$(basename --suffix=.pro ${f})

	# LWC
	echo "awk -F, -v yr=${yrange} -v res=${res} 'BEGIN {data=0; yri=int(yr/res+0.5)} {if(/\[DATA\]/) {data=1}; if(data) {if(/^0500/) {n++; if(n!=1) {dates[d]=d; idxn=0; for(j=maxi-1; j>=0; j--) {idx=int((yr-z[j])/res+0.5); idx0=int((yr-z[j+1])/res+0.5); if(idx0>idxn+1 && idxn==0) {for(i=idxn+1; i<=idx0-1; i++) {temp[d,i] = -9999}; idxn=i} if(idx>idxn) {for(i=idxn+1; i<=idx; i++) {temp[d,i] = ((val[j+1]==-999)?(-9999):(val[j+1]))}; idxn=idx}; if(idxn<yri) {for(i=idxn+1; i<=yri; i++) {temp[d,i]=-9999}}}}; d=sprintf(\"%04d-%02d-%02dT%02d:%02d\", substr(\$NF,7,4), substr(\$NF,4,2), substr(\$NF,1,2), substr(\$NF,12,2), substr(\$NF,15,2))} else if (/^0501/) {z[0]=0; for(i=3; i<=NF; i++) {z[i-2]=\$i}; maxi=NF-2} else if (/^0506/) {for(i=3; i<=NF; i++) {val[i-2]=\$i}}}} END {n=asort(dates); for(k in dates) {printf \"%s \", dates[k]}; printf \"\n\"; for(l=1; l<=yri; l++) {for(k in dates) {m=dates[k]; txt=temp[m,l]; printf \"%s \", (txt==\"\")?(-9999):(txt)}; printf \"\n\"}}' ${f} > postprocess/${g}_lwc.dat" >> main_postprocess_to_exec.lst

	# Grain size
	echo "awk -F, -v yr=${yrange} -v res=${res} 'BEGIN {data=0; yri=int(yr/res+0.5)} {if(/\[DATA\]/) {data=1}; if(data) {if(/^0500/) {n++; if(n!=1) {dates[d]=d; idxn=0; for(j=maxi-1; j>=0; j--) {idx=int((yr-z[j])/res+0.5); idx0=int((yr-z[j+1])/res+0.5); if(idx0>idxn+1 && idxn==0) {for(i=idxn+1; i<=idx0-1; i++) {temp[d,i] = -9999}; idxn=i} if(idx>idxn) {for(i=idxn+1; i<=idx; i++) {temp[d,i] = ((val[j+1]==-999)?(-9999):(val[j+1]))}; idxn=idx}; if(idxn<yri) {for(i=idxn+1; i<=yri; i++) {temp[d,i]=-9999}}}}; d=sprintf(\"%04d-%02d-%02dT%02d:%02d\", substr(\$NF,7,4), substr(\$NF,4,2), substr(\$NF,1,2), substr(\$NF,12,2), substr(\$NF,15,2))} else if (/^0501/) {z[0]=0; for(i=3; i<=NF; i++) {z[i-2]=\$i}; maxi=NF-2} else if (/^0512/) {for(i=3; i<=NF; i++) {val[i-2]=\$i}}}} END {n=asort(dates); for(k in dates) {printf \"%s \", dates[k]}; printf \"\n\"; for(l=1; l<=yri; l++) {for(k in dates) {m=dates[k]; txt=temp[m,l]; printf \"%s \", (txt==\"\")?(-9999):(txt)}; printf \"\n\"}}' ${f} > postprocess/${g}_gs.dat" >> main_postprocess_to_exec.lst

done
