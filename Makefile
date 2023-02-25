FRONTDIR=front
IMAGESETTING=node:16.14-slim
PROJECTNAME=<<PROJECTNAME設定>>

.PHONY: setup-all setup setup-vue

setup-all: rename-dir setup rm-garbage

setup: clean-all make-directory rewrite-docker-setting-files cra-react rewrite-vite-port build

setup-vue: clean-all make-directory rewrite-docker-setting-files cra-vue rewrite-vite-port build

make-directory:
	mkdir -p ${FRONTDIR}

cra-react:
	cd ${FRONTDIR} && echo ${PROJECTNAME} |\
	npm create vite@latest . -- --template react-ts && cp -f ../basic/react.vite.config.ts vite.config.ts

cra-vue:
	cd ${FRONTDIR} && echo ${PROJECTNAME} |\
	npm create vite@latest . -- --template vue-ts && cp -f ../basic/vue.vite.config.ts vite.config.ts

build:
	docker-compose build

rewrite-docker-setting-files:  rewrite-docker-compose rewrite-dockerfile edit-devcontainer-file

rewrite-vite-port:
	cat front/package.json | sed -e '/vite preview/s/vite preview/vite preview --port 3001/g' | \
	sed -e '/"dev": "vite"/s/"dev": "vite"/"dev": "vite serve --port 3000"/g' > tmpfrontpackage.json && \
	cat tmpfrontpackage.json > front/package.json && rm tmpfrontpackage.json

rewrite-docker-compose:
	cat docker-compose.yml | sed -e 's/<<ProjectName>>/${PROJECTNAME}/' > tmpfile && \
	cat tmpfile > docker-compose.yml && rm tmpfile

rewrite-dockerfile:
	cat Dockerfile | sed -e 's/<<ImageSetting>>/${IMAGESETTING}/' > tmpfile && \
	cat tmpfile > Dockerfile && rm tmpfile

edit-devcontainer-file:
	cat .devcontainer/devcontainer.json | sed -e "s/<<ProjectName>>/${PROJECTNAME}/" > .devcontainer/tmp.devcontainer.json && \
	cat .devcontainer/tmp.devcontainer.json > .devcontainer/devcontainer.json && rm .devcontainer/tmp.devcontainer.json

rename-dir:
	cd ../ && \
	mv make-vite-project/ ${PROJECTNAME}/ && \
	cd ${PROJECTNAME}

rm-garbage:
	rm Makefile && \
	cp basic/Makefile Makefile && \
	rm -r basic && \
	sudo rm -r .git

clean-dir:
	-rm -rf $(FRONTDIR)

clean-all: clean-dir