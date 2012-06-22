"""
Create the application.
"""

import os
from flask import Flask, render_template, request, redirect, url_for
from flask.ext.assets import Environment
from webassets.loaders import PythonLoader


app = Flask(__name__)
assets = Environment(app)


app.config.from_pyfile('settings.py')


# Load and register assets bundles.
bundles = PythonLoader('bundles').load_bundles()
for name, bundle in bundles.iteritems():
    assets.register(name, bundle)

# Output un-merged source files in debug mode.
if app.debug:
    app.config['ASSETS_DEBUG'] = True


### Routes ###


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


if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
