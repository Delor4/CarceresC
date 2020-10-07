
DOCKER_IMAGE = carceres
DOCKER_IMAGENAME = my_pms

.PHONY: all clean build restart

all: build

# cleanup
clean:
	rm -R app
	cp -r app_template/ app/

build:
	docker-compose build

restart:
	docker stop $(DOCKER_IMAGENAME)
	docker rm $(DOCKER_IMAGENAME)
	docker run -d --name $(DOCKER_IMAGENAME) -p 80:80 $(DOCKER_IMAGE)
