#git log --merges --pretty=format:'%an %ai %s %b' | grep 'pull request' | grep 'stevemartin' | awk 'BEGIN{FS=" "} NR!=1 {a[$2]++;b[$3]+$3}END{for (i in a) printf("%s %10.0f\n", i, a[i])}' | sort > tmp/sm_pull_request_rate.txt
#
#set xdata time
#set timefmt "%Y-%m-%d"
#set format x "%b %d"
#plot 'tmp/sm_pull_request_rate.txt' using 1:2 with linespoints

#brew install gnuplot
#gnuplot
set xdata time
set timefmt "%Y-%m-%d"
set format x "%b %d"
plot "< git log --merges --pretty=format:'%an %ai %s %b' | grep 'pull request' | grep '`echo $COMMITER`' | awk 'BEGIN{FS=\" \"} NR!=1 {a[$2]++;b[$3]+$3}END{for (i in a) printf(\"%s %10.0f\\n\", i, a[i])}' | sort" using 1:2 with linespoints
