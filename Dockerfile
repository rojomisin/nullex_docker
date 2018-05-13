
FROM ubuntu:16.04
LABEL maintainer="Rojo Misin"

# Install dependencies.

RUN apt-get update \
    	&& apt-get install -y --no-install-recommends \
       	build-essential \
	libtool autotools-dev \
	autoconf \
	pkg-config \
	libssl-dev \
	libevent-dev \
       	libboost-all-dev \
       	rsyslog systemd \
	systemd-cron \
	sudo \
    	libminiupnpc-dev \
	&& apt-get install -y --no-install-recommends \
	software-properties-common \
	python-software-properties \
     	&& add-apt-repository ppa:bitcoin/bitcoin \
        && apt-get update \
	&& apt-get install -y --no-install-recommends libdb4.8-dev libdb4.8++-dev \
	&& apt-get install -y --no-install-recommends libminiupnpc-dev \
	&& apt-get install -y --no-install-recommends libqt5gui5 \
		libqt5core5a \
		libqt5dbus5 \
		qttools5-dev \
		qttools5-dev-tools \
		libprotobuf-dev \
		protobuf-compiler \
	&& apt-get install -y --no-install-recommends libqrencode-dev \
    	&& apt-get clean
RUN uptime

ADD https://s3.us-east-2.amazonaws.com/softup-artifacts/nullex/nullexd /root/nullexd
ADD https://s3.us-east-2.amazonaws.com/softup-artifacts/nullex/nullex-cli /root/nullex-cli
ADD https://s3.us-east-2.amazonaws.com/softup-artifacts/nullex/nullex-qt /root/nullex-qt

RUN chmod 0755 /root/nullex*

