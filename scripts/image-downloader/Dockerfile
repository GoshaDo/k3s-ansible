FROM alpine:3.12

WORKDIR /scripts

# Install packages
RUN apk update && \
    apk upgrade && \
    apk add bash curl jq skopeo openssl yq && \
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

COPY ./scripts ./scripts

RUN chmod +x parse-image-name.sh && \
    chmod +x image-download.sh && \
    chmod +x helm-download.sh && \
    chmod +x upload.sh

    

