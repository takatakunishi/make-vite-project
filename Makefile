FRONTDIR=front

setup: clean-all make-directory cra-react rewite-vite-port build

setup-vue: clean-all make-directory cra-vue rewite-vite-port build

make-directory:
	mkdir -p ${FRONTDIR}

cra-react:
	cd ${FRONTDIR} && echo ${PROJECTNAME} |\
	npm create vite@latest . -- --template react-ts && cp -f ../basic/react.vite.config.ts vite.config.ts

cra-vue:
	cd ${FRONTDIR} && echo ${PROJECTNAME} |\
	npm create vite@latest . -- --template vue-ts && cp -f ../basic/vue.vite.config.ts vite.config.ts

build:
	echo "\nPROJECTNAME=${PROJECTNAME}" >> .env && sed -i -e '/^$$/d' .env && docker-compose build

rewite-vite-port:
	sed -i -e '/vite preview/s/vite preview/vite preview --port 3001/g' front/package.json

up:
	docker-compose up -d

down:
	docker-compose down

clean-env:
	sed -i -e "/^PROJECTNAME=/d" .env && sed -i -e '/^$$/d' .env

clean-dir:
	-rm -rf $(FRONTDIR)

shell:
	find . -name .env -type f -print0 |\
	xargs -0 grep PROJECTNAME |\
	sed -e 's/PROJECTNAME=//' |\
	xargs -I arg echo 'docker exec -it arg_front bash'

clean-all: clean-dir clean-env