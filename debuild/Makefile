.PHONY: build-image push-image run

build-image: Dockerfile
	sudo docker build -t gadl/spot-debuild .

push-image:
	sudo docker push gadl/spot-debuild

run:
	cd .. && sudo docker run -v $$PWD:/build/result gadl/spot-debuild ./build-spot.sh next -j8
