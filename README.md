# terraform-digitalocean-app
# DigitalOcean Terraform Configuration

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [Examples](#examples)
- [License](#license)

## Introduction
This Terraform configuration is designed to create and manage a DigitalOcean App.

## Usage
To use this module, you should have Terraform installed and configured for DIGITALOCEAN. This module provides the necessary Terraform configuration for creating DIGITALOCEAN resources, and you can customize the inputs as needed. Below is an example of how to use this module:

#  Example: complete
You can use this module in your Terraform configuration like this:

```hcl
module "app" {
  source = "git::https://github.com/cypik/terraform-digitalocean-app.git?ref=v1.0.0"
  spec = [{
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

#  Example: basic
You can use this module in your Terraform configuration like this:

```hcl
module "app" {
  source = "git::https://github.com/cypik/terraform-digitalocean-app.git?ref=v1.0.0"
  spec = [{
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


## Module Inputs

- 'name': The name of the app. Must be unique across all apps in the same account.
- 'enabled' :   Whether to automatically deploy images pushed to DOCR.
- 'region' :  The slug for the DigitalOcean data center region hosting the app.
- 'spec' :  A DigitalOcean App spec describing the app.
- 'window' :  The time before alerts should be triggered. This is may be one of:
- 'domain' :  Describes a domain where the application will be made available.
- 'type' :  The domain type, which can be one of the following:
- 'alert' : Describes an alert policy for the app.
- 'repository' : The repository name.
- 'disabled' : Determines whether or not the alert is disabled (default: false).




## Module Outputs

This module does not produce any outputs. It is primarily used for labeling resources within your Terraform configuration.

- 'id' : The ID of the app.
- 'default_ingress' : The default URL to access the app.
- 'live_url' :  The live URL of the app.
- 'active_deployment_id' : The ID the app's currently active deployment.
- 'urn' :  The uniform resource identifier for the app.
- 'updated_at' : The date and time of when the app was last updated.
- 'created_at' : The date and time of when the app was created.


## Examples
For detailed examples on how to use this module, please refer to the '[examples](https://github.com/cypik/terraform-digitalocean-app/blob/master/_examples)' directory within this repository.

## License
This Terraform module is provided under the '[License Name]' License. Please see the [LICENSE](https://github.com/cypik/terraform-digitalocean-app/blob/master/LICENSE) file for more details.

## Author
Your Name
Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.
