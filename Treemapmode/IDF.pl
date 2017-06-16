use Text::TFIDF;
print "Please input the paper filecase:";
$paper_filecase=<STDIN>;
$paper_filecase=~s/\"//g;#要是路徑有空格，路徑外部會用""套住，導致路徑字串無法啟動
chomp $paper_filecase;

opendir (DIR, $paper_filecase) || die "Error in opening dir $paper_filecase\n";
while( ($filename = readdir(DIR))){
	if ($filename ne "." && $filename ne ".."){
		if ($filename =~ /.txt/){
			push (@filenamearray,"$filename");
			push (@paper_filecasearray,"$paper_filecase");
			push (@txtfile,"$paper_filecase\\$filename");
			$count++;
		}#限定只有後綴是.TXT才會加上COUNT
	}#"." and ".." are still unknown why they come out.
}
closedir(DIR);

$range = 100;
	my $Obj = new Text::TFIDF(file=>\@txtfile);
	unlink "cat.csv" if (-e "cat.csv");
	open (proto,">>cat.csv")||die "File open error!";
	printf proto ("Wordlist,IDF\n");
for($x=0;$x<@txtfile;$x++){
	@wordx = ();
	@splited = ();
	@merged = ();
	@TFIDFwordarray = ();
	@TFIDFvaluearray = ();
	@TFIDFvaluewordarray = ();
	@TFIDFwordmergedarray= ();
	@TFIDFvaluemergedarray= ();

	$main_paper=$txtfile[$x];
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
	my %hash = ();
	for($i=0;$i<@merged;$i++){
		if($merged[$i] ne $merged[$i+1]){
			my $TFvalue = $Obj->TF("$main_paper","$merged[$i]");
			my $TFIDFvalue = $Obj->TFIDF("$main_paper","$merged[$i]");
			push(@TFIDFwordarray, $merged[$i]);
			push(@TFIDFvaluearray, $TFIDFvalue);
			#push(@TFIDFvaluewordarray, ($TFIDFvalue." ".$merged[$i]));

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
	

	for($i=0;$i<$range;$i++){
		if($TFIDFvaluemergedarray[$i] eq "" ||$TFIDFwordmergedarray[$i] eq "" || $TFIDFvaluemergedarray[$i] eq ""){
			last;
		}
		if($i==$range-1 && $x==@txtfile-1){
			printf proto "$TFIDFwordmergedarray[$i],$TFIDFvaluemergedarray[$i]\n";
		}else{
			printf proto "$TFIDFwordmergedarray[$i],$TFIDFvaluemergedarray[$i]\n";
		}
	}
}

close (proto);
system "cat.csv";
exit;