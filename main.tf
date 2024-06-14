provider "google" {
  credentials = file("alien-house-421716-666597119746")
  project     = "alien-house-421716"
  region      = "us-central1"
}

resource "google_compute_instance" "my_instance" {
  name         = "my-vm-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = "user:${file("~/.ssh/id_rsa.pub")}"
  }
}
