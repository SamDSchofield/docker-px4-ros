FROM px4io/px4-dev-ros

WORKDIR /px4
RUN apt update && apt install  openssh-client -y \
    && rm -rf /var/lib/apt/lists/* \
    && git clone https://github.com/PX4/Firmware.git \
    && cd Firmware \
    && git checkout 50bd148 \
    && DONT_RUN=true make posix_sitl_default gazebo
