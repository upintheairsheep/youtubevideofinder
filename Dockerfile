FROM python:3.10-slim-bullseye
RUN pip install --no-cache-dir gunicorn flask[async] requests
RUN apt install -y openssl

COPY . /app
EXPOSE 8000
WORKDIR /app
ENTRYPOINT ["gunicorn", "-b", "0.0.0.0:8000", "--config", "gunicorn.conf", "app:app"]
