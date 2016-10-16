set border lw 1 lc rgb 'white'
set xtics textcolor rgb 'white'
set ytics textcolor rgb 'white'
set title ''
set ylabel 'Altitude (m)' textcolor rgb 'yellow'
set timefmt '%H:%M:%S'
set format x '%H:%M'
set xdata time
set xlabel 'Time' textcolor rgb 'yellow'
set grid
set key textcolor rgb 'white'
set term png size 580, 350 background rgb 'black'
set output 'hab.png'
set datafile separator ','
plot '.csv' u 1:2 linecolor rgb 'yellow' notitle with lines
