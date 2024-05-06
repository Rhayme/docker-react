# Phase #1 the build fase 
# as builder => tag this phase and everithing under this command will be tag as builder
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Phase #2 (Run phase)copying the build forder to served in Nginx
FROM nginx
#copy something the builder phase
# /usr/share/nginx/htm this is settings for the nginx (found on docker hub)
COPY  --from=builder /app/build /usr/share/nginx/html
