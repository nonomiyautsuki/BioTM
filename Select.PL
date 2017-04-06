use Browser::Open qw( open_browser );

$url = 'http://web.ntnu.edu.tw/~60343051s/article_input_place_CTD.html';

system "D:\\BioTMFullversion\\Keyword_lockon\\ListStarter.pl";



print "Select which mode you need:\n\n";

print "Single article mode----1\n";
print "Highlight mode----2\n";
print "Pie mode----3\n";
print "Treemap mode----4\n\n";

print "please input the number:";

my $select_num = <STDIN>;

if($select_num == 1){
	print "Single article mode system\n";
	#open FILE, "Single_article_mode\\test.txt";
	system "D:\\BioTMFullversion\\Single_article_mode\\Start_to_connect.pl";
<STDIN>
}
elsif($select_num == 2){
	print "Highlight mode system\n";
	open_browser($url);
}
elsif($select_num == 3){
	print "Pie mode system\n";
	system "D:\\BioTMFullversion\\Piemode\\TFIDF_fake_limited_ranged_to_d3pie.pl";
<STDIN>}
elsif($select_num == 4){
	print "Treemap mode system\n";
	system "D:\\BioTMFullversion\\Treemapmode\\Treemap_mode.pl";
<STDIN>}
else{
	print "File error!\n";
<STDIN>
}