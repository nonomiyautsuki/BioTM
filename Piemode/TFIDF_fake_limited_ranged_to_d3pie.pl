use Text::TFIDF;
print "Please input the main paper:";
$main_paper=<STDIN>;
$main_paper=~s/\"//g;#要是路徑有空格，路徑外部會用""套住，導致路徑字串無法啟動
chomp $main_paper;
unless (open(TEXT,$main_paper) ) {
    print "Cannot open file \"$main_paper\"\n\n";
		<STDIN>;
	exit;
}
@wordx = <TEXT>;
close TEXT;#打開目標文件

for($i=0;$i<@wordx;$i++){
	$wordx[$i] =~tr/A-Z/a-z/;#將所有字都變成小寫
	$wordx[$i] =~s/\W/ /g;#刪除所有英文數字以外的字元(亂碼)
	$wordx[$i] =~s/[?;:!,.'"]//g; 
}

for($i=0;$i<@wordx;$i++){
	@splited = split (/\s+/, $wordx[$i]);
	for my $tmp ( @splited) {
		push( @merged, $tmp);
	}
}#對目標檔案內的字元以空格和換行為界線進行排序

@merged = sort @merged;

print "Please input the sub paper filecase:";
$sub_paper_filecase=<STDIN>;
$sub_paper_filecase=~s/\"//g;#要是路徑有空格，路徑外部會用""套住，導致路徑字串無法啟動
chomp $sub_paper_filecase;

opendir (DIR, $sub_paper_filecase) || die "Error in opening dir $sub_paper_filecase\n";
while( ($filename = readdir(DIR))){
	if ($filename ne "." && $filename ne ".."){
		if ($filename =~ /.txt/){
			push (@txtfile,"$sub_paper_filecase\\$filename");
			$count++;
		}#限定只有後綴是.TXT才會加上COUNT
	}#"." and ".." are still unknown why they come out.
}
closedir(DIR);
foreach (@txtfile){
	print "$_\n";
}
my $Obj = new Text::TFIDF(file=>\@txtfile);

print "Please input the result range:";
$pierange = <STDIN>;

open (proto,">TFIDF limited.html")||die "File open error!";
my %hash;
for($i=0;$i<@merged;$i++){
	if($merged[$i] ne $merged[$i+1]){
		my $TFIDFvalue = $Obj->TFIDF("$main_paper","$merged[$i]");
		push(@TFIDFwordarray, $merged[$i]);
		push(@TFIDFvaluearray, $TFIDFvalue);
		push(@TFIDFvaluewordarray, ($TFIDFvalue." ".$merged[$i]));

		#print $merged[$i]."\n" ;
		#printf proto ("$merged[$i] ". "TF ");
		#printf proto ( $Obj->TF("$main_paper","$merged[$i]")."\n");
		#printf proto ( "$merged[$i] ". "IDF ");
		#printf proto ( $Obj->IDF("$merged[$i]")."\n");
		#printf proto ( "$merged[$i] ". "TF-IDF ");
		#printf proto ( $Obj->TFIDF("$main_paper","$merged[$i]")."\n");

	}
}

for($i=0;$i<@TFIDFvaluearray;$i++){
	$hash{$TFIDFwordarray[$i]} = "$TFIDFvaluearray[$i]";
	#printf proto "$TFIDFwordarray[$i]"." "."$hash{$TFIDFwordarray[$i]}"."\n";
}



# my @keys = keys(%hash); # 將所有鍵取出 存入陣列
# my @values = values(%hash); # 將所有值取出 存入陣列


# for($i=0;$i<@keys;$i++){
	# printf proto ("$keys[$i]"."\n");
	# }

# @hash{@TFIDFword} = @TFIDFvalue;
# @TFIDFvalue = reverse sort @TFIDFvalue;

#print length(@TFIDFword);
#print length(@TFIDFvalue);


 # for($i=0;$i<@TFIDFvalue;$i++){
	# printf proto ("$TFIDFvalue[$i]"."\n");
	# }
#@TFIDFvaluewordarray= reverse sort @TFIDFvaluewordarray;

# for($i=0;$i<@TFIDFvalueword;$i++){
	  # printf proto ("$TFIDFvalueword[$i]"."\n");
	 # }
	 
	 
###############

foreach $value (reverse sort {$hash{$a} <=> $hash{$b}} keys %hash){
	#printf proto "$value $hash{$value}"."\n";
		push(@TFIDFwordmergedarray, $value);
		push(@TFIDFvaluemergedarray, $hash{$value});
	}#使hash按照value值排序

################


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
			"text": "Biological report topic mining",
			"fontSize": 24,
			"font":"open sans"
		},
		"subtitle": {
			"text": "To visualize report key words.",
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
		"canvasWidth": 590,
		"pieOuterRadius": "90%"
	},
	"data": {
		"sortOrder": "value-desc",
			"smallSegmentGrouping": {
			"enabled": true,
			"value": 0
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


printf proto ($htmlStart);
for($i=0;$i<$pierange;$i++){
	  #printf proto ("$TFIDFwordmergedarray[$i] $TFIDFvaluemergedarray[$i]"."\n");
	  	my $range = 256;#設定亂數範圍
		my $random_number = int(rand($range));#生成亂數
		my $r = int(rand($range));#亂數紅
		my $g = int(rand($range));#亂數藍
		my $b = int(rand($range));#亂數綠
		$hex_r = sprintf("%x", $r);
		#print $hex_r;#亂數紅hex版
		$hex_g = sprintf("%x", $g);
		#print $hex_g;#亂數綠hex版
		$hex_b = sprintf("%x", $b);
		#print $hex_b;#亂數藍hex版
	  printf proto ("{\"label\":\"$TFIDFwordmergedarray[$i]\",\n\"value\":$TFIDFvaluemergedarray[$i],\n\"color\":\"\#$hex_r$hex_g$hex_b\"},\n");
	  
	 }
printf proto ($htmlEnd);
close (proto);
system "TFIDF limited.html";
exit;