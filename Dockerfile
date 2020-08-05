### STAGE 1: Build the VueJS app ###

FROM node:12.18-stretch as build-stage

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

### STAGE 2: Add Nginx for hosting the VueJS app ###

FROM nginx:1.18 as production-stage

RUN mkdir /app

# Copy the bundle
COPY --from=build-stage /app/dist /app

# Copy the default nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

# Copy shell script to container
WORKDIR /app
COPY ./scripts/generate_env.sh .

# Make our shell script executable
RUN chmod +x generate_env.sh

# Start Nginx server
CMD ["/bin/bash", "-c", "/app/generate_env.sh && nginx -g \"daemon off;\""]
