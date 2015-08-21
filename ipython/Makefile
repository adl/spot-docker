.PHONY: build-image push-image run

build-image:
	sudo docker build $(BUILDFLAGS) -t gadl/spot-ipython .

push-image:
	sudo docker push gadl/spot-ipython

run:
	cd .. && sudo docker run -p 8888:8888 -t -e USERID=`id -u` -v $$PWD:/home/docker/remote gadl/spot-ipython run-nb
