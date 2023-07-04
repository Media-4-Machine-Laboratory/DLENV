FROM python:3.10

RUN apt-get update && apt-get install -y libsasl2-dev python-pip python-dev libldap2-dev libssl-dev && rm -rf /var/lib/apt/lists/*
COPY . /home/user/workspace/mlLearning
WORKDIR /home/user/workspace/mlLearning

RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
