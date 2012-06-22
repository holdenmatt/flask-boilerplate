#
# Makefile
#
# Update static libraries to latest stable versions.
#

# Download files to a temp directory.
TEMP=temp

# Styling
NORM=\033[0m
BOLD=\033[1m

all:
	@$(MAKE) clean && mkdir $(TEMP)

	@$(MAKE) update_libs
	@$(MAKE) update_bootstrap

	@mv $(TEMP)/*.js static/js
	@mv $(TEMP)/*.css static/css
	@mv $(TEMP)/*.png static/img

	@$(MAKE) clean
	@echo "\n${BOLD} - Boom! It worked! - ${NORM}\n"

# Download and build the latest Twitter Bootstrap.
# Copy built js/css files into TEMP.
update_bootstrap:
	@echo "\n${BOLD} - Cloning Twitter Bootstrap - ${NORM}\n"

	git clone git://github.com/twitter/bootstrap.git
	cd bootstrap; make bootstrap

	cp bootstrap/bootstrap/js/bootstrap.js $(TEMP)
	cp bootstrap/bootstrap/css/bootstrap.css $(TEMP)
	cp bootstrap/bootstrap/css/bootstrap-responsive.css $(TEMP)
	cp bootstrap/bootstrap/img/* $(TEMP)

# Download latest lib versions to an update folder.
update_libs:
	@echo "${BOLD} Fetching jquery.js ${NORM}"
	cd $(TEMP); curl -O http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js

	@echo "${BOLD} Fetching modernizr.js ${NORM}"
	cd $(TEMP); curl -O http://modernizr.com/downloads/modernizr.js

	@echo "${BOLD} Fetching underscore.js ${NORM}"
	cd $(TEMP); curl -O http://underscorejs.org/underscore.js

	@echo "${BOLD} Fetching backbone.js ${NORM}"
	cd $(TEMP); curl -O http://backbonejs.org/backbone.js

	@echo "${BOLD} Fetching handlebars.js ${NORM}"
	cd $(TEMP); curl http://cloud.github.com/downloads/wycats/handlebars.js/handlebars-1.0.0.beta.6.js > handlebars.js

clean:
	-rm -rf $(TEMP)
	-rm -rf bootstrap

# Run tests.
test:
	nosetests -v tests
