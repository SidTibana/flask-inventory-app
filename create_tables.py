from app import app, db

with app.app_context():
    # Create all tables in the database
    # This sets up the tables based on our models
    db.create_all()
