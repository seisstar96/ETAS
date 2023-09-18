
file=San_Andreas_eq_etas_pre.txt
cut -c1-10 $file > date_ymd.csv
sed 's/ /-/g' date_ymd.csv > 1.csv
cut -c12-22  $file > date_hms.csv
sed 's/ /:/g' date_hms.csv > 2.csv
awk '{print $8,$7,$10}' $file > date_other.csv
paste 1.csv 2.csv date_other.csv > date_all.csv
awk '{print $1,$2,$3,$4,$5}' date_all.csv > San_Andreas_eq_etas.txt
rm *.csv