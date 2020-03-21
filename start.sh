IMAGE_NAME=wego-kh.com/xampp-php5
CONTAINER_NAME=xampp-docker
PUBLIC_WWW_DIR='~/web_pages'


echo "Running container '$CONTAINER_NAME' from image '$IMAGE_NAME'..."

docker start $CONTAINER_NAME > /dev/null 2> /dev/null || {
	echo "Creating new container..."
	docker run \
	       --detach \
	       --tty \
	       -p 8002:80 \
	       -p 3386:3306 \
	       --name $CONTAINER_NAME \
           --volume "/opt/docker/wegox/htdocs:/opt/lampp/htdocs" \
           --volume "/opt/docker/wegox/logs:/opt/lampp/logs" \
           --volume "/opt/docker/wegox/ssl:/opt/lampp/ssl" \
	       #--mount "source=$CONTAINER_NAME-vol,destination=/opt/lampp/var/mysql/" \
			$IMAGE_NAME
}

#if [ "$#" -eq  "0" ]; then
#	docker exec --interactive --tty $CONTAINER_NAME bash
#elif [ "$1" = "stop" ]; then
#	docker stop $CONTAINER_NAME
#else
#	docker exec $CONTAINER_NAME $@
#fi

