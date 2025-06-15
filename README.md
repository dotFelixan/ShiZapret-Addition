<div align="center">
Форк https://github.com/Flowseal/zapret-discord-youtube c автообновлением и с обходом блокировок от 10/6/2025. Все источники находятся в начале shizapret.bat.

Альтернатива https://github.com/bol-van/zapret-win-bundle и https://github.com/Flowseal/zapret-discord-youtube
</div>
<div align="center" style="line-height: 1;">
  <a href="https://www.github.com/sch-izo/shizapret/releases/"><img alt="downloads"
    src="https://img.shields.io/github/downloads/sch-izo/shizapret/total"/></a>
  <a href="https://www.github.com/sch-izo/shizapret/releases/"><img alt="release"
    src="https://img.shields.io/github/v/release/sch-izo/shizapret"/></a>
  <a href="https://www.github.com/sch-izo/shizapret/tree/main"><img alt="code size"
    src="https://img.shields.io/github/languages/code-size/sch-izo/shizapret"/></a>
  <a href="https://www.github.com/sch-izo/shizapret/releases/latest"><img alt="downloads@latest"
    src="https://img.shields.io/github/downloads/sch-izo/shizapret/latest/total"/></a>
</div>

> [!CAUTION]
>
> ### АНТИВИРУСЫ
> WinDivert может вызвать реакцию антивируса.
> WinDivert - это инструмент для перехвата и фильтрации трафика, необходимый для работы zapret.
> Замена iptables и NFQUEUE в Linux, которых нет под Windows.
> Он может использоваться как хорошими, так и плохими программами, но сам по себе не является вирусом.
> Драйвер WinDivert64.sys подписан для возможности загрузки в 64-битное ядро Windows.
> Но антивирусы склонны относить подобное к классам повышенного риска или хакерским инструментам.
> В случае проблем используйте исключения или выключайте антивирус совсем.
>
> **Выдержка из [`readme.md`](https://github.com/bol-van/zapret-win-bundle/blob/master/readme.md#%D0%B0%D0%BD%D1%82%D0%B8%D0%B2%D0%B8%D1%80%D1%83%D1%81%D1%8B) репозитория [bol-van/zapret-win-bundle](https://github.com/bol-van/zapret-win-bundle)*

> [!IMPORTANT]
> Все файлы в папке [`bin`](./bin) скачиваются из [zapret-win-bundle/zapret-winws](https://github.com/bol-van/zapret-win-bundle/tree/master/zapret-winws). Вы можете это проверить с помощью хэшей/контрольных сумм.

## ❤Использование

1. Загрузите архив (zip) со [страницы последнего релиза](https://github.com/sch-izo/shizapret/releases/latest)

2. Распакуйте содержимое архива по пути, который не содержит кириллицу (русские буквы)/специальные символы.

3. Запустите [shizapret.bat](./shizapret.bat). Файл за вас все установит и обновит.

4. Рекомендуется часто обновлять файлы с помощью [update.bat](./update.bat), нажав 0.

## ⚙️Настройки

Чтобы включить, добавьте 1 в конце параметра. Пример:
```
EverythingCygwin1 = Выключено
EverythingCygwin11 = Включено
```

## ℹ️Краткие описания файлов

- [**`update.bat`**](./update.bat) - обновление файлов

- [**`shizapret.bat`**](./shizapret.bat) - запуск со стратегией для обхода блокировок Роскомнадзора

- [**`service.bat`**](./service.bat) - установка на автозапуск (`Install Service`), удаление из автозапуска (`Remove Services`), проверка сервисов, диагностика, проверка обновлений

### Сайты не работают

- **Обновитесь на [самую новую версию](https://www.github.com/sch-izo/shizapret/releases/latest)**

- **Включите QUIC в браузере:**

  Chromium (Chrome, Brave, Edge, Yandex и др.): В chrome://flags найти "QUIC" и включить найденный параметр.

  Gecko (Firefox, Waterfox и др.): В about:config найти "network.http.http3.retry_different_ip_family" и поставить найденный параметр на true.

- **Попробуйте включить DNS в браузере**

  Почти во всех браузерах настройки DNS находятся в настройках приватности. Я рекомендую эти DNS-сервера:
  
  Quad9: 9.9.9.9 (приватность)

  Cloudflare: 1.1.1.1

  Google: 8.8.8.8

### Обход не работает

> [!IMPORTANT]
> **Стратегии блокировок со временем изменяются.**
> Определенная стратегия обхода zapret может работать какое-то время, но если меняется способ блокировки или обнаружения обхода блокировки, то она перестанет работать.
> В репозитории представлены множество различных стратегий для обхода. Если ни одна из них вам не помогает, то вам необходимо создать новую, взяв за основу одну из представленных здесь и изменив её параметры.
> Информацию про параметры стратегий вы можете найти [тут](https://github.com/bol-van/zapret/blob/master/docs/readme.md#nfqws).

- Обновите файлы в папке [`bin`](./bin), открыв [update.bat](./update.bat) и нажав 3.

### Не работает вместе с VPN

- Отключите функцию **TUN** (Tunneling) в настройках вашего VPN

### При удалении с помощью [**`service.bat`**](./service.bat), WinDivert остается в службах

1. Узнайте название службы с помощью команды, в командной строке Windows (Win+R, `cmd`):

```cmd
driverquery | find "Divert"
```

2. Остановите и удалите службу командами:

```cmd
sc stop {название, которые вы узнали в шаге 1}

sc delete {название, которые вы узнали в шаге 1}
```

### Не нашли своей проблемы

* Создайте её [тут](https://github.com/sch-izo/shizapret/issues)

## ⭐Поддержка проекта

Вы можете поддержать проект, поставив :star: этому форку (сверху справа этой страницы)

Также, вы можете материально поддержать разработчика zapret [тут](https://github.com/bol-van/zapret/issues/590#issuecomment-2408866758)

💖 Отдельная благодарность разработчику [zapret](https://github.com/bol-van/zapret) - [bol-van](https://github.com/bol-van)
