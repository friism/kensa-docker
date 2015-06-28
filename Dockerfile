FROM ubuntu:trusty
RUN apt-get update && apt-get install -y --no-install-recommends \
    	    build-essential \
    	    ruby-dev \
	    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*
RUN gem install rdoc kensa
WORKDIR /root
