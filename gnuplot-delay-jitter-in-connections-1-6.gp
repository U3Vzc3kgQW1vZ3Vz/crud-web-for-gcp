set title "TCP connection n1-n6, Delay, Mean Delay and Jitter vs Simulation Time“
set xlabel "Time (s)”
plot "tcp1-6.tr" using 2:4 t "Delay" w lines, "tcp1-6.tr" using 2:5 t "Mean Delay" w lines, "tcp1-6.tr" using 2:6 t "Jitter" w lines
