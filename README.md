# Terraform-digitalocean-app
# Terraform DigitalOcean cloud app Module

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#examples)
- [Author](#author)
- [License](#license)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Introduction
This Terraform configuration is designed to create and manage a DigitalOcean App.

## Usage
To use this module, you should have Terraform installed and configured for DIGITALOCEAN. This module provides the necessary Terraform configuration for creating DIGITALOCEAN resources, and you can customize the inputs as needed. Below is an example of how to use this module:

# Example: Complete
You can use this module in your Terraform configuration like this:

```hcl
module "app" {
  source   = "cypik/app/digitalocean"
  version  = "1.0.2"
  spec     = [{
    name   = "test"
    region = "nyc3"
    domain = {
      name = "test.do.cypik.ca"
      type = "PRIMARY"
      zone = "do.cypik.ca"
    }

    static_site = {
      name             = "blog"
      build_command    = "bundle exec jekyll build -d ./public"
      environment_slug = "hugo"
      output_dir       = "/public"

      git = {
        repo_clone_url = "https://github.com/digitalocean/sample-jekyll.git"
        branch         = "main"
      }

      routes = {
        path = "/"
      }
    }
  }]
}

```

# Example: Basic
You can use this module in your Terraform configuration like this:

```hcl
module "app" {
  source   = "cypik/app/digitalocean"
  version  = "1.0.2"
  spec     = [{
    name   = "test"
    region = "nyc3"

    domain = {
      name = "test.do.cypik.ca"
      type = "PRIMARY"
      zone = "do.cypik.ca"
    }

    service = {
      name = "librqary-nginx"
      image = {
        registry_type  = "DOCKER_HUB"
        registry       = "library"
        repository     = "nginx"
        tag            = "latest"
        internal_ports = "80"
        deploy_on_push = {
          enabled = true
        }
      }
      alert = {
        rule     = "CPU_UTILIZATION"
        value    = 50
        operator = "GREATER_THAN"
        window   = "FIVE_MINUTES"
        disabled = false
      }
    }
  }]
}

```
This example demonstrates how to create various DIGITALOCEAN resources using the provided modules. Adjust the input values to suit your specific requirements.


## Examples
For detailed examples on how to use this module, please refer to the [examples](https://github.com/cypik/terraform-digitalocean-app/blob/master/example) directory within this repository.

## Author
Your Name
Replace **MIT** and **Cypik** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This Terraform module is provided under the **MIT** License. Please see the [LICENSE](https://github.com/cypik/terraform-digitalocean-app/blob/master/LICENSE) file for more details.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.5 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >= 2.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | >= 2.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_app.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether to automatically deploy images pushed to DOCR. | `bool` | `true` | no |
| <a name="input_spec"></a> [spec](#input\_spec) | (Required) A DigitalOcean App spec describing the app. | `any` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_active_deployment_id"></a> [active\_deployment\_id](#output\_active\_deployment\_id) | The ID the app's currently active deployment. |
| <a name="output_created_at"></a> [created\_at](#output\_created\_at) | The date and time of when the app was created. |
| <a name="output_default_ingress"></a> [default\_ingress](#output\_default\_ingress) | The default URL to access the app. |
| <a name="output_id"></a> [id](#output\_id) | ID of the app. |
| <a name="output_live_url"></a> [live\_url](#output\_live\_url) | The live URL of the app. |
| <a name="output_updated_at"></a> [updated\_at](#output\_updated\_at) | The date and time of when the app was last updated. |
<!-- END_TF_DOCS -->