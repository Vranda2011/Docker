#Following are the steps need to be done for setting up the docker-compose.yml file

Step 1: Create a new instance using the AMI (Docker_Compose)

Step 2: While creating the instance add the command "docker-compose up -d" in the USER DATA

Step 3: ssh into the instance 

Step 4: run the command "docker ps"

Step 5: go to given github link ""

Step 6: Change the ip in the config .json file 

Step 7: get the RAW URl from the github for the config.json and copy it to the clipboard

Step 8: go tot the terminal 

Step 9: open the run.sh file for sync gateway and copy the url in the file 

Step 10: save and exit the file and build the image of sync gateway again 

Step 11: run "docker-compose up -d"

