# Copyright (c) 2022, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

data "oci_identity_user" "coa_demo_executer" {
  #Required
  user_id = var.user_id
}

data "oci_identity_availability_domains" "availability_domains" {
  #Required
  compartment_id = var.tenancy_id
}


data "oci_objectstorage_namespace" "user_namespace" {

  compartment_id = var.default_compartment_id

}

data "oci_objectstorage_objects" "test_objects" {
  #Required
  bucket    = "${var.names_prefix}bucket"
  namespace = data.oci_objectstorage_namespace.user_namespace.namespace
}

data "oci_core_images" "this" {
  #Required
  compartment_id = var.default_compartment_id

  #Optional
  display_name = var.image_name
}
