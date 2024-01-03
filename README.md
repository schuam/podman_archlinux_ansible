# Arch Linux Docker Image for Ansible Role Testing

I use the Containerfile contained in this repository to build a podman image
that I can use to test Ansible roles on an Arch Linux system. It's based on the
official [Arch Linux docker image](https://hub.docker.com/\_/archlinux/) and
just installs some additionally needed packages. I also had to change the
/etc/pacman.conf file of the official image a little bit, in order to be able
to test a German locale setup.

To test Ansible roles, I use Molecule. To use the image that is generated from
the Containerfile in this repo, I added the following parts to the file
molecule/default/molecule.yml within the Ansible role:

```yml
driver:
  name: podman
platforms:
  - name: arch
    image: "docker.io/schuam/podman_archlinux_ansible:latest"
    pre_build_image: true
```

You can find the
[image on dockerhub](https://hub.docker.com/r/schuam/podman\_archlinux\_ansible).

