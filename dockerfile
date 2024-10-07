# Use the official Apache image
FROM httpd:latest

# Copy custom HTML file into the container's web directory
COPY ./index.html /usr/local/apache2/htdocs/

# Expose port 80 to be mapped to host
EXPOSE 80

