"""
Flask application settings.
"""
import os


SECRET_KEY = os.environ.get('SECRET_KEY', None)
MY_VAR = os.environ.get('MY_VAR', None)
