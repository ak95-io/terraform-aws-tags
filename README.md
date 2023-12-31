# Terraform AWS Tags

A terraform module to manage Tags on AWS resources.

## Prerequisites

Terraform and AWS Command Line Interface tools need to be installed on your
local computer.

### Terraform

Terraform version >= 0.12.19 is required.

Terraform installation instructions can be found
[here](https://www.terraform.io/intro/getting-started/install.html).

### AWS Command Line Interface

AWS Command Line Interface installation instructions can be found
[here](http://docs.aws.amazon.com/cli/latest/userguide/installing.html).

## Module Input Variables

- `environment` - **[type: string]** The environment name for the resource. *[default value: ""]*
- `delimiter` - **[type: string]** The delimiter char that will be used to separate the fields in the resource id. *[default value: "-"]*
- `id_tags_order` - **[type: list(string)]** The list of fields (in order) that will be used for the resource id. *[default value: "['environment', 'namespace', 'name', 'stage']"]*
- `name` - **[type: string]** The main name for the resource. *[default value: "default"]*
- `namespace` - **[type: string]** The namespace tag for the resource. *[default value: ""]*
- `stage` - **[type: string]** The stage tag for the resource. *[default value: ""]*
- `tags` - **[type: map(string)]** Map of tags (e.g.: '{name=test,environment=dev}'). *[default value: {}]*

## Usage

```hcl
module "my_aws_tags" {
  source        = "github.com/ak95-io/terraform-module-aws-tags"
  environment   = "prod"
  delimiter     = "-"
  id_tags_order = ["namespace", "name", "environment", "stage"]
  name          = "default"
  namespace     = ""
  stage         = ""
  tags          = {}
}

resource "aws_vpc" "my_aws_vpc" {
  cidr_block = "10.0.0.0/16"
  tags       = module.my_aws_tags.tags
}
```

## Outputs

- `id` - **[type: string]** The ID of the resource.
- `id_tags_order` - **[type: list(string)]** List of fields (in order) that were used for the resource id.
- `tags` - **[type: map(string)]** A map with the tags.
- `uuid` - **[type: string]** The UUID of the resource.
- `uuid_short` - **[type: string]** The prefix of the resource's UUID.
