test:
	docker-compose exec -T aoe2comments python aoe2comments/manage.py test

run:
	docker-compose up

build:
	docker-compose build

rebuild:
	docker-compose build
	docker-compose up

migrate:
	docker-compose exec -T aoe2comments python aoe2comments/manage.py makemigrations
	docker-compose exec -T aoe2comments python aoe2comments/manage.py migrate

shell:
	docker-compose exec -T aoe2comments python aoe2comments/manage.py shell

format:
	docker-compose exec -T aoe2comments black . --exclude aoe2commentsapi/migrations/

check_format:
	docker-compose exec -T aoe2comments black . --check --exclude aoe2commentsapi/migrations/

lint:
	docker-compose exec -T aoe2comments flake8 . --max-line-length 88 --exclude ./aoe2commentsapi/migrations/,./aoe2comments/settings/
