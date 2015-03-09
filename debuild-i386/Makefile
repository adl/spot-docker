.PHONY: build-image push-image run

build-image: Dockerfile
	sudo docker build -t gadl/spot-debuild-i386 .

push-image:
	sudo docker push gadl/spot-debuild-i386

run:
	cd .. && sudo docker run -v $$PWD:/build/result gadl/spot-debuild-i386 ./build-spot.sh next -j8
