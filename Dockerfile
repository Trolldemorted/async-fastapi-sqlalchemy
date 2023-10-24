FROM python
WORKDIR /app
ENV APP_CONFIG_FILE docker

COPY requirements.lock requirements.lock
RUN pip3 install -r requirements.lock

COPY . .

ENTRYPOINT alembic upgrade head && uvicorn --host="0.0.0.0" app.main:app
