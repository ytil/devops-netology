1. Установите средство виртуализации [Oracle VirtualBox](https://www.virtualbox.org/).

2. Установите средство автоматизации [Hashicorp Vagrant](https://www.vagrantup.com/).

3. В вашем основном окружении подготовьте удобный для дальнейшей работы терминал. Можно предложить:

4. С помощью базового файла конфигурации запустите Ubuntu 20.04 в VirtualBox посредством Vagrant:

5. Ознакомьтесь с графическим интерфейсом VirtualBox. Какие ресурсы выделены по-умолчанию?

```
ОЗУ - 1024
CPU - 2
HDD - 64GB
```

6. Ознакомьтесь с возможностями конфигурации VirtualBox через Vagrantfile: [документация](https://www.vagrantup.com/docs/providers/virtualbox/configuration.html). Как добавить оперативной памяти или ресурсов процессора виртуальной машине?

```
v.memory = 1024
v.cpus = 2
```

7. Команда `vagrant ssh` из директории, в которой содержится Vagrantfile, позволит вам оказаться внутри виртуальной машины без каких-либо дополнительных настроек. Попрактикуйтесь в выполнении обсуждаемых команд в терминале Ubuntu.

```
PS C:\Users\ivann\devops-netology\vagrant> vagrant ssh
Welcome to Ubuntu 20.04.2 LTS (GNU/Linux 5.4.0-80-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Sat 13 Nov 2021 08:22:45 AM UTC

  System load:  0.48              Processes:             115
  Usage of /:   2.4% of 61.31GB   Users logged in:       0
  Memory usage: 14%               IPv4 address for eth0: 10.0.2.15
  Swap usage:   0%


This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento
vagrant@vagrant:~$
```

8. Ознакомиться с разделами `man bash`, почитать о настройках самого bash:
    * какой переменной можно задать длину журнала `history`, и на какой строчке manual это описывается?
    * что делает директива `ignoreboth` в bash?

`HISTFILESIZE`, 846 строка
`ignoreboth` - не сохранять строки начинающиеся с символа <пробел> и не сохранять строки, совпадающие с последней выполненной командой

9. В каких сценариях использования применимы скобки `{}` и на какой строчке `man bash` это описано?

строка 232
используется для выполнения команд в текущем shell без создания нового контекста выполнения
```
vagrant@vagrant:~$ TESTVAR=1
vagrant@vagrant:~$ ( TESTVAR=2 )
vagrant@vagrant:~$ echo $TESTVAR
1
vagrant@vagrant:~$ { TESTVAR=2; }
vagrant@vagrant:~$ echo $TESTVAR
2
```

10. С учётом ответа на предыдущий вопрос, как создать однократным вызовом `touch` 100000 файлов Получится ли аналогичным образом создать 300000? Если нет, то почему?

```
vagrant@vagrant:~$ touch test{1..100000} - OK
vagrant@vagrant:~$ touch test{1..300000}
-bash: /usr/bin/touch: Argument list too long
```

11. В man bash поищите по `/\[\[`. Что делает конструкция `[[ -d /tmp ]]`

проверяет существует ли директория `/tmp`

12. Основываясь на знаниях о просмотре текущих (например, PATH) и установке новых переменных; командах, которые мы рассматривали, добейтесь в выводе type -a bash в виртуальной машине наличия первым пунктом в списке:

	```bash
	bash is /tmp/new_path_directory/bash
	bash is /usr/local/bin/bash
	bash is /bin/bash
	```
```
vagrant@vagrant:~$ sudo mkdir /tmp/new_path_directory/
vagrant@vagrant:~$ sudo touch /tmp/new_path_directory/bash
vagrant@vagrant:~$ sudo chmod +x /tmp/new_path_directory/bash
vagrant@vagrant:~$ PATH="/tmp/new_path_directory/:$PATH"
vagrant@vagrant:~$ type -a bash
```

13. Чем отличается планирование команд с помощью `batch` и `at`?

команда at используется для назначения одноразового задания на заданное время, а команда batch — для назначения одноразовых задач, которые должны выполняться, когда загрузка системы становится меньше 0,8.

14. Завершите работу виртуальной машины чтобы не расходовать ресурсы компьютера и/или батарею ноутбука.

```
PS C:\Users\ivann\devops-netology\vagrant> vagrant halt
==> default: Attempting graceful shutdown of VM...
```