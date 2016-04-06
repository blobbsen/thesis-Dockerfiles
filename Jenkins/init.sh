docker run --rm \
	\
	-p 8190:8080 \
	-p 2020:22 \
	-p 5000:5000 \
	\
	-v `pwd`/jenkins_home:/var/lib/jenkins \
	-v `pwd`/etc_ssh:/etc/ssh \
	\
	--name "jenkins_docker" \
	\
	jenkins_final01
