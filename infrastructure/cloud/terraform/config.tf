terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "6.20.0"
    }
  }
}

data "oci_identity_tenancy" "current" {
  tenancy_id = var.tenancy_ocid
}

data "oci_identity_compartments" "target_compartment" {
  compartment_id = data.oci_identity_tenancy.current.id # Search within the tenancy
  name           = "berxarduino"
}

