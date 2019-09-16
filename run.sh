 #!/bin/bash 
 COUNTER=0
 while [  $COUNTER -lt 50 ]; do
     echo The counter is $COUNTER
     let COUNTER=COUNTER+1 
     sleep 1
     echo $COUNTER >> a.txt
 done