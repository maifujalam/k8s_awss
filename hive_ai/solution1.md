# SOLUTION by SK Maifuj Alam:-

Problem Statement-1: https://hub.docker.com/r/mkassaian/docker-challenge

## Debug the Issue:-
1. Run the container: `docker run -d --name docker-challenge mkassaian/docker-challenge`
2. Check the ps and utilized ports.As binary not present had to install it:   
   `docker exec -it docker-challenge bash`  
    `apt install vi net-tools procps`
3. Check the running process and he associated port: `netstat -nltp`
4. Check he entrypoint and found the misspelling(with zero and small letter o) of 2nd nginx config file:
   `cd /etc/nginx/`
   `mv nginxo2.conf nginx02.conf`
5. Check the ha-proxy config file (at /usr/local/etc/haproxy/haproxy.cfg) and found that host mapping was incorrect.The host localhost:8002 was missing.So corrected it as below.  
   **backend webservers  
     mode http  
     server localhost-01 localhost:8001  
     server localhost-02 localhost:8002  
     server localhost-03 localhost:8003**
6. Edited the nginx index page to add my name as below:-  
   `it works! solved by SK maifuj Alam`
7. Soft reloaded nginx:  `nginx -s reload`
8. Validate from inside container,to hit the HA proxy port 80 and expect it to distribute traffic between 3 nginx backend:  
   ` watch curl -s 127.0.0.1:80`
    

## Commit Solution and push:
1. Commit the solution:  
   `docker commit docker-challenge docker-challenge-solved `
2. Create tag: `docker tag docker-challenge-solved skmaifujalam/hive_test:1 `
3. Login to personal docker hub registry:  ` docker login docker.io`
4. Docker push: 
   `docker push  skmaifujalam/hive_test:1`


## Validate Solution:
1. **Run the solution:**  
   For Docker: `sudo docker run -d -p 80:80 docker.io/skmaifujalam/hive_test:1`  
   For Podman: `sudo podman run -d -p 80:80 docker.io/skmaifujalam/hive_test:1` 
2. Validate from inside container:
   `docker exec -it happy_morse bash `
    `watch curl -s localhost:80`
3. Validate from outside container i.e,localhost.Fire curl every two seconds silently to validate that it gives success response all the time: 
    `watch curl -s localhost:80 `
4. You can also test it in browser with url: http://localhost:80

