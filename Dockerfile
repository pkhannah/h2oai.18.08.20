FROM python:latest

RUN apt update -y

RUN apt install -y wget

RUN wget http://h2o-release.s3.amazonaws.com/h2o/rel-wright/5/h2o-3.20.0.5.zip

RUN apt install -y unzip

RUN unzip /h2o-3.20.0.5.zip

RUN apt install -y default-jre-headless

RUN pip install requests tabulate scikit-learn colorama future

RUN pip install /h2o-3.20.0.5/python/*.whl

RUN pip install pandas

COPY *.dataframe /
COPY cmd.py /cmd.py

COPY cmd.sh /cmd.sh

CMD bash /cmd.sh
