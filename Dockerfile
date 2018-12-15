FROM python:3.7.1-alpine3.8

# 時間をJSTに設定する
RUN set -xe && \
	apk --update add tzdata && \
	cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
	apk del tzdata && \
	rm -rf /var/cache/apk/*

# su-execのインストール
RUN set -xe && \
	apk --update add \
		su-exec && \
	rm -rf /var/cache/apk/*

RUN set -xe && \
	pip install toot

# entrypoint.sh の追加
COPY entrypoint.sh /

# entrypointの設定
ENTRYPOINT ["/entrypoint.sh"]

