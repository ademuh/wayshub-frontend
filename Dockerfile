# base image yang digunakan untuk dependency aplikasi
FROM node:10.24.1-alpine

# setup untuk menjalan aplikasi
WORKDIR /app
COPY . .
RUN npm install

# expose ke port aplikasi
EXPOSE 3000

# cara menjalanakan aplikasi
CMD ["npm","start"]
