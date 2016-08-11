# Bootstrap GCE for Dokku
This is very simple example of how to use [Terraform](https://www.terraform.io/) to bootstrap an instance in [Google Cloud's Compute Engine](https://cloud.google.com/compute/) and then install [Dokku](http://dokku.viewdocs.io/dokku/).

### Requirements
* [Terraform](https://www.terraform.io/) ie: `brew update && brew install terraform`
* [GCE service account JSON file](https://cloud.google.com/compute/docs/access/create-enable-service-accounts-for-instances)

### Setup
This example tries to follow the [Twelve-Factor app](http://12factor.net/) approach (sorta). Other then the json file you should have downloaded above, all configuration is stored in environment.

1. Clone this repo locally
2. Download your project's json key file and save it locally
3. Copy the below to a text editor (like vim!) and amend the exports as necessary
4. Either paste or source the exports after you have made changes
5. `cd` into the repo and run `terrafrom plan`. It should not prompt you for any variables, if it does, make sure the full path to the key is correct in the env and all of the other exports are present: `env | grep TF_VAR`
6. Use `terraform apply` to apply these changes

### Env Vars to export
```
# Replace export if your not using a bash / borne shell
export TF_VAR_JSON_PATH='project.json'
export TF_VAR_REGION='us-west1'
export TF_VAR_METADATA_SCRIPT='wget https://raw.githubusercontent.com/dokku/dokku/v0.7.0/bootstrap.sh && sudo DOKKU_TAG=v0.7.0 bash bootstrap.sh'
export TF_VAR_PROJECT='nameofproject-123456'
```

### Notes
_This really applies changes to your Google Cloud account! Charges may apply! Don't run this in production, unless you know what your doing! Please see the license._
