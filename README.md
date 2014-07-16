# DockerApache

Sample apache configuration for running an apache server inside a docker container, sharing the code through a shared folder. Work in progress.

# Usage

Build the container
	
	sudo ./build.sh

It will build the image keirua/apache-base. Once it's done, you can see it by running docker images

You can then run the container. It shares a folder containing a php file, which can be executed through apache :

	sudo ./run.sh

The console output should be something like

	apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2 for ServerName

You can then browse to http://172.17.0.2 and see the content of src/index.php be executed.
Since the src/ directory is shared, every modification on the files inside src/ will take effect inside the container.

