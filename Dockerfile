# Start with the Etherpad base image
FROM etherpad/etherpad:latest

# Set environment variables for Etherpad configuration
ENV NODE_ENV=production \
    DB_TYPE=postgres \
    DB_HOST=postgres \
    DB_PORT=5432 \
    DB_NAME=${POSTGRES_DB} \
    DB_USER=${POSTGRES_USER} \
    DB_PASS=${POSTGRES_PASSWORD} \
    DB_CHARSET=utf8mb4 \
    ADMIN_PASSWORD=${ETHERPAD_ADMIN_PASSWORD} \
    DEFAULT_PAD_TEXT="Bienvenue sur Etherpad!" \
    DISABLE_IP_LOGGING=false \
    SOFFICE=null \
    TRUST_PROXY=true

# Copy local plugins or additional files if needed (optional)
# COPY ./plugins /opt/etherpad-lite/src/plugin_packages
# Production stage
FROM nginx:1.25-alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf /etc/nginx/conf.d/*

COPY --from=build /app/dist .
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/gzip.conf /etc/nginx/conf.d/gzip.conf

# Set the working directory
# WORKDIR /opt/etherpad-lite

# Expose the Etherpad port
EXPOSE 80

# Start Etherpad
CMD ["nginx", "-g", "daemon off;"]