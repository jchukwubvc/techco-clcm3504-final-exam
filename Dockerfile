# Use an official Apache HTTP Server image as the base image
FROM httpd:2.4-alpine

# Set the working directory
WORKDIR /usr/local/apache2/htdocs

# Copy the content of the local src directory to the working directory
COPY . .

# Expose port 80 for the web server
EXPOSE 80
