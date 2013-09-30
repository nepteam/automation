help:
	@echo "Try make init_debian or make init_fedora to begin."

init: init_debian

yum_install:
	@yum install -y python puppet facter git

apt_install:
	@apt-get install -y python puppet facter git 

puppet_install:
	@#puppet module install
	@echo "..."

init_debian: apt_install puppet_install
init_fedora: yum_install puppet_install
