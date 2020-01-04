# Start with the OpenJDK 8 JRE Alpine (small) image.
FROM openjdk:8-jre-alpine
LABEL maintainer="njrusmc@gmail.com"

# Download the specific VTL release, unzip it, and delete the original zip.
RUN wget https://github.com/plavjanik/vtl-cli/releases/download/v0.1.1/vtl.zip && \
    unzip vtl.zip && \
    rm -f vtl.zip

# Copy the sample directory into the container.
COPY sample /sample
