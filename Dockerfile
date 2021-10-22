FROM debian:latest AS build-env
RUN apt-get update
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3 psmisc
RUN apt-get clean

# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"
# RUN flutter doctor -v
# RUN flutter channel master
# RUN flutter upgrade
RUN flutter config --enable-web
# Run flutter doctor
# Copy the app files to the container
# COPY . /usr/local/bin/app
RUN git clone https://github.com/Noyvilaijid/ExcelWeb.git /usr/local/bin/app
# Set the working directory to the app files within the container
WORKDIR /usr/local/bin/app
# Get App Dependencies
RUN flutter pub get
# Build the app for the web
RUN flutter build web
# Document the exposed port
EXPOSE 4040
# Set the server startup script as executable
RUN ["chmod", "+x", "/usr/local/bin/app/server/server.sh"]
# Start the web server
ENTRYPOINT [ "/usr/local/bin/app/server/server.sh" ]



# FROM google/dart
# # uncomment next line to ensure latest Dart and root CA bundle
# RUN apt -y update && apt -y upgrade
# WORKDIR /app
# COPY pubspec.* .
# RUN pub get
# COPY . /usr/local/bin/app
# RUN pub get --offline
# RUN dart2native /app/bin/server.dart -o /app/bin/server
# FROM subfuzion/dart-scratch
# COPY --from=0 /app/bin/server /app/bin/server
# # COPY any other directories or files you may require at runtime, ex:
# #COPY --from=0 /app/static/ /app/static/
# EXPOSE 8080
# ENTRYPOINT ["/usr/local/bin/app/server/server.sh"]
