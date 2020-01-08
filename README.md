```
$ terraform init
$ terraform apply
```

```
$ git submodule init
$ cd kubespray
$ python -m venv venv
$ source ./venv/bin/activate
$ pip install -r requirements.txt
```

edit ~/.ssh/config

```
Host f35-manager-1
	Hostname 127.0.0.1
	User ictsc
	Port 8022
	IdentityFile ~/.ssh/github

Host f35-manager-2
	Hostname 127.0.0.1
	User ictsc
	Port 8023
	IdentityFile ~/.ssh/github

Host f35-manager-3
	Hostname 127.0.0.1
	User ictsc
	Port 8024
	IdentityFile ~/.ssh/github

Host f35-worker-1
	Hostname 127.0.0.1
	User ictsc
	Port 8025
	IdentityFile ~/.ssh/github

Host f35-worker-2
	Hostname 127.0.0.1
	User ictsc
	Port 8026
	IdentityFile ~/.ssh/github

Host f35-worker-3
	Hostname 127.0.0.1
	User ictsc
	Port 8027
	IdentityFile ~/.ssh/github
```

```
$ ansible-playbook -i inventory/n0stack/inventory.ini cluster.yml --ask-become-pass --ask-pass --become --become-user=root
```
