# HNRSS Docker Image
# Repo: https://github.com/cascadingstyletrees/hnrss-docker
# Credits:
# - Original HNRSS project: https://github.com/hnrss/hnrss
# - Dockerfile and entrypoint.sh by: Gabriel Corral (https://github.com/cascadingstyletrees)

# Use a small base image
FROM alpine:latest

# Set the working directory in the container
WORKDIR /app

# Expose the port the app runs on
EXPOSE 9000

# Copy the entrypoint script
COPY entrypoint.sh /app/entrypoint.sh

# Make the script executable
RUN chmod +x /app/entrypoint.sh

# Command to run the entrypoint script
CMD ["/app/entrypoint.sh"]