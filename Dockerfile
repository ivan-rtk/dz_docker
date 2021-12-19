# Использовать официальный образ родительского образа / слепка.
FROM python:3.8
# Установка рабочей директории, откуда выполняются команды внутриконтейнера.
WORKDIR /stocks_products
# Скопировать все файлы с локальной машины внутрь файловой системывиртуального образа.
COPY ./stocks_products /stocks_products
# Запустить команду внутри образа, установка зависимостей.
RUN pip install -r /stocks_products/requirements.txt
RUN python3 /stocks_products/manage.py migrate


CMD ["gunicorn", "--bind", "0.0.0.0:8000", "stocks_products.wsgi"]


