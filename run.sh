#https://hub.docker.com/r/luketillman/datastax-enterprise/
echo 'Starting DSE 4.8.9'
docker rm -f dse-search
docker run -d -p 9042:9042 -p 8983:8983 --name dse-search luketillman/datastax-enterprise:4.8.9 -s
docker volume ls -qf dangling=true | xargs docker volume rm
echo 'now wait for startup...'
(docker logs -f --tail 1 dse-search &) | grep -m1 'Listening for thrift clients'
echo 'all done'
