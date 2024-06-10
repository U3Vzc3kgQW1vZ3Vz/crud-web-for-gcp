set title "TCP connection n0-n5, Delay, Mean Delay and Jitter vs Simulation Time“
set xlabel "Time (s)”
plot "tcp0-5.tr" using 2:4 t "Delay" w lines, "tcp0-5.tr" using 2:5 t "Mean Delay" w lines, "tcp0-5.tr" using 2:6 t "Jitter" w lines
