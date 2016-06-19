DOCKERFILE_TEST := Dockerfile_test
IMAGE_TEST := iptables_test
PROJECT := github.com/albertoleal/iptables

help:
	@echo '    image_test ............... buils docker image'
	@echo '    test ..................... runs tests'
	@echo '    unittest ................. runs tests in a docker container'
	@echo '    local_unittest ........... runs tests locally'

test:
	make unittest

image_test:
	docker build -t $(IMAGE_TEST) -f $(DOCKERFILE_TEST) .

unittest: image_test
	docker run -t --privileged --rm -v $(PWD):/go/src/$(PROJECT) $(IMAGE_TEST) make local_unittest

local_unittest:
	go vet ./...
	ginkgo -tags daemon -r -p -race -cover -keepGoing -nodes=4 .
