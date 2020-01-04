# Start with the OpenJDK 8 JRE Alpine (small) image.
FROM openjdk:8-jre-alpine
LABEL maintainer="njrusmc@gmail.com"

# Reference the VERSION argument (must come after FROM command)
ARG VERSION

# Download the specific VTL release, unzip it, and delete the original zip.
RUN wget https://github.com/plavjanik/vtl-cli/releases/download/v${VERSION}/vtl.zip && \
    unzip vtl.zip && \
    rm -f vtl.zip

# Copy the sample directory into the container.
COPY sample /sample

# ** EXAMPLE BUILD COMMAND **
# VERSION=0.1.1
# docker build \
#   --build-arg VERSION=$VERSION \
#   -t nickrusso42518/vtlcli-docker:$VERSION \
#   -t nickrusso42518/vtlcli-docker:latest .
