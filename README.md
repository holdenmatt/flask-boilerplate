# flask-boilerplate

Boilerplate for a web application using the Python Flask framework.

 * easily deploy to Heroku,
 * package assets (JS, CSS, CoffeeScript, SCSS, etc) using [Flask-Assets](http://flask-assets.readthedocs.org/en/latest/index.html),
 * includes Backbone/Underscore and Twitter Bootstrap by default, but these are
 easily swapped for libraries of your choice.

Thanks to:

* https://github.com/zachwill/flask_heroku
* https://github.com/tbranyen/backbone-boilerplate
* https://github.com/miracle2k/webassets


### Install

0. Install [Python and Virtualenv](http://install.python-guide.org/).
1. Clone this repo.
2. Run:

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
$ heroku create --stack cedar
$ git push heroku master
```

Note: Heroku currently requires Python 2.7.
