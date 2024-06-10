# -----------------------------------------------------------------
# type: perl throughput_vs_sim_time.pl <trace file> <flow id> <required node>
$infile=$ARGV[0];
$flow_id=$ARGV[1];
$tonode=$ARGV[2];
#we compute how many bytes were transmitted during simulation time
# in fact, when a packet arrived at the recceiving node.
$sum=0;
$start_time=-1;
$end_time=0;
open (DATA,"<$infile") || die "Can't open $infile $!";
while (<DATA>) {
@x = split(' ');
#checking if the event corresponds to a reception
if ($x[0] eq 'r' && $x[7] == $flow_id && $x[3] eq $tonode)
{
if ($start_time == -1) {
$start_time = $x[1];
}
else {
    

$sum += $x[5];
if ($x[1] != $start_time) {
$throughput = $sum / ($x[1] - $start_time);
$throughput = $throughput * 8 / 1024;
print STDOUT "$x[1] $throughput \n";
}
}
}
}
close DATA;
exit(0);