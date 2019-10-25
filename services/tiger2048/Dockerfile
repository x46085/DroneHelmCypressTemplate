FROM node:12.4.0-alpine
LABEL maintainer="dandriscoll@bitgo.com"

# create runtime user, which is used by kubernetes to run the container and prevent container breakout attacks: 
# https://security.stackexchange.com/questions/152978/is-it-possible-to-escalate-privileges-and-escaping-from-a-docker-container

RUN adduser -D -H -u 1001 -s /bin/bash tiger

# drop into your user as soon as makes sense, in kubernetes you also need to set the user in the deployment file:
RUN mkdir /home/tiger && mkdir /home/tiger/tiger2048
RUN chown -R tiger /home/tiger && chown -R tiger /home/tiger/tiger2048
WORKDIR /home/tiger/tiger2048
USER tiger

# copy over dependencies and seldom changed build steps first for faster rebuild:
COPY --chown=tiger:tiger tiger2048/package* /home/tiger/tiger2048/.
RUN npm install

# when copying files, make sure to use the new user & group so it can access those files:
COPY --chown=tiger:tiger tiger2048 /home/tiger/tiger2048

EXPOSE 8080
CMD ["npm", "run", "start"]
