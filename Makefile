BLOG_DIRECTORY              = $(PWD)
BLOG_PUBLISHING_DIRECTORY   = $(BLOG_DIRECTORY)/public
REPO                        = git@github.com:tjmaynes/blog.git
TARGET_BRANCH               = gh-pages

define execute_script
chmod +x ./scripts/${1}.sh
./scripts/${1}.sh
endef

install_dependencies:
	$(call execute_script,$@)

.PHONY: build
build:
	hugo --gc --minify

edit:
	hugo server --bind=0.0.0.0 --baseUrl=http://$(HOST) --port=80 --buildFuture -D

preview: build 
	$(call execute_script,$@) \
		$(BLOG_PUBLISHING_DIRECTORY)	

deploy:
	$(call execute_script,$@) \
		$(GIT_USERNAME) \
		$(GIT_EMAIL) \
		$(GIT_COMMIT_SHA) \
		$(TARGET_BRANCH) \
		$(BLOG_PUBLISHING_DIRECTORY) \
		$(REPO)

clean:
	rm -rf $(BLOG_PUBLISHING_DIRECTORY)
