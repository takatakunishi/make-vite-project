FROM <<ImageSetting>>
WORKDIR /usr/src/app
COPY ./front/package*.json ./
RUN npm install && chown node -R node_modules
RUN apt update && apt install git -y
COPY ./front /usr/src/app/
EXPOSE 3000
EXPOSE 3001