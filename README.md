Flask Inventory Web Application

This repository contains a basic web application built using Python, Flask, SQLAlchemy, and Docker. It allows users to perform CRUD (Create, Read, Update, Delete) operations on a MySQL database.

Features

CRUD Operations: Create, read, update, and delete inventory items.
Docker Integration: Dockerized setup for easy deployment and testing.
User Interface: Simple UI using Bootstrap and Jinja2 templates.

Setup

Prerequisites
Python 3.x installed.
Docker and Docker Compose installed.

Running Locally
1. Clone the Repository:

git clone https://github.com/SidTibana/flask-inventory-app
cd your-repository

2. Install Dependencies:

pip install -r requirements.txt

3. Set Up the Database:

python create_tables.py

4. Run the Application:

flask run

Open your browser and go to http://127.0.0.1:5000 to view the application.



Running with Docker

1. Build and Start Containers:

docker-compose up --build

This command will build the Docker image and start the application along with the MySQL container.

2. Access the Application:

Open your browser and go to http://localhost:5000.

File Structure

app.py: Main application file.
Dockerfile: Dockerfile for building the Docker image.
docker-compose.yml: Docker Compose configuration file.
requirements.txt: Python dependencies.
create_tables.py: Script to create database tables.
templates/: Folder containing HTML templates.
static/: Folder for static files like images and CSS.

Notes

Ensure that the DATABASE_URL environment variable is set correctly in the docker-compose.yml file.
Use wait-for-it.sh to ensure that MySQL is ready before starting the Flask application.
Contributing
Feel free to open issues or submit pull requests. Contributions are welcome!

License
This project is licensed under the MIT License.