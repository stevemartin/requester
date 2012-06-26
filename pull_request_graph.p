set term png
set output "`echo $COMMITER`.png"
set xdata time
set timefmt "%Y-%m-%d"
set format x "%b %d"
plot "< git log --merges --date=short --pretty=format:'%an,%ad,%s,%b' | grep 'pull request' | grep '`echo $COMMITER`' | awk 'BEGIN{FS=\",\"} NR!=1 {a[$2]++;b[$3]+$3}END{for (i in a) printf(\"%s %10.0f\\n\", i, a[i])}' | sort" using 1:2 with linespoints
