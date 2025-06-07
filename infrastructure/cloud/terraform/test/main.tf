provider "oci" {}

resource "oci_core_instance" "generated_oci_core_instance" {
	agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Oracle Java Management Service"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "OS Management Service Agent"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "OS Management Hub Agent"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Management Agent"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Custom Logs Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute RDMA GPU Monitoring"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Run Command"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Auto-Configuration"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Authentication"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Cloud Guard Workload Protection"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Block Volume Management"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Bastion"
		}
	}
	availability_config {
		recovery_action = "RESTORE_INSTANCE"
	}
	availability_domain = "jqrR:EU-MADRID-1-AD-1"
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaalsnj4rpt6y6uxwwcd7n4kx6dwydgwkmnhil4e5i553esnxuwnshq"
	create_vnic_details {
		assign_ipv6ip = "false"
		assign_private_dns_record = "true"
		assign_public_ip = "true"
		subnet_id = "ocid1.subnet.oc1.eu-madrid-1.aaaaaaaanzu3i3ko3prdhgn3gbewrthezqrkz4wftilgmjutkccfoycm3fuq"
	}
	display_name = "berxaserver"
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	is_pv_encryption_in_transit_enabled = "true"
	metadata = {
		"ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCiVzOkMjqMIxPbqTvBZy9920L8aMYovP111QAaOxAuAMMRaYOlfYn4fo5z9yaUo90VXJUIsXHw2TqJCn69dgLl52Bu2bbidxK4a/FCb450ge+aM3j2GdsIIQT1/daSI4mXTIgvm/X+rRlBvq8nHHvvnDZ4nP0n+0ETysguzbfLv78IY/4Oy4uxgTXFwyh6HnP2BJUg7NkPBteaBR9EkmJXXQAvnMFnsAe6u4zn3eERs7VDx8lcEwg4tNnU0gve01tqzZaj0n+Yyfq9V6onfuUI/dWMXk9m7FLd0URq1FxNoiis6vRZefs+n5kwln/TVux+N7n2FQGx9I8/Ru/PVYoSbvwjltqvgvakYevh+VOrOKyPlrMKR4oX1SCW2JtWSFD19Alpue3eTEA9DHMYzxTgnWNF+J57DtH2FnKkBZjBglTH3kYVjBzL5URSHIdYSPY3yD2V+7StuFAMKDt0kgK53jB8/M18IB6qwDjNlPlyAAOWe/jv+h7NcY6F3f6Cra+9MBUfvFPTbgK8QCvSLtiA+06YkiAX8TKXINFBDzd00+W9we5YpzvH5/gZcLyfGwc4KVoo8T/jjqbwZSLw934LSjHRuZLasrhoJPV8mOG8Pd0JgW88yAPjTkmaH7bEQsKAKYhSm1b3eva/WP7NMGdFgQUOPW/kdYIOPRftiuGl9Q== rodriguez_as@SIT-SMBP-299PHQ\n"
	}
	shape = "VM.Standard.E2.1.Micro"
	source_details {
		source_id = "ocid1.image.oc1.eu-madrid-1.aaaaaaaancdqkmx5jftjb6q2dflbujdbcm76zqlp6vl3te3auyhpfcnqd2mq"
		source_type = "image"
	}
}
