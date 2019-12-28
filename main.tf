provider "n0stack" {
	endpoint = "172.16.14.10:20180"
}

resource "n0stack_network" "f35" {
	name = "f35"
	ipv4_cidr = "192.168.7.0/24"
	annotations = {
		"n0core/provisioning/virtual_machine/vlan_id" = "125"
	}
}

variable "machines" {
	default = {
	}
}

resource "n0stack_blockstorage" "manager-1" {
	image_name = "baseimage-ubuntu"
	tag = "latest"
	blockstorage_name = "f35-manager-1"
	annotations = {
		"n0core/provisioning/block_storage/request_node_name" = "n0node00"
	}
	request_bytes = 1073741824
	limit_bytes = 10737418240
}

resource "n0stack_virtualmachine" "manager-1" {
	name = "f35-manager-1"
	annotations = {
		"n0core/provisioning/virtual_machine/request_node_name" = "n0node00"
	}
	request_cpu_milli_core = 10
	limit_cpu_milli_core = 1000
	request_memory_bytes = 536870912
	limit_memory_bytes = 536870912
	block_storage_names = [n0stack_blockstorage.manager-1.blockstorage_name]

	nics {
		network_name = n0stack_network.f35.name
		ipv4_address = "192.168.7.1"
	}
}
