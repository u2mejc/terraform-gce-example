variable "METADATA_SCRIPT" {
} # ie TF_VAR_METADATA_SCRIPT

variable "JSON_PATH" {
} # ie TF_VAR_JSON_PATH

variable "PROJECT" {
} # ie TF_VAR_PROJECT

variable "REGION" {
} # ie TF_VAR_REGION

module "bootstrap-dokku" {
  MOD_METADATA_SCRIPT = "${var.METADATA_SCRIPT}"
  MOD_JSON_PATH       = "${var.JSON_PATH}"
  MOD_PROJECT         = "${var.PROJECT}"
  MOD_REGION          = "${var.REGION}"

  source = "modules"
}
