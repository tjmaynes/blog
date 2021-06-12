install_dependencies:
	git submodule init && git submodule update --remote

.PHONY: build
build:
	hugo --gc --minify

edit:
	hugo server --bind=0.0.0.0 --port=80 --buildFuture -D
