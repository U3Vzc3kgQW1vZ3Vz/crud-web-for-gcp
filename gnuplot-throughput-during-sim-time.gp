set title "Throughput_vs_sim_time of all Connections"
set key top right
set xlabel "Simulation Time (s)"
set ylabel "Throughput(t) (kbps)"
plot 'out-tcp0.tr' w lines,'out-tcp0.tr' w lines, 'out-tcp1.tr' w lines, 'out-tcp2.tr' w lines, 'out-cbr.tr' w lines
