#Following are the steps need to be done for setting up the docker-compose.yml file

Step 1: Create a new instance using the AMI (Docker_Compose)

Step 2: While creating the instance add the command "docker-compose up -d" in the USER DATA

Step 3: Associate the Elasic Ip and ssh into the instance 

Step 4: run the command "docker ps", you will see four containers running(couchbase, couchdb, odata and ionic)

Step 5: go to github gist of your github account

       Note : Gists are a great way to share your work. You can share single files, parts of files, or full applications. You can access gists at https://gist.github.com.

       Every gist is a Git repository, which means that it can be forked, cloned, and manipulated in every way.

Step 6: Create a new gist file named as config.json amd copy the following code in it

       { 
    "interface":":4984", 
    "adminInterface":":4985", 
    "log":["REST"], 
    "databases":{ 
       "sync_gateway":{ 
          "server":"http://54.233.161.75:8091",     // just change the IP with your elastic IP here
          "bucket":"sync_gateway", 
          "sync":`function(doc) {channel(doc.channels);}`,
          "users": {
                "GUEST": {
                    "disabled": false,
                    "admin_channels": ["*"]
                }
            }
      } 
   } 
 } 

Step 7: get the RAW URL from the github for the config.json and copy it to the clipboard

       Note: (look for the raw button on the top-right of the source code).

Step 8: go to the terminal 

Step 9: open the run.sh file for sync gateway from the location /Docker/sync_gateway/run.sh and replace the url in the file at the following location:

       case "$1" in  *)   
       
       sync_gateway 
       
       https://gist.githubusercontent.com/Vranda2011/81f015a138a1a86d6f8f7e854743d25d/raw/047c32c99323fb86374df355bf5099434deab
       
       478/config.json;;  // replace this URL with your gist URL 
       
       esac}
        

Step 10: save and exit the file and build the image of sync gateway again 

Step 11: Now you need to make some changes in the Ionic container so run the ionic container individually using the following command :

       docker run -it -p 8100:8100 image_name /bin/bash
       
       Step 11.1: Go to app.js which is in /Sensor-app/Sensor_zip/www/js location and find the two locations where an IP address is mapped, change it with your elastic IP and save the file. (Do not exit the container)
        
       Step 11.2: Open new terminal and do the following:
                  docker ps (copy the ionic container id)
                  docker commit -p container_id new_name #this new name should be changed in the docker-compose.yml file
       Step 11.3: After creating an image out of the container you can stop and remove the container          

Step 12: run "docker-compose up -d"

Note: Also make sure that linking_volume container is always present in stop state in docker as couchbase 
      uses its volume to make default configurations.
      
Step 13: You will have all the containers running on different ports now:

       couchbase:ElasticIp:8091
       sync_gateway:ElasticIp:4985/_admin/
       couchdb:ElasticIp:5984
       odata:ElasticIp:8888
       ionic:ElasticIp:8100
        
Step 14: Now open all the required containers with the given ports on the web console 

Step 15: Testing can be done by:

     15.1  Open the Ionic App in web console and add data in that
     
     15.2  Now run a curl command for continuous integration of couchdb with couchbase 
     
           Command: 
           
     15.3  This will save the data to Couchbase server and also in couchdb client db
     
     15.4  Now open the Odata in browser and make following configurtions to connect it to the couchbase server
           Uname: Uname of couchbase 
           Password: Paswword of couchbase
           Server IP: Elastic IP:8091  (Couchbase configuration)
           
     15.5  Test the connection and try adding the tables, if the data sync is working: the bucket from couchbase will be replicated in the odata console. And hence will be transfered to the Salesforce Application.
     
 Step 16: If the procedure works successfully that means you have made correct configurations and ready to work on the IOT 
 
 Infrastructure for data replication from client db(device application database) 
      


