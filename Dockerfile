# Use the official Python image from the Docker Hub
FROM python:3.11-slim

# Install dependencies required for compiling mysqlclient
# This installs packages needed to build and connect to MySQL
RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
# This is where all subsequent commands will be run
WORKDIR /app

# Copy the requirements file into the container
# This file lists all the Python packages needed
COPY requirements.txt .

# Install the dependencies
# This installs the Python packages listed in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code and the wait-for-it.sh script into the container
# This includes all the code and scripts needed to run the app
COPY . .
COPY wait-for-it.sh /wait-for-it.sh

# Make sure wait-for-it.sh is executable
# This script will check if MySQL is ready before starting the app
RUN chmod +x /wait-for-it.sh

# Set environment variables
# Specify the main application file and make sure Flask listens on all network interfaces
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Expose the port the app runs on
# This makes port 5000 accessible from outside the container
EXPOSE 5000

# Command to run the application, waiting for MySQL to be ready first
# First, the script waits for MySQL to start, then it runs create_tables.py to set up the database,
# and finally, it starts the Flask app
CMD ["/wait-for-it.sh", "mysql:3306", "--", "sh", "-c", "python create_tables.py && flask run"]
