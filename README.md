Created networking modules where all the vpc networking resides

Also created ec2 modules for development branch which can be reused for any environment to created instances.

## Commands
### Packer
```
packer init .
packer validate .
packer build aws-ubuntu.pkr.hcl
packer build aws-linux.pkr.hcl
```
#### or
```
packer build .
```
To build all in the current directory

## cd to server/main and run 
terraform apply -var-file=environments/dev.tfvars

##
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts playbook.yaml --check
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory/hosts playbooks/playbook.yaml --check
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory/dev/hosts playbooks/kafka.yaml -C
