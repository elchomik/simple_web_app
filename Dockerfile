FROM node:alpine

WORKDIR /usr/app

RUN apk add --update nodejs npm
RUN apk add --update openssh
RUN apk add --update git
RUN mkdir -p /root/.ssh
RUN touch /root/.ssh/id_rsa
RUN touch /root/.ssh/id_rsa.pub
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts
RUN chmod 600 /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa.pub
COPY ./keys/id_rsa.pub /root/.ssh/id_rsa.pub
COPY ./keys/id_rsa /root/.ssh/id_rsa
RUN chmod 400 /root/.ssh/id_rsa.pub
RUN chmod 400 /root/.ssh/id_rsa
RUN touch /root/.ssh/config
RUN chmod 700 /root/.ssh/config
RUN echo $'Host git \n HostName github.com \n AddKeysToAgent yes \n PreferredAuthentications publickey \n IdentityFile /root/.ssh/id_rsa' > /root/.ssh/config
RUN git clone git@github.com:elchomik/simple_web_app.git
RUN npm install 

CMD ["npm", "start"]