FROM px4io/px4-dev-ros-kinetic

WORKDIR /px4
RUN apt-key del 421C365BD9FF1F717815A3895523BAEEB01FA116 \
    && apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 \
    && apt clean && apt update && apt install openssh-client ros-kinetic-xacro -y \
    && rm -rf /var/lib/apt/lists/* \
    && git clone https://github.com/PX4/Firmware.git \
    && cd Firmware \
    && git checkout 50bd148 \
    && DONT_RUN=true make posix_sitl_default gazebo
