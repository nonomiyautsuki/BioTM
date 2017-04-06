print "Please input the reporter:";
$textfile=<STDIN>;
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
	#print @merged;
	
		
		
%toRemve = (
	"'ll"=>1,
	"'ll"=>1,
	"'ve"=>1,
	"'ve"=>1,
	"a"=>1,
	"A"=>1,
	"able"=>1,
	"Able"=>1,
	"about"=>1,
	"About"=>1,
	"above"=>1,
	"Above"=>1,
	"abst"=>1,
	"Abst"=>1,
	"accordance"=>1,
	"Accordance"=>1,
	"according"=>1,
	"According"=>1,
	"accordingly"=>1,
	"Accordingly"=>1,
	"across"=>1,
	"Across"=>1,
	"act"=>1,
	"Act"=>1,
	"actually"=>1,
	"Actually"=>1,
	"added"=>1,
	"Added"=>1,
	"adj"=>1,
	"Adj"=>1,
	"affected"=>1,
	"Affected"=>1,
	"affecting"=>1,
	"Affecting"=>1,
	"affects"=>1,
	"Affects"=>1,
	"after"=>1,
	"After"=>1,
	"afterwards"=>1,
	"Afterwards"=>1,
	"again"=>1,
	"Again"=>1,
	"against"=>1,
	"Against"=>1,
	"ah"=>1,
	"Ah"=>1,
	"all"=>1,
	"All"=>1,
	"almost"=>1,
	"Almost"=>1,
	"alone"=>1,
	"Alone"=>1,
	"along"=>1,
	"Along"=>1,
	"already"=>1,
	"Already"=>1,
	"also"=>1,
	"Also"=>1,
	"although"=>1,
	"Although"=>1,
	"always"=>1,
	"Always"=>1,
	"am"=>1,
	"Am"=>1,
	"among"=>1,
	"Among"=>1,
	"amongst"=>1,
	"Amongst"=>1,
	"an"=>1,
	"An"=>1,
	"and"=>1,
	"And"=>1,
	"announce"=>1,
	"Announce"=>1,
	"another"=>1,
	"Another"=>1,
	"any"=>1,
	"Any"=>1,
	"anybody"=>1,
	"Anybody"=>1,
	"anyhow"=>1,
	"Anyhow"=>1,
	"anymore"=>1,
	"Anymore"=>1,
	"anyone"=>1,
	"Anyone"=>1,
	"anything"=>1,
	"Anything"=>1,
	"anyway"=>1,
	"Anyway"=>1,
	"anyways"=>1,
	"Anyways"=>1,
	"anywhere"=>1,
	"Anywhere"=>1,
	"apparently"=>1,
	"Apparently"=>1,
	"approximately"=>1,
	"Approximately"=>1,
	"are"=>1,
	"Are"=>1,
	"aren"=>1,
	"Aren"=>1,
	"arent"=>1,
	"Arent"=>1,
	"arise"=>1,
	"Arise"=>1,
	"around"=>1,
	"Around"=>1,
	"as"=>1,
	"As"=>1,
	"aside"=>1,
	"Aside"=>1,
	"ask"=>1,
	"Ask"=>1,
	"asking"=>1,
	"Asking"=>1,
	"at"=>1,
	"At"=>1,
	"auth"=>1,
	"Auth"=>1,
	"available"=>1,
	"Available"=>1,
	"away"=>1,
	"Away"=>1,
	"awfully"=>1,
	"Awfully"=>1,
	"b"=>1,
	"B"=>1,
	"back"=>1,
	"Back"=>1,
	"be"=>1,
	"Be"=>1,
	"became"=>1,
	"Became"=>1,
	"because"=>1,
	"Because"=>1,
	"become"=>1,
	"Become"=>1,
	"becomes"=>1,
	"Becomes"=>1,
	"becoming"=>1,
	"Becoming"=>1,
	"been"=>1,
	"Been"=>1,
	"before"=>1,
	"Before"=>1,
	"beforehand"=>1,
	"Beforehand"=>1,
	"begin"=>1,
	"Begin"=>1,
	"beginning"=>1,
	"Beginning"=>1,
	"beginnings"=>1,
	"Beginnings"=>1,
	"begins"=>1,
	"Begins"=>1,
	"behind"=>1,
	"Behind"=>1,
	"being"=>1,
	"Being"=>1,
	"believe"=>1,
	"Believe"=>1,
	"below"=>1,
	"Below"=>1,
	"beside"=>1,
	"Beside"=>1,
	"besides"=>1,
	"Besides"=>1,
	"between"=>1,
	"Between"=>1,
	"beyond"=>1,
	"Beyond"=>1,
	"biol"=>1,
	"Biol"=>1,
	"both"=>1,
	"Both"=>1,
	"brief"=>1,
	"Brief"=>1,
	"briefly"=>1,
	"Briefly"=>1,
	"but"=>1,
	"But"=>1,
	"by"=>1,
	"By"=>1,
	"c"=>1,
	"C"=>1,
	"ca"=>1,
	"Ca"=>1,
	"came"=>1,
	"Came"=>1,
	"can"=>1,
	"Can"=>1,
	"can't"=>1,
	"Can't"=>1,
	"cannot"=>1,
	"Cannot"=>1,
	"cause"=>1,
	"Cause"=>1,
	"causes"=>1,
	"Causes"=>1,
	"certain"=>1,
	"Certain"=>1,
	"certainly"=>1,
	"Certainly"=>1,
	"co"=>1,
	"Co"=>1,
	"com"=>1,
	"Com"=>1,
	"come"=>1,
	"Come"=>1,
	"comes"=>1,
	"Comes"=>1,
	"contain"=>1,
	"Contain"=>1,
	"containing"=>1,
	"Containing"=>1,
	"contains"=>1,
	"Contains"=>1,
	"could"=>1,
	"Could"=>1,
	"couldnt"=>1,
	"Couldnt"=>1,
	"d"=>1,
	"D"=>1,
	"date"=>1,
	"Date"=>1,
	"did"=>1,
	"Did"=>1,
	"didn't"=>1,
	"Didn't"=>1,
	"different"=>1,
	"Different"=>1,
	"do"=>1,
	"Do"=>1,
	"does"=>1,
	"Does"=>1,
	"doesn't"=>1,
	"Doesn't"=>1,
	"doing"=>1,
	"Doing"=>1,
	"don't"=>1,
	"Don't"=>1,
	"done"=>1,
	"Done"=>1,
	"down"=>1,
	"Down"=>1,
	"downwards"=>1,
	"Downwards"=>1,
	"due"=>1,
	"Due"=>1,
	"during"=>1,
	"During"=>1,
	"e"=>1,
	"E"=>1,
	"each"=>1,
	"Each"=>1,
	"ed"=>1,
	"Ed"=>1,
	"edu"=>1,
	"Edu"=>1,
	"effect"=>1,
	"Effect"=>1,
	"eg"=>1,
	"Eg"=>1,
	"eight"=>1,
	"Eight"=>1,
	"eighty"=>1,
	"Eighty"=>1,
	"either"=>1,
	"Either"=>1,
	"else"=>1,
	"Else"=>1,
	"elsewhere"=>1,
	"Elsewhere"=>1,
	"end"=>1,
	"End"=>1,
	"ending"=>1,
	"Ending"=>1,
	"enough"=>1,
	"Enough"=>1,
	"especially"=>1,
	"Especially"=>1,
	"et"=>1,
	"Et"=>1,
	"et-al"=>1,
	"Et-al"=>1,
	"etc"=>1,
	"Etc"=>1,
	"even"=>1,
	"Even"=>1,
	"ever"=>1,
	"Ever"=>1,
	"every"=>1,
	"Every"=>1,
	"everybody"=>1,
	"Everybody"=>1,
	"everyone"=>1,
	"Everyone"=>1,
	"everything"=>1,
	"Everything"=>1,
	"everywhere"=>1,
	"Everywhere"=>1,
	"ex"=>1,
	"Ex"=>1,
	"except"=>1,
	"Except"=>1,
	"f"=>1,
	"F"=>1,
	"far"=>1,
	"Far"=>1,
	"few"=>1,
	"Few"=>1,
	"ff"=>1,
	"Ff"=>1,
	"fifth"=>1,
	"Fifth"=>1,
	"first"=>1,
	"First"=>1,
	"five"=>1,
	"Five"=>1,
	"fix"=>1,
	"Fix"=>1,
	"followed"=>1,
	"Followed"=>1,
	"following"=>1,
	"Following"=>1,
	"follows"=>1,
	"Follows"=>1,
	"for"=>1,
	"For"=>1,
	"former"=>1,
	"Former"=>1,
	"formerly"=>1,
	"Formerly"=>1,
	"forth"=>1,
	"Forth"=>1,
	"found"=>1,
	"Found"=>1,
	"four"=>1,
	"Four"=>1,
	"from"=>1,
	"From"=>1,
	"further"=>1,
	"Further"=>1,
	"furthermore"=>1,
	"Furthermore"=>1,
	"g"=>1,
	"G"=>1,
	"gave"=>1,
	"Gave"=>1,
	"get"=>1,
	"Get"=>1,
	"gets"=>1,
	"Gets"=>1,
	"getting"=>1,
	"Getting"=>1,
	"give"=>1,
	"Give"=>1,
	"given"=>1,
	"Given"=>1,
	"gives"=>1,
	"Gives"=>1,
	"giving"=>1,
	"Giving"=>1,
	"go"=>1,
	"Go"=>1,
	"goes"=>1,
	"Goes"=>1,
	"gone"=>1,
	"Gone"=>1,
	"got"=>1,
	"Got"=>1,
	"gotten"=>1,
	"Gotten"=>1,
	"h"=>1,
	"H"=>1,
	"had"=>1,
	"Had"=>1,
	"happens"=>1,
	"Happens"=>1,
	"hardly"=>1,
	"Hardly"=>1,
	"has"=>1,
	"Has"=>1,
	"hasn't"=>1,
	"Hasn't"=>1,
	"have"=>1,
	"Have"=>1,
	"haven't"=>1,
	"Haven't"=>1,
	"having"=>1,
	"Having"=>1,
	"he"=>1,
	"He"=>1,
	"hed"=>1,
	"Hed"=>1,
	"hence"=>1,
	"Hence"=>1,
	"her"=>1,
	"Her"=>1,
	"here"=>1,
	"Here"=>1,
	"hereafter"=>1,
	"Hereafter"=>1,
	"hereby"=>1,
	"Hereby"=>1,
	"herein"=>1,
	"Herein"=>1,
	"heres"=>1,
	"Heres"=>1,
	"hereupon"=>1,
	"Hereupon"=>1,
	"hers"=>1,
	"Hers"=>1,
	"herself"=>1,
	"Herself"=>1,
	"hes"=>1,
	"Hes"=>1,
	"hi"=>1,
	"Hi"=>1,
	"hid"=>1,
	"Hid"=>1,
	"him"=>1,
	"Him"=>1,
	"himself"=>1,
	"Himself"=>1,
	"his"=>1,
	"His"=>1,
	"hither"=>1,
	"Hither"=>1,
	"home"=>1,
	"Home"=>1,
	"how"=>1,
	"How"=>1,
	"howbeit"=>1,
	"Howbeit"=>1,
	"however"=>1,
	"However"=>1,
	"hundred"=>1,
	"Hundred"=>1,
	"i"=>1,
	"I"=>1,
	"i'll"=>1,
	"I'll"=>1,
	"i've"=>1,
	"I've"=>1,
	"id"=>1,
	"Id"=>1,
	"ie"=>1,
	"Ie"=>1,
	"if"=>1,
	"If"=>1,
	"im"=>1,
	"Im"=>1,
	"immediate"=>1,
	"Immediate"=>1,
	"immediately"=>1,
	"Immediately"=>1,
	"importance"=>1,
	"Importance"=>1,
	"important"=>1,
	"Important"=>1,
	"in"=>1,
	"In"=>1,
	"inc"=>1,
	"Inc"=>1,
	"indeed"=>1,
	"Indeed"=>1,
	"index"=>1,
	"Index"=>1,
	"information"=>1,
	"Information"=>1,
	"instead"=>1,
	"Instead"=>1,
	"into"=>1,
	"Into"=>1,
	"invention"=>1,
	"Invention"=>1,
	"inward"=>1,
	"Inward"=>1,
	"is"=>1,
	"Is"=>1,
	"isn't"=>1,
	"Isn't"=>1,
	"it"=>1,
	"It"=>1,
	"it'll"=>1,
	"It'll"=>1,
	"itd"=>1,
	"Itd"=>1,
	"its"=>1,
	"Its"=>1,
	"itself"=>1,
	"Itself"=>1,
	"j"=>1,
	"J"=>1,
	"just"=>1,
	"Just"=>1,
	"k"=>1,
	"K"=>1,
	"keep	keeps"=>1,
	"Keep	keeps"=>1,
	"kept"=>1,
	"Kept"=>1,
	"kg"=>1,
	"Kg"=>1,
	"km"=>1,
	"Km"=>1,
	"know"=>1,
	"Know"=>1,
	"known"=>1,
	"Known"=>1,
	"knows"=>1,
	"Knows"=>1,
	"l"=>1,
	"L"=>1,
	"largely"=>1,
	"Largely"=>1,
	"last"=>1,
	"Last"=>1,
	"lately"=>1,
	"Lately"=>1,
	"later"=>1,
	"Later"=>1,
	"latter"=>1,
	"Latter"=>1,
	"latterly"=>1,
	"Latterly"=>1,
	"least"=>1,
	"Least"=>1,
	"less"=>1,
	"Less"=>1,
	"lest"=>1,
	"Lest"=>1,
	"let"=>1,
	"Let"=>1,
	"lets"=>1,
	"Lets"=>1,
	"like"=>1,
	"Like"=>1,
	"liked"=>1,
	"Liked"=>1,
	"likely"=>1,
	"Likely"=>1,
	"line"=>1,
	"Line"=>1,
	"little"=>1,
	"Little"=>1,
	"look"=>1,
	"Look"=>1,
	"looking"=>1,
	"Looking"=>1,
	"looks"=>1,
	"Looks"=>1,
	"ltd"=>1,
	"Ltd"=>1,
	"m"=>1,
	"M"=>1,
	"made"=>1,
	"Made"=>1,
	"mainly"=>1,
	"Mainly"=>1,
	"make"=>1,
	"Make"=>1,
	"makes"=>1,
	"Makes"=>1,
	"many"=>1,
	"Many"=>1,
	"may"=>1,
	"May"=>1,
	"maybe"=>1,
	"Maybe"=>1,
	"me"=>1,
	"Me"=>1,
	"mean"=>1,
	"Mean"=>1,
	"means"=>1,
	"Means"=>1,
	"meantime"=>1,
	"Meantime"=>1,
	"meanwhile"=>1,
	"Meanwhile"=>1,
	"merely"=>1,
	"Merely"=>1,
	"mg"=>1,
	"Mg"=>1,
	"might"=>1,
	"Might"=>1,
	"million"=>1,
	"Million"=>1,
	"miss"=>1,
	"Miss"=>1,
	"ml"=>1,
	"Ml"=>1,
	"more"=>1,
	"More"=>1,
	"moreover"=>1,
	"Moreover"=>1,
	"most"=>1,
	"Most"=>1,
	"mostly"=>1,
	"Mostly"=>1,
	"mr"=>1,
	"Mr"=>1,
	"mrs"=>1,
	"Mrs"=>1,
	"much"=>1,
	"Much"=>1,
	"mug"=>1,
	"Mug"=>1,
	"must"=>1,
	"Must"=>1,
	"my"=>1,
	"My"=>1,
	"myself"=>1,
	"Myself"=>1,
	"n"=>1,
	"N"=>1,
	"na"=>1,
	"Na"=>1,
	"name"=>1,
	"Name"=>1,
	"namely"=>1,
	"Namely"=>1,
	"nay"=>1,
	"Nay"=>1,
	"nd"=>1,
	"Nd"=>1,
	"near"=>1,
	"Near"=>1,
	"nearly"=>1,
	"Nearly"=>1,
	"necessarily"=>1,
	"Necessarily"=>1,
	"necessary"=>1,
	"Necessary"=>1,
	"need"=>1,
	"Need"=>1,
	"needs"=>1,
	"Needs"=>1,
	"neither"=>1,
	"Neither"=>1,
	"never"=>1,
	"Never"=>1,
	"nevertheless"=>1,
	"Nevertheless"=>1,
	"new"=>1,
	"New"=>1,
	"next"=>1,
	"Next"=>1,
	"nine"=>1,
	"Nine"=>1,
	"ninety"=>1,
	"Ninety"=>1,
	"no"=>1,
	"No"=>1,
	"nobody"=>1,
	"Nobody"=>1,
	"non"=>1,
	"Non"=>1,
	"none"=>1,
	"None"=>1,
	"nonetheless"=>1,
	"Nonetheless"=>1,
	"noone"=>1,
	"Noone"=>1,
	"nor"=>1,
	"Nor"=>1,
	"normally"=>1,
	"Normally"=>1,
	"nos"=>1,
	"Nos"=>1,
	"not"=>1,
	"Not"=>1,
	"noted"=>1,
	"Noted"=>1,
	"nothing"=>1,
	"Nothing"=>1,
	"now"=>1,
	"Now"=>1,
	"nowhere"=>1,
	"Nowhere"=>1,
	"o"=>1,
	"O"=>1,
	"obtain"=>1,
	"Obtain"=>1,
	"obtained"=>1,
	"Obtained"=>1,
	"obviously"=>1,
	"Obviously"=>1,
	"of"=>1,
	"Of"=>1,
	"off"=>1,
	"Off"=>1,
	"often"=>1,
	"Often"=>1,
	"oh"=>1,
	"Oh"=>1,
	"ok"=>1,
	"Ok"=>1,
	"okay"=>1,
	"Okay"=>1,
	"old"=>1,
	"Old"=>1,
	"omitted"=>1,
	"Omitted"=>1,
	"on"=>1,
	"On"=>1,
	"once"=>1,
	"Once"=>1,
	"one"=>1,
	"One"=>1,
	"ones"=>1,
	"Ones"=>1,
	"only"=>1,
	"Only"=>1,
	"onto"=>1,
	"Onto"=>1,
	"or"=>1,
	"Or"=>1,
	"ord"=>1,
	"Ord"=>1,
	"other"=>1,
	"Other"=>1,
	"others"=>1,
	"Others"=>1,
	"otherwise"=>1,
	"Otherwise"=>1,
	"ought"=>1,
	"Ought"=>1,
	"our"=>1,
	"Our"=>1,
	"ours"=>1,
	"Ours"=>1,
	"ourselves"=>1,
	"Ourselves"=>1,
	"out"=>1,
	"Out"=>1,
	"outside"=>1,
	"Outside"=>1,
	"over"=>1,
	"Over"=>1,
	"overall"=>1,
	"Overall"=>1,
	"owing"=>1,
	"Owing"=>1,
	"own"=>1,
	"Own"=>1,
	"p"=>1,
	"P"=>1,
	"page"=>1,
	"Page"=>1,
	"pages"=>1,
	"Pages"=>1,
	"part"=>1,
	"Part"=>1,
	"particular"=>1,
	"Particular"=>1,
	"particularly"=>1,
	"Particularly"=>1,
	"past"=>1,
	"Past"=>1,
	"per"=>1,
	"Per"=>1,
	"perhaps"=>1,
	"Perhaps"=>1,
	"placed"=>1,
	"Placed"=>1,
	"please"=>1,
	"Please"=>1,
	"plus"=>1,
	"Plus"=>1,
	"poorly"=>1,
	"Poorly"=>1,
	"possible"=>1,
	"Possible"=>1,
	"possibly"=>1,
	"Possibly"=>1,
	"potentially"=>1,
	"Potentially"=>1,
	"pp"=>1,
	"Pp"=>1,
	"predominantly"=>1,
	"Predominantly"=>1,
	"present"=>1,
	"Present"=>1,
	"previously"=>1,
	"Previously"=>1,
	"primarily"=>1,
	"Primarily"=>1,
	"probably"=>1,
	"Probably"=>1,
	"promptly"=>1,
	"Promptly"=>1,
	"proud"=>1,
	"Proud"=>1,
	"provides"=>1,
	"Provides"=>1,
	"put"=>1,
	"Put"=>1,
	"q"=>1,
	"Q"=>1,
	"que"=>1,
	"Que"=>1,
	"quickly"=>1,
	"Quickly"=>1,
	"quite"=>1,
	"Quite"=>1,
	"qv"=>1,
	"Qv"=>1,
	"r"=>1,
	"R"=>1,
	"ran"=>1,
	"Ran"=>1,
	"rather"=>1,
	"Rather"=>1,
	"rd"=>1,
	"Rd"=>1,
	"re"=>1,
	"Re"=>1,
	"readily"=>1,
	"Readily"=>1,
	"really"=>1,
	"Really"=>1,
	"recent"=>1,
	"Recent"=>1,
	"recently"=>1,
	"Recently"=>1,
	"ref"=>1,
	"Ref"=>1,
	"refs"=>1,
	"Refs"=>1,
	"regarding"=>1,
	"Regarding"=>1,
	"regardless"=>1,
	"Regardless"=>1,
	"regards"=>1,
	"Regards"=>1,
	"related"=>1,
	"Related"=>1,
	"relatively"=>1,
	"Relatively"=>1,
	"research"=>1,
	"Research"=>1,
	"respectively"=>1,
	"Respectively"=>1,
	"resulted"=>1,
	"Resulted"=>1,
	"resulting"=>1,
	"Resulting"=>1,
	"results"=>1,
	"Results"=>1,
	"right"=>1,
	"Right"=>1,
	"run"=>1,
	"Run"=>1,
	"s"=>1,
	"S"=>1,
	"said"=>1,
	"Said"=>1,
	"same"=>1,
	"Same"=>1,
	"saw"=>1,
	"Saw"=>1,
	"say"=>1,
	"Say"=>1,
	"saying"=>1,
	"Saying"=>1,
	"says"=>1,
	"Says"=>1,
	"sec"=>1,
	"Sec"=>1,
	"section"=>1,
	"Section"=>1,
	"see"=>1,
	"See"=>1,
	"seeing"=>1,
	"Seeing"=>1,
	"seem"=>1,
	"Seem"=>1,
	"seemed"=>1,
	"Seemed"=>1,
	"seeming"=>1,
	"Seeming"=>1,
	"seems"=>1,
	"Seems"=>1,
	"seen"=>1,
	"Seen"=>1,
	"self"=>1,
	"Self"=>1,
	"selves"=>1,
	"Selves"=>1,
	"sent"=>1,
	"Sent"=>1,
	"seven"=>1,
	"Seven"=>1,
	"several"=>1,
	"Several"=>1,
	"shall"=>1,
	"Shall"=>1,
	"she"=>1,
	"She"=>1,
	"she'll"=>1,
	"She'll"=>1,
	"shed"=>1,
	"Shed"=>1,
	"shes"=>1,
	"Shes"=>1,
	"should"=>1,
	"Should"=>1,
	"shouldn't"=>1,
	"Shouldn't"=>1,
	"show"=>1,
	"Show"=>1,
	"showed"=>1,
	"Showed"=>1,
	"shown"=>1,
	"Shown"=>1,
	"showns"=>1,
	"Showns"=>1,
	"shows"=>1,
	"Shows"=>1,
	"significant"=>1,
	"Significant"=>1,
	"significantly"=>1,
	"Significantly"=>1,
	"similar"=>1,
	"Similar"=>1,
	"similarly"=>1,
	"Similarly"=>1,
	"since"=>1,
	"Since"=>1,
	"six"=>1,
	"Six"=>1,
	"slightly"=>1,
	"Slightly"=>1,
	"so"=>1,
	"So"=>1,
	"some"=>1,
	"Some"=>1,
	"somebody"=>1,
	"Somebody"=>1,
	"somehow"=>1,
	"Somehow"=>1,
	"someone"=>1,
	"Someone"=>1,
	"somethan"=>1,
	"Somethan"=>1,
	"something"=>1,
	"Something"=>1,
	"sometime"=>1,
	"Sometime"=>1,
	"sometimes"=>1,
	"Sometimes"=>1,
	"somewhat"=>1,
	"Somewhat"=>1,
	"somewhere"=>1,
	"Somewhere"=>1,
	"soon"=>1,
	"Soon"=>1,
	"sorry"=>1,
	"Sorry"=>1,
	"specifically"=>1,
	"Specifically"=>1,
	"specified"=>1,
	"Specified"=>1,
	"specify"=>1,
	"Specify"=>1,
	"specifying"=>1,
	"Specifying"=>1,
	"still"=>1,
	"Still"=>1,
	"stop"=>1,
	"Stop"=>1,
	"strongly"=>1,
	"Strongly"=>1,
	"sub"=>1,
	"Sub"=>1,
	"substantially"=>1,
	"Substantially"=>1,
	"successfully"=>1,
	"Successfully"=>1,
	"such"=>1,
	"Such"=>1,
	"sufficiently"=>1,
	"Sufficiently"=>1,
	"suggest"=>1,
	"Suggest"=>1,
	"sup"=>1,
	"Sup"=>1,
	"sure	t"=>1,
	"Sure	t"=>1,
	"take"=>1,
	"Take"=>1,
	"taken"=>1,
	"Taken"=>1,
	"taking"=>1,
	"Taking"=>1,
	"tell"=>1,
	"Tell"=>1,
	"tends"=>1,
	"Tends"=>1,
	"th"=>1,
	"Th"=>1,
	"than"=>1,
	"Than"=>1,
	"thank"=>1,
	"Thank"=>1,
	"thanks"=>1,
	"Thanks"=>1,
	"thanx"=>1,
	"Thanx"=>1,
	"that"=>1,
	"That"=>1,
	"that'll"=>1,
	"That'll"=>1,
	"that've"=>1,
	"That've"=>1,
	"thats"=>1,
	"Thats"=>1,
	"the"=>1,
	"The"=>1,
	"their"=>1,
	"Their"=>1,
	"theirs"=>1,
	"Theirs"=>1,
	"them"=>1,
	"Them"=>1,
	"themselves"=>1,
	"Themselves"=>1,
	"then"=>1,
	"Then"=>1,
	"thence"=>1,
	"Thence"=>1,
	"there"=>1,
	"There"=>1,
	"there'll"=>1,
	"There'll"=>1,
	"there've"=>1,
	"There've"=>1,
	"thereafter"=>1,
	"Thereafter"=>1,
	"thereby"=>1,
	"Thereby"=>1,
	"thered"=>1,
	"Thered"=>1,
	"therefore"=>1,
	"Therefore"=>1,
	"therein"=>1,
	"Therein"=>1,
	"thereof"=>1,
	"Thereof"=>1,
	"therere"=>1,
	"Therere"=>1,
	"theres"=>1,
	"Theres"=>1,
	"thereto"=>1,
	"Thereto"=>1,
	"thereupon"=>1,
	"Thereupon"=>1,
	"these"=>1,
	"These"=>1,
	"they"=>1,
	"They"=>1,
	"they'll"=>1,
	"They'll"=>1,
	"they've"=>1,
	"They've"=>1,
	"theyd"=>1,
	"Theyd"=>1,
	"theyre"=>1,
	"Theyre"=>1,
	"think"=>1,
	"Think"=>1,
	"this"=>1,
	"This"=>1,
	"those"=>1,
	"Those"=>1,
	"thou"=>1,
	"Thou"=>1,
	"though"=>1,
	"Though"=>1,
	"thoughh"=>1,
	"Thoughh"=>1,
	"thousand"=>1,
	"Thousand"=>1,
	"throug"=>1,
	"Throug"=>1,
	"through"=>1,
	"Through"=>1,
	"throughout"=>1,
	"Throughout"=>1,
	"thru"=>1,
	"Thru"=>1,
	"thus"=>1,
	"Thus"=>1,
	"til"=>1,
	"Til"=>1,
	"tip"=>1,
	"Tip"=>1,
	"to"=>1,
	"To"=>1,
	"together"=>1,
	"Together"=>1,
	"too"=>1,
	"Too"=>1,
	"took"=>1,
	"Took"=>1,
	"toward"=>1,
	"Toward"=>1,
	"towards"=>1,
	"Towards"=>1,
	"tried"=>1,
	"Tried"=>1,
	"tries"=>1,
	"Tries"=>1,
	"truly"=>1,
	"Truly"=>1,
	"try"=>1,
	"Try"=>1,
	"trying"=>1,
	"Trying"=>1,
	"ts"=>1,
	"Ts"=>1,
	"twice"=>1,
	"Twice"=>1,
	"two"=>1,
	"Two"=>1,
	"u"=>1,
	"U"=>1,
	"un"=>1,
	"Un"=>1,
	"under"=>1,
	"Under"=>1,
	"unfortunately"=>1,
	"Unfortunately"=>1,
	"unless"=>1,
	"Unless"=>1,
	"unlike"=>1,
	"Unlike"=>1,
	"unlikely"=>1,
	"Unlikely"=>1,
	"until"=>1,
	"Until"=>1,
	"unto"=>1,
	"Unto"=>1,
	"up"=>1,
	"Up"=>1,
	"upon"=>1,
	"Upon"=>1,
	"ups"=>1,
	"Ups"=>1,
	"us"=>1,
	"Us"=>1,
	"use"=>1,
	"Use"=>1,
	"used"=>1,
	"Used"=>1,
	"useful"=>1,
	"Useful"=>1,
	"usefully"=>1,
	"Usefully"=>1,
	"usefulness"=>1,
	"Usefulness"=>1,
	"uses"=>1,
	"Uses"=>1,
	"using"=>1,
	"Using"=>1,
	"usually"=>1,
	"Usually"=>1,
	"v"=>1,
	"V"=>1,
	"value"=>1,
	"Value"=>1,
	"various"=>1,
	"Various"=>1,
	"very"=>1,
	"Very"=>1,
	"via"=>1,
	"Via"=>1,
	"viz"=>1,
	"Viz"=>1,
	"vol"=>1,
	"Vol"=>1,
	"vols"=>1,
	"Vols"=>1,
	"vs"=>1,
	"Vs"=>1,
	"w"=>1,
	"W"=>1,
	"want"=>1,
	"Want"=>1,
	"wants"=>1,
	"Wants"=>1,
	"was"=>1,
	"Was"=>1,
	"wasnt"=>1,
	"Wasnt"=>1,
	"way"=>1,
	"Way"=>1,
	"we"=>1,
	"We"=>1,
	"we'll"=>1,
	"We'll"=>1,
	"we've"=>1,
	"We've"=>1,
	"wed"=>1,
	"Wed"=>1,
	"welcome"=>1,
	"Welcome"=>1,
	"went"=>1,
	"Went"=>1,
	"were"=>1,
	"Were"=>1,
	"werent"=>1,
	"Werent"=>1,
	"what"=>1,
	"What"=>1,
	"what'll"=>1,
	"What'll"=>1,
	"whatever"=>1,
	"Whatever"=>1,
	"whats"=>1,
	"Whats"=>1,
	"when"=>1,
	"When"=>1,
	"whence"=>1,
	"Whence"=>1,
	"whenever"=>1,
	"Whenever"=>1,
	"where"=>1,
	"Where"=>1,
	"whereafter"=>1,
	"Whereafter"=>1,
	"whereas"=>1,
	"Whereas"=>1,
	"whereby"=>1,
	"Whereby"=>1,
	"wherein"=>1,
	"Wherein"=>1,
	"wheres"=>1,
	"Wheres"=>1,
	"whereupon"=>1,
	"Whereupon"=>1,
	"wherever"=>1,
	"Wherever"=>1,
	"whether"=>1,
	"Whether"=>1,
	"which"=>1,
	"Which"=>1,
	"while"=>1,
	"While"=>1,
	"whim"=>1,
	"Whim"=>1,
	"whither"=>1,
	"Whither"=>1,
	"who"=>1,
	"Who"=>1,
	"who'll"=>1,
	"Who'll"=>1,
	"whod"=>1,
	"Whod"=>1,
	"whoever"=>1,
	"Whoever"=>1,
	"whole"=>1,
	"Whole"=>1,
	"whom"=>1,
	"Whom"=>1,
	"whomever"=>1,
	"Whomever"=>1,
	"whos"=>1,
	"Whos"=>1,
	"whose"=>1,
	"Whose"=>1,
	"why"=>1,
	"Why"=>1,
	"widely"=>1,
	"Widely"=>1,
	"willing"=>1,
	"Willing"=>1,
	"wish"=>1,
	"Wish"=>1,
	"with"=>1,
	"With"=>1,
	"within"=>1,
	"Within"=>1,
	"without"=>1,
	"Without"=>1,
	"wont"=>1,
	"Wont"=>1,
	"words"=>1,
	"Words"=>1,
	"world"=>1,
	"World"=>1,
	"would"=>1,
	"Would"=>1,
	"wouldnt"=>1,
	"Wouldnt"=>1,
	"www"=>1,
	"Www"=>1,
	"x"=>1,
	"X"=>1,
	"y"=>1,
	"Y"=>1,
	"yes"=>1,
	"Yes"=>1,
	"yet"=>1,
	"Yet"=>1,
	"you"=>1,
	"You"=>1,
	"you'll"=>1,
	"You'll"=>1,
	"you've"=>1,
	"You've"=>1,
	"youd"=>1,
	"Youd"=>1,
	"your"=>1,
	"Your"=>1,
	"youre"=>1,
	"Youre"=>1,
	"yours"=>1,
	"Yours"=>1,
	"yourself"=>1,
	"Yourself"=>1,
	"yourselves"=>1,
	"Yourselves"=>1,
	"z"=>1,
	"Z"=>1,
	"zero"=>1,
	"Zero"=>1,
	"fig"=>1,
	"Fig"=>1,

);#不需要的Stopword

for($i=0;$i<@merged;$i++){
	 if($toRemve{$merged[$i]}){
		 delete $merged[$i];#除去以上常用詞彙
	 }
}

		
		
open (proto,">Single_article_mode\\temp.txt")||die "File open error!";
printf proto ($merged);
	
for($i=0;$i<@merged;$i++){
		printf proto ("$merged[$i]\n")
}


close (proto);
#system "temp.txt";
exit;