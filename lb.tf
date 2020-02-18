resource "n0stack_blockstorage" "blockstorage-lb" {
	image_name = "baseimage-ubuntu"
	tag = "latest"
	blockstorage_name = "f35-lb"
	annotations = {
		"n0core/provisioning/block_storage/request_node_name" = "ictsc-sl2500-1-3"
	}
	request_bytes = 1073741824
	limit_bytes = 10737418240
}

resource "n0stack_virtualmachine" "vitualmachine-lb" {
	name = "f35-lb"
        annotations = {
                "n0core/provisioning/virtual_machine/request_node_name" = "ictsc-sl2500-1-3"
        }
        request_cpu_milli_core = 3000
        limit_cpu_milli_core = 3000
        request_memory_bytes = 4294967296
        limit_memory_bytes = 4294967296
        block_storage_names = ["f35-lb"]

        nics {
                network_name = "f35"
                ipv4_address = "192.168.7.7"
        }
}