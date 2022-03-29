provider "yandex" {
  cloud_id  = "b1gvrb9fvo1fp873u2ql"
  folder_id = "b1g05fu2ui3aa1vmdppg"
  zone      = "ru-central1-a"
}

resource "yandex_compute_image" "foo-image" {
  name       = "my-custom-image"
  source_url = "https://storage.yandexcloud.net/lucky-images/kube-it.img"
}
