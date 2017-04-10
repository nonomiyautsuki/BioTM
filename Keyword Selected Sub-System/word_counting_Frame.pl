#print "\n\n\t\####### Welcome to the word counting software ####### \n\n";

print "Please input the reporter:";
$textfile="temp.txt";
$textfile=~s/\"//g;#要是路徑有空格，路徑外部會用""套住，導致路徑字串無法啟動
chomp $textfile;
unless ( open(text,$textfile) ) {
    print "Cannot open file \"$textfile\"\n\n";
	 <STDIN>;
	 exit;
}
@word = <text>; 
close text;#打開目標文件


for($i=0;$i<@word;$i++){
	$word[$i] =~tr/A-Z/a-z/;#將所有字都變成小寫
	$word[$i] =~s/\W/ /g;#刪除所有英文以外的字元(亂碼)
		$word[$i] =~s/_//g;#刪除"_"字元
}


for($i=0;$i<@word;$i++){
	@splited = split ( ' ', $word[$i]);
	for my $tmp ( @splited) {
		push( @merged, $tmp);
	}
}#對目標檔案內的字元以空格和換行為界線進行排序


@merged = sort @merged;#以字母順序進行再排序
$count=1;


for($i=0;$i<@merged;$i++){
	if($merged[$i] =~/\w./){
		$merged[$i] =~s/(^|\W*)(\w*)/$1\u$2/g;
		}
}#將所有排序過的英文首字母改成大寫

# if($#merged<=2000){
	# $width=1280;
# }
# elsif($#merged>=2000 && $#merged<=8000){
	# $width=1600;
# }
# else{
	# $width=1920;
# }
# $height=($width*9/16);
$width = 960;
$height =700;

#設定文字雲範圍大小


$htmlStart ='<html>
	<head>
		<title>WordCloud</title>
		<script src ="wordcloud2.js"></script>
	</head>
	<body>
		<canvas id="my_canvas" class="canvas" width="' . $width . '" height="' . $height  . '"></canvas>
		<script>var wordlist = [';

$htmlEnd ='];
			wordlist.sort(function(a, b){return b[1]-a[1]});
			WordCloud(document.getElementById("my_canvas"), { list: wordlist } );
		</script>
	</body>
</html>';#啟動wordcloud2.js套件


# for($i=0;$i<@merged;$i++){
	# $merged[$i] =~s/\d//g;#刪除所有單一數字
# }

open (proto,">RawCloud.html")||die "File open error!";
open (list,">keywordlist.csv")||die "File open error!";

printf proto ($htmlStart);
printf list ("Keyword,count");



$outputCount = 0;

for($i=0;$i<@merged;$i++){
	if($merged[$i] eq $merged[$i+1]){
		$count++;
	}else{
			printf list ("\n$merged[$i], $count");
			$count=1;
		}
	}






for($i=0;$i<@merged;$i++){
	if($merged[$i] eq $merged[$i+1]){
		$count++;
	}else {
		if($count >=log10($#merged)){#太少的字不要顯示
			if($outputCount == 1){
				#$count=int((log10($count))*1);
					if ($count >140){
						$count = 140;
					}#對太大量的字的權宜之計
				printf proto ("['$merged[$i]', $count]");#第一個字的字型大小限制
			}elsif($outputCount >2){
				#$count=int((log10($count))*1);
				if ($count >140){
					$count = 140;
					}#對太大量的字的權宜之計
				printf proto (",['$merged[$i]', $count]");#之後的字型大小限制
			}
			 $outputCount ++;
		}
		$count=1;
	}
}
printf proto ($htmlEnd);
close (proto);
close (list);
#system "RawCloud.html";#打開RawCloud.html，顯示結果

sub log10 {
  my $n = shift;
  return log($n)/log(10);
}#計算出log10的副常式
exit;