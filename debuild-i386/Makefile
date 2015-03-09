.PHONY: build-image push-image run run-bin

build-image: Dockerfile
	sudo docker build -t gadl/spot-debuild-i386 .

push-image:
	sudo docker push gadl/spot-debuild-i386

# Build source & binary
run:
	cd .. && sudo docker run -v $$PWD:/build/result gadl/spot-debuild-i386 ./build-spot.sh next -j8

# Build only binary from existing source
run-bin:
	cd .. && sudo docker run -v $$PWD:/build/result gadl/spot-debuild-i386 ./bin-spot.sh -j8
