"""
Define static webasset bundles.
"""
from flask.ext.assets import Bundle


# Bundle js libs, except jQuery (loads from CDN) and Modernizr (loads in head).
libs_js = Bundle(
    'js/underscore.js',
    'js/backbone.js',
    'js/bootstrap.js',
    'js/handlebars-1.0.0.beta.6.js',
    filters='uglifyjs',
    output='build/libs.js'
)

all_css = Bundle(
    'css/bootstrap.css',
    'css/bootstrap-responsive.css',
    filters='cssmin',
    output='build/all.css'
)
