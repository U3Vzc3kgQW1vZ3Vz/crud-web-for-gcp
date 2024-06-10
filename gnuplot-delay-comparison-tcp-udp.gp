set title "Comparison of packet Delay of TCP and UDP connections"
set xlabel "Time (s)”
plot "tcp0-5.tr" using 2:4 w lines ,"tcp1-6.tr" using 2:4 w lines ,"tcp2-7.tr" using 2:4 w lines ,"udp3-6.tr" using 2:4 w lines 