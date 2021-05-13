docker build -t geokoshy89/multi-client:latest -t geokoshy89/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t geokoshy89/multi-server:latest -t geokoshy89/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t geokoshy89/multi-worker:latest -t geokoshy89/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push geokoshy89/multi-client:latest
docker push geokoshy89/multi-server:latest
docker push geokoshy89/mult-worker:latest

docker push geokoshy89/multi-client:$SHA
docker push geokoshy89/multi-server:$SHA
docker push geokoshy89/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=geokoshy89/multi-server:$SHA
kubectl set image deployments/client-deployment client=geokoshy89/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=geokoshy89/multi-worker:$SHA