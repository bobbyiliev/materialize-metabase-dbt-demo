terraform {
  required_providers {
    materialize = {
      source  = "MaterializeInc/materialize"
      version = "0.1.2"
    }
  }
}

resource "materialize_cluster" "auction_house" {
  name               = "auction_house"
  size               = "large"
  replication_factor = 1
}
