build:
	@docker build -t comau/ros .

run: build
	@docker run  -v ${PWD}/ws:/ws -e USER=$USER -e USERID=$UID -it comau/ros bash
