build:
	docker build --platform linux/amd64 -t olegsklyarov/run-goal-site .

push:
	docker push --platform linux/amd64 olegsklyarov/run-goal-site

run-local:
	docker run -it -d -p 8080:80 --restart=unless-stopped --name run-goal-site olegsklyarov/run-goal-site

run:
	docker run -it -d --restart=unless-stopped --network=infra_web_net --name run-goal-site olegsklyarov/run-goal-site

stop:
	docker stop run-goal-site || true
	docker rm run-goal-site || true
