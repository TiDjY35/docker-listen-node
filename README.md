# docker-listen-node
Container Docker pour executer un "node" en écoute des infos réceptionner par onde radio depuis un Arduino

pour lancer le docker : 
docker run --device /dev/mem:/dev/mem --privileged --name [name of container] -ti [name of image] "/app/startup.sh"

Vous pouvez récupérer les logs dans un répertoire local : 
docker run --device /dev/mem:/dev/mem -v $(pwd)/logs:/app/logs --privileged --name [name of container] -ti [name of image] "/app/startup.sh"

Vous pouvez lier votre container à un autre container mysql
docker run --device /dev/mem:/dev/mem -v $(pwd)/logs:/app/logs --privileged --name [name of container] --link [name of container mysql]:mysql -ti [name of image] "/app/startup.sh"

le script "startup.sh" : 
- lance le binaire "/app/nodelisten" en écoute sur le gpio 14
- génère le log
