FROM node:boron-alpine

RUN apk update && apk upgrade && \
apk add bash git && \
adduser -S meanshop && \
mkdir -p /home/meanshop && \
chown -R meanshop. /home/meanshop

COPY . /meanshop
WORKDIR /meanshop
# Bundle app source
#ADD server /meanshop
#RUN chown -R meanshop. /meanshop

COPY node/bootstrap.sh /home/meanshop/bootstrap.sh
COPY node/nostrap.sh /home/meanshop/nostrap.sh
#CMD ["/home/meanshop/bootstrap.sh"]
#USER meanshop
CMD ["/home/meanshop/nostrap.sh"]
