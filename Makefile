.PHONY: build
build:
	docker build -t gitbucket .

.PHONY: exec
exec: build
	docker run -it --rm gitbucket /bin/sh

.PHONY: run
run: build
	docker run -it --rm --publish 0.0.0.0:8080:8080 gitbucket
