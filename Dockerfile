FROM python:3.10

ENV PYTHONUNBUFFERED 1          # 標準出力・標準エラーのストリームのバッファリングを行わない
ENV PYTHONDONTWRITEBYTECODE 1   # キャッシュファイルを作成しない

RUN mkdir /src

WORKDIR /src
COPY requirements.txt /src/

RUN apt update && apt install -y sqlite3 vim less
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /src/
