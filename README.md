# archiso-builder
Build your own Arch Linux ISO made with 'archiso' very simply using Docker

See what archiso is in the [ArchLinux wiki](https://wiki.archlinux.org/index.php/archiso)

## How to use?
At firt, push your archiso files to any SCM using git (Github, Bitbucket, Gitlab, etc...),
an example is avaiable [here](https://github.com/nlhomme/lhoslite)

To build the image, run:

    docker build --rm -t nlhomme/archiso-builder:latest .

You can also pull the latest image available by running:

    docker pull nlhomme/archiso-builder

Note: A new image is automatically pushed to Docker Hub at each Github commit.

Run the container with the command below, the ISO building will start automatically:

    docker run --rm -v /tmp:/tmp -t -i --privileged nlhomme/archiso-builder:latest
    
The console will ask you the URL of the repo he must clone, give it.
You can copy/paste the example if you want to try first.

One the ISO build is done, go on the /tmp folder on your host system and find the file (where yyy-mm-dd is the current date):

    iso-name.iso

#NOTE: this image because will not work if the live cd you're going to build if bigger than the limit of 10gb per Docker container. I'll will work on it soon...
