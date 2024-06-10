set title "Bandwidth sharing between 3 tcp & 1 udp connections, Granualarity=150ms
set key top right
set xlabel "Simulation Time (s)"
set ylabel "Throughput(t) (kbps)"
plot 'out-tcp0-2.tr' w lines,'out-tcp1-2.tr' w lines, 'out-tcp2-2.tr' w lines, 'out-cbr-2.tr' w lines