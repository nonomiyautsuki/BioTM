use strict;
print "Please input the StopwordCSV:";

my $StopWordFile=<STDIN>;
$StopWordFile=~s/\"//g;#�n�O���|���Ů�A���|�~���|��""�M��A�ɭP���|�r��L�k�Ұ�
chomp $StopWordFile;#�h���ܼƤ�������r��(�ëD�峹��)
print "Opening ".$StopWordFile."\n";
unless ( open(text,$StopWordFile) ) {
    print "Cannot open file $StopWordFile \n\n";
	 <STDIN>;
	 exit;
}
my @StopWordCSV= <text>; 
close text;#���}�ؼФ��

print "\nStart to input Stopword list\n";
my @StopWords;
for(my $i=0;$i<@StopWordCSV;$i++){
	 my @temp = split ( ',', $StopWordCSV[$i]);
	for my $tmp ( @temp) {
	#print $tmp."\n";
		push( @StopWords, $tmp);
	}
}#��ؼ��ɮפ����r���H�Ů�M���欰�ɽu�i��Ƨ�
undef @StopWordCSV;
print "\nEnd to input Stopword list\n";

#Read Stopword list

print "\nStart to input pubmed abstracts\n";


print "\nPlease input the reporter:\n";
my $textfile=<STDIN>;
$textfile=~s/\"//g;#�n�O���|���Ů�A���|�~���|��""�M��A�ɭP���|�r��L�k�Ұ�

chomp $textfile;#�h���ܼƤ�������r��(�ëD�峹��)
unless ( open(text,$textfile) ) {
    print "Cannot open file $textfile \n\n";
	 <STDIN>;
	 exit;
}
my @word = <text>; 
close text;#���}�ؼФ��

for(my $i=0;$i<@word;$i++){
	$word[$i] =~s/\W/ /g;#�R���Ҧ��^��Ʀr�H�~���r��(�ýX)
}

my @merged;
for(my $i=0;$i<@word;$i++){
	my @splited = split ( ' ', $word[$i]);
	for my $tmp ( @splited) {
		push( @merged, $tmp);
	}
}#��ؼ��ɮפ����r���H�Ů�M���欰�ɽu�i��Ƨ�

print "\nEnd to input pubmed abstracts\n";

#my @merged = sort @merged;#�H�r�����Ƕi��A�Ƨ�
		

my %toRemove;
foreach my $i (@StopWords){
	$toRemove{$StopWords[$i]}=1;
}

my $allword = scalar(@merged) ;
#���ݭn��Stopword

 for(my$i=0;$i<@merged;$i++){
	 if($merged[$i]=~ /(\d)/){
		 if ($merged[$i]=~/\D/){
	  next;}
		 splice @merged,$i,1,;#���h�H�W�`�ε��J
		 $i=$i-1; 
		 }
 }
	

open (proto,">WordListAndTF.csv")||die "File open error!";


printf proto (my $merged);
for(my$i=0;$i<@merged;$i++){
		printf proto ("$merged[$i]\n");
}

 



close (proto);
exit;