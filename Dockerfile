FROM alpine:3

# variable "VERSION" must be passed as docker environment variables during the image build
# docker build --no-cache --build-arg VERSION=2.12.0 -t alpine/helm:2.12.0 .

ARG VERSION

# ENV BASE_URL="https://storage.googleapis.com/kubernetes-helm"
ENV BASE_URL="https://github.com/fairwindsops/pluto/releases/download"
ENV TAR_FILE="v${VERSION}/pluto_${VERSION}_linux_386.tar.gz"

RUN apk add --update --no-cache curl ca-certificates && \
    curl -L ${BASE_URL}/${TAR_FILE} | tar xvz && \
    mv pluto /usr/bin/pluto && \
    chmod +x /usr/bin/pluto && \
    rm -f /var/cache/apk/*

WORKDIR /apps

ENTRYPOINT ["pluto"]
CMD ["--help"]
