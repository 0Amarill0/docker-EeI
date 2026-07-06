FROM ubuntu:latest

RUN mkdir -p /disco-constante
RUN mkdir -p /disco-temporal

# Instalar herramientas
RUN apt-get update && apt-get install -y \
    wget \
    gcc \
    make \
    iputils-ping
#Instalar GSL
RUN wget ftp://ftp.gnu.org/gnu/gsl/gsl-latest.tar.gz && \
    mkdir gsl-source && \
    tar -zxvf gsl-latest.tar.gz -C gsl-source --strip-components=1 && \
    cd gsl-source && \
    mkdir -p /gsl-install && \ 
    ./configure --prefix="/gsl-source/gsl-install" && \
    make && \
    make install 
    
RUN rm -rf gsl-install gsl-latest.tar.gz

# Instalar OpenMPI - da error
RUN apt-get update && apt-get install -y openmpi-bin openmpi-common openssh-client openssh-server libopenmpi-dev

VOLUME ["/disco-constante"]

CMD ["/bin/bash"]