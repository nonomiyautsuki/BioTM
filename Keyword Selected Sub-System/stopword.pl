use strict;

print "Please input the reporter:";
$textfile=<STDIN>;
$textfile=~s/\"//g;#要是路徑有空格，路徑外部會用""套住，導致路徑字串無法啟動

chomp $textfile;#去除變數中的換行字元(並非文章中)
print "Start reading file\n";
unless ( open(text,$textfile) ) {
    print "Cannot open file $textfile \n\n";
	 <STDIN>;
	 exit
}
print "End reading file\n";
@word = <text>; 
close text;#打開目標文件

print "Delete error word\n";
for($i=0;$i<@word;$i++){
	$word[$i] =~s/\W/ /g;#刪除所有英文數字以外的字元(亂碼)
}
print "End of Delete error word\n";
print "crash";
for($i=0;$i<@word;$i++){
	@splited = split ( ' ', $word[$i]);
	push( @merged, @splited);
	@splited =0;
}#對目標檔案內的字元以空格和換行為界線進行排序
print "end crash";
#@merged = sort @merged;#以字母順序進行再排序
#print @merged;



		
		
open (proto,">temp.txt")||die "File open error!";
printf proto ($merged);
	
for($i=0;$i<@merged;$i++){
		printf proto ("$merged[$i]\n")
}


close (proto);
#system "temp.txt";
print "~~~end of program~~~";;


<STDIN>;