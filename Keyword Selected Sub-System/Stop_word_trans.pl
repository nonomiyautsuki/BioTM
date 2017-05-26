use strict;
print "Input the stop word list:";
my $StopWordFile=<STDIN>;
$StopWordFile=~s/\"//g;#要是路徑有空格，路徑外部會用""套住，導致路徑字串無法啟動
unless ( open(text,$StopWordFile) ) {
    print "Cannot open file $StopWordFile \n\n";
	 <STDIN>;
	 exit;
}
my @StopWordCSV= <text>; 
close text;

print "\nStart to read Stopword list\n";

my @StopWords;
for(my $i=0;$i<@StopWordCSV;$i++){
	 my @temp = split ( ',', $StopWordCSV[$i]);
	for my $temp ( @temp) {
		push( @StopWords, $temp);
	}
}#對目標檔案內的字元以空格和換行為界線進行排序
undef @StopWordCSV;
print "\nFinish reading Stopword list\n";

#set the stop word hash
my %toRemove;
for (my $i=0; $i<@StopWords; $i++){
	$toRemove{$StopWords[$i]}=1;
}


print "\nPlease input the reporter:\n";
my $textfile=<STDIN>;
$textfile=~s/\"//g;#要是路徑有空格，路徑外部會用""套住，導致路徑字串無法啟動
chomp $textfile;#去除變數中的換行字元(並非文章中)
unless ( open(text,$textfile) ) {
    print "Cannot open file $textfile \n\n";
	 <STDIN>;
	 exit;
}
print "\nStart to input pubmed abstracts\n";
my @word = <text>;

print "\nEnd to input pubmed abstracts\n";

close text;



print "\nStart to data cleaning\n";
for(my $i=0;$i<@word;$i++){
	$word[$i] =~s/\W/ /g;
}

my %keywordscount;
for(my $i=0;$i<@word;$i++){
	foreach my $temp(split(' ',$word[$i])){
		if($keywordscount{$temp}==undef){
			$keywordscount{$temp}=1;
		}
		else{
			$keywordscount{$temp}++;
		}
	}
}
undef @word;
print "Finish split the text to word\n";
print "Start exclude stopword\n";
my $sum=0;


foreach my $keyword (keys %keywordscount){
	if($toRemove{$keyword}||($keyword=~/\d/ && $keyword !~ /\D/)|| $keyword=~ /\n/){
		$keywordscount{$keyword}=0;
		}
		$sum+=$keywordscount{$keyword};
}

open (proto,">WordListAndTF.csv")||die "File open error!";
print "\nStart to build CSV\n";
printf proto ("Word,Count,TF\n");
foreach my $keyword (keys %keywordscount){
	if($keywordscount{$keyword}>0){
		printf proto ($keyword.",".$keywordscount{$keyword}.",".$keywordscount{$keyword}/$sum."\n");
	}
}
close (proto);
print "press any key to exit.\n";
#print $sum;
system "WordListAndTF.csv";

<STDIN>;
exit;