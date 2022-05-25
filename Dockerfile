# syntax=docker/dockerfile:1
FROM ubuntu:20.04
RUN apt update
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt install python3.8 python3-pip git nodejs -y
RUN pip install --upgrade pip
RUN pip install urbanpy jupyterlab
RUN git clone https://github.com/EL-BID/urbanpy.git
WORKDIR /urbanpy/notebooks
CMD ["jupyter", "lab",  "--ip", "0.0.0.0", "--port", "8888", "--no-browser", "--allow-root"]
EXPOSE 8888