FROM <<ImageSetting>>
WORKDIR /usr/src/app
COPY ./front ./front
# RUN cd front && npm install && chown node -R node_modules // for windows
RUN cd front && yarn install
RUN apt update && apt install git -y
EXPOSE 3000
EXPOSE 3001