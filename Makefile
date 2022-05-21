FRONTDIR=front

setup: clean-all make-directory cra-vite build

make-directory:
	mkdir -p ${FRONTDIR}

cra-vite:
	cd ${FRONTDIR} && echo ${PROJECTNAME} | npm create vite@latest . -- --template react-ts

build:
	echo "\nPROJECTNAME=${PROJECTNAME}" >> .env && sed -i -e '/^$$/d' .env && docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

clean-env:
	sed -i -e "/^PROJECTNAME=/d" .env && sed -i -e '/^$$/d' .env

clean-dir:
	-rm -rf $(FRONTDIR)


shell:
	find . -name .env -type f -print0 | xargs -0 grep PROJECTNAME | sed -e 's/PROJECTNAME=//' | xargs -I arg echo 'docker exec -it arg_front bash'
clean-all: clean-dir clean-env