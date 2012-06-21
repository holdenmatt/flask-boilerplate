"""
app.py

Create the application.
"""

import os
from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)
app.config.from_pyfile('settings.py')


@app.route('/')
def home():
    """Render home page."""
    return render_template('home.html')


@app.route('/about/')
def about():
    """Render the about page."""
    return render_template('about.html')


@app.route('/<file_name>.txt')
def send_text_file(file_name):
    """Send static text files."""
    return app.send_static_file(file_name + '.txt')


@app.after_request
def add_header(response):
    """
    Add headers to force latest IE rendering engine or Chrome Frame,
    and also to cache the rendered page for 10 minutes.
    """
    response.headers['X-UA-Compatible'] = 'IE=Edge,chrome=1'
    response.headers['Cache-Control'] = 'public, max-age=600'
    return response


@app.errorhandler(404)
def page_not_found(error):
    """Custom 404 page."""
    return render_template('404.html'), 404


# If PORT not specified by environment, assume development config.
if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    if port == 5000:
        app.debug = True
    app.run(host='0.0.0.0', port=port)
