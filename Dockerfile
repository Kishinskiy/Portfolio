# pull official base image
FROM python
# set work directory
WORKDIR /app
# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1 
ENV PYTHONUNBUFFERED 1
# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /app/requirements.txt 
RUN pip install -r requirements.txt

# copy entrypoint.sh
# COPY ./app/entrypoint.sh /app/entrypoint.sh

# copy project
COPY ./app /app
RUN chmod +x entrypoint.sh
RUN ls -l

# run entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
