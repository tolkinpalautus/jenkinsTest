# jenkinsTest
This repo has 2 files
- dockerfile : used to file a docker image running a war file (tomcat 8.0 image based)
- jenkinsfile : pipeline used by a jenkins server

## dockerfile
It uses as base consol/tomcat-8.0 image because it was the first match I got in google for docker tomcat 8.0 image, any other could have been used.

I tried first to include a wget and curl commands to get directly the war file when the docker image was being created, however I got into issues while opening the file itself when tomcat was starting up. This is most likely because of ownership and user rights. I left the last lines I tried commented and not to spend too much time there I opted for download the war file during the jenkins pipeline execution and include an ADD clause in the dockerfile

## jenkinsfile
This jenkinsfile will be read by jenkins and populate needed steps in jenkins to have a working pipeline that will build a docker image to execute a war base web site.

A bit of explanation of the pipeline, though output has been included in the logs and it may be self explanatory.

- the pipeline will be executed in the master of jenkins, so there is no need to create a separate build slave.
- a standard set of options is given, specially note the timeout 15mins to prevent the job of getting halted.
- Stage Build<br>
It downloads the war file to the workspace and runs a docker build command
- Stage Run<br>
Stops any running instance of the docker container, in case something has been left running in a previous build.
Runs the docker container. It sets the listening port to 8086
- Stage Test<br>
It tests the web app is running by downloading the entry web page file and printing its content in the pipeline log.
- Stage Wait<br>
waits 5m, during which the docker container is running and users can access it, or for instance they can run in their own browser: http://192.168.100.2:8086/sample . where 192.168.100.2 is the IP of our jenkins  server
- Stage Stopping image<br>
Stops the container

