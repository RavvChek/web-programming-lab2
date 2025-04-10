# WebApp: Проверка попадания точки в область

Веб-приложение, реализующее проверку попадания точки на координатной плоскости в заданную область. Разработано на базе **Java Servlets** и **JSP** с применением шаблона проектирования **MVC**. Приложение развёртывается на сервере приложений **WildFly**.

## 📌 Функциональность

- Ввод координат точки и радиуса области через веб-форму.
- Интерактивная графика: клик по области с учётом текущего радиуса отправляет координаты на сервер.
- Отображение результатов в виде таблицы.
- Валидация значений на клиенте с помощью JavaScript.
- Поддержка истории запросов через HTTP-сессию или другие Java EE-механизмы.

## 🧩 Архитектура

### 📎 `ControllerServlet`
- Главный контроллер, обрабатывающий все входящие HTTP-запросы.
- Делегирует:
  - На `AreaCheckServlet`, если в запросе содержатся координаты и радиус.
  - На JSP-страницу, если параметры отсутствуют.

### 📎 `AreaCheckServlet`
- Выполняет проверку попадания точки в заданную область.
- Генерирует HTML-ответ с результатами и таблицей проверок.

### 📎 JSP-страница
- Отображает:
  - Веб-форму с полями для ввода координат и радиуса.
  - Интерактивное изображение координатной плоскости.
  - Результаты предыдущих проверок.
- Содержит:
  - Шапку с ФИО, группой и номером варианта.
  - JavaScript-валидацию и обработку кликов по изображению.

## 🧪 Используемые технологии

- **Java EE / Jakarta EE** (Servlets, JSP)
- **HTML / CSS / JavaScript**
- **WildFly Application Server**
- **MVC (Model-View-Controller)**

Баянов Равиль - @RavvChek
