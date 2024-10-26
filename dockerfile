# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Install system dependencies for Chrome browser and WebDriver
RUN apt-get update && apt-get install -y \
    chromium-driver \
    chromium-browser \
    && apt-get clean

# Set the working directory in the container
WORKDIR /app

# Copy the script, data files, and requirements.txt into the container
COPY script.py /app/
COPY requirements.txt /app/
COPY archive/ /app/data/

# Install Python dependencies
RUN pip install -r requirements.txt

# Run the Selenium script
CMD ["python", "script.py"]

RUN apt-get update --fix-missing

RUN add-apt-repository universe

FROM ubuntu:20.04

RUN apt-cache policy chromium-driver chromium-browser

FROM ubuntu:20.04

RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository universe && \
    apt-get update && \
    apt-get install -y chromium-driver chromium-browser && \
    apt-get clean
