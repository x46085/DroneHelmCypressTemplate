FROM docker:18.06.1-ce-dind

RUN apk update \
  && apk add --no-cache python3 bash \
  && pip3 install --upgrade pip \
  && pip3 install --no-cache-dir awscli==1.16.91

CMD ["sh"]