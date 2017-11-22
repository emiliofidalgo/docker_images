# Ubuntu Xenial
FROM ubuntu:16.04

ARG USR
ENV USR ${USR:-emilio}
ARG DEBIAN_FRONTEND=noninteractive

# Labels to identify the image
LABEL maintainer="Emilio Garcia-Fidalgo"

# Installing some software
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y \
        ca-certificates \
        apt-transport-https \
        wget \
        software-properties-common \
	curl \
        vim \
        nmap \
        git

# Installing ROS and tools
ENV ROS_DISTRO lunar
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
RUN apt-get update
RUN apt-get install -y ros-lunar-desktop-full
RUN apt-get install -y \
        python-rosinstall \
        python-rosinstall-generator \
        python-wstool \
        build-essential \
        python-catkin-tools
RUN rm -rf /var/lib/apt/lists/*
RUN rosdep init

# Adding a group
RUN groupadd -r $USR
# Adding a user
RUN useradd --no-log-init --create-home --shell /bin/bash --system --gid $USR $USR
# Setting the corresponding password
RUN echo $USR:$USR | chpasswd
# Adding the user to sudo group
RUN adduser $USR sudo

# Switching to the new user
USER $USR
WORKDIR /home/$USR
RUN rosdep update

# Setup catkin workspace
RUN /bin/bash -c "source /opt/ros/lunar/setup.bash && \
                  mkdir -p ROS/lunar/src && \
                  cd ROS/lunar/ && \
                  catkin_make && \
                  echo 'source ROS/lunar/devel/setup.bash' >> .bashrc"

# Setup entrypoint
COPY ./ros_entrypoint.sh .

ENTRYPOINT ["ros_entrypoint.sh"]
CMD ["bash"]
