#
# Makefile
#
# make init:
# 	Initialize virtualenv/dependencies.
#
# make update:
# 	Update static libraries to latest stable versions.
#

# Include some favorite JS libraries.
LIBS = \
	http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js \
	http://modernizr.com/downloads/modernizr.js \
	http://underscorejs.org/underscore.js \
	http://backbonejs.org/backbone.js \
	http://cloud.github.com/downloads/wycats/handlebars.js/handlebars-1.0.0.beta.6.js

# Include these files built from Twitter Bootstrap.
BOOTSTRAP_FILES = \
	js/bootstrap.js \
	css/bootstrap.css \
	css/bootstrap-responsive.css \
	img/*

# Download files to a temp directory.
TEMP = temp

# Styling
NORM = \033[0m
BOLD = \033[1m

# Install virtualenv and dependencies from requirements.txt.
init:
	-@rm -rf venv
	virtualenv venv --distribute --no-site-packages
	source venv/bin/activate && pip install -r requirements.txt

# Update libraries to latest stable versions.
update:
	$(MAKE) clean && mkdir $(TEMP)

	# Download each lib to a TEMP directory.
	@for url in $(LIBS) ; do \
		echo "\n${BOLD}Fetching $$url${NORM}\n" ; \
		cd $(TEMP); curl -O $$url ; \
	done

	# Clone and build Bootstrap.
	echo "\n${BOLD}Cloning Bootstrap${NORM}\n" ; \
	git clone git://github.com/twitter/bootstrap.git
	cd bootstrap; make bootstrap

	# Copy Bootstrap files into TEMP.
	@for file in $(BOOTSTRAP_FILES) ; do \
		cp bootstrap/bootstrap/$$file $(TEMP) ; \
	done

	# Copy js/css/img files from TEMP into static.
	mv $(TEMP)/*.js static/js/libs
	mv $(TEMP)/*.css static/css
	mv $(TEMP)/*.png static/img

	$(MAKE) clean
	@echo "\n${BOLD}Updated! Boom!${NORM}\n"

clean:
	-rm -rf $(TEMP)
	-rm -rf bootstrap
	-rm -rf static/.webassets-cache

# Run tests.
test:
	nosetests -v tests
