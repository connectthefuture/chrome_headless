# This doesn't work. 
#cat ~/sarnobat.git/yurl_queue_httpcat.txt  | perl -pe 's{.*http}{http}g' | grep -v null | grep -v jpg | DISPLAY=:99 xargs -n 1 -I% groovy headless.groovy ~/github/chrome_headless/chromedriver_linux64 "%"  | grep 'title>' | tee titles.txt
#head -10 ~/sarnobat.git/yurl_queue_httpcat.txt  | perl -pe 's{.*http}{http}g' | grep -v null | grep -v jpg | grep -v "'" | DISPLAY=:99 xargs -n 1 -I% groovy headless.groovy ~/github/chrome_headless/chromedriver_linux64 "%"  | grep 'title>'  | perl -pe 's{.*(<title)}{$1}g'  | perl -pe 's{(</title>).*}{$1}g' | tee titles.txt
cat  ~/sarnobat.git/yurl_queue_httpcat.txt  \
	| grep -v -f titles_attempted.txt \
	| head -30 \
	| perl -pe 's{.*http}{http}g' \
	| grep -v null \
	| grep -v jpg \
	| grep -v "'" \
	| tee -a titles_attempted.txt \
	| sh title_individual.sh \
	| tee titles_new.txt \
	| tee -a titles_all.txt
#	| DISPLAY=:99 groovy headless.groovy ~/github/chrome_headless/chromedriver_linux64   | tee out.txt   | grep --text '<title>' | tee -a title_lines.txt| perl -pe 's{.*<title>\s*(.*)</title>.*}{$1}g' \
