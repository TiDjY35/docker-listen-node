# Image de base
FROM resin/rpi-raspbian:jessie

# Installation de git
RUN apt-get update \
&& apt-get install git-core

# Installation make pour compiler wiringpi
RUN apt-get install make \
&& apt-get install gcc \
&& apt-get install build-essential \
&& apt-get install g++

# Installation de wiringpi
RUN git clone git://git.drogon.net/wiringPi \
&& cd wiringPi \
&& git pull origin \
&& ./build

# Installation php pour utiliser node.php
RUN apt-get install php5

# Ajouter source de l'application
ADD node* /app/
ADD startup.sh /app/
RUN g++ /app/node.cpp -o /app/nodelisten -lwiringPi

# Dossier de logs
VOLUME /app/logs


# On lance la vérif wiringpi quand on démarre le conteneur
CMD /app/startup.sh
