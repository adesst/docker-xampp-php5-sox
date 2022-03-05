# Build with:
# 	docker build -t defyma/xampp-php5 .

FROM xampp5:latest

ENV DEBIAN_FRONTEND noninteractive

# Install curl and net-stats for XAMPP
RUN apt-get update && apt-get install -yq --no-install-recommends apt-utils

RUN apt-get update && \
    apt-get -yq upgrade && \
        apt-get install -yq curl net-tools tzdata && \
    apt-get install -y vim && \
    echo "Asia/Jakarta" > /etc/timezone && \
    rm -f /etc/localtime && \
    ln -s /usr/share/zoneinfo/Asia/Jakarta /etc/localtime	

RUN  apt-get -yq install lame sox libsox-fmt-all

# Copy Libz.so.1
RUN mv /opt/lampp/lib/libz.so.1 /opt/lampp/lib/libz.so.1.backup
RUN ln -s /lib/x86_64-linux-gnu/libz.so.1 /opt/lampp/lib/libz.so.1

EXPOSE 80 443 3306

ADD init.sh /usr/local/bin/init.sh
RUN chmod 777 /usr/local/bin/init.sh

ADD restart.sh /usr/local/bin/restart.sh
RUN chmod 777 /usr/local/bin/restart.sh

# Start the init script
ENTRYPOINT ["/usr/local/bin/init.sh"]

