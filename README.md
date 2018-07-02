## docker-compose-ssh-agent
docker-compose for using ssh-agent

## How to use

### create volumne

```
docker volume create --name=ssh-agent
```

### run 

```
docker-compose up -d
```

### add ssh-key

```
docker-compose run ssh ssh-add ~/.ssh/id_rsa
```


### edit your docker-compose.yml

```
version: "3"
services:
    your_app:
        image: ...
        ...
        volumes:
            - ssh:/ssh
        ...            
volumnes:
    ssh:
        external:
            name: ssh-agent
```

### chack in your docker-compose.yml

```
docker-compose run your_app /bin/sh
# ssh -T git@github.com
# > Hi {yourname}! You've successfully authenticated, but GitHub does not provide shell access.
```
