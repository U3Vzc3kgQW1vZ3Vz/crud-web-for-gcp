set title "TCP connection n2-n7, Delay, Mean Delay and Jitter vs Simulation Time“
set xlabel "Time (s)”
plot "tcp2-7.tr" using 2:4 t "Delay" w lines, "tcp2-7.tr" using 2:5 t "Mean Delay" w lines, "tcp2-7.tr" using 2:6 t "Jitter" w lines
