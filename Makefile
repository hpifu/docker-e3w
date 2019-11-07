repository=e3w

.PHONY: deploy remove logs

deploy:
	mkdir -p /var/docker/${repository}/conf
	cp config.ini /var/docker/${repository}/conf
	docker stack deploy -c stack.yml ${repository}

remove:
	docker stack rm ${repository}

logs:
	docker logs $$(docker ps --filter name=$(repository) -q)
