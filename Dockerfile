# Start with the Etherpad base image
FROM etherpad/etherpad:latest

# # Set environment variables for Etherpad configuration
# ENV NODE_ENV=production \
#     DB_TYPE=postgres \
#     DB_HOST=postgres \
#     DB_PORT=5432 \
#     DB_NAME=${DB_NAME} \
#     DB_USER=${DB_USER} \
#     DB_PASS=${DB_PASS} \
#     DB_CHARSET=utf8mb4 \
#     ADMIN_PASSWORD=${ADMIN_PASSWORD} \
#     DEFAULT_PAD_TEXT="Bienvenue sur Etherpad!" \
#     DISABLE_IP_LOGGING=false \
#     SOFFICE=null \
#     TRUST_PROXY=true

# # Copy local plugins or additional files if needed (optional)
# # COPY ./plugins /opt/etherpad-lite/src/plugin_packages
# # Production stage
# FROM nginx:1.25-alpine

# WORKDIR /usr/share/nginx/html

# RUN rm -rf /etc/nginx/conf.d/*

# COPY --from=build /app/dist .
# COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
# COPY ./nginx/gzip.conf /etc/nginx/conf.d/gzip.conf

# # Set the working directory
# # WORKDIR /opt/etherpad-lite 

# # Expose the Etherpad port
# EXPOSE 9001

# # Start Etherpad
# CMD ["nginx", "-g", "daemon off;"]
