# Running Terraform configuration files with .tfvars files

.tfvars files contain variable names and values. They will overwrite default values specified in a main.tf file.

By default, terraform is looking for a "terraform.tfvars" file while executing terraform commands, such as `terraform apply`. 
If such file does not exist, or no file with .tfvars extension exists, default variable values will take effect (unless values are provided via CLI). 

If you decide to create a set of .tfvars files with different names representing regions to deploy resources to, you need to make sure to specify a flag in CLI.

```
terraform apply -var-file {some_file.tfvars}
```
In such a file, you need to create variables and assign them values, for example:

```
region="us-east-1"
```

## Supporting Documentation

https://developer.hashicorp.com/terraform/language/values/variables/#variable-definitions-tfvars-files
