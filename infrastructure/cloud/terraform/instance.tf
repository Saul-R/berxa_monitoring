data "oci_core_vcns" "target_vcn" {
  compartment_id = data.oci_identity_compartments.target_compartment.id
  display_name   = "vcn-20250607-1211"
}

data "oci_core_subnets" "target_subnet" {
  compartment_id = data.oci_identity_compartments.target_compartment.id
  vcn_id         = data.oci_core_vcns.target_vcn.id
  display_name   = "subnet-20250607-1210"
}

data "oci_core_images" "oracle_linux_image" {
  compartment_id = data.oci_identity_tenancy.current.id # Platform images are at the tenancy level
  operating_system = "Oracle Linux"
  operating_system_version = "8"
  shape = "VM.Standard.E2.1.Micro"
  sort_by = "TIMECREATED"
  sort_order = "DESC"
  # Filter to prioritize "Always Free-eligible" if available
  # This can be tricky with specific display names, so we rely on sorting by creation time.
  # If you find this doesn't pick the right image, you might need to hardcode image_id directly.
}

output "test" {
  value = data.oci_core_images.oracle_linux_image.id
}

#
#
#

resource "oci_core_instance" "free_tier_vm" {
  compartment_id = data.oci_identity_compartments.target_compartment.id
  availability_domain = "ocid1.availabilitydomain.oc1..aaaaaaaapwdvvyn7wtnuphlw2ogec6b2s73scavimbvcbfm5eg2xhwnelj2q"
  shape = "VM.Standard.E2.1.Micro"
  create_vnic_details {
    subnet_id        = data.oci_core_subnets.target_subnet.id
    assign_public_ip = true
  }
  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.oracle_linux_image.images[0].id
  }
  display_name = "berxaserver"
  metadata = {
    ssh_authorized_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCiVzOkMjqMIxPbqTvBZy9920L8aMYovP111QAaOxAuAMMRaYOlfYn4fo5z9yaUo90VXJUIsXHw2TqJCn69dgLl52Bu2bbidxK4a/FCb450ge+aM3j2GdsIIQT1/daSI4mXTIgvm/X+rRlBvq8nHHvvnDZ4nP0n+0ETysguzbfLv78IY/4Oy4uxgTXFwyh6HnP2BJUg7NkPBteaBR9EkmJXXQAvnMFnsAe6u4zn3eERs7VDx8lcEwg4tNnU0gve01tqzZaj0n+Yyfq9V6onfuUI/dWMXk9m7FLd0URq1FxNoiis6vRZefs+n5kwln/TVux+N7n2FQGx9I8/Ru/PVYoSbvwjltqvgvakYevh+VOrOKyPlrMKR4oX1SCW2JtWSFD19Alpue3eTEA9DHMYzxTgnWNF+J57DtH2FnKkBZjBglTH3kYVjBzL5URSHIdYSPY3yD2V+7StuFAMKDt0kgK53jB8/M18IB6qwDjNlPlyAAOWe/jv+h7NcY6F3f6Cra+9MBUfvFPTbgK8QCvSLtiA+06YkiAX8TKXINFBDzd00+W9we5YpzvH5/gZcLyfGwc4KVoo8T/jjqbwZSLw934LSjHRuZLasrhoJPV8mOG8Pd0JgW88yAPjTkmaH7bEQsKAKYhSm1b3eva/WP7NMGdFgQUOPW/kdYIOPRftiuGl9Q=="
  }
  defined_tags = {
    "Oracle-Tags.CreatedBy" = "terraform"
  }
}


# Output the public IP address of the created instance
output "instance_public_ip" {
  value = oci_core_instance.free_tier_vm.public_ip
  description = "The public IP address of the created free tier VM instance."
}