ECR registry URL: 
629318173228.dkr.ecr.us-east-1.amazonaws.com/bank:latest

Change directory to where Dockerfile is located 

Build the image using set REPO= on Windows or export REPO= on Linux 
629318173228.dkr.ecr.us-east-1.amazonaws.com/bank:latest
docker build -t $REPO . or 
docker build %REPO% .

login to ECR with docker
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $REPO

docker push $REPO
or docker push %REPO%

To pull an image from ECR:
docker pull <aws_account_id>.dkr.acr.<region>.amazonaws/com/REPO

To run the ECR microservice:
docker-compose -f docker-compose-ecr.yml --env-file compose-vars.env up 
