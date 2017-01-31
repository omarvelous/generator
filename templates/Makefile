build:
	docker-compose build

bundle:
	docker-compose run app bundle install

setup: bundle build setup-db migrate

setup-db:
	docker-compose run app bundle exec rails db:create

migrate:
	docker-compose run app bundle exec rails db:migrate

seed:
	docker-compose run app bundle exec rails db:seed

drop-db:
	docker-compose run app bundle exec rails db:drop

redo-db: drop-db setup-db migrate

run:
	docker-compose up

console:
	docker-compose run app bundle exec rails console

routes:
	docker-compose run app bundle exec rails routes

lint:
	docker-compose run app bundle exec rubocop

rspec:
	docker-compose run app bundle exec rspec

ci: bundle lint rspec

g:
	docker-compose run app bundle exec rails g $(c)

r:
	docker-compose run app bundle exec rails $(c)
