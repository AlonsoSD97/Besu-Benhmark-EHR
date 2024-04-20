# variables.tf

variable "instance_count" {
  description = "Número de instancias a crear"
  type        = number
  default     = 4
}

# main.tf

provider "google" {
  # credentials = file("/home/alonsosalasdias15_gmail_com/.gcp/gcp-key-ansible-sa.json") # Crar una service account en gcp
  project     = "caliper-besu" # "<tu ID de proyecto GCP>"
  region      = "us-central1"
}

resource "google_compute_instance" "mi_instancia" {
  count        = var.instance_count
  name         = "node-${count.index + 1}"
  machine_type = "t2d-standard-1"
  zone         = "us-central1-a"
  tags = [ "blockchain","http-server","https-server","allow-ssh" ]
  scheduling {
    preemptible                 = false
    automatic_restart           = false
    provisioning_model          = "STANDARD"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "main"
    subnetwork = "public"
    network_ip = "10.0.64.${count.index + 2}"
    access_config {
      // Elegir 'Ephemeral' para asignar una dirección IP externa automáticamente
    }
  }
  #   service_account {
  #   email  = "alonso-salas@benchmark-besu.iam.gserviceaccount.com"
  #   scopes = ["cloud-platform"]
  # }
}

resource "google_compute_instance" "mi_instancia_zona_b" {
  count        = var.instance_count
  name         = "node-${count.index + 5}"
  machine_type = "t2d-standard-1"
  zone         = "us-east1-b"
  tags = [ "blockchain","http-server","https-server","allow-ssh" ]
  scheduling {
    preemptible                 = false
    automatic_restart           = false
    provisioning_model          = "STANDARD"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "main"
    subnetwork = "public-us-east1"
    network_ip = "10.0.65.${count.index + 2}"
    access_config {
      // Elegir 'Ephemeral' para asignar una dirección IP externa automáticamente
    }
  }
  #   service_account {
  #   email  = "alonso-salas@benchmark-besu.iam.gserviceaccount.com"
  #   scopes = ["cloud-platform"]
  # }
}

resource "google_compute_instance" "mi_instancia_zona_c" {
  count        = var.instance_count
  name         = "node-${count.index + 9}"
  machine_type = "t2d-standard-1"
  zone         = "us-west1-a"
  tags = [ "blockchain","http-server","https-server","allow-ssh" ]
  scheduling {
    preemptible                 = false
    automatic_restart           = false
    provisioning_model          = "STANDARD"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "main"
    subnetwork = "public-us-west1"
    network_ip = "10.0.66.${count.index + 2}"
    access_config {
      // Elegir 'Ephemeral' para asignar una dirección IP externa automáticamente
    }
  }
  #   service_account {
  #   email  = "alonso-salas@benchmark-besu.iam.gserviceaccount.com"
  #   scopes = ["cloud-platform"]
  # }
}

resource "google_compute_instance" "mi_instancia_zona_d" {
  count        = var.instance_count
  name         = "node-${count.index + 13}"
  machine_type = "t2d-standard-1"
  zone         = "us-south1-a"
  tags = [ "blockchain","http-server","https-server","allow-ssh" ]
  scheduling {
    preemptible                 = false
    automatic_restart           = false
    provisioning_model          = "STANDARD"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "main"
    subnetwork = "public-us-south1"
    network_ip = "10.0.67.${count.index + 2}"
    access_config {
      // Elegir 'Ephemeral' para asignar una dirección IP externa automáticamente
    }
  }
  #   service_account {
  #   email  = "alonso-salas@benchmark-besu.iam.gserviceaccount.com"
  #   scopes = ["cloud-platform"]
  # }
}
# resource "google_compute_firewall" "allow_ssh" {
#   name    = "allow-ssh"
#   network = "default"

  # allow {
  #   protocol = "tcp"
  #   ports    = ["22"]
  # }

#   source_ranges = ["0.0.0.0/0"]
#   target_tags = ["blockchain"]
# }

resource "google_compute_firewall" "allow_besu" {
  name    = "allow-besu"
  network = "main"
  allow {
    protocol = "tcp"
    ports    = ["30303", "8545", "8546","80","8080","9545","9546"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = [ "blockchain" ]
}

resource "google_compute_firewall" "allow_besu_udp" {
  name    = "allow-besu-udp"
  network = "main"

  allow {
    protocol = "udp"
    ports    = ["30303", "8545", "8546","80","8080","9545","9546"]
  }

  source_ranges = ["0.0.0.0/0"]
}
#   provisioner "local-exec" {
#     command = "./output_ips.sh ${self.network_interface.0.access_config.0.nat_ip}"
#   }
# }

# resource "null_resource" "exportar_ips" {
#   count = length(google_compute_instance.mi_instancia)

#   provisioner "local-exec" {
#     command = "echo ${google_compute_instance.mi_instancia[count.index].network_interface.0.access_config.0.nat_ip} >> public_ips.txt"
#   }

#   provisioner "local-exec" {
#     command = "echo ${google_compute_instance.mi_instancia[count.index].network_interface.0.network_ip} >> private_ips.txt"
#   }
# }