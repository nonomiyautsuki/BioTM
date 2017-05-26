use strict;

print "Please input the StopwordCSV:";
###################輸入stopword#########################
my $StopWordFile=<STDIN>;
$StopWordFile=~s/\"//g;#要是路徑有空格，路徑外部會用""套住，導致路徑字串無法啟動
chomp $StopWordFile;#去除變數中的換行字元(並非文章中)
print "Opening ".$StopWordFile."\n";
unless ( open(text,$StopWordFile) ) {
    print "Cannot open file $StopWordFile \n\n";
	 <STDIN>;
	 exit;
}
my @StopWordCSV= <text>; 
close text;#打開目標文件



print "\nStart to input Stopword list\n";
my @StopWords;
for(my $i=0;$i<@StopWordCSV;$i++){
	my @temp = split ( ',', $StopWordCSV[$i]);
	for my $tmp ( @temp) {
	#print $tmp."\n";
		push( @StopWords, $tmp);
	}
}
#對目標檔案內的字元以空格和換行為界線進行排序

my %toRemove;
for (my$i=0;$i<@StopWords;$i++){
 $toRemove{$StopWords[$i]}=1;}
#將stopword加入一個雜湊中並賦值1


undef @StopWordCSV;
print "\nEnd to input Stopword list\n";
###################end########################	





###################輸入文件##################

print "\nStart to input pubmed abstracts\n";
print "\nPlease input the reporter:\n";
my $textfile=<STDIN>;
$textfile=~s/\"//g;#要是路徑有空格，路徑外部會用""套住，導致路徑字串無法啟動

chomp $textfile;#去除變數中的換行字元(並非文章中)
unless ( open(text,$textfile) ) {
    print "Cannot open file $textfile \n\n";
	<STDIN>;
	exit;
}
my @word = <text>; 
close text;#打開目標文件


for(my $i=0;$i<@word;$i++){
	$word[$i] =~s/\W/ /g;}
	#刪除所有英文數字以外的字元(亂碼)
my @merged;
for(my $i=0;$i<@word;$i++){
	my @splited = split ( ' ', $word[$i]);
	for my $tmp ( @splited) {
		push( @merged, $tmp);
	}
}
#對目標檔案內的字元以空格和換行為界線進行排序
print "\nEnd to input pubmed abstracts\n";
######################end########################
	

	
######################刪除無用字彙#####################
for(my$i=0;$i<@merged;$i++){
print "$toRemove{$merged[$i]}\n";
	  if($toRemove{$merged[$i]}){
		  splice @merged,$i,1, ;
	  $i=$i-1;
	 }
}	 
#不需要的Stopword



for(my$i=0;$i< @merged;$i++){
	if($merged[$i]=~ /(\d)/){
		if ($merged[$i]=~/\D/){
		next;}
	splice @merged,$i,1,;
	$i=$i-1; 
	}
}

for(my$i=0;$i<@merged;$i++){
	 if($merged[$i]=~ /\n/){
		 splice(@merged,$i,1,);
	$i=$i-1; 
	 }
}
######################end#######################
open (proto,">WordListAndTF.csv")||die "File open error!";


printf proto ( my$merged);
for(my$i=0;$i<@merged;$i++){
		printf proto ("$merged[$i]\n");
}

close (proto);
exit;
