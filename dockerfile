FROM python:3.12-alpine

WORKDIR /var/app

COPY requirements.txt .

RUN chmod 700 /var/app
RUN python -m ensurepip --upgrade
RUN python -m pip install --upgrade setuptools
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app/app.py"]