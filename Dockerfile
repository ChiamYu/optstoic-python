# Reference: https://github.com/sanderdw/SCIP/blob/master/scip_python/Dockerfile
FROM python:3.8.5-alpine

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    zlib1g-dev \ 
    libgmp3-dev \
    libreadline-dev \ 
    lib32ncurses5-dev \ 
    bison \
    flex \
    zimpl \
    bliss \
    graphviz \
    && apt-get clean
COPY scipoptsuite-7.0.1.tgz /
RUN tar xvf scipoptsuite-7.0.1.tgz
RUN cd scipoptsuite-7.0.1 && cmake /scipoptsuite-7.0.1 -DCMAKE_INSTALL_PREFIX=/home/SCIP && make install TPI=tny USRLDFLAGS=-lpthread
RUN export SCIPOPTDIR=/home/SCIP 
RUN pip install --upgrade pip && pip install notebook && pip install ipykernel
 
COPY . /app
WORKDIR /app/
RUN python setup.py develop

ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]
EXPOSE 8888
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]