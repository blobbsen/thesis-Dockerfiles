docker run --rm \
	\
	-p 8190:8080 \
	-p 8023:22 \
	-p 5000:5000 \
	\
	-v `pwd`/jenkins_home:/var/lib/jenkins \
	-v `pwd`/etc_ssh:/etc/ssh \
	\
	--name "test_derLetzte01" \
	\
	jenkins_final01
