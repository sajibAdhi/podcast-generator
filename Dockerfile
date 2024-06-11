# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Install git
RUN apt-get update && apt-get install -y git

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Create a virtual environment and install packages
RUN python3 -m venv /app/venv
RUN /app/venv/bin/pip install --upgrade pip
RUN /app/venv/bin/pip install PyYAML

# Make the entrypoint.sh file executable
RUN chmod +x /app/entrypoint.sh

# Use the absolute path in the ENTRYPOINT command
ENTRYPOINT ["/app/entrypoint.sh"]