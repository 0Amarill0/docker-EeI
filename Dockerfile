FROM ubuntu:latest

RUN mkdir -p /disco-constante
RUN mkdir -p /disco-temporal

VOLUME ["/disco-temporal", "/disco-constante"]

CMD ["/bin/bash"]