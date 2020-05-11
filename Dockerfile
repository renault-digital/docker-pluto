FROM alpine:3

# variable "VERSION" must be passed as docker environment variables during the image build
# docker build --no-cache --build-arg VERSION=2.12.0 .

ARG VERSION
ARG NO_PREFIX_VERSION

ENV BASE_URL="https://github.com/fairwindsops/pluto/releases/download"
ENV TAR_FILE="${VERSION}/pluto_${NO_PREFIX_VERSION}_linux_386.tar.gz"

WORKDIR /apps

RUN apk add --update --no-cache curl ca-certificates && \
    curl -L ${BASE_URL}/${TAR_FILE} | tar xvz && \

    # we only move binary and let README.md + Licence for instruction if necessary
    mv pluto /usr/bin/pluto && \
    chmod +x /usr/bin/pluto && \
    rm -f /var/cache/apk/*

ENTRYPOINT ["pluto"]
CMD ["--help"]
