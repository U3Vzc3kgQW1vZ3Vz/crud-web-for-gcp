$infile=$ARGV[0];
$flow=$ARGV[1];
$src=$ARGV[2];
$dst=$ARGV[3];
@send = (0..0);
@recv = (0..0);
$max_pktid = 0;
$num = 0;
open (DATA,"<$infile") || die "Can't open $infile $!";
while (<DATA>) {
@x = split(' ');
$event_ = $x[0];
$time_ = $x[1];
$flow_ = $x[7];
$pkt_ = $x[11];
$node_ = $x[2] if (($event_ eq "+") || ($event_ eq "s"));
$node_ = $x[3] if ($event_ eq "r");
# Ghi thời điểm gửi và nhận từng gói tin vào mảng $send và $rev, $num đếm số gói tin
if ((($event_ eq "+") || ($event_ eq "s")) && ($flow_ == $flow)
&& ($node_ == $src) && (!$send[$pkt_])) {
# Kiem tra (!$send[$pkt_]) dam bao luon tinh goi tin duoc gui lan dau, khong tinh goi tin gui lai
$send[$pkt_] = $time_;
$max_pktid = $pkt_ if ($max_pktid < $pkt_);
}
if (($event_ eq "r") && ($flow_ == $flow) && ($node_ == $dst)) {
$recv[$pkt_] = $time_;
$num++;
}
}
close DATA;
# Tính tổng thời gian trễ $delay rồi tính thời gian trễ trung bình của các gói tin $avg_delay
$delay = 0;
for ($count = 0; $count <= $max_pktid; $count ++) {
if ($send[$count] && $recv[$count]) {
$send_ = $send[$count];
$recv_ = $recv[$count];
$delay = $delay + ($recv_ - $send_);
}
}
$avg_delay = $delay / $num;
print STDOUT "Avg delay(flow id = $flow; src node = $src; \
dst node = $dst) = $avg_delay(s)\n";
exit(0);