#<tracefile> <flow id> <required node> <granularity >> file
# this script comes from ...
#and modified by Assoc. Prof, Dr. Nguyen Dinh Viet
# Faculty of Technology, College of Engineering, VNU, Hanoi
# ‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐
$infile=$ARGV[0];
$flow_id=$ARGV[1];
$tonode=$ARGV[2];
$granularity=$ARGV[3];
$start_time=0;
$end_time=0;
# we compute how many bytes were transmitted during time interval
# specified by granularity parameter in seconds
$sum=0;
$clock=0;
open (DATA,'<',"$infile") || die "Can't open $infile $!";
while (<DATA>) {
@x = split(' ');
if ($x[0] eq 'r' && $x[7] == $flow_id && $x[3]
eq $tonode) {
if ($start_time <= 0) {
$start_time=$x[1];
$clock=$start_time;
# print STDOUT ʺStart_time = $start_time\nʺ;
}
if ($x[1]-$clock < $granularity) {
$sum=$sum+$x[5]*8/1024;
}
else {
$end_time=$x[1];
# $throughput=$sum/$granularity;
$throughput=$sum/($end_time -$clock);
print STDOUT "$x[1] $throughput\n";
$clock=$clock+$granularity;
$sum=0;
# print STDOUT ʺ$x[0] $x[1] $x[2] $x[3] $x[4] $x[5] $x[7] $x[10] $x[11]\nʺ;
}
}
}
if ($x[1]-$clock < $granularity) {
$throughput=$sum/($x[1]-$clock);
print STDOUT "$end_time $throughput\n";
}
close DATA;
exit(0);