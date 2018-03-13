FROM alpine:3.7
ENV DOCTL_VERSION=1.7.1

RUN apk add --no-cache \
  ansible \
  bash \
  curl \
  git \
  openssh-keygen \
  terraform \
  unzip

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN curl -L https://github.com/digitalocean/doctl/releases/download/v${DOCTL_VERSION}/doctl-${DOCTL_VERSION}-linux-amd64.tar.gz \
  | tar xz -C /usr/local/bin

WORKDIR /blueprint
VOLUME /blueprint
CMD ["bash"]
