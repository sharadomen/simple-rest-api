FROM node:15.9.0-alpine3.10
LABEL maintainer "Asha Yadav <ashaya9511@gmail.com>"
ENV FILE_P simple-rest-api
ENV TAR_EXT .tar
ADD ${FILE_P}${TAR_EXT} /opt/
WORKDIR /opt/${FILE_P}
RUN npm install 
CMD ["npm", "start"]
