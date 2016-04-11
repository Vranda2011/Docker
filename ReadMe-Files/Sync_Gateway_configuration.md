# Configuring Sync Gateway Using Docker

Steps to be followed are: 

Step 1: Install Docker-Engine and start Docker

Step 2: Create a Dockerfile for sync Gateway (given here in this github)

Step 3: Create another file called as "run.sh" for giving the execution part of sync gateway

Step 4: Open Github GIST and create a file called as Config.json (given here in github gist)

Step 5: Write the server configurations in that file (Here we need to map hostname and port of couchbase as we want to link them together)

Step 6: Save the file 

Step 7: Click on the button named as "RAW" above the file (this will help execute the configuration of the json file)

Step 8: Select the URL from the address bar for the "RAW CONFIG.JSON"

Step 9: Now got to the teminal and open the run.sh file creates earlier, we will see following block of code

            case "$1" in  *) sync_gateway $@;; esac
            
            here replace the "$@" by "the url copied from the gist"
        
Step 10: Save the file 

Step 11: Give the executable permission to the file run.sh 

          chmod 777 run.sh
          
Step 12: Build the image using the following command: 

          sudo docker build -t sync .
          
Step 13: After getting a message of image successfully build, Run the container using 

         sudo docker run -t -i -d -p 4984:4984 -p 4985:4985 sync
         
Step 14: Open the console using
      
         a.http://public_dns:4984
         
         We will see the welcome page of sync gateway in for of a json formatted file
         
         b. http://public_dns:4985/_admin/
         
         This will allow us to open the admin console of sync gateway and acccess the bucket or create  new documents in it
