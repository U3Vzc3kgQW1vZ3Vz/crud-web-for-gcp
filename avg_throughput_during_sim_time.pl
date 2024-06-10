$infile=$ARGV[0];
$flow_id=$ARGV[1];
$tonode=$ARGV[2];
$start_time=0;
$end_time=0;
$sum=0;
$perloutputfile="flow_$flow_id-endnode_$tonode.tr\n";
open (FH,'>',"$perloutputfile") || die "Can't open $perloutputfile $!";
open (DATA,'<',"$infile") || die "Can't open $infile $!";
while (<DATA>) {
@x = split(' ');
#checking if the event corresponds to a reception

if ( $x[0] eq 'r' && $x[7] == $flow_id && $x[3] eq $tonode) {
if ($start_time == 0) {

print STDOUT "$perloutputfile";
$start_time=$x[1];
}
    for(my $i=0;$i<11;$i++){
        print FH "$x[$i] ";
    }
    print FH "\n";
$sum=$sum+$x[5];
$end_time=$x[1];
}

}
close FH;
print STDOUT "start_time = $start_time\t";
print STDOUT "end_time = $end_time\n";
print STDOUT "sum=$sum\n";
$throughput_byte=$sum/($end_time - $start_time);
$throughput_kbit=$throughput_byte*8/1024;

print STDOUT "Avg throughtput(flow id = $flow_id; dst node = $tonode)
= $throughput_kbit(Kbps)\n\n";
close DATA;
exit(0);