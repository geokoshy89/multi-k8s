docker build -t geokoshy89/multi-client -f ./client/Dockerfile ./client
dokcer build -t geokoshy89/multi-server -f ./server/Dockerfile ./server
docker build -t geokoshy89/-multi-worker -f ./worker/Dockerfile ./worker
docker push geokoshy89/multi-client
docker push geokoshy89/multi-server
docker push geokoshy89/mult-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=geokoshy89/multi-server