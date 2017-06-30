FROM 32bit/ubuntu:16.04

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
RUN apt-get update && apt-get install ros-kinetic-ros-base -y
RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash && mkdir -p /ws/ros_ws/src && cd /ws/ros_ws/src && catkin_init_workspace"
RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash &&  cd /ws/ros_ws && catkin_make"
RUN echo "/opt/ros/kinetic/setup.bash" >> /root/.bashrc
RUN echo "/ws/ros_ws/devel/setup.bash" >> /root/.bashrc

COPY ./ros_entrypoint.sh /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]
