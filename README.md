# archiso-builder

Build your own Arch Linux ISO made with 'archiso' very simply using Docker

See what archiso is in the [ArchLinux wiki](https://wiki.archlinux.org/index.php/archiso)

A built-in pacman cache is automatically used to prevent unnecessary downloads.

Please configure your preferred upstream mirror URLs in `pacoloco/pacoloco.yaml`

## How to use?

First, get a copy of the `releng` config by using the `new` command:

    ./cli.sh new foo

To build the image, run:

    ./cli.sh build foo

# References

- Originally forked from https://github.com/nlhomme/archiso-builder
- Pacman cache facilitate by Pacoloco https://github.com/anatol/pacoloco