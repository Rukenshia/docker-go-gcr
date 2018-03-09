FROM docker:latest
RUN apk update && apk add \
    go python2 ca-certificates

ADD https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-192.0.0-linux-x86_64.tar.gz gcloud-sdk.tar.gz
RUN tar -xzf gcloud-sdk.tar.gz
RUN rm gcloud-sdk.tar.gz
RUN ./google-cloud-sdk/install.sh
ENV PATH="/google-cloud-sdk/bin:${PATH}"
RUN gcloud components install docker-credential-gcr

ADD entrypoint.sh .

ENTRYPOINT [ "./entrypoint.sh" ]
CMD []