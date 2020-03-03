FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /src -p
COPY app src/
WORKDIR /src
COPY requirements.txt .
RUN pip install -r requirements.txt
EXPOSE 8000
CMD ["gunicorn", "--chdir", "aoe2comments", "--bind", ":8000", "aoe2comments.wsgi:application"]