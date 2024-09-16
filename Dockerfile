FROM nvidia/cuda:11.3.1-cudnn8-devel-ubuntu20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get install wget unzip vim -y
RUN apt-get update -y && apt-get install -y python3 python3-pip python3-dev git && apt-get autoclean -y
RUN apt-get update \
    && apt install -y git python3-pip prodigal diamond-aligner 
RUN apt-get update && apt-get install -y libmetis-dev && rm -rf /var/lib/apt/lists/*



RUN pip install --upgrade pip
RUN pip install --upgrade pip setuptools wheel

COPY requirements.txt /graphmb_checkm2/requirements.txt

#RUN make /app
WORKDIR /graphmb_checkm2
# Copy only the requirements file to the working directory

# Install Python dependencies
RUN pip install -r requirements.txt



#Installing CheckM2

RUN git clone --recursive https://github.com/chklovski/checkm2.git \
    && cd checkm2 \
    && python3 setup.py install


ENV PATH="graphmb_checkm2/checkm2/bin:$PATH"


RUN python3 -m pip install https://github.com/RasmussenLab/vamb/archive/v3.0.8.zip

COPY ./ /graphmb_checkm2/
RUN python3 -m pip install .



CMD ["bash"]