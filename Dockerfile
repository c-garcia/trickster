FROM ubuntu:18.04
ARG node_version=10.15.1
ARG go_version=1.11.5
ARG updated_at=20190219200000
COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ADD node-v${node_version}-linux-x64.tar.xz /usr/local/
RUN ln -s /usr/local/node-v${node_version}-linux-x64 /usr/local/node
ENV PATH /usr/local/node/bin:$PATH
ADD go${go_version}.linux-amd64.tar.gz /usr/local
ENV GOROOT=/usr/local/go
ENV PATH=$PATH:$GOROOT/bin
ENTRYPOINT ["/entrypoint.sh"]
CMD /bin/bash
RUN set UPDATED_AT=${updated_at}
RUN apt-get update
RUN apt-get install -y make git
RUN npm install --production -g mountebank 
RUN mkdir /go
ENV GOPATH=/go
ENV PATH=$PATH:$GOPATH/bin
RUN go get -u github.com/golang/dep/cmd/dep
