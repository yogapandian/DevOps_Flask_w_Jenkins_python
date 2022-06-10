# pulls ubuntu image
FROM ubuntu:18.04

MAINTAINER Your Name "rsimarcom"

# installs python 
RUN apt-get update -y
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update -y
RUN apt-get install -y python3.6
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN apt-get install -y python3-pip

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

# mounts docker file to directory
WORKDIR /app

# install requirements
RUN pip3 install -r requirements.txt

# copy our application to working directory
COPY . /app

# exposes port 5000 for our app
EXPOSE 5000

ENTRYPOINT [ "python3" ]

CMD [ "src/my_app.py" ]
