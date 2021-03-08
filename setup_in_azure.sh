### HOSTING IN AZURE (DOES NOT WORK IN FREE MODE AS IT RUNS OUT OF CPU CYCLES) ###
#to deploy to azure
az webapp up
#go to Deployment Center (Preview)/Logs/Show Logs


#initial setup
#Create app service in azure
#in configuration set the following property
SCM_DO_BUILD_DURING_DEPLOYMENT:true
cd src
az webapp up
# ^ then go to Deployment Center (Preview)/Logs/Show Logs
#OR if no existing VM
cd src
az webapp up --location westus2 --sku F1 --name oneShotQnA
#wait about 20 minutes
#get location list (optional)
az account list-locations

#Note
#SCM_DO_BUILD_DURING_DEPLOYMENT:true must be set. 
# It causes pip install -r requirements.txt to run
# If set to false then the pip install -r requirements.txt will get uninstalled



### IF DOCKER ###
#docker note:
# if the server runs out of memory, there is no indication
  #other than it just dies
#docker image
#to run locally:
docker-compose up
#OR
docker-compose up -d   #<-- detached
#http://localhost:9901/summary?text=what is a computer
#then
docker-compose down -v --rmi local
#to build into host
docker build -t dockerusername/host src
#to build for azure
docker build -f src/Dockerfile -t dockerusername/host src

#deploy
docker push dockerusername/host
