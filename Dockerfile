FROM node:alpine as build_phase
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx as deploy_phase
COPY --from=build_phase /app/build /usr/share/nginx/html