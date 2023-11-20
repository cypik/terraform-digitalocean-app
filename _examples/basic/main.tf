provider "digitalocean" {

}

##------------------------------------------------
## app module call
##------------------------------------------------
module "app" {
  source = "./../../"
  spec = [{
    name   = "test"
    region = "nyc3"

    domain = {
      name = "test.do.opz0.ca"
      type = "PRIMARY"
      zone = "do.opz0.ca"
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
