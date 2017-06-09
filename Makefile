build: init bundle rails override

init:
	$(info >>>> Making dir)
	cd ..; mkdir $(n)
	$(info >>>> Copying templates)
	cp templates/* ../$(n)
	$(info >>>> Initializing Git)
	cd ../$(n); git init; git add .; git commit -m "init"

bundle:
	$(info >>>> Running bundle)
	cd ../$(n); make bundle

rails:
	$(info >>>> Running rails new)
	cd ../$(n); make r c="new . --force --database=postgresql --skip-bundle --skip-gemfile"
	cd ../$(n); git add .; git commit -m "rails new"

override:
	$(info >>>> Copying overrides)
	cp -rf overrides/* ../$(n)
	cd ../$(n); grep -ilr '<<APP_NAME>>' * | xargs -I@ sed -i '' 's/<<APP_NAME>>/'"$(n)"'/g' @
	cd ../$(n); git add .; git commit -m "overrides"

add-devise:
	$(info >>>> Copying devise)
	# add to gemfile and bundle
	cp -rf devise/* ../$(n)
	cd ../$(n); make migrate
	cd ../$(n); git add .; git commit -m "devise"
