FROM ubuntu:latest

RUN apt update -y

RUN apt install -y wget

RUN wget http://h2o-release.s3.amazonaws.com/h2o/rel-wright/5/h2o-3.20.0.5.zip

RUN apt install -y unzip

RUN unzip /h2o-3.20.0.5.zip

RUN apt install -y default-jre-headless

RUN apt install -y python3-pip

RUN pip3 install requests tabulate scikit-learn colorama future

RUN pip3 install /h2o-3.20.0.5/python/*.whl

COPY cmd.sh /cmd.sh

CMD bash /cmd.sh
