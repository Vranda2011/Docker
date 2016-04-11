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

NOTE : allow connections to the following ports: 

     11211, 11210, 11209, 4369,8091, 8092, 18091, 18092, 11214, 11215 and from 21100 to 21299.
     
     Port 8091:     Used by the Couchbase Web Console for REST/HTTP traffic.
     
     Port 8092:     Used to access views, run queries, XDCR,and update design documents.
     
     Port 11207:    Used by smart client libraries to access data nodes using SSL.
     
     Port 11210:    Used by smart client libraries or Moxi to directly connect to the data nodes.
     
     Port 11211:    Used by pre-existing Couchbase and memcached (non-smart) client libraries.
     
 Now to Prepare couchbase to configure with sync gateway we need to follow some steps :
 
 Step1:  Go to the console of couchbase
 
 Step2:  Create a new bucket named as sync_gateway
 
 And that is it...!
     
     Ports 11214 and 11215 : Used for SSL XDCR data encryption.
     
     Port 18091:    Used by the Couchbase Web Console for REST/HTTP traffic with SSL.
     
     Port 18092:    Used to access views, run queries, XDCR and update design documents with SSL.
     
     All other Ports :Used for other Couchbase Server communications.



