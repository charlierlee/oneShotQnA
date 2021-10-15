# to run locally
cd ~/git3/oneShotQnA
python3 -m venv env
source env/bin/activate
pip install -r src/requirements.txt
cd src
flask run --host=0.0.0.0 --port=5000

# to run in docker
#  Install docker
#   To configure after 1st install
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
    docker run hello-world
sudo apt install docker-compose

docker-compose build
docker-compose up

#to clear everything in docker:
docker-compose down -v --rmi local
docker rm -vf $(docker ps -a -q)
docker rmi -f $(docker images -a -q)
docker system prune --all



# microk8s
docker-compose build
then see microk8/microk8.txt
