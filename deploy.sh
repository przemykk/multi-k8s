# docker build -t przemyyk/multi-client:latest -t przemyyk/multi-client:#SHA -f ./client/Dockerfile ./client 
# docker build -t przemyyk/multi-server:latest -t przemyyk/multi-server:$SHA -f ./server/Dockerfile ./server
# docker build -t przemyyk/multi-worker:latest -t przemyyk/multi-worker:$SHA -f ./worker/Dockerfile ./worker

# docker push przemyyk/multi-client:latest
# docker push przemyyk/multi-server:latest
# docker push przemyyk/multi-worker:latest

# docker push przemyyk/multi-client:$SHA
# docker push przemyyk/multi-server:$SHA
# docker push przemyyk/multi-worker:$SHA

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud-generic.yaml
kubectl apply -f k8s

kubectl set image deployments/server-deployment server=przemyyk/multi-server:$SHA
kubectl set image deployments/client-deployment client=przemyyk/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=przemyyk/multi-worker:$SHA