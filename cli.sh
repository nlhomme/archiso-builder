#!/bin/bash
BUILDER_TAG=archiso-builder:latest

function print_help {
  echo "Usage: $(basename $0) [command] [name]"
  echo " e.g.: $(basename $0) build [name]"
  echo " e.g.: $(basename $0) new [name]"
}

function process_command {
  local command=$1
  local name=$2

  case $command in
    build)
      if [ -z "$name" ]; then
        echo "Error: No profile name provided for build command"
        print_help
        exit 1
      fi
      if [[ ! -f ./configs/$name/profiledef.sh ]]; then
        echo "Error: Profile $name not found. Can be created with new command"
        exit 1
      fi

      echo "Building profile $name..."
      docker compose build
      docker compose run --rm -v $PWD/configs/$name:/root/archlive -v /tmp:/tmp -w /root/archlive builder mkarchiso -v -w /tmp/archiso-work-$name -o /tmp/archiso-output-$name /root/archlive/
      ls -lah /tmp/archiso-output-$name/*.iso
      ;;
    new)
      if [ -z "$name" ]; then
        echo "Error: No profile name provided for new command"
        print_help
        exit 1
      fi
      if [[ -d ./configs/$name ]]; then
        echo "Error: Directory configs/$name already exists. Cannot continue..."
        exit 1
      fi

      echo "Creating new profile $name in ./configs by copying default releng config"
      mkdir -p configs
      docker compose build builder
      container_id=$(docker-compose run --no-deps --rm --name temp_builder -d builder sleep infinity)
      docker cp temp_builder:/usr/share/archiso/configs/releng ./configs/$name
      docker stop temp_builder > /dev/null
      ;;
    
    *)
      print_help
      ;;
  esac
}

if [ $# -lt 1 ]; then
  print_help
  exit 1
fi

process_command $@
