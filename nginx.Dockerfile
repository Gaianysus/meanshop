FROM nginx:alpine

ENV THALHALLA_MEANSHOP 20170421

RUN apk update && \
apk upgrade && \
apk add openssl && \
apk add bash && \
rm -rf /var/cache/apk/*

COPY nginx /assets
COPY client /meanshop/current/dist/public
CMD ["/assets/start.sh"]
