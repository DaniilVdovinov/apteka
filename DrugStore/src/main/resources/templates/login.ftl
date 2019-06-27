<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Вход</title>
    <link rel="stylesheet" href="../static/css/sign.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div>
    <#if logout??>
        Вы вышли из системы
    </#if>
</div>
<form method="post" class="form-signin">
    <a href="/home">
        <img class="nav-img" style="width: 100%" src='https://s8.hostingkartinok.com/uploads/images/2019/06/df320380ecdc2f42f71085655399e267.png' alt='Logo.png' />
    </a>
    <h1 class="h1_project" style="color: #d5423b; text-align: center; margin: 25px;">
        ВХОД
    </h1>
    <#if error??>
        <h4 style="color: crimson">Неправильный логин или пароль</h4>
    </#if>
    <div class="form__group">
        <input class="form__input" name="email" placeholder="Логин" type="email" required autofocus>
    </div>
    <div class="form__group">
        <input class="form__input" type="password" name="password" placeholder="Пароль" required>
    </div>
    <div style="text-align:center;">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="form_button" style="color: white">ВОЙТИ</button>
</form>
<form action="/registration" method="get" class="form-signin">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button class="form_button" style="color: white">РЕГИСТРАЦИЯ</button>
</form>
</div>

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