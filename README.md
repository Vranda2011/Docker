# IoT_Couchbase_Gateway Using Docker 

Steps to be followed for couchbase
 
Step 1. create a  dockerfile for couchbase
Step 2. create a folder named as "scripts"
Step 3. Go into the "scripts" folder
Step 4. create two files in that named as: "entrypoint.sh" and "run"
Step 5. Now Build the image using the following command
        sudo docker build -t couch .
        
Step 6. After we receive a message " successfully build" move to next step
Step 7. Run the container using the image name (Here: "couch")
        sudo docker run -t -i -d -p 8091:8091 couch

Step 7   To open the UI console on web 
     7.1 Paste the pubic DNS or the public Ip on the adress bar with the port number of couchbase "Ex:xx.xx.xxx.xx:8091"
     7.2 Now we can configure the couchbase and create buckets as per our requirement

