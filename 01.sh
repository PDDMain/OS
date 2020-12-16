test_dir=$HOME/test/
date_time=$(date +"%d-%m-%Y_%H-%M")
domain="www.net_nikogo.ru"
mkdir $test_dir 2> /dev/null &&
  (echo "catalog test was created successfully" >> ~/report;
   touch $test_dir$date_time)

ping $domain -n 1 2> /dev/null ||
  echo $date_time': '$domain'  is unreachable' >> ~/report
