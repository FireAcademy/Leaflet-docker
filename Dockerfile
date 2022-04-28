FROM ghcr.io/chia-network/chia:main

ENV service="node"
ENV upnp="false"
ENV healthcheck="false"

RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh && \
    chmod +x nodesource_setup.sh && \
    ./nodesource_setup.sh && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    git wget tmux

# ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache
RUN cd / && \
    git config --global core.autocrlf input && \
    git clone https://github.com/FireAcademy/leaflet && \
    cd leaflet && \
    npm install 

COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

CMD ["start.sh"]
