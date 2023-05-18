English README
ModemSwitcher
* ModemSwitcher is a Bash script that automates the process of switching between multiple modems based on signal quality. The script periodically checks the signal quality of all available modems and connects to the one with the best signal, disconnecting from all others.

Requirements
* Linux-based operating system
* ModemManager and NetworkManager installed and correctly configured

Installation
* To install the script, simply copy the Bash script into a file in your desired location. For instance, you can use the nano text editor to do this:
nano /path/to/your/desired/location/modem_switcher.sh
* Paste the script into this file, then press Ctrl+X to exit, and Y to save the file.

Usage
* To run the script, use the following command:
bash /path/to/your/desired/location/modem_switcher.sh

Autostart
* To make the script start automatically on system startup, add the script command to the crontab. To edit the crontab, use:
crontab -e
* And add the following line at the end of the file:
@reboot bash /path/to/your/desired/location/modem_switcher.sh &
* Save and exit the file.

Russian README
ModemSwitcher
* ModemSwitcher - это скрипт Bash, который автоматизирует процесс переключения между несколькими модемами на основе качества сигнала. Скрипт периодически проверяет качество сигнала всех доступных модемов и подключается к модему с лучшим сигналом, отключаясь от всех остальных.

Требования
* Операционная система на базе Linux
* Установленные и правильно настроенные ModemManager и NetworkManager

Установка
* Чтобы установить скрипт, просто скопируйте скрипт Bash в файл в нужном вам месте. Например, вы можете использовать текстовый редактор nano для этого:
nano /путь/к/вашему/желаемому/местоположению/modem_switcher.sh
* Вставьте скрипт в этот файл, затем нажмите Ctrl+X для выхода и Y для сохранения файла.

Использование
* Чтобы запустить скрипт, используйте следующую команду:
bash /путь/к/вашему/желаемому/местоположению/modem_switcher.sh

Автозапуск
* Чтобы скрипт запускался автоматически при запуске системы, добавьте команду скрипта в crontab. Чтобы редактировать crontab, используйте:
crontab -e
* И добавьте следующую строку в конец файла:
@reboot bash /путь/к/вашему/желаемому/местоположению/modem_switcher.sh &
* Сохраните и выйдите из файла.
