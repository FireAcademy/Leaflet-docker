FROM ghcr.io/chia-network/chia:1.6.1

ENV service="node"
ENV upnp="true"
ENV healthcheck="false"

RUN curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh && \
    chmod +x nodesource_setup.sh && \
    ./nodesource_setup.sh && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    git wget

RUN npm install -g ts-node typescript '@types/node'

RUN cd / && \
    git config --global core.autocrlf input && \
    git clone https://github.com/FireAcademy/leaflet && \
    cd leaflet && \
    npm install 

COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

CMD ["start.sh"]
