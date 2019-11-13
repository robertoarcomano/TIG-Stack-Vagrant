awk -v N=$1 -v DATABASE=$2 '
function random(width,start) {
  return sprintf("%.2d",rand()*width+start)
}

BEGIN {
 srand();
 print "CREATE DATABASE "DATABASE
 print "# DML"
 print "# CONTEXT-DATABASE: "DATABASE
 for (i=0; i<int(N); i++) {
   # Use a random sensor_id, 1-10
   sensor_id=random(10,1)

   # Use a random temperature, -20-40
   temperature=random(60,20)

   # Create date from Start to End of 2019 using Epoch format
   DATE=random(29894399000,1546300800000)
   print "temperature,sensor_id="sensor_id" temperature="temperature" "DATE;
 }
}'
