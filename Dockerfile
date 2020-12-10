FROM openjdk:8u272-slim

ARG GCP_CREDS

RUN apt-get update -y  && apt-get install -y curl apt-transport-https ca-certificates gnupg && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
    apt-get update -y && apt-get install -y google-cloud-sdk && \
    apt-get purge -y curl
RUN $GCP_CREDS
#    echo $GCP_CREDS | gcloud auth activate-service-account --key-file=-

CMD ["sleep", "120"]
