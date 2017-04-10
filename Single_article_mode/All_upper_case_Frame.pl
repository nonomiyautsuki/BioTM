#print "Please input the reporter:";
$textfile="temp.txt";#空白路徑問題無法解決，要由底下的code複合才可
$textfile=~s/\"//g;#要是路徑有空格，路徑外部會用""套住，導致路徑字串無法啟動

chomp $textfile;#去除變數中的換行字元(並非文章中)
unless ( open(text,$textfile) ) {
    print "Cannot open file $textfile \n\n";
	 <STDIN>;
	 exit
}
@word = <text>; 
close text;#打開目標文件
for($i=0;$i<@word;$i++){
	$word[$i] =~s/\W/ /g;#刪除所有英文數字以外的字元(亂碼)
	}

for($i=0;$i<@word;$i++){
	@splited = split ( ' ', $word[$i]);
	for my $tmp ( @splited) {
		push( @merged, $tmp);
	}
}#對目標檔案內的字元以空格和換行為界線進行排序
@merged = sort @merged;#以字母順序進行再排序
	
$htmlStart ='<html>
<head></head>
<body>
<div id="pieChart"></div>
<script src="http://cdnjs.cloudflare.com/ajax/libs/d3/3.4.4/d3.min.js"></script>
<script src="d3pie.min.js"></script>
<script>
var pie = new d3pie("pieChart", {
	"header": {
		"title": {
			"text": "Possible Proper noun",
			"fontSize": 24,
			"font":"open sans"
		},
		"subtitle": {
			"text": "",
			"color": "#999999",
			"fontSize": 12,
			"font": "open sans"
		},
		"titleSubtitlePadding": 9
	},
	"footer": {
		"color": "#999999",
		"fontSize": 10,
		"font": "open sans",
		"location": "bottom-left"
	},
	"size": {
		"canvasHeight": 220,
		"canvasWidth": 400,
		"pieInnerRadius": "50%",
		"pieOuterRadius": "90%"
	},
	"data": {
		"sortOrder": "value-desc",
			"smallSegmentGrouping": {
			"enabled": true,
			"value": 1
		},
		"content":[';

		
		
$htmlEnd ='		]
	},
	"labels": {
		"outer": {
			"pieDistance": 32
		},
		"inner": {
			"hideWhenLessThanPercentage": 3
		},
		"mainLabel": {
			"fontSize": 11
		},
		"percentage": {
			"color": "#ffffff",
			"decimalPlaces": 0
		},
		"value": {
			"color": "#adadad",
			"fontSize": 11
		},
		"lines": {
			"enabled": true
		},
		"truncation": {
			"enabled": true
		}
	},
	"effects": {
		"pullOutSegmentOnClick": {
			"effect": "linear",
			"speed": 400,
			"size": 8
		}
	},
	"misc": {
		"gradient": {
			"enabled": true,
			"percentage": 100
		}
	}
});
</script>

</body>
</html>';




open (proto,">All upper case to d3pie.html")||die "File open error!";
printf proto ($htmlStart);
$count=1;

	
for($i=0;$i<@merged;$i++){
	if($merged[$i] eq $merged[$i+1]){
		$count++;
	}
	elsif($merged[$i] =~ /[A-Z]/  || $merged[$i] =~ /[A-Z].[A-Z]/ ){#挑出單字中有一個大寫字母，或是兩個大寫穿插小寫數字的字串
		my $range = 256;#設定亂數範圍
	my $random_number = int(rand($range));#生成整數亂數
	my $r = int(rand($range));#亂數紅
	my $g = int(rand($range));#亂數藍
	my $b = int(rand($range));#亂數綠

	$hex_r = sprintf("%x", $r);
	print $hex_r;#亂數紅hex版

	$hex_g = sprintf("%x", $g);
	print $hex_g;#亂數綠hex版

	$hex_b = sprintf("%x", $b);
	print $hex_b;#亂數藍hex版
	printf proto ("{\"label\":\"$merged[$i]\",\n\"value\":$count,\n\"color\":\"\#$hex_r$hex_g$hex_b\"},\n");

		#printf proto ("$merged[$i],$count\n");
		$count=1;
	} 
	else{
		delete $merged[$i] ;
		$count=1;
	}
}
printf proto ($htmlEnd);
close (proto);
#system "All upper case to d3pie.html";
exit;