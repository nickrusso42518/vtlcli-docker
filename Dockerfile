# Start with the OpenJDK 8 JRE Alpine (small) image.
FROM openjdk:8-jre-alpine
LABEL maintainer="njrusmc@gmail.com"

# Reference the VTL_VER argument (must come after FROM command)
ARG VTL_VER

# Download the specific VTL release, unzip it, and delete the original zip.
RUN wget https://github.com/plavjanik/vtl-cli/releases/download/v${VTL_VER}/vtl.zip && \
    unzip vtl.zip && \
    rm -f vtl.zip

# Copy the sample directory into the container.
COPY sample /sample

# ** EXAMPLE BUILD COMMAND FROM SHELL **
# VTL_VER=0.1.1
# docker build \
#   --build-arg VTL_VER=$VTL_VER \
#   -t nickrusso42518/vtlcli-docker:$VTL_VER \
#   -t nickrusso42518/vtlcli-docker:latest .
