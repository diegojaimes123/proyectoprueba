#!/bin/bash
rm .rf ./tempdir

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp ejercicio_app.py tempdir/
cp requirements.txt tempdir/
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python:3" >> tempdir/Dockerfile

echo "WORKDIR" >> tempdir/Dockerfile

echo "COPY requirements.txt ./" >> tempdir/Dockerfile

echo "RUN pip install flask" >> tempdir/Dockerfile

echo "COPY ./static ./static/" >> tempdir/Dockerfile
echo "COPY ./templates ./templates/" >> tempdir/Dockerfile
echo "COPY ejercicio_app.py ./" >> tempdir/Dockerfile

echo "RUN pip install --no-cache-dir -r requirements.txt " >> tempdir/Dockerfile

echo "EXPOSE 5050" >> tempdir/Dockerfile

echo "CMD python /ejercicio_app.py" >> tempdir/Dockerfile

cd tempdir

docker build -t sampleapp .

docker run -t -d -p 5050:5050 --name samplerunning sampleapp

docker ps -a