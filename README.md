# flask-boilerplate

Boilerplate for a web application using the Python Flask framework:

 * easily deploy to Heroku,
 * package assets (JS, CSS, CoffeeScript, SCSS, etc) using [Flask-Assets](http://flask-assets.readthedocs.org/en/latest/index.html),
 * includes some favorite libraries (Backbone, Bootstrap, etc), and a Makefile
 to automatically update them to stable versions.

Adapted from: https://github.com/zachwill/flask_heroku.

### Install

0. Install [Python and Virtualenv](http://install.python-guide.org/).

1. Install dependencies from `npm`:
 * `npm install -g uglify-js`
 * `npm install -g recess` (needed to build Bootstrap)

2. Clone this repo.

3. Run:

```
    $ virtualenv venv --distribute --no-site-packages
    $ source venv/bin/activate
    $ pip install -r requirements.txt
```


### Run locally

```
$ (gem install foreman)
$ foreman start -f Procfile.dev
```


### Deploy to Heroku

http://devcenter.heroku.com/articles/python

```
$ heroku login
$ heroku create
$ git push heroku master
$ heroku ps:scale web=1
```

Note: Heroku currently requires Python 2.7.


### Read more

 * [Getting starting with Python on Heroku](https://devcenter.heroku.com/articles/python)
 * [Flask Documentation](http://flask.pocoo.org/docs/)
 * [Jinja2 Documentation](http://jinja.pocoo.org/2/documentation/)
 * [Werkzeug Documentation](http://werkzeug.pocoo.org/documentation/)
