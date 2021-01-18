FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . . 

CMD  ["npm", "run", "build"]


#End of builder phase and beginning of run phase. This is a phase that copies the content from build stage

FROM nginx

COPY --from=builder /app/build  /usr/share/nginx/html 


