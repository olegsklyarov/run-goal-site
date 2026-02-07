build:
	docker build --platform linux/amd64 -t olegsklyarov/run_goal_site .

push:
	docker push --platform linux/amd64 olegsklyarov/run_goal_site

run-local:
	docker run -it -d -p 8080:80 --restart=unless-stopped --name run_goal_site olegsklyarov/run_goal_site

run:
	docker run -it -d --restart=unless-stopped --network=infra_web_net --name run_goal_site olegsklyarov/run_goal_site

stop:
	docker stop run_goal_site
	docker rm run_goal_site
