set title "TCP connection n3-n6, Delay, Mean Delay and Jitter vs Simulation Time“
set xlabel "Time (s)”
plot "udp3-6.tr" using 2:4 t "Delay" w lines, "udp3-6.tr" using 2:5 t "Mean Delay" w lines, "udp3-6.tr" using 2:6 t "Jitter" w lines
