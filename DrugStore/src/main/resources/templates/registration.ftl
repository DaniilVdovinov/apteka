<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Регистрация</title>
    <link rel="stylesheet" href="../static/css/sign.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<div>
    <#if message??>
        Пользователь с такими данными уже существует!
    </#if>
</div>

<form action="/registration" method="post" class="form-signin">
    <a href="/home">
        <img class="nav-img" style="width: 100%" src='https://s8.hostingkartinok.com/uploads/images/2019/06/df320380ecdc2f42f71085655399e267.png' alt='Logo.png' />
    </a>
    <h1 class="h1_project" style="color: #d5423b; text-align: center; margin: 25px;">
        РЕГИСТРАЦИЯ
    </h1>
    <div class="form__group">
        <input class="form__input" name="firstName" placeholder="Имя" type="text">
    </div>
    <div class="form__group">
        <input class="form__input" name="lastName" placeholder="Фамилия" type="text">
    </div>
    <div class="form__group">
        <input class="form__input" name="email" placeholder="Электронная почта" type="email">
    </div>
    <div class="form__group">
        <input class="form__input" type="password" name="password" placeholder="Пароль">
    </div>
    <div style="text-align:center;">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="form_button" style="color: white">ВОЙТИ</button>
    </div>
    <script>
        function showError(container, errorMessage) {
            container.className = 'error';
            var msgElem = document.createElement('span');
            msgElem.className = "error-message";
            msgElem.innerHTML = errorMessage;
            container.appendChild(msgElem);
        }
        function resetError(container) {
            container.className = '';
            if (container.lastChild.className == "error-message") {
                container.removeChild(container.lastChild);
            }
        }
        function validate(form) {
            var elems = form.elements;
            resetError(elems.firstName.parentNode);
            if (!elems.firstName.value) {
                showError(elems.firstName.parentNode, ' Укажите Ваше имя.');
                return false;
            }
            resetError(elems.lastName.parentNode);
            if (!elems.lastName.value) {
                showError(elems.lastName.parentNode, ' Укажите Вашу фамилию.');
                return false;
            }
            resetError(elems.email.parentNode);
            if (!elems.email.value) {
                showError(elems.email.parentNode, ' Укажите электронную почту.');
                return false;
            }
            resetError(elems.password.parentNode);
            if (!elems.password.value) {
                showError(elems.password.parentNode, ' Укажите пароль.');
                return false;
            }
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
</body>
</html>