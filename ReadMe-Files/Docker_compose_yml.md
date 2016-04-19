#Following are the steps need to be done for setting up the docker-compose.yml file

Step 1: Create a new instance using the AMI (Docker_Compose)

Step 2: While creating the instance add the command "docker-compose up -d" in the USER DATA

Step 3: ssh into the instance 

Step 4: run the command "docker ps"

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

Step 9: open the run.sh file for sync gateway from the location /Docker/sync_gateway/run.sh and copy the url in the file 

       case "$1" in  *)   
       
       sync_gateway 
       
       https://gist.githubusercontent.com/Vranda2011/81f015a138a1a86d6f8f7e854743d25d/raw/047c32c99323fb86374df355bf5099434deab
       
       478/config.json;;  // replace this URL with your gist URL 
       
       esac}
        

Step 10: save and exit the file and build the image of sync gateway again 

Step 11: run "docker-compose up -d"

Note: Also make sure that linking_volume container is always present in either running or stop state in docker as couchbase 
      uses its volume to make default configurations.
      
Step 12: You will have all the containers running on different ports now:

       couchbase:ElasticIp:8091
       sync_gateway:ElasticIp:4985/_admin/
       couchdb:ElasticIp:5984
       odata:ElasticIp:8888
       ionic:ElasticIp:8100
        
Step 13: Now open all the required containers with the given ports on the web console 

Step 14: Testing can be done by:

     14.1  Open the Ionic App in web console and add data in that
     
     14.2  Now run a curl command for continuous integration of couchdb with couchbase 
     
           Command: 
           
     14.3  This will save the data to Couchbase server and also in couchdb client db
     
     14.4  Now open the Odata in browser and make following configurtions to connect it to the couchbase server
           Uname: Uname of couchbase 
           Password: Paswword of couchbase
           Server IP: Elastic IP:8091  (Couchbase configuration)
           
     14.5  Test the connection and try adding the tables, if the data sync is working: the bucket from couchbase will be     replicated in the odata console. And hence will be transfered to the Salesforce Application.
     
 Step 15: If the procedure works successfully that means you have made correct configurations and ready to work on the IOT   Infrastructure for data replication from client db(device application database) 
      


