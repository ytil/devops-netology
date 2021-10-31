# devops-netology

Будут проигнорированы:
- директории .terraform и вложенные файлы
- любые файлы с расширением .tfstate (example.tfstate or example.tfstate.local)
- файлы crash.log в любой директории
- любые файлы с расширением .tfvars
- файлы override.tf / override.tf.json в любой директории
- файлы которые заканчиваются на _override.tf / _override.tf.json
- файлы .terraformrc / terraform.rc в любой директории
