image:
	docker build -t ruken/docker-go-gcr:latest .
	docker push ruken/docker-go-gcr

.PHONY: image