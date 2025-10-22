@echo off
set "LOCAL_VERSION=1.0.0"

:: Initialize language system
if not exist "%~dp0params\Language\" mkdir "%~dp0params\Language"
if not exist "%~dp0params\Language\current" (
    echo EN> "%~dp0params\Language\current"
)

:: Load language
set /p LANG=<"%~dp0params\Language\current"
set "LANG=%LANG: =%"

:: Set code page based on language
if /i "%LANG%"=="RU" (
    chcp 65001 > nul
) else (
    chcp 437 > nul
)

:: Load language strings
if /i "%LANG%"=="RU" (
    :: Russian strings
    set MSG_ADMIN_STARTED=Запущено с правами администратора
    set MSG_ADMIN_REQUEST=Запрос прав администратора...
    set MSG_MENU=Меню
    set MSG_MENU_INSTALL=Установить сервис
    set MSG_MENU_REMOVE=Удалить сервисы
    set MSG_MENU_STATUS=Проверить статус
    set MSG_MENU_DIAGNOSTICS=Запустить диагностику
    set MSG_MENU_UPDATES=Проверить обновления
    set MSG_MENU_GAME_FILTER=Переключить игровой фильтр
    set MSG_MENU_IPSET=Переключить ipset
    set MSG_MENU_EXIT=Выход
    set MSG_MENU_UPDATE_BIN=Обновить папку /bin/
    set MSG_MENU_UPDATE_LIST=Обновить /lists/list-general.txt
    set MSG_MENU_UPDATE_IPSET=Обновить /lists/ipset-all.txt
    set MSG_MENU_UPDATE_ALL=Обновить всё
    set MSG_MENU_SETTINGS=Изменить настройки
    set MSG_MENU_GAME_TCP=Переключить игровой фильтр для TCP ^(чаты, аватары и т.д.^)
    set MSG_MENU_VERIFY=Проверить все файлы
    set MSG_MENU_LANGUAGE=Сменить язык
    set MSG_MENU_CHOICE=Введите выбор ^(0-18^)
    
    set MSG_STATUS_INSTALLED=Стратегия сервиса установлена из
    set MSG_STATUS_RUNNING=запущен
    set MSG_STATUS_NOT_RUNNING=НЕ запущен
    set MSG_STATUS_ALREADY_RUNNING=уже ЗАПУЩЕН как сервис, используйте service.bat и выберите Удалить сервисы если хотите запустить отдельный bat
    set MSG_STATUS_STOP_PENDING=находится в состоянии STOP_PENDING. Это может быть вызвано конфликтом с другим обходом. Запустите диагностику для исправления конфликтов
    set MSG_STATUS_BYPASS_ACTIVE=Обход ^(winws.exe^) АКТИВЕН
    set MSG_STATUS_BYPASS_NOT_FOUND=Обход ^(winws.exe^) НЕ НАЙДЕН
    
    set MSG_REMOVE_NOT_INSTALLED=Сервис не установлен
    
    set MSG_INSTALL_PICK=Выберите один из вариантов:
    set MSG_INSTALL_INPUT=Введите индекс файла ^(номер^)
    set MSG_INSTALL_INVALID=Неверный выбор, выход...
    set MSG_INSTALL_SUCCESS=[S] Конфигурация УСПЕШНА
    
    set MSG_UPDATE_FAILED=Не удалось получить последнюю версию. Это не влияет на работу ShiZapret Addition.
    set MSG_UPDATE_LATEST=Установлена последняя версия:
    set MSG_UPDATE_NEW=Доступна новая версия:
    set MSG_UPDATE_RELEASE=Страница релиза:
    set MSG_UPDATE_INSTALL=Хотите установить новую версию? ^(Y/N^) ^(по умолчанию: Y^)
    set MSG_UPDATE_EXTRACTING=Извлечение
    set MSG_UPDATE_INSTALLED=Обновление установлено в
    set MSG_UPDATE_REMOVE_SERVICE=Хотите автоматически удалить сервис? ^(Y/N^) ^(по умолчанию: Y^)
    set MSG_UPDATE_NOT_INSTALLED=Обновление не было установлено
    
    set MSG_DIAG_BFE_PASS=Проверка Base Filtering Engine пройдена
    set MSG_DIAG_BFE_FAIL=[X] Base Filtering Engine не запущен. Этот сервис необходим для работы zapret
    set MSG_DIAG_PROXY_ENABLED=[?] Системный прокси включен:
    set MSG_DIAG_PROXY_CHECK=Убедитесь, что он действителен или отключите его, если не используете прокси
    set MSG_DIAG_PROXY_PASS=Проверка прокси пройдена
    set MSG_DIAG_TCP_PASS=Проверка TCP timestamps пройдена
    set MSG_DIAG_TCP_DISABLED=[?] TCP timestamps отключены. Включение timestamps...
    set MSG_DIAG_TCP_ENABLED=TCP timestamps успешно включены
    set MSG_DIAG_TCP_FAILED=[X] Не удалось включить TCP timestamps
    set MSG_DIAG_ADGUARD_FOUND=[X] Обнаружен процесс Adguard. Adguard может вызывать проблемы с Discord
    set MSG_DIAG_ADGUARD_PASS=Проверка Adguard пройдена
    set MSG_DIAG_KILLER_FOUND=[X] Обнаружены сервисы Killer. Killer конфликтует с zapret
    set MSG_DIAG_KILLER_PASS=Проверка Killer пройдена
    set MSG_DIAG_INTEL_FOUND=[X] Обнаружен Intel Connectivity Network Service. Он конфликтует с zapret
    set MSG_DIAG_INTEL_PASS=Проверка Intel Connectivity пройдена
    set MSG_DIAG_CHECKPOINT_FOUND=[X] Обнаружены сервисы Check Point. Check Point конфликтует с zapret
    set MSG_DIAG_CHECKPOINT_TRY=Попробуйте удалить Check Point
    set MSG_DIAG_CHECKPOINT_PASS=Проверка Check Point пройдена
    set MSG_DIAG_SMARTBYTE_FOUND=[X] Обнаружены сервисы SmartByte. SmartByte конфликтует с zapret
    set MSG_DIAG_SMARTBYTE_TRY=Попробуйте удалить или отключить SmartByte через services.msc
    set MSG_DIAG_SMARTBYTE_PASS=Проверка SmartByte пройдена
    set MSG_DIAG_VPN_FOUND=[?] Обнаружены некоторые VPN сервисы. Некоторые VPN могут конфликтовать с zapret
    set MSG_DIAG_VPN_CHECK=Убедитесь, что все VPN отключены
    set MSG_DIAG_VPN_PASS=Проверка VPN пройдена
    set MSG_DIAG_DNS_NOT_SET=[?] DNS серверы вероятно не указаны.
    set MSG_DIAG_DNS_PROVIDER=Вероятно автоматически используются DNS серверы провайдера, что может влиять на zapret. Рекомендуется установить известные DNS серверы и настроить DoH
    set MSG_DIAG_DNS_PASS=Проверка DNS пройдена
    set MSG_DIAG_DOH_NOT_SET=[?] Убедитесь, что вы настроили безопасный DNS в браузере с нестандартным провайдером DNS.
    set MSG_DIAG_DOH_WIN11=Если вы используете Windows 11, вы можете настроить зашифрованный DNS в настройках, чтобы скрыть это предупреждение
    set MSG_DIAG_DOH_PASS=Проверка Secure DNS пройдена
    set MSG_DIAG_WINDIVERT_CONFLICT=[?] winws.exe не запущен, но сервис WinDivert активен. Попытка удалить WinDivert...
    set MSG_DIAG_WINDIVERT_FAILED=[X] Не удалось удалить WinDivert. Проверка конфликтующих сервисов...
    set MSG_DIAG_WINDIVERT_FOUND=[?] Найден конфликтующий сервис:
    set MSG_DIAG_WINDIVERT_STOPPING=Остановка и удаление...
    set MSG_DIAG_WINDIVERT_REMOVED=Успешно удален сервис:
    set MSG_DIAG_WINDIVERT_REMOVE_FAILED=[X] Не удалось удалить сервис:
    set MSG_DIAG_WINDIVERT_NO_CONFLICT=[X] Конфликтующие сервисы не найдены. Проверьте вручную, использует ли другой обход WinDivert.
    set MSG_DIAG_WINDIVERT_RETRY=[?] Попытка удалить WinDivert снова...
    set MSG_DIAG_WINDIVERT_SUCCESS=WinDivert успешно удален после удаления конфликтующих сервисов
    set MSG_DIAG_WINDIVERT_STILL_FAILED=[X] WinDivert всё ещё не может быть удален. Проверьте вручную, использует ли другой обход WinDivert.
    set MSG_DIAG_CONFLICT_FOUND=[X] Обнаружены конфликтующие сервисы обхода:
    set MSG_DIAG_CONFLICT_REMOVE=Хотите удалить эти конфликтующие сервисы? ^(Y/N^) ^(по умолчанию: N^)
    set MSG_DIAG_DISCORD_CACHE=Хотите очистить кэш Discord? ^(Y/N^) ^(по умолчанию: Y^)
    set MSG_DIAG_DISCORD_RUNNING=запущен, закрытие...
    set MSG_DIAG_DISCORD_CLOSED=успешно закрыт
    set MSG_DIAG_DISCORD_CLOSE_FAILED=Не удалось закрыть
    set MSG_DIAG_DISCORD_CLEANING=Очистка кэша Discord...
    set MSG_DIAG_DISCORD_DELETED=Успешно удалено
    set MSG_DIAG_DISCORD_DELETE_FAILED=Не удалось удалить
    set MSG_DIAG_DISCORD_NOT_EXIST=не существует
    set MSG_DIAG_DISCORD_PTB_CLEANING=Очистка кэша Discord PTB...
    set MSG_DIAG_DISCORD_CANARY_CLEANING=Очистка кэша Discord Canary...
    
    set MSG_GAME_ENABLING=Включение игрового фильтра...
    set MSG_GAME_DISABLING=Отключение игрового фильтра...
    set MSG_GAME_RESTART=Перезапустите ShiZapret Addition для применения изменений.
    set MSG_GAME_TCP_ENABLING=Включение игрового фильтра для TCP...
    set MSG_GAME_TCP_DISABLING=Отключение игрового фильтра для TCP...
    
    set MSG_IPSET_NOT_DOWNLOADED=ipset не загружен.
    set MSG_IPSET_ENABLING=Включение обхода на основе ipset...
    set MSG_IPSET_DISABLING=Отключение обхода на основе ipset...
    set MSG_IPSET_NO_BACKUP=Ошибка: нет резервной копии для восстановления. Обновите список из меню сервиса самостоятельно
    
    set MSG_DOWNLOAD=Загрузка
    set MSG_DOWNLOAD_SOURCE=Источник:
    set MSG_VERIFY=Проверка
    set MSG_VERIFY_FAILED=не прошёл проверку. Файл может быть поврежден или правильный хэш ещё не обновлен. Ваш хэш:
    set MSG_VERIFY_CORRECT=Правильный хэш:
    set MSG_VERIFY_SUCCESS=успешно проверен. Хэш:
    set MSG_VERIFY_NO_REACH=Не удалось достичь
    set MSG_VERIFY_TO_VERIFY=для проверки
    set MSG_VERIFY_YOUR_HASH=Ваш хэш:
    
    set MSG_SETTINGS_TITLE=Настройки
    set MSG_SETTINGS_UPDATE_START=Обновление при запуске:
    set MSG_SETTINGS_UPDATE_CYGWIN=Обновлять cygwin1.dll:
    set MSG_SETTINGS_UPDATE_WINDIVERT=Обновлять WinDivert.dll:
    set MSG_SETTINGS_UPDATE_WINDIVERT64=Обновлять WinDivert64.sys:
    set MSG_SETTINGS_UPDATE_WINWS=Обновлять winws.exe:
    set MSG_SETTINGS_UPDATE_IPSET=Обновлять ipset-all.txt:
    set MSG_SETTINGS_UPDATE_LIST=Обновлять list-general.txt:
    set MSG_SETTINGS_VERIFY=Проверять файлы при обновлении:
    set MSG_SETTINGS_LIST_SOURCE=Источник list-general.txt:
    set MSG_SETTINGS_IPSET_SOURCE=Источник ipset-all:
    set MSG_SETTINGS_HASH_ALG=Алгоритм хэша верификатора:
    set MSG_SETTINGS_BACK=Назад
    set MSG_SETTINGS_CHANGE=Изменить настройку:
    set MSG_SETTINGS_RECEIVING=Получение стандартных источников загрузки...
    set MSG_SETTINGS_COULD_NOT=Не удалось получить стандартный источник! Откат к
    
    set MSG_SOURCE_CURRENT=Текущий источник:
    set MSG_SOURCE_ENTER_0=Введите 0 для возврата
    set MSG_SOURCE_ENTER_1=Введите 1 для сброса к стандартному
    set MSG_SOURCE_NEW_IPSET=Введите новый источник ipset-all.txt ^(ссылка, начинается с http^(s^)://^):
    set MSG_SOURCE_NEW_LIST=Введите новый источник list-general.txt ^(ссылка, начинается с http^(s^)://^):
    
    set MSG_ALG_CURRENT=Текущий алгоритм:
    set MSG_ALG_DEFAULT=по умолчанию:
    set MSG_ALG_NEW=Введите новый алгоритм:
    
    set MSG_LANG_CURRENT=Текущий язык
    set MSG_LANG_BACK=Назад
    set MSG_LANG_SELECT=Выберите язык
    set MSG_LANG_CHANGED=Язык изменён. Перезапуск...
    
    set enabled=включен
    set disabled=отключен
    set empty=пусто
    set loaded=загружен
) else (
    :: English strings
    set MSG_ADMIN_STARTED=Started with admin rights
    set MSG_ADMIN_REQUEST=Requesting admin rights...
    set MSG_MENU=Menu
    set MSG_MENU_INSTALL=Install Service
    set MSG_MENU_REMOVE=Remove Services
    set MSG_MENU_STATUS=Check Status
    set MSG_MENU_DIAGNOSTICS=Run Diagnostics
    set MSG_MENU_UPDATES=Check Updates
    set MSG_MENU_GAME_FILTER=Switch Game Filter
    set MSG_MENU_IPSET=Switch ipset
    set MSG_MENU_EXIT=Exit
    set MSG_MENU_UPDATE_BIN=Update /bin/ Folder
    set MSG_MENU_UPDATE_LIST=Update /lists/list-general.txt
    set MSG_MENU_UPDATE_IPSET=Update /lists/ipset-all.txt
    set MSG_MENU_UPDATE_ALL=Update Everything
    set MSG_MENU_SETTINGS=Change Settings
    set MSG_MENU_GAME_TCP=Switch Game Filter for TCP ^(Chats, Profile Pictures, etc.^)
    set MSG_MENU_VERIFY=Verify All Files
    set MSG_MENU_LANGUAGE=Change Language
    set MSG_MENU_CHOICE=Enter choice ^(0-18^)
    
    set MSG_STATUS_INSTALLED=Service strategy installed from
    set MSG_STATUS_RUNNING=is RUNNING
    set MSG_STATUS_NOT_RUNNING=is NOT running
    set MSG_STATUS_ALREADY_RUNNING=is ALREADY RUNNING as service, use service.bat and choose Remove Services first if you want to run standalone bat
    set MSG_STATUS_STOP_PENDING=is STOP_PENDING. This may be caused by a conflict with another bypass. Run Diagnostics to try to fix conflicts
    set MSG_STATUS_BYPASS_ACTIVE=Bypass ^(winws.exe^) is ACTIVE
    set MSG_STATUS_BYPASS_NOT_FOUND=Bypass ^(winws.exe^) NOT FOUND
    
    set MSG_REMOVE_NOT_INSTALLED=Service is not installed
    
    set MSG_INSTALL_PICK=Pick one of the options:
    set MSG_INSTALL_INPUT=Input file index ^(number^)
    set MSG_INSTALL_INVALID=Invalid choice, exiting...
    set MSG_INSTALL_SUCCESS=[S] Config SUCCESS
    
    set MSG_UPDATE_FAILED=Failed to fetch the latest version. This does not affect the operation of ShiZapret Addition.
    set MSG_UPDATE_LATEST=Latest version installed:
    set MSG_UPDATE_NEW=New version available:
    set MSG_UPDATE_RELEASE=Release page:
    set MSG_UPDATE_INSTALL=Do you want to install the new version? ^(Y/N^) ^(default: Y^)
    set MSG_UPDATE_EXTRACTING=Extracting
    set MSG_UPDATE_INSTALLED=Update installed into
    set MSG_UPDATE_REMOVE_SERVICE=Do you want to automatically remove service? ^(Y/N^) ^(default: Y^)
    set MSG_UPDATE_NOT_INSTALLED=Update was not installed
    
    set MSG_DIAG_BFE_PASS=Base Filtering Engine check passed
    set MSG_DIAG_BFE_FAIL=[X] Base Filtering Engine is not running. This service is required for zapret to work
    set MSG_DIAG_PROXY_ENABLED=[?] System proxy is enabled:
    set MSG_DIAG_PROXY_CHECK=Make sure it's valid or disable it if you don't use a proxy
    set MSG_DIAG_PROXY_PASS=Proxy check passed
    set MSG_DIAG_TCP_PASS=TCP timestamps check passed
    set MSG_DIAG_TCP_DISABLED=[?] TCP timestamps are disabled. Enabling timestamps...
    set MSG_DIAG_TCP_ENABLED=TCP timestamps successfully enabled
    set MSG_DIAG_TCP_FAILED=[X] Failed to enable TCP timestamps
    set MSG_DIAG_ADGUARD_FOUND=[X] Adguard process found. Adguard may cause problems with Discord
    set MSG_DIAG_ADGUARD_PASS=Adguard check passed
    set MSG_DIAG_KILLER_FOUND=[X] Killer services found. Killer conflicts with zapret
    set MSG_DIAG_KILLER_PASS=Killer check passed
    set MSG_DIAG_INTEL_FOUND=[X] Intel Connectivity Network Service found. It conflicts with zapret
    set MSG_DIAG_INTEL_PASS=Intel Connectivity check passed
    set MSG_DIAG_CHECKPOINT_FOUND=[X] Check Point services found. Check Point conflicts with zapret
    set MSG_DIAG_CHECKPOINT_TRY=Try to uninstall Check Point
    set MSG_DIAG_CHECKPOINT_PASS=Check Point check passed
    set MSG_DIAG_SMARTBYTE_FOUND=[X] SmartByte services found. SmartByte conflicts with zapret
    set MSG_DIAG_SMARTBYTE_TRY=Try to uninstall or disable SmartByte through services.msc
    set MSG_DIAG_SMARTBYTE_PASS=SmartByte check passed
    set MSG_DIAG_VPN_FOUND=[?] Some VPN services found. Some VPNs can conflict with zapret
    set MSG_DIAG_VPN_CHECK=Make sure that all VPNs are disabled
    set MSG_DIAG_VPN_PASS=VPN check passed
    set MSG_DIAG_DNS_NOT_SET=[?] DNS servers are probably not specified.
    set MSG_DIAG_DNS_PROVIDER=Provider's DNS servers are probably automatically used, which may affect zapret. It is recommended to install well-known DNS servers and setup DoH
    set MSG_DIAG_DNS_PASS=DNS check passed
    set MSG_DIAG_DOH_NOT_SET=[?] Make sure you have configured secure DNS in a browser with a non-default DNS service provider.
    set MSG_DIAG_DOH_WIN11=If you use Windows 11, you can configure encrypted DNS in the Settings to hide this warning
    set MSG_DIAG_DOH_PASS=Secure DNS check passed
    set MSG_DIAG_WINDIVERT_CONFLICT=[?] winws.exe is not running but WinDivert service is active. Attempting to delete WinDivert...
    set MSG_DIAG_WINDIVERT_FAILED=[X] Failed to delete WinDivert. Checking for conflicting services...
    set MSG_DIAG_WINDIVERT_FOUND=[?] Found conflicting service:
    set MSG_DIAG_WINDIVERT_STOPPING=Stopping and removing...
    set MSG_DIAG_WINDIVERT_REMOVED=Successfully removed service:
    set MSG_DIAG_WINDIVERT_REMOVE_FAILED=[X] Failed to remove service:
    set MSG_DIAG_WINDIVERT_NO_CONFLICT=[X] No conflicting services found. Check manually if any other bypass is using WinDivert.
    set MSG_DIAG_WINDIVERT_RETRY=[?] Attempting to delete WinDivert again...
    set MSG_DIAG_WINDIVERT_SUCCESS=WinDivert successfully deleted after removing conflicting services
    set MSG_DIAG_WINDIVERT_STILL_FAILED=[X] WinDivert still cannot be deleted. Check manually if any other bypass is using WinDivert.
    set MSG_DIAG_CONFLICT_FOUND=[X] Conflicting bypass services found:
    set MSG_DIAG_CONFLICT_REMOVE=Do you want to remove these conflicting services? ^(Y/N^) ^(default: N^)
    set MSG_DIAG_DISCORD_CACHE=Do you want to clear the Discord cache? ^(Y/N^) ^(default: Y^)
    set MSG_DIAG_DISCORD_RUNNING=is running, closing...
    set MSG_DIAG_DISCORD_CLOSED=was successfully closed
    set MSG_DIAG_DISCORD_CLOSE_FAILED=Unable to close
    set MSG_DIAG_DISCORD_CLEANING=Cleaning Discord cache...
    set MSG_DIAG_DISCORD_DELETED=Successfully deleted
    set MSG_DIAG_DISCORD_DELETE_FAILED=Failed to delete
    set MSG_DIAG_DISCORD_NOT_EXIST=does not exist
    set MSG_DIAG_DISCORD_PTB_CLEANING=Cleaning Discord PTB cache...
    set MSG_DIAG_DISCORD_CANARY_CLEANING=Cleaning Discord Canary cache...
    
    set MSG_GAME_ENABLING=Enabling game filter...
    set MSG_GAME_DISABLING=Disabling game filter...
    set MSG_GAME_RESTART=Restart ShiZapret Addition to apply the changes.
    set MSG_GAME_TCP_ENABLING=Enabling game filter for TCP...
    set MSG_GAME_TCP_DISABLING=Disabling game filter for TCP...
    
    set MSG_IPSET_NOT_DOWNLOADED=ipset is not downloaded.
    set MSG_IPSET_ENABLING=Enabling ipset based bypass...
    set MSG_IPSET_DISABLING=Disabling ipset based bypass...
    set MSG_IPSET_NO_BACKUP=Error: no backup to restore. Update list from service menu by yourself
    
    set MSG_DOWNLOAD=Downloading
    set MSG_DOWNLOAD_SOURCE=Source:
    set MSG_VERIFY=Verifying
    set MSG_VERIFY_FAILED=failed the verification. File might be damaged or the correct hash has not been updated yet. Your hash:
    set MSG_VERIFY_CORRECT=Correct hash:
    set MSG_VERIFY_SUCCESS=successfully verified. Hash:
    set MSG_VERIFY_NO_REACH=Could not reach
    set MSG_VERIFY_TO_VERIFY=to verify
    set MSG_VERIFY_YOUR_HASH=Your hash:
    
    set MSG_SETTINGS_TITLE=Settings
    set MSG_SETTINGS_UPDATE_START=Update on start:
    set MSG_SETTINGS_UPDATE_CYGWIN=Update cygwin1.dll:
    set MSG_SETTINGS_UPDATE_WINDIVERT=Update WinDivert.dll:
    set MSG_SETTINGS_UPDATE_WINDIVERT64=Update WinDivert64.sys:
    set MSG_SETTINGS_UPDATE_WINWS=Update winws.exe:
    set MSG_SETTINGS_UPDATE_IPSET=Update ipset-all.txt:
    set MSG_SETTINGS_UPDATE_LIST=Update list-general.txt:
    set MSG_SETTINGS_VERIFY=Verify files when updating:
    set MSG_SETTINGS_LIST_SOURCE=list-general.txt Source:
    set MSG_SETTINGS_IPSET_SOURCE=ipset-all Source:
    set MSG_SETTINGS_HASH_ALG=Verifier Hash Algorithm:
    set MSG_SETTINGS_BACK=Back
    set MSG_SETTINGS_CHANGE=Change Setting:
    set MSG_SETTINGS_RECEIVING=Receiving default download sources...
    set MSG_SETTINGS_COULD_NOT=Could not receive the default source! Fell back to
    
    set MSG_SOURCE_CURRENT=Current source:
    set MSG_SOURCE_ENTER_0=Enter 0 to go back
    set MSG_SOURCE_ENTER_1=Enter 1 to reset to default
    set MSG_SOURCE_NEW_IPSET=Enter the new ipset-all.txt source ^(link, starts with http^(s^)://^):
    set MSG_SOURCE_NEW_LIST=Enter the new list-general.txt source ^(link, starts with http^(s^)://^):
    
    set MSG_ALG_CURRENT=Current algorithm:
    set MSG_ALG_DEFAULT=default:
    set MSG_ALG_NEW=Enter the new algorithm:
    
    set MSG_LANG_CURRENT=Current language
    set MSG_LANG_BACK=Back
    set MSG_LANG_SELECT=Select language
    set MSG_LANG_CHANGED=Language changed. Restarting...
    
    set enabled=enabled
    set disabled=disabled
    set empty=empty
    set loaded=loaded
)
call :tcp_enable

:: External commands
if "%~1"=="status_zapret" (
    call :test_service zapret soft
    call :tcp_enable
    exit /b
)

if "%~1"=="check_updates" (
    if not "%~2"=="soft" (
        start /b service check_updates soft
    ) else (
        call :service_check_updates soft
    )
    exit /b
)

if "%~1"=="load_game_filter" (
    call :game_switch_status
    exit /b
)

if "%~1"=="list" (
    call :list ext
    exit /b
)

if "%~1"=="ips" (
    call :ips ext
    exit /b
)

if "%~1"=="bin" (
    call :bin ext
    exit /b
)

if "%~1"=="et" (
    call :et ext
    exit /b
)

if "%1"=="admin" (
    echo %MSG_ADMIN_STARTED%
) else (
    echo %MSG_ADMIN_REQUEST%
    powershell -Command "Start-Process 'cmd.exe' -ArgumentList '/c \"\"%~f0\" admin\"' -Verb RunAs"
    exit
)

:: MENU ================================
setlocal EnableDelayedExpansion
:menu
cls
call :ipset_switch_status
call :game_switch_status

set "menu_choice=null"

if "%~1"=="settings" (
    call :settings
    exit /b
)
echo =======================
echo =       v!LOCAL_VERSION!        =
echo ==========%MSG_MENU%===========
echo 1. %MSG_MENU_INSTALL%
echo 2. %MSG_MENU_REMOVE%
echo 3. %MSG_MENU_STATUS%
echo 4. %MSG_MENU_DIAGNOSTICS%
echo 5. %MSG_MENU_UPDATES%
echo 6. %MSG_MENU_GAME_FILTER% (%GameFilterStatus%)
echo 7. %MSG_MENU_IPSET% (%IPsetStatus%)
echo 0. %MSG_MENU_EXIT%
echo ======ShiZapret Addition========
echo 11. %MSG_MENU_UPDATE_BIN%
echo 12. %MSG_MENU_UPDATE_LIST%
echo 13. %MSG_MENU_UPDATE_IPSET%
echo 14. %MSG_MENU_UPDATE_ALL%
echo 15. %MSG_MENU_SETTINGS%
echo 16. %MSG_MENU_GAME_TCP% (%GameFilterTCPStatus%)
echo 17. %MSG_MENU_VERIFY%
:: echo 18. %MSG_MENU_LANGUAGE% (%LANG%)
set /p menu_choice=%MSG_MENU_CHOICE%: 

if "%menu_choice%"=="1" goto service_install
if "%menu_choice%"=="2" goto service_remove
if "%menu_choice%"=="3" goto service_status
if "%menu_choice%"=="4" goto service_diagnostics
if "%menu_choice%"=="5" goto service_check_updates
if "%menu_choice%"=="6" goto game_switch
if "%menu_choice%"=="7" goto ipset_switch
if "%menu_choice%"=="0" exit /b
if "%menu_choice%"=="11" goto bin
if "%menu_choice%"=="12" goto list
if "%menu_choice%"=="13" goto ips
if "%menu_choice%"=="14" goto et
if "%menu_choice%"=="15" goto settings
if "%menu_choice%"=="16" goto game_switch_tcp
if "%menu_choice%"=="17" goto verifyall
:: if "%menu_choice%"=="18" goto language_switch
goto menu

:: LANGUAGE SWITCH =====================
:language_switch
cls
echo %MSG_LANG_CURRENT%: %LANG%
echo ==============================
echo 1. English (EN)
echo 2. Русский (RU)
echo 0. %MSG_LANG_BACK%
echo ==============================
set /p lang_choice=%MSG_LANG_SELECT%: 

if "%lang_choice%"=="1" (
    echo EN> "%~dp0params\Language\current"
    echo %MSG_LANG_CHANGED%
    timeout /t 2 > nul
    goto restart_script
)
if "%lang_choice%"=="2" (
    echo RU> "%~dp0params\Language\current"
    echo %MSG_LANG_CHANGED%
    timeout /t 2 > nul
    goto restart_script
)
if "%lang_choice%"=="0" goto menu
goto language_switch

:restart_script
start "" "%~f0" admin
exit

:: LOAD LANGUAGE STRINGS ===============
:load_language_strings
if /i "%LANG%"=="RU" (
    :: Russian strings - UTF-8 encoding
    set MSG_ADMIN_STARTED=Запущено с правами администратора
    set MSG_ADMIN_REQUEST=Запрос прав администратора...
    set MSG_MENU=Меню
    set MSG_MENU_INSTALL=Установить сервис
    set MSG_MENU_REMOVE=Удалить сервисы
    set MSG_MENU_STATUS=Проверить статус
    set MSG_MENU_DIAGNOSTICS=Запустить диагностику
    set MSG_MENU_UPDATES=Проверить обновления
    set MSG_MENU_GAME_FILTER=Переключить игровой фильтр
    set MSG_MENU_IPSET=Переключить ipset
    set MSG_MENU_EXIT=Выход
    set MSG_MENU_UPDATE_BIN=Обновить папку /bin/
    set MSG_MENU_UPDATE_LIST=Обновить /lists/list-general.txt
    set MSG_MENU_UPDATE_IPSET=Обновить /lists/ipset-all.txt
    set MSG_MENU_UPDATE_ALL=Обновить всё
    set MSG_MENU_SETTINGS=Изменить настройки
    set MSG_MENU_GAME_TCP=Переключить игровой фильтр для TCP (чаты, аватары и т.д.)
    set MSG_MENU_VERIFY=Проверить все файлы
    set MSG_MENU_LANGUAGE=Сменить язык
    set MSG_MENU_CHOICE=Введите выбор (0-18^)
    
    set MSG_STATUS_INSTALLED=Стратегия сервиса установлена из
    set MSG_STATUS_RUNNING=запущен
    set MSG_STATUS_NOT_RUNNING=НЕ запущен
    set MSG_STATUS_ALREADY_RUNNING=уже ЗАПУЩЕН как сервис, используйте service.bat и выберите Удалить сервисы если хотите запустить отдельный bat
    set MSG_STATUS_STOP_PENDING=находится в состоянии STOP_PENDING. Это может быть вызвано конфликтом с другим обходом. Запустите диагностику для исправления конфликтов
    set MSG_STATUS_BYPASS_ACTIVE=Обход (winws.exe^) АКТИВЕН
    set MSG_STATUS_BYPASS_NOT_FOUND=Обход (winws.exe^) НЕ НАЙДЕН
    
    set MSG_REMOVE_NOT_INSTALLED=Сервис не установлен
    
    set MSG_INSTALL_PICK=Выберите один из вариантов:
    set MSG_INSTALL_INPUT=Введите индекс файла (номер^)
    set MSG_INSTALL_INVALID=Неверный выбор, выход...
    set MSG_INSTALL_SUCCESS=[S] Конфигурация УСПЕШНА
    
    set MSG_UPDATE_FAILED=Не удалось получить последнюю версию. Это не влияет на работу ShiZapret Addition.
    set MSG_UPDATE_LATEST=Установлена последняя версия:
    set MSG_UPDATE_NEW=Доступна новая версия:
    set MSG_UPDATE_RELEASE=Страница релиза:
    set MSG_UPDATE_INSTALL=Хотите установить новую версию? (Y/N) (по умолчанию: Y)
    set MSG_UPDATE_EXTRACTING=Извлечение
    set MSG_UPDATE_INSTALLED=Обновление установлено в
    set MSG_UPDATE_REMOVE_SERVICE=Хотите автоматически удалить сервис? (Y/N) (по умолчанию: Y)
    set MSG_UPDATE_NOT_INSTALLED=Обновление не было установлено
    
    set MSG_DIAG_BFE_PASS=Проверка Base Filtering Engine пройдена
    set MSG_DIAG_BFE_FAIL=[X] Base Filtering Engine не запущен. Этот сервис необходим для работы zapret
    set MSG_DIAG_PROXY_ENABLED=[?] Системный прокси включен:
    set MSG_DIAG_PROXY_CHECK=Убедитесь, что он действителен или отключите его, если не используете прокси
    set MSG_DIAG_PROXY_PASS=Проверка прокси пройдена
    set MSG_DIAG_TCP_PASS=Проверка TCP timestamps пройдена
    set MSG_DIAG_TCP_DISABLED=[?] TCP timestamps отключены. Включение timestamps...
    set MSG_DIAG_TCP_ENABLED=TCP timestamps успешно включены
    set MSG_DIAG_TCP_FAILED=[X] Не удалось включить TCP timestamps
    set MSG_DIAG_ADGUARD_FOUND=[X] Обнаружен процесс Adguard. Adguard может вызывать проблемы с Discord
    set MSG_DIAG_ADGUARD_PASS=Проверка Adguard пройдена
    set MSG_DIAG_KILLER_FOUND=[X] Обнаружены сервисы Killer. Killer конфликтует с zapret
    set MSG_DIAG_KILLER_PASS=Проверка Killer пройдена
    set MSG_DIAG_INTEL_FOUND=[X] Обнаружен Intel Connectivity Network Service. Он конфликтует с zapret
    set MSG_DIAG_INTEL_PASS=Проверка Intel Connectivity пройдена
    set MSG_DIAG_CHECKPOINT_FOUND=[X] Обнаружены сервисы Check Point. Check Point конфликтует с zapret
    set MSG_DIAG_CHECKPOINT_TRY=Попробуйте удалить Check Point
    set MSG_DIAG_CHECKPOINT_PASS=Проверка Check Point пройдена
    set MSG_DIAG_SMARTBYTE_FOUND=[X] Обнаружены сервисы SmartByte. SmartByte конфликтует с zapret
    set MSG_DIAG_SMARTBYTE_TRY=Попробуйте удалить или отключить SmartByte через services.msc
    set MSG_DIAG_SMARTBYTE_PASS=Проверка SmartByte пройдена
    set MSG_DIAG_VPN_FOUND=[?] Обнаружены некоторые VPN сервисы. Некоторые VPN могут конфликтовать с zapret
    set MSG_DIAG_VPN_CHECK=Убедитесь, что все VPN отключены
    set MSG_DIAG_VPN_PASS=Проверка VPN пройдена
    set MSG_DIAG_DNS_NOT_SET=[?] DNS серверы вероятно не указаны.
    set MSG_DIAG_DNS_PROVIDER=Вероятно автоматически используются DNS серверы провайдера, что может влиять на zapret. Рекомендуется установить известные DNS серверы и настроить DoH
    set MSG_DIAG_DNS_PASS=Проверка DNS пройдена
    set MSG_DIAG_DOH_NOT_SET=[?] Убедитесь, что вы настроили безопасный DNS в браузере с нестандартным провайдером DNS.
    set MSG_DIAG_DOH_WIN11=Если вы используете Windows 11, вы можете настроить зашифрованный DNS в настройках, чтобы скрыть это предупреждение
    set MSG_DIAG_DOH_PASS=Проверка Secure DNS пройдена
    set MSG_DIAG_WINDIVERT_CONFLICT=[?] winws.exe не запущен, но сервис WinDivert активен. Попытка удалить WinDivert...
    set MSG_DIAG_WINDIVERT_FAILED=[X] Не удалось удалить WinDivert. Проверка конфликтующих сервисов...
    set MSG_DIAG_WINDIVERT_FOUND=[?] Найден конфликтующий сервис:
    set MSG_DIAG_WINDIVERT_STOPPING=Остановка и удаление...
    set MSG_DIAG_WINDIVERT_REMOVED=Успешно удален сервис:
    set MSG_DIAG_WINDIVERT_REMOVE_FAILED=[X] Не удалось удалить сервис:
    set MSG_DIAG_WINDIVERT_NO_CONFLICT=[X] Конфликтующие сервисы не найдены. Проверьте вручную, использует ли другой обход WinDivert.
    set MSG_DIAG_WINDIVERT_RETRY=[?] Попытка удалить WinDivert снова...
    set MSG_DIAG_WINDIVERT_SUCCESS=WinDivert успешно удален после удаления конфликтующих сервисов
    set MSG_DIAG_WINDIVERT_STILL_FAILED=[X] WinDivert всё ещё не может быть удален. Проверьте вручную, использует ли другой обход WinDivert.
    set MSG_DIAG_CONFLICT_FOUND=[X] Обнаружены конфликтующие сервисы обхода:
    set MSG_DIAG_CONFLICT_REMOVE=Хотите удалить эти конфликтующие сервисы? (Y/N) (по умолчанию: N)
    set MSG_DIAG_DISCORD_CACHE=Хотите очистить кэш Discord? (Y/N) (по умолчанию: Y)
    set MSG_DIAG_DISCORD_RUNNING=запущен, закрытие...
    set MSG_DIAG_DISCORD_CLOSED=успешно закрыт
    set MSG_DIAG_DISCORD_CLOSE_FAILED=Не удалось закрыть
    set MSG_DIAG_DISCORD_CLEANING=Очистка кэша Discord...
    set MSG_DIAG_DISCORD_DELETED=Успешно удалено
    set MSG_DIAG_DISCORD_DELETE_FAILED=Не удалось удалить
    set MSG_DIAG_DISCORD_NOT_EXIST=не существует
    set MSG_DIAG_DISCORD_PTB_CLEANING=Очистка кэша Discord PTB...
    set MSG_DIAG_DISCORD_CANARY_CLEANING=Очистка кэша Discord Canary...
    
    set MSG_GAME_ENABLING=Включение игрового фильтра...
    set MSG_GAME_DISABLING=Отключение игрового фильтра...
    set MSG_GAME_RESTART=Перезапустите ShiZapret Addition для применения изменений.
    set MSG_GAME_TCP_ENABLING=Включение игрового фильтра для TCP...
    set MSG_GAME_TCP_DISABLING=Отключение игрового фильтра для TCP...
    
    set MSG_IPSET_NOT_DOWNLOADED=ipset не загружен.
    set MSG_IPSET_ENABLING=Включение обхода на основе ipset...
    set MSG_IPSET_DISABLING=Отключение обхода на основе ipset...
    set MSG_IPSET_NO_BACKUP=Ошибка: нет резервной копии для восстановления. Обновите список из меню сервиса самостоятельно
    
    set MSG_DOWNLOAD=Загрузка
    set MSG_DOWNLOAD_SOURCE=Источник:
    set MSG_VERIFY=Проверка
    set MSG_VERIFY_FAILED=не прошёл проверку. Файл может быть поврежден или правильный хэш ещё не обновлен. Ваш хэш:
    set MSG_VERIFY_CORRECT=Правильный хэш:
    set MSG_VERIFY_SUCCESS=успешно проверен. Хэш:
    set MSG_VERIFY_NO_REACH=Не удалось достичь
    set MSG_VERIFY_TO_VERIFY=для проверки
    set MSG_VERIFY_YOUR_HASH=Ваш хэш:
    
    set MSG_SETTINGS_TITLE=Настройки
    set MSG_SETTINGS_UPDATE_START=Обновление при запуске:
    set MSG_SETTINGS_UPDATE_CYGWIN=Обновлять cygwin1.dll:
    set MSG_SETTINGS_UPDATE_WINDIVERT=Обновлять WinDivert.dll:
    set MSG_SETTINGS_UPDATE_WINDIVERT64=Обновлять WinDivert64.sys:
    set MSG_SETTINGS_UPDATE_WINWS=Обновлять winws.exe:
    set MSG_SETTINGS_UPDATE_IPSET=Обновлять ipset-all.txt:
    set MSG_SETTINGS_UPDATE_LIST=Обновлять list-general.txt:
    set MSG_SETTINGS_VERIFY=Проверять файлы при обновлении:
    set MSG_SETTINGS_LIST_SOURCE=Источник list-general.txt:
    set MSG_SETTINGS_IPSET_SOURCE=Источник ipset-all:
    set MSG_SETTINGS_HASH_ALG=Алгоритм хэша верификатора:
    set MSG_SETTINGS_BACK=Назад
    set MSG_SETTINGS_CHANGE=Изменить настройку:
    set MSG_SETTINGS_RECEIVING=Получение стандартных источников загрузки...
    set MSG_SETTINGS_COULD_NOT=Не удалось получить стандартный источник! Откат к
    
    set MSG_SOURCE_CURRENT=Текущий источник:
    set MSG_SOURCE_ENTER_0=Введите 0 для возврата
    set MSG_SOURCE_ENTER_1=Введите 1 для сброса к стандартному
    set MSG_SOURCE_NEW_IPSET=Введите новый источник ipset-all.txt (ссылка, начинается с http(s)://):
    set MSG_SOURCE_NEW_LIST=Введите новый источник list-general.txt (ссылка, начинается с http(s)://):
    
    set MSG_ALG_CURRENT=Текущий алгоритм:
    set MSG_ALG_DEFAULT=по умолчанию:
    set MSG_ALG_NEW=Введите новый алгоритм:
    
    set MSG_LANG_CURRENT=Текущий язык
    set MSG_LANG_BACK=Назад
    set MSG_LANG_SELECT=Выберите язык
    set MSG_LANG_CHANGED=Язык изменён. Перезапуск...
    
    set enabled=включен
    set disabled=отключен
    set empty=пусто
    set loaded=загружен
) else (
    :: English strings
    set MSG_ADMIN_STARTED=Started with admin rights
    set MSG_ADMIN_REQUEST=Requesting admin rights...
    set MSG_MENU=Menu
    set MSG_MENU_INSTALL=Install Service
    set MSG_MENU_REMOVE=Remove Services
    set MSG_MENU_STATUS=Check Status
    set MSG_MENU_DIAGNOSTICS=Run Diagnostics
    set MSG_MENU_UPDATES=Check Updates
    set MSG_MENU_GAME_FILTER=Switch Game Filter
    set MSG_MENU_IPSET=Switch ipset
    set MSG_MENU_EXIT=Exit
    set MSG_MENU_UPDATE_BIN=Update /bin/ Folder
    set MSG_MENU_UPDATE_LIST=Update /lists/list-general.txt
    set MSG_MENU_UPDATE_IPSET=Update /lists/ipset-all.txt
    set MSG_MENU_UPDATE_ALL=Update Everything
    set MSG_MENU_SETTINGS=Change Settings
    set MSG_MENU_GAME_TCP=Switch Game Filter for TCP (Chats, Profile Pictures, etc.)
    set MSG_MENU_VERIFY=Verify All Files
    set MSG_MENU_LANGUAGE=Change Language
    set MSG_MENU_CHOICE=Enter choice (0-18^)
    
    set MSG_STATUS_INSTALLED=Service strategy installed from
    set MSG_STATUS_RUNNING=is RUNNING
    set MSG_STATUS_NOT_RUNNING=is NOT running
    set MSG_STATUS_ALREADY_RUNNING=is ALREADY RUNNING as service, use service.bat and choose Remove Services first if you want to run standalone bat
    set MSG_STATUS_STOP_PENDING=is STOP_PENDING. This may be caused by a conflict with another bypass. Run Diagnostics to try to fix conflicts
    set MSG_STATUS_BYPASS_ACTIVE=Bypass (winws.exe^) is ACTIVE
    set MSG_STATUS_BYPASS_NOT_FOUND=Bypass (winws.exe^) NOT FOUND
    
    set MSG_REMOVE_NOT_INSTALLED=Service is not installed
    
    set MSG_INSTALL_PICK=Pick one of the options:
    set MSG_INSTALL_INPUT=Input file index (number^)
    set MSG_INSTALL_INVALID=Invalid choice, exiting...
    set MSG_INSTALL_SUCCESS=[S] Config SUCCESS
    
    set MSG_UPDATE_FAILED=Failed to fetch the latest version. This does not affect the operation of ShiZapret Addition.
    set MSG_UPDATE_LATEST=Latest version installed:
    set MSG_UPDATE_NEW=New version available:
    set MSG_UPDATE_RELEASE=Release page:
    set MSG_UPDATE_INSTALL=Do you want to install the new version? (Y/N) (default: Y)
    set MSG_UPDATE_EXTRACTING=Extracting
    set MSG_UPDATE_INSTALLED=Update installed into
    set MSG_UPDATE_REMOVE_SERVICE=Do you want to automatically remove service? (Y/N) (default: Y)
    set MSG_UPDATE_NOT_INSTALLED=Update was not installed
    
    set MSG_DIAG_BFE_PASS=Base Filtering Engine check passed
    set MSG_DIAG_BFE_FAIL=[X] Base Filtering Engine is not running. This service is required for zapret to work
    set MSG_DIAG_PROXY_ENABLED=[?] System proxy is enabled:
    set MSG_DIAG_PROXY_CHECK=Make sure it's valid or disable it if you don't use a proxy
    set MSG_DIAG_PROXY_PASS=Proxy check passed
    set MSG_DIAG_TCP_PASS=TCP timestamps check passed
    set MSG_DIAG_TCP_DISABLED=[?] TCP timestamps are disabled. Enabling timestamps...
    set MSG_DIAG_TCP_ENABLED=TCP timestamps successfully enabled
    set MSG_DIAG_TCP_FAILED=[X] Failed to enable TCP timestamps
    set MSG_DIAG_ADGUARD_FOUND=[X] Adguard process found. Adguard may cause problems with Discord
    set MSG_DIAG_ADGUARD_PASS=Adguard check passed
    set MSG_DIAG_KILLER_FOUND=[X] Killer services found. Killer conflicts with zapret
    set MSG_DIAG_KILLER_PASS=Killer check passed
    set MSG_DIAG_INTEL_FOUND=[X] Intel Connectivity Network Service found. It conflicts with zapret
    set MSG_DIAG_INTEL_PASS=Intel Connectivity check passed
    set MSG_DIAG_CHECKPOINT_FOUND=[X] Check Point services found. Check Point conflicts with zapret
    set MSG_DIAG_CHECKPOINT_TRY=Try to uninstall Check Point
    set MSG_DIAG_CHECKPOINT_PASS=Check Point check passed
    set MSG_DIAG_SMARTBYTE_FOUND=[X] SmartByte services found. SmartByte conflicts with zapret
    set MSG_DIAG_SMARTBYTE_TRY=Try to uninstall or disable SmartByte through services.msc
    set MSG_DIAG_SMARTBYTE_PASS=SmartByte check passed
    set MSG_DIAG_VPN_FOUND=[?] Some VPN services found. Some VPNs can conflict with zapret
    set MSG_DIAG_VPN_CHECK=Make sure that all VPNs are disabled
    set MSG_DIAG_VPN_PASS=VPN check passed
    set MSG_DIAG_DNS_NOT_SET=[?] DNS servers are probably not specified.
    set MSG_DIAG_DNS_PROVIDER=Provider's DNS servers are probably automatically used, which may affect zapret. It is recommended to install well-known DNS servers and setup DoH
    set MSG_DIAG_DNS_PASS=DNS check passed
    set MSG_DIAG_DOH_NOT_SET=[?] Make sure you have configured secure DNS in a browser with a non-default DNS service provider.
    set MSG_DIAG_DOH_WIN11=If you use Windows 11, you can configure encrypted DNS in the Settings to hide this warning
    set MSG_DIAG_DOH_PASS=Secure DNS check passed
    set MSG_DIAG_WINDIVERT_CONFLICT=[?] winws.exe is not running but WinDivert service is active. Attempting to delete WinDivert...
    set MSG_DIAG_WINDIVERT_FAILED=[X] Failed to delete WinDivert. Checking for conflicting services...
    set MSG_DIAG_WINDIVERT_FOUND=[?] Found conflicting service:
    set MSG_DIAG_WINDIVERT_STOPPING=Stopping and removing...
    set MSG_DIAG_WINDIVERT_REMOVED=Successfully removed service:
    set MSG_DIAG_WINDIVERT_REMOVE_FAILED=[X] Failed to remove service:
    set MSG_DIAG_WINDIVERT_NO_CONFLICT=[X] No conflicting services found. Check manually if any other bypass is using WinDivert.
    set MSG_DIAG_WINDIVERT_RETRY=[?] Attempting to delete WinDivert again...
    set MSG_DIAG_WINDIVERT_SUCCESS=WinDivert successfully deleted after removing conflicting services
    set MSG_DIAG_WINDIVERT_STILL_FAILED=[X] WinDivert still cannot be deleted. Check manually if any other bypass is using WinDivert.
    set MSG_DIAG_CONFLICT_FOUND=[X] Conflicting bypass services found:
    set MSG_DIAG_CONFLICT_REMOVE=Do you want to remove these conflicting services? (Y/N) (default: N)
    set MSG_DIAG_DISCORD_CACHE=Do you want to clear the Discord cache? (Y/N) (default: Y)
    set MSG_DIAG_DISCORD_RUNNING=is running, closing...
    set MSG_DIAG_DISCORD_CLOSED=was successfully closed
    set MSG_DIAG_DISCORD_CLOSE_FAILED=Unable to close
    set MSG_DIAG_DISCORD_CLEANING=Cleaning Discord cache...
    set MSG_DIAG_DISCORD_DELETED=Successfully deleted
    set MSG_DIAG_DISCORD_DELETE_FAILED=Failed to delete
    set MSG_DIAG_DISCORD_NOT_EXIST=does not exist
    set MSG_DIAG_DISCORD_PTB_CLEANING=Cleaning Discord PTB cache...
    set MSG_DIAG_DISCORD_CANARY_CLEANING=Cleaning Discord Canary cache...
    
    set MSG_GAME_ENABLING=Enabling game filter...
    set MSG_GAME_DISABLING=Disabling game filter...
    set MSG_GAME_RESTART=Restart ShiZapret Addition to apply the changes.
    set MSG_GAME_TCP_ENABLING=Enabling game filter for TCP...
    set MSG_GAME_TCP_DISABLING=Disabling game filter for TCP...
    
    set MSG_IPSET_NOT_DOWNLOADED=ipset is not downloaded.
    set MSG_IPSET_ENABLING=Enabling ipset based bypass...
    set MSG_IPSET_DISABLING=Disabling ipset based bypass...
    set MSG_IPSET_NO_BACKUP=Error: no backup to restore. Update list from service menu by yourself
    
    set MSG_DOWNLOAD=Downloading
    set MSG_DOWNLOAD_SOURCE=Source:
    set MSG_VERIFY=Verifying
    set MSG_VERIFY_FAILED=failed the verification. File might be damaged or the correct hash has not been updated yet. Your hash:
    set MSG_VERIFY_CORRECT=Correct hash:
    set MSG_VERIFY_SUCCESS=successfully verified. Hash:
    set MSG_VERIFY_NO_REACH=Could not reach
    set MSG_VERIFY_TO_VERIFY=to verify
    set MSG_VERIFY_YOUR_HASH=Your hash:
    
    set MSG_SETTINGS_TITLE=Settings
    set MSG_SETTINGS_UPDATE_START=Update on start:
    set MSG_SETTINGS_UPDATE_CYGWIN=Update cygwin1.dll:
    set MSG_SETTINGS_UPDATE_WINDIVERT=Update WinDivert.dll:
    set MSG_SETTINGS_UPDATE_WINDIVERT64=Update WinDivert64.sys:
    set MSG_SETTINGS_UPDATE_WINWS=Update winws.exe:
    set MSG_SETTINGS_UPDATE_IPSET=Update ipset-all.txt:
    set MSG_SETTINGS_UPDATE_LIST=Update list-general.txt:
    set MSG_SETTINGS_VERIFY=Verify files when updating:
    set MSG_SETTINGS_LIST_SOURCE=list-general.txt Source:
    set MSG_SETTINGS_IPSET_SOURCE=ipset-all Source:
    set MSG_SETTINGS_HASH_ALG=Verifier Hash Algorithm:
    set MSG_SETTINGS_BACK=Back
    set MSG_SETTINGS_CHANGE=Change Setting:
    set MSG_SETTINGS_RECEIVING=Receiving default download sources...
    set MSG_SETTINGS_COULD_NOT=Could not receive the default source! Fell back to
    
    set MSG_SOURCE_CURRENT=Current source:
    set MSG_SOURCE_ENTER_0=Enter 0 to go back
    set MSG_SOURCE_ENTER_1=Enter 1 to reset to default
    set MSG_SOURCE_NEW_IPSET=Enter the new ipset-all.txt source (link, starts with http(s)://):
    set MSG_SOURCE_NEW_LIST=Enter the new list-general.txt source (link, starts with http(s)://):
    
    set MSG_ALG_CURRENT=Current algorithm:
    set MSG_ALG_DEFAULT=default:
    set MSG_ALG_NEW=Enter the new algorithm:
    
    set MSG_LANG_CURRENT=Current language
    set MSG_LANG_BACK=Back
    set MSG_LANG_SELECT=Select language
    set MSG_LANG_CHANGED=Language changed. Restarting...
    
    set enabled=enabled
    set disabled=disabled
    set empty=empty
    set loaded=loaded
)
exit /b

:: TCP ENABLE ==========================
:tcp_enable
netsh interface tcp show global | findstr /i "timestamps" | findstr /i "enabled" > nul || netsh interface tcp set global timestamps=enabled > nul 2>&1
exit /b

:: STATUS ==============================
:service_status
cls

sc query "zapret" >nul 2>&1
if !errorlevel!==0 (
    for /f "tokens=2*" %%A in ('reg query "HKLM\System\CurrentControlSet\Services\zapret" /v shizapret 2^>nul') do echo %MSG_STATUS_INSTALLED% '%%B'
    if !errorlevel!==0 (
        for /f "tokens=2*" %%A in ('reg query "HKLM\System\CurrentControlSet\Services\zapret" /v zapret-discord-youtube 2^>nul') do call :PrintYellow "%MSG_STATUS_INSTALLED% '%%B' using zapret-discord-youtube or an older version of shizapret."
    )
)

call :test_service zapret
call :test_service WinDivert
echo:

tasklist /FI "IMAGENAME eq winws.exe" | find /I "winws.exe" > nul
if !errorlevel!==0 (
    call :PrintGreen "%MSG_STATUS_BYPASS_ACTIVE%"
) else (
    call :PrintRed "%MSG_STATUS_BYPASS_NOT_FOUND%"
)

pause
goto menu

:test_service
set "ServiceName=%~1"
set "ServiceStatus="

for /f "tokens=3 delims=: " %%A in ('sc query "%ServiceName%" ^| findstr /i "STATE"') do set "ServiceStatus=%%A"
set "ServiceStatus=%ServiceStatus: =%"

if "%ServiceStatus%"=="RUNNING" (
    if "%~2"=="soft" (
        echo "%ServiceName%" %MSG_STATUS_ALREADY_RUNNING%
        pause
        exit /b
    ) else (
        echo "%ServiceName%" service %MSG_STATUS_RUNNING%.
    )
) else if "%ServiceStatus%"=="STOP_PENDING" (
    call :PrintYellow "!ServiceName! %MSG_STATUS_STOP_PENDING%"
) else if not "%~2"=="soft" (
    echo "%ServiceName%" service %MSG_STATUS_NOT_RUNNING%.
)

exit /b

:: REMOVE ==============================
:service_remove
cls

set SRVCNAME=zapret
sc query "!SRVCNAME!" >nul 2>&1
if !errorlevel!==0 (
    net stop %SRVCNAME%
    sc delete %SRVCNAME%
) else (
    echo %MSG_REMOVE_NOT_INSTALLED% "%SRVCNAME%".
)

sc query "WinDivert" >nul 2>&1
if !errorlevel!==0 (
    net stop "WinDivert"

    sc query "WinDivert" >nul 2>&1
    if !errorlevel!==0 (
        sc delete "WinDivert"
    )
)

net stop "WinDivert14" >nul 2>&1
sc delete "WinDivert14" >nul 2>&1
if "%1"=="shizapret" exit /b

pause
goto menu

:: INSTALL =============================
:service_install
cls

:: Main
cd /d "%~dp0"
set "BIN_PATH=%~dp0bin\"
set "LISTS_PATH=%~dp0lists\"

if not exist "bin/cygwin1.dll" (
    call bin
)
if not exist "lists/list-general.txt" (
    call list
)
if not exist "lists/ipset-all.txt" (
    call ips
)

cls

:: Searching for .bat files in current folder and strategies folder, except for files that start with "service" and "calls"
echo %MSG_INSTALL_PICK%
set "count=0"

:: Search in root directory
for %%f in (*.bat) do (
    set "filename=%%~nxf"
    if /i not "!filename:~0,7!"=="service" (
          set /a count+=1
          echo !count!. %%f
          set "file!count!=%%f"
    )
)

:: Search in strategies folder
if exist "strategies\" (
    for %%f in (strategies\*.bat) do (
        set "filename=%%~nxf"
        if /i not "!filename:~0,7!"=="service" (
              set /a count+=1
              echo !count!. %%f
              set "file!count!=%%f"
        )
    )
)

:: Choosing file
set "choice="
set /p "choice=%MSG_INSTALL_INPUT%: "
if "!choice!"=="" (
    echo %MSG_INSTALL_INVALID%
    pause
    goto menu
)

set "selectedFile=!file%choice%!"
if not defined selectedFile (
    echo %MSG_INSTALL_INVALID%
    pause
    goto menu
)

:: Args that should be followed by value
set "args_with_value=sni host altorder"

:: Parsing args (mergeargs: 2=start param|3=arg with value|1=params args|0=default)
set "args="
set "capture=0"
set "mergeargs=0"
set QUOTE="

for /f "tokens=*" %%a in ('type "!selectedFile!"') do (
    set "line=%%a"
    call set "line=%%line:^!=EXCL_MARK%%"

    echo !line! | findstr /i "%BIN%winws.exe" >nul
    if not errorlevel 1 (
        set "capture=1"
    )

    if !capture!==1 (
        if not defined args (
            set "line=!line:*%BIN%winws.exe!=!"
        )

        set "temp_args="
        for %%i in (!line!) do (
            set "arg=%%i"

            if not "!arg!"=="^" (
                if "!arg:~0,2!" EQU "--" if not !mergeargs!==0 (
                    set "mergeargs=0"
                )

                if "!arg:~0,1!" EQU "!QUOTE!" (
                    set "arg=!arg:~1,-1!"

                    echo !arg! | findstr ":" >nul
                    if !errorlevel!==0 (
                        set "arg=\!QUOTE!!arg!\!QUOTE!"
                    ) else if "!arg:~0,1!"=="@" (
                        set "arg=\!QUOTE!@%~dp0!arg:~1!\!QUOTE!"
                    ) else if "!arg:~0,5!"=="%%BIN%%" (
                        set "arg=\!QUOTE!!BIN_PATH!!arg:~5!\!QUOTE!"
                    ) else if "!arg:~0,7!"=="%%LISTS%%" (
                        set "arg=\!QUOTE!!LISTS_PATH!!arg:~7!\!QUOTE!"
                    ) else (
                        set "arg=\!QUOTE!%~dp0!arg!\!QUOTE!"
                    )
                ) else if "!arg:~0,12!" EQU "%%GameFilter%%" (
                    set "arg=%GameFilter%"
                ) else if "!arg:~0,16!" EQU "%%GameFilterTCP%%" (
                    set "arg=%GameFilterTCP%"
                ) 

                if !mergeargs!==1 (
                    set "temp_args=!temp_args!,!arg!"
                ) else if !mergeargs!==3 (
                    set "temp_args=!temp_args!=!arg!"
                    set "mergeargs=1"
                ) else (
                    set "temp_args=!temp_args! !arg!"
                )

                if "!arg:~0,2!" EQU "--" (
                    set "mergeargs=2"
                ) else if !mergeargs! GEQ 1 (
                    if !mergeargs!==2 set "mergeargs=1"

                    for %%x in (!args_with_value!) do (
                        if /i "%%x"=="!arg!" (
                            set "mergeargs=3"
                        )
                    )
                )
            )
        )

        if not "!temp_args!"=="" (
            set "args=!args! !temp_args!"
        )
    )
)

:: Creating service with parsed args
call :tcp_enable

set ARGS=%args%
call set "ARGS=%%ARGS:EXCL_MARK=^!%%"

:: Simplified output to show only CONFIG SUCCESS
echo.
echo %MSG_INSTALL_SUCCESS%
echo.

set SRVCNAME=zapret

net stop %SRVCNAME% >nul 2>&1
sc delete %SRVCNAME% >nul 2>&1
sc create %SRVCNAME% binPath= "\"%BIN_PATH%winws.exe\" !ARGS!" DisplayName= "zapret" start= auto
sc description %SRVCNAME% "Zapret DPI bypass software"
sc start %SRVCNAME%
for %%F in ("!file%choice%!") do (
    set "filename=%%~nF"
)
reg add "HKLM\System\CurrentControlSet\Services\zapret" /v shizapret /t REG_SZ /d "!filename!" /f

pause
goto menu

:: CHECK UPDATES =======================
:service_check_updates
cls

:: Set current version and URLs
set "GITHUB_VERSION_URL=https://raw.githubusercontent.com/dotFelixan/ShiZapret-Addition/refs/heads/main/.service/version.txt"
set "GITHUB_RELEASE_URL=https://github.com/dotFelixan/ShiZapret-Addition/releases/tag/"
set "GITHUB_DOWNLOAD_URL=https://github.com/dotFelixan/ShiZapret-Addition/releases/latest/download/ShiZapret_Addition-"

:: Get the latest version from GitHub
for /f "delims=" %%A in ('powershell -command "(Invoke-WebRequest -Uri \"%GITHUB_VERSION_URL%\" -Headers @{\"Cache-Control\"=\"no-cache\"} -TimeoutSec 5).Content.Trim()" 2^>nul') do set "GITHUB_VERSION=%%A"

:: Error handling
if not defined GITHUB_VERSION (
    echo %MSG_UPDATE_FAILED%
    timeout /T 9
    if "%1"=="soft" exit 
    goto menu
)

:: Version comparison
if "%LOCAL_VERSION%"=="%GITHUB_VERSION%" (
    echo %MSG_UPDATE_LATEST% %LOCAL_VERSION%
    
    if "%1"=="soft" exit
    pause
    goto menu
) 

echo %MSG_UPDATE_NEW% %GITHUB_VERSION%
echo %MSG_UPDATE_RELEASE% %GITHUB_RELEASE_URL%%GITHUB_VERSION%

set "CHOICE="
set /p "CHOICE=%MSG_UPDATE_INSTALL% "
if "%CHOICE%"=="" set "CHOICE=Y"
if "!CHOICE!"=="y" set "CHOICE=Y"

if /i "!CHOICE!"=="Y" (
    cd /d "%~dp0"
    cls
    call :downloadfile "%GITHUB_DOWNLOAD_URL%%GITHUB_VERSION%.zip" "%~dp0" "ShiZapret_Addition-%GITHUB_VERSION%.zip"
    cls
    echo %MSG_UPDATE_EXTRACTING% ShiZapret_Addition-%GITHUB_VERSION%.zip...
    powershell -Command "Expand-Archive 'ShiZapret_Addition-%GITHUB_VERSION%.zip' '%GITHUB_VERSION%'"
    del ShiZapret_Addition-%GITHUB_VERSION%.zip
    cls
    if exist "%GITHUB_VERSION%\shizapret.bat" (
    echo %MSG_UPDATE_INSTALLED% "%~dp0%GITHUB_VERSION%".
    set "SERVICE_CHOICE="
    set /p "SERVICE_CHOICE=%MSG_UPDATE_REMOVE_SERVICE% "
    if "%SERVICE_CHOICE%"=="" set "SERVICE_CHOICE=Y"
    if /i "%SERVICE_CHOICE%"=="y" set "SERVICE_CHOICE=Y"
    if /i "%SERVICE_CHOICE%"=="Y" (
        call :service_remove shizapret
    )
    ) else (
    call :PrintRed "%MSG_UPDATE_NOT_INSTALLED%"
    )
)

if "%1"=="soft" exit
cls
pause
goto menu

:: DIAGNOSTICS =========================
:service_diagnostics
cls

:: Base Filtering Engine
sc query BFE | findstr /I "RUNNING" > nul
if !errorlevel!==0 (
    call :PrintGreen "%MSG_DIAG_BFE_PASS%"
) else (
    call :PrintRed "%MSG_DIAG_BFE_FAIL%"
)
echo:

:: Proxy check
set "proxyEnabled=0"
set "proxyServer="

for /f "tokens=2*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable 2^>nul ^| findstr /i "ProxyEnable"') do (
    if "%%B"=="0x1" set "proxyEnabled=1"
)

if !proxyEnabled!==1 (
    for /f "tokens=2*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer 2^>nul ^| findstr /i "ProxyServer"') do (
        set "proxyServer=%%B"
    )

    call :PrintYellow "%MSG_DIAG_PROXY_ENABLED% !proxyServer!"
    call :PrintYellow "%MSG_DIAG_PROXY_CHECK%"
) else (
    call :PrintGreen "%MSG_DIAG_PROXY_PASS%"
)
echo:

:: TCP timestamps check
netsh interface tcp show global | findstr /i "timestamps" | findstr /i "enabled" > nul
if !errorlevel!==0 (
    call :PrintGreen "%MSG_DIAG_TCP_PASS%"
) else (
    call :PrintYellow "%MSG_DIAG_TCP_DISABLED%"
    netsh interface tcp set global timestamps=enabled > nul 2>&1
    if !errorlevel!==0 (
        call :PrintGreen "%MSG_DIAG_TCP_ENABLED%"
    ) else (
        call :PrintRed "%MSG_DIAG_TCP_FAILED%"
    )
)
echo:

:: AdguardSvc.exe
tasklist /FI "IMAGENAME eq AdguardSvc.exe" | find /I "AdguardSvc.exe" > nul
if !errorlevel!==0 (
    call :PrintRed "%MSG_DIAG_ADGUARD_FOUND%"
    call :PrintRed "https://github.com/Flowseal/zapret-discord-youtube/issues/417"
) else (
    call :PrintGreen "%MSG_DIAG_ADGUARD_PASS%"
)
echo:

:: Killer
sc query | findstr /I "Killer" > nul
if !errorlevel!==0 (
    call :PrintRed "%MSG_DIAG_KILLER_FOUND%"
    call :PrintRed "https://github.com/Flowseal/zapret-discord-youtube/issues/2512#issuecomment-2821119513"
) else (
    call :PrintGreen "%MSG_DIAG_KILLER_PASS%"
)
echo:

:: Intel Connectivity Network Service
sc query | findstr /I "Intel" | findstr /I "Connectivity" | findstr /I "Network" > nul
if !errorlevel!==0 (
    call :PrintRed "%MSG_DIAG_INTEL_FOUND%"
    call :PrintRed "https://github.com/ValdikSS/GoodbyeDPI/issues/541#issuecomment-2661670982"
) else (
    call :PrintGreen "%MSG_DIAG_INTEL_PASS%"
)
echo:

:: Check Point
set "checkpointFound=0"
sc query | findstr /I "TracSrvWrapper" > nul
if !errorlevel!==0 (
    set "checkpointFound=1"
)

sc query | findstr /I "EPWD" > nul
if !errorlevel!==0 (
    set "checkpointFound=1"
)

if !checkpointFound!==1 (
    call :PrintRed "%MSG_DIAG_CHECKPOINT_FOUND%"
    call :PrintRed "%MSG_DIAG_CHECKPOINT_TRY%"
) else (
    call :PrintGreen "%MSG_DIAG_CHECKPOINT_PASS%"
)
echo:

:: SmartByte
sc query | findstr /I "SmartByte" > nul
if !errorlevel!==0 (
    call :PrintRed "%MSG_DIAG_SMARTBYTE_FOUND%"
    call :PrintRed "%MSG_DIAG_SMARTBYTE_TRY%"
) else (
    call :PrintGreen "%MSG_DIAG_SMARTBYTE_PASS%"
)
echo:

:: VPN
sc query | findstr /I "VPN" > nul
if !errorlevel!==0 (
    call :PrintYellow "%MSG_DIAG_VPN_FOUND%"
    call :PrintYellow "%MSG_DIAG_VPN_CHECK%"
) else (
    call :PrintGreen "%MSG_DIAG_VPN_PASS%"
)
echo:

:: DNS
set "dnsfound=0"
for /f "delims=" %%a in ('powershell -Command "Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object {$_.IPEnabled -eq $true} | ForEach-Object {$_.DNSServerSearchOrder} | Where-Object {$_ -match '^192\.168\.'} | Measure-Object | Select-Object -ExpandProperty Count"') do (
    if %%a gtr 0 (
        set "dnsfound=1"
    )
)
if !dnsfound!==1 (
    call :PrintYellow "%MSG_DIAG_DNS_NOT_SET%"
    call :PrintYellow "%MSG_DIAG_DNS_PROVIDER%"
) else (
    call :PrintGreen "%MSG_DIAG_DNS_PASS%"
)
echo:

:: Secure DNS
set "dohfound=0"
for /f "delims=" %%a in ('powershell -Command "Get-ChildItem -Recurse -Path 'HKLM:System\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\' | Get-ItemProperty | Where-Object { $_.DohFlags -gt 0 } | Measure-Object | Select-Object -ExpandProperty Count"') do (
    if %%a gtr 0 (
        set "dohfound=1"
    )
)
if !dohfound!==0 (
    call :PrintYellow "%MSG_DIAG_DOH_NOT_SET%"
    call :PrintYellow "%MSG_DIAG_DOH_WIN11%"
) else (
    call :PrintGreen "%MSG_DIAG_DOH_PASS%"
)
echo:

:: WinDivert conflict
tasklist /FI "IMAGENAME eq winws.exe" | find /I "winws.exe" > nul
set "winws_running=!errorlevel!"

sc query "WinDivert" | findstr /I "RUNNING STOP_PENDING" > nul
set "windivert_running=!errorlevel!"

if !winws_running! neq 0 if !windivert_running!==0 (
    call :PrintYellow "%MSG_DIAG_WINDIVERT_CONFLICT%"
    
    net stop "WinDivert" >nul 2>&1
    sc delete "WinDivert" >nul 2>&1
    sc query "WinDivert" >nul 2>&1
    if !errorlevel!==0 (
        call :PrintRed "%MSG_DIAG_WINDIVERT_FAILED%"
        
        set "conflicting_services=GoodbyeDPI"
        set "found_conflict=0"
        
        for %%s in (!conflicting_services!) do (
            sc query "%%s" >nul 2>&1
            if !errorlevel!==0 (
                call :PrintYellow "%MSG_DIAG_WINDIVERT_FOUND% %%s. %MSG_DIAG_WINDIVERT_STOPPING%"
                net stop "%%s" >nul 2>&1
                sc delete "%%s" >nul 2>&1
                if !errorlevel!==0 (
                    call :PrintGreen "%MSG_DIAG_WINDIVERT_REMOVED% %%s"
                ) else (
                    call :PrintRed "%MSG_DIAG_WINDIVERT_REMOVE_FAILED% %%s"
                )
                set "found_conflict=1"
            )
        )
        
        if !found_conflict!==0 (
            call :PrintRed "%MSG_DIAG_WINDIVERT_NO_CONFLICT%"
        ) else (
            call :PrintYellow "%MSG_DIAG_WINDIVERT_RETRY%"

            net stop "WinDivert" >nul 2>&1
            sc delete "WinDivert" >nul 2>&1
            sc query "WinDivert" >nul 2>&1
            if !errorlevel! neq 0 (
                call :PrintGreen "%MSG_DIAG_WINDIVERT_SUCCESS%"
            ) else (
                call :PrintRed "%MSG_DIAG_WINDIVERT_STILL_FAILED%"
            )
        )
    ) else (
        call :PrintGreen "WinDivert successfully removed"
    )
    
    echo:
)

:: Conflicting bypasses
set "conflicting_services=GoodbyeDPI discordfix_zapret winws1 winws2"
set "found_any_conflict=0"
set "found_conflicts="

for %%s in (!conflicting_services!) do (
    sc query "%%s" >nul 2>&1
    if !errorlevel!==0 (
        if "!found_conflicts!"=="" (
            set "found_conflicts=%%s"
        ) else (
            set "found_conflicts=!found_conflicts! %%s"
        )
        set "found_any_conflict=1"
    )
)

if !found_any_conflict!==1 (
    call :PrintRed "%MSG_DIAG_CONFLICT_FOUND% !found_conflicts!"
    
    set "CHOICE="
    set /p "CHOICE=%MSG_DIAG_CONFLICT_REMOVE% "
    if "!CHOICE!"=="" set "CHOICE=N"
    if "!CHOICE!"=="y" set "CHOICE=Y"
    
    if /i "!CHOICE!"=="Y" (
        for %%s in (!found_conflicts!) do (
            call :PrintYellow "%MSG_DIAG_WINDIVERT_STOPPING% %%s"
            net stop "%%s" >nul 2>&1
            sc delete "%%s" >nul 2>&1
            if !errorlevel!==0 (
                call :PrintGreen "%MSG_DIAG_WINDIVERT_REMOVED% %%s"
            ) else (
                call :PrintRed "%MSG_DIAG_WINDIVERT_REMOVE_FAILED% %%s"
            )
        )

        net stop "WinDivert" >nul 2>&1
        sc delete "WinDivert" >nul 2>&1
        net stop "WinDivert14" >nul 2>&1
        sc delete "WinDivert14" >nul 2>&1
    )
    
    echo:
)

:: Discord cache clearing
set "CHOICE="
set /p "CHOICE=%MSG_DIAG_DISCORD_CACHE%  "
if "!CHOICE!"=="" set "CHOICE=Y"
if "!CHOICE!"=="y" set "CHOICE=Y"

if /i "!CHOICE!"=="Y" (
    for %%i in ("Discord.exe" "DiscordPTB.exe" "DiscordCanary.exe") do (
        tasklist /FI "IMAGENAME eq %%i" | findstr /I "%%i" > nul
        if !errorlevel!==0 (
            echo %%i %MSG_DIAG_DISCORD_RUNNING%
            taskkill /IM %%i /F > nul
            if !errorlevel! == 0 (
                call :PrintGreen "%%i %MSG_DIAG_DISCORD_CLOSED%"
            ) else (
                call :PrintRed "%MSG_DIAG_DISCORD_CLOSE_FAILED% %%i"
            )
        )
    )

    set "discordCacheDir=%appdata%\discord"
    set "discordPTBCacheDir=%appdata%\discordptb"
    set "discordCanaryCacheDir=%appdata%\discordcanary"

    echo %MSG_DIAG_DISCORD_CLEANING%
    for %%d in ("Cache" "Code Cache" "GPUCache") do (
        set "dirPath=!discordCacheDir!\%%~d"
        if exist "!dirPath!" (
            rd /s /q "!dirPath!"
            if !errorlevel!==0 (
                call :PrintGreen "%MSG_DIAG_DISCORD_DELETED% !dirPath!"
            ) else (
                call :PrintRed "%MSG_DIAG_DISCORD_DELETE_FAILED% !dirPath!"
            )
        ) else (
            call :PrintRed "!dirPath! %MSG_DIAG_DISCORD_NOT_EXIST%"
        )
    )
    
    if exist "!discordPTBCacheDir!\" (
        echo %MSG_DIAG_DISCORD_PTB_CLEANING%
        for %%d in ("Cache" "Code Cache" "GPUCache") do (
            set "dirPath=!discordPTBCacheDir!\%%~d"
            if exist "!dirPath!" (
                rd /s /q "!dirPath!"
                if !errorlevel!==0 (
                    call :PrintGreen "%MSG_DIAG_DISCORD_DELETED% !dirPath!"
                ) else (
                    call :PrintRed "%MSG_DIAG_DISCORD_DELETE_FAILED% !dirPath!"
                )
            ) else (
                call :PrintRed "!dirPath! %MSG_DIAG_DISCORD_NOT_EXIST%"
            )
        )
    )

    if exist "!discordCanaryCacheDir!\" (
        echo %MSG_DIAG_DISCORD_CANARY_CLEANING%
        for %%d in ("Cache" "Code Cache" "GPUCache") do (
            set "dirPath=!discordCanaryCacheDir!\%%~d"
            if exist "!dirPath!" (
                rd /s /q "!dirPath!"
                if !errorlevel!==0 (
                    call :PrintGreen "%MSG_DIAG_DISCORD_DELETED% !dirPath!"
                ) else (
                    call :PrintRed "%MSG_DIAG_DISCORD_DELETE_FAILED% !dirPath!"
                )
            ) else (
                call :PrintRed "!dirPath! %MSG_DIAG_DISCORD_NOT_EXIST%"
            )
        )
    )
)
echo:

pause
goto menu

:: GAME SWITCH ========================
:game_switch_status
set "gameFlagFile=%~dp0bin\game_filter.enabled"

if exist "%gameFlagFile%" (
    set "GameFilterStatus=%enabled%"
    set "GameFilter=1024-65535"
) else (
    set "GameFilterStatus=%disabled%"
    set "GameFilter=12"
)

set "gameTCPFlagFile=%~dp0bin\game_filtertcp.enabled"

if exist "%gameTCPFlagFile%" (
    set "GameFilterTCPStatus=%enabled%"
    set "GameFilterTCP=1024-65535"
) else (
    set "GameFilterTCPStatus=%disabled%"
    set "GameFilterTCP=12"
)
exit /b

:game_switch
cls

if not exist "%gameFlagFile%" (
    echo %MSG_GAME_ENABLING%
    echo ENABLED > "%gameFlagFile%"
    call :PrintYellow "%MSG_GAME_RESTART%"
) else (
    echo %MSG_GAME_DISABLING%
    del /f /q "%gameFlagFile%"
    call :PrintYellow "%MSG_GAME_RESTART%"
)

pause
goto menu

:game_switch_tcp
cls

if not exist "%gameTCPFlagFile%" (
    echo %MSG_GAME_TCP_ENABLING%
    echo ENABLED > "%gameTCPFlagFile%"
    call :PrintYellow "%MSG_GAME_RESTART%"
) else (
    echo %MSG_GAME_TCP_DISABLING%
    del /f /q "%gameTCPFlagFile%"
    call :PrintYellow "%MSG_GAME_RESTART%"
)

pause
goto menu

:: IPSET SWITCH =======================
:ipset_switch_status
if exist "%~dp0lists/ipset-all.txt" (
    findstr /R "^203\.0\.113\.113/32$" "%~dp0lists\ipset-all.txt" >nul
    if !errorlevel!==0 (
        set "IPsetStatus=%empty%"
    ) else (
        set "IPsetStatus=%loaded%"
    )
) else (
    set "IPsetStatus=%empty%"
)
exit /b

:ipset_switch
cls
set "listFile=%~dp0lists\ipset-all.txt"
if not exist "%listFile%" (
  call :PrintRed "%MSG_IPSET_NOT_DOWNLOADED%"
  pause
  goto menu
)
set "backupFile=%listFile%.backup"

findstr /R "^203\.0\.113\.113/32$" "%listFile%" >nul
if !errorlevel!==0 (
    echo %MSG_IPSET_ENABLING%

    if exist "%backupFile%" (
        del /f /q "%listFile%"
        ren "%backupFile%" "ipset-all.txt"
    ) else (
        echo %MSG_IPSET_NO_BACKUP%
    )

) else (
    echo %MSG_IPSET_DISABLING%

    if not exist "%backupFile%" (
        ren "%listFile%" "ipset-all.txt.backup"
    ) else (
        del /f /q "%backupFile%"
        ren "%listFile%" "ipset-all.txt.backup"
    )

    >"%listFile%" (
        echo 203.0.113.113/32
    )
)

pause
goto menu

:: Utility functions

:PrintGreen
powershell -Command "Write-Host \"%~1\" -ForegroundColor Green"
exit /b

:PrintRed
powershell -Command "Write-Host \"%~1\" -ForegroundColor Red"
exit /b

:PrintYellow
powershell -Command "Write-Host \"%~1\" -ForegroundColor Yellow"
exit /b

:: ===== shizapret =====

:: ===== updater: ipset =====

:ips
cd /d "%~dp0"
call :getsources
cls
call :downloadfile "%IPSET_SOURCE%" "lists/ipset-all.txt" "ipset-all.txt"
if "%~1"=="ext" exit /b
pause
goto menu

:: ===== updater: bin =====

:bin
cd /d "%~dp0"
call :getsources
call :getalgorithm
if exist "params/Updater/EverythingWinws1" (
    cls
    call :downloadfile "https://github.com/bol-van/zapret-win-bundle/raw/refs/heads/master/zapret-winws/winws.exe" "bin" "winws.exe"
    if exist params/Updater/VerifyFiles1 (
        call :verifyfile "https://raw.githubusercontent.com/sch-izo/shizapret/refs/heads/main/.service/hashes/winws.%ALG%" "%~dp0bin/winws.exe" "winws.exe"
    )
)
if exist "params/Updater/EverythingWinDivert1" (
    cls
    call :downloadfile "https://github.com/bol-van/zapret-win-bundle/raw/refs/heads/master/zapret-winws/WinDivert.dll" "bin" "WinDivert.dll"
    if exist params/Updater/VerifyFiles1 (
        call :verifyfile "https://raw.githubusercontent.com/sch-izo/shizapret/refs/heads/main/.service/hashes/windivert.%ALG%" "%~dp0bin/WinDivert.dll" "WinDivert.dll"
    )
)
if exist "params/Updater/EverythingWinDivert641" (
    cls
    call :downloadfile "https://github.com/bol-van/zapret-win-bundle/raw/refs/heads/master/zapret-winws/WinDivert64.sys" "bin" "WinDivert64.sys"
    if exist params/Updater/VerifyFiles1 (
        call :verifyfile "https://raw.githubusercontent.com/sch-izo/shizapret/refs/heads/main/.service/hashes/windivert64.%ALG%" "%~dp0bin/WinDivert64.sys" "WinDivert64.sys"
    )
)
if exist "params/Updater/EverythingCygwin11" (
    cls
    call :downloadfile "https://github.com/bol-van/zapret-win-bundle/raw/refs/heads/master/zapret-winws/cygwin1.dll" "bin" "cygwin1.dll"
    if exist params/Updater/VerifyFiles1 (
        call :verifyfile "https://raw.githubusercontent.com/sch-izo/shizapret/refs/heads/main/.service/hashes/cygwin1.%ALG%" "%~dp0bin/cygwin1.dll" "cygwin1.dll"    )
)
if "%~1"=="ext" exit /b
pause
goto menu

:: ===== updater: list =====

:list
cd /d "%~dp0"
call :getsources
cls
call :downloadfile "%LIST_SOURCE%" "lists\list-general.txt" "list-general.txt"
if "%~1"=="ext" exit /b
pause
goto menu

:: ===== updater: everything =====

:et
cd /d "%~dp0"
cls
call :bin
if exist "params/Updater/EverythingIPSet1" (
    cls
    call :ips
)
if exist "params/Updater/EverythingList1" (
    cls
    call :list
)
pause
goto menu

:: ===== settings =====

:settings
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cls

:: check settings

call :getsources

if not exist "params/AutoUpdater/AutoUpdate1" (
    set "autoupdate=%disabled%"
) else (
    set "autoupdate=%enabled%"
)

if not exist "params/Updater/EverythingCygwin11" (
    set "cygwin1=%disabled%"
) else (
    set "cygwin1=%enabled%"
)

if not exist "params/Updater/EverythingWinDivert1" (
    set "windivert=%disabled%"
) else (
    set "windivert=%enabled%"
)

if not exist "params/Updater/EverythingWinDivert641" (
    set "windivert64=%disabled%"
) else (
    set "windivert64=%enabled%"
)

if not exist "params/Updater/EverythingWinws1" (
    set "winws=%disabled%"
) else (
    set "winws=%enabled%"
)

if not exist "params/Updater/EverythingIPSet1" (
    set "ipset=%disabled%"
) else (
    set "ipset=%enabled%"
)

if not exist "params/Updater/EverythingList1" (
    set "general=%disabled%"
) else (
    set "general=%enabled%"
)

if not exist "params/Updater/VerifyFiles1" (
    set "verifywhenupdate=%disabled%"
) else (
    set "verifywhenupdate=%enabled%"
)

echo %MSG_SETTINGS_RECEIVING%

if not defined defaultipsetsource (
for /f "delims=" %%A in ('powershell -command "(Invoke-WebRequest -Uri "https://raw.githubusercontent.com/sch-izo/shizapret/refs/heads/main/params/DownloadSources/IPSetSource" -TimeoutSec 5).Content.Trim()" 2^>nul') do set "defaultipsetsource=%%A"
)

if not defined defaultlistsource (
for /f "delims=" %%A in ('powershell -command "(Invoke-WebRequest -Uri "https://raw.githubusercontent.com/sch-izo/shizapret/refs/heads/main/params/DownloadSources/ListSource" -TimeoutSec 5).Content.Trim()" 2^>nul') do set "defaultlistsource=%%A"
)

call :getalgorithm

cls

set "listdefault="
if "%LIST_SOURCE%"=="%defaultlistsource%" set "listdefault=(Default)"

set "ipsetdefault="
if "%IPSET_SOURCE%"=="%defaultipsetsource%" set "ipsetdefault=(Default)"

set "settings_choice=null"
if not defined defaultipsetsource (
    set "defaultipsetsource=https://raw.githubusercontent.com/sch-izo/shizapret/refs/heads/main/.service/ipset-all.txt"
    echo %MSG_SETTINGS_COULD_NOT% IP Set "%defaultipsetsource%".
)
if not defined defaultlistsource (
    set "defaultlistsource=https://raw.githubusercontent.com/bol-van/rulist/refs/heads/main/reestr_hostname.txt"
    echo %MSG_SETTINGS_COULD_NOT% list "%defaultlistsource%".
)
echo =======%MSG_SETTINGS_TITLE%========
echo 1. %MSG_SETTINGS_UPDATE_START% %autoupdate%
echo 2. %MSG_SETTINGS_UPDATE_CYGWIN% %cygwin1%
echo 3. %MSG_SETTINGS_UPDATE_WINDIVERT% %windivert%
echo 4. %MSG_SETTINGS_UPDATE_WINDIVERT64% %windivert64%
echo 5. %MSG_SETTINGS_UPDATE_WINWS% %winws%
echo 6. %MSG_SETTINGS_UPDATE_IPSET% %ipset%
echo 7. %MSG_SETTINGS_UPDATE_LIST% %general%
echo 8. %MSG_SETTINGS_VERIFY% %verifywhenupdate%
echo 9. %MSG_SETTINGS_LIST_SOURCE% %LIST_SOURCE% %listdefault%
echo 10. %MSG_SETTINGS_IPSET_SOURCE% %IPSET_SOURCE% %ipsetdefault%
echo 11. %MSG_SETTINGS_HASH_ALG% %ALG%
echo 0. %MSG_SETTINGS_BACK%
set /p settings_choice=%MSG_SETTINGS_CHANGE% 

if "%settings_choice%"=="1" call :switchsetting "params\AutoUpdater\AutoUpdate1"
if "%settings_choice%"=="2" call :switchsetting "params\Updater\EverythingCygwin11"
if "%settings_choice%"=="3" call :switchsetting "params\Updater\EverythingWinDivert1"
if "%settings_choice%"=="4" call :switchsetting "params\Updater\EverythingWinDivert641"
if "%settings_choice%"=="5" call :switchsetting "params\Updater\EverythingWinws1"
if "%settings_choice%"=="6" call :switchsetting "params\Updater\EverythingIPSet1"
if "%settings_choice%"=="7" call :switchsetting "params\Updater\EverythingList1"
if "%settings_choice%"=="8" call :switchsetting "params\Updater\VerifyFiles1"
if "%settings_choice%"=="9" goto setlistsource
if "%settings_choice%"=="10" goto setipsetsource
if "%settings_choice%"=="11" goto setalgorithm
if "%settings_choice%"=="0" goto menu
goto settings

:switchsetting
if not exist "%~1" (
    echo ENABLED > "%~1"
) else (
    del /f /q "%~1"
)
goto settings

:: ===== set ipset source =====

:setipsetsource

echo %MSG_SETTINGS_RECEIVING% IP Set...

if not defined defaultipsetsource (
for /f "delims=" %%A in ('powershell -command "(Invoke-WebRequest -Uri "https://raw.githubusercontent.com/sch-izo/shizapret/refs/heads/main/params/DownloadSources/IPSetSource" -TimeoutSec 5).Content.Trim()" 2^>nul') do set "defaultipsetsource=%%A"
)

if not defined defaultipsetsource (
    set "defaultipsetsource=https://raw.githubusercontent.com/sch-izo/shizapret/refs/heads/main/.service/ipset-all.txt"
    echo %MSG_SETTINGS_COULD_NOT% IP Set "%defaultipsetsource%".
)

cls
echo %MSG_SOURCE_CURRENT% %IPSET_SOURCE% %ipsetdefault%
echo ==============================
echo %MSG_SOURCE_ENTER_0%
echo %MSG_SOURCE_ENTER_1%
echo ==============================

set "IPSET_SOURCE_INPUT=0"
set /p IPSET_SOURCE_INPUT=%MSG_SOURCE_NEW_IPSET% 

:: static commands

if "%IPSET_SOURCE_INPUT%"=="0" goto settings
if "%IPSET_SOURCE_INPUT%"=="1" set "IPSET_SOURCE_INPUT=%defaultipsetsource%"

:: set source

echo %IPSET_SOURCE_INPUT%> params/DownloadSources/IPSetSource
set "IPSET_SOURCE=%IPSET_SOURCE_INPUT%"

goto settings

:: ===== set list source =====

:setlistsource

echo %MSG_SETTINGS_RECEIVING% list...

if not defined defaultlistsource (
for /f "delims=" %%A in ('powershell -command "(Invoke-WebRequest -Uri "https://raw.githubusercontent.com/sch-izo/shizapret/refs/heads/main/params/DownloadSources/ListSource" -TimeoutSec 5).Content.Trim()" 2^>nul') do set "defaultlistsource=%%A"
)

if not defined defaultlistsource (
    set "defaultlistsource=https://raw.githubusercontent.com/bol-van/rulist/refs/heads/main/reestr_hostname.txt"
    echo %MSG_SETTINGS_COULD_NOT% list "%defaultlistsource%".
)

cls
echo %MSG_SOURCE_CURRENT% %LIST_SOURCE% %listdefault%
echo ==============================
echo %MSG_SOURCE_ENTER_0%
echo %MSG_SOURCE_ENTER_1%
echo ==============================

set "LIST_SOURCE_INPUT=0"
set /p LIST_SOURCE_INPUT=%MSG_SOURCE_NEW_LIST% 

:: static commands

if "%LIST_SOURCE_INPUT%"=="0" goto settings
if "%LIST_SOURCE_INPUT%"=="1" set "LIST_SOURCE_INPUT=%defaultlistsource%"

:: set source

echo %LIST_SOURCE_INPUT%> params/DownloadSources/ListSource
set "LIST_SOURCE=%LIST_SOURCE_INPUT%"

goto settings

:: ===== set algorithm =====

:setalgorithm

cls
echo %MSG_ALG_CURRENT% %ALG%, %MSG_ALG_DEFAULT% SHA512
echo ==============================
echo %MSG_SOURCE_ENTER_0%
echo 1. SHA1 (160-bit)
echo 2. SHA256 (256-bit)
echo 3. SHA384 (384-bit)
echo 4. SHA512 (512-bit)
echo 5. MD5 (128-bit)
echo ==============================

set "IPSET_SOURCE_INPUT=0"
set /p IPSET_SOURCE_INPUT=%MSG_ALG_NEW% 

:: static commands

if "%IPSET_SOURCE_INPUT%"=="0" goto settings
if "%IPSET_SOURCE_INPUT%"=="1" call :switchalgorithm "SHA1"
if "%IPSET_SOURCE_INPUT%"=="2" call :switchalgorithm "SHA256"
if "%IPSET_SOURCE_INPUT%"=="3" call :switchalgorithm "SHA384"
if "%IPSET_SOURCE_INPUT%"=="4" call :switchalgorithm "SHA512"
if "%IPSET_SOURCE_INPUT%"=="5" call :switchalgorithm "MD5"

:switchalgorithm
echo %~1> %~dp0params/Verifier/HashAlgorithm
goto settings

:: ===== verify all files =====

:verifyall

cls
call :getalgorithm
if exist "%~dp0bin/winws.exe" (
    call :verifyfile "https://raw.githubusercontent.com/sch-izo/shizapret/refs/heads/main/.service/hashes/winws.%ALG%" "%~dp0bin/winws.exe" "winws.exe"
)
if exist "%~dp0bin/WinDivert64.sys" (
    call :verifyfile "https://raw.githubusercontent.com/sch-izo/shizapret/refs/heads/main/.service/hashes/windivert64.%ALG%" "%~dp0bin/WinDivert64.sys" "WinDivert64.sys"
)
if exist "%~dp0bin/WinDivert.dll" (
    call :verifyfile "https://raw.githubusercontent.com/sch-izo/shizapret/refs/heads/main/.service/hashes/windivert.%ALG%" "%~dp0bin/WinDivert.dll" "WinDivert.dll"
)
if exist "%~dp0bin/cygwin1.dll" (
    call :verifyfile "https://raw.githubusercontent.com/sch-izo/shizapret/refs/heads/main/.service/hashes/cygwin1.%ALG%" "%~dp0bin/cygwin1.dll" "cygwin1.dll"
)
pause
goto menu

:: ===== function: get download sources =====

:getsources

set /p IPSET_SOURCE=<%~dp0params/DownloadSources/IPSetSource
set /p LIST_SOURCE=<%~dp0params/DownloadSources/ListSource
exit /b

:: ===== function: get hash algorithm =====

:getalgorithm

set /p ALG=<%~dp0params/Verifier/HashAlgorithm
exit/b

:: ===== function: download file =====

:downloadfile

:: call :downloadfile (uri) (destination) (name)
:: call :downloadfile "github.com/example.txt" "bin/example.bin" "Example" 

echo %MSG_DOWNLOAD% %~3...
echo %MSG_DOWNLOAD_SOURCE% %~1
powershell -Command "Start-BitsTransfer -Source \"%~1\" -Destination \"%~2\" -DisplayName \"%~3\" -Description \" \""
exit /b

:: ===== function: verify file hash =====

:verifyfile

:: call :verifyfile (hash uri) (file to verify) (name)
:: call :verifyfile "github.com/example.%ALG%" "bin/example.bin" "Example"

echo %MSG_VERIFY% %~3...
for /f "delims=" %%A in ('powershell -command "(Invoke-WebRequest -Uri \"%~1\" -Headers @{\"Cache-Control\"=\"no-cache\"} -TimeoutSec 5).Content.Trim()" 2^>nul') do set "CORRECTHASH=%%A"

for /f "tokens=2 delims=: " %%A in ('powershell -Command "Get-FileHash %~2 -Algorithm %ALG% | Format-List -Property Hash"') do set "LOCALHASH=%%A"
if not defined CORRECTHASH (
    call :PrintYellow "%MSG_VERIFY_NO_REACH% %~1 %MSG_VERIFY_TO_VERIFY% %~3. %MSG_VERIFY_YOUR_HASH% %LOCALHASH%"
    exit /b
)
if "%LOCALHASH%"=="%CORRECTHASH%" (
    call :PrintGreen "%~3 %MSG_VERIFY_SUCCESS% %LOCALHASH%"
) else (
    call :PrintRed "%~3 %MSG_VERIFY_FAILED% %LOCALHASH%, %MSG_VERIFY_CORRECT% %CORRECTHASH%"
    pause
)
exit /b
