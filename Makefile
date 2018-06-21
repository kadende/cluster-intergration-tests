
deploy_base_image:
	docker build -t kadende/cluster-intergration-tests:base-image -f BaseDockerfile .
	docker push kadende/cluster-intergration-tests:base-image
