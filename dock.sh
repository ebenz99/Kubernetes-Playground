docker login
docker build -t mkdn .
docker tag mkdn ebensma/mkdn:latest
docker push ebensma/mkdn:latest
