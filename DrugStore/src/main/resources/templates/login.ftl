<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Вход</title>
</head>
<body>
<h1>Вход</h1>
<div>
    <#if error??>
        Неверное имя пользователя или пароль
    </#if>
</div>
<div>
    <#if logout??>
        Вы вышли из системы
    </#if>
</div>
<#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
    <div class="alert alert-danger" role="alert">
        ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
    </div>
</#if>
<form method="post">
<#--    <div class="form-group row">-->
<#--        <label class="col-sm-2 col-form-label">Имя пользователя :</label>-->
<#--        <div class="col-sm-6">-->
<#--            <input type="text" name="username" value="<#if user??>${user.username}</#if>"-->
<#--                   class="form-control ${(usernameError??)?string('is-invalid', '')}"-->
<#--                   placeholder="Введите имя пользователя"/>-->
<#--            <#if usernameError??>-->
<#--                <div class="invalid-feedback">-->
<#--                    ${usernameError}-->
<#--                </div>-->
<#--            </#if>-->
<#--        </div>-->
<#--    </div>-->
<#--    <div class="form-group row">-->
<#--        <label class="col-sm-2 col-form-label">Пароль:</label>-->
<#--        <div class="col-sm-6">-->
<#--            <input type="password" name="password"-->
<#--                   class="form-control ${(passwordError??)?string('is-invalid', '')}"-->
<#--                   placeholder="Введите пароль"/>-->
<#--            <#if passwordError??>-->
<#--                <div class="invalid-feedback">-->
<#--                    ${passwordError}-->
<#--                </div>-->
<#--            </#if>-->
<#--        </div>-->
<#--    </div>-->
<#--    <div class="form-group row">-->
<#--        <label class="col-sm-2 col-form-label">Электронная почта:</label>-->
<#--        <div class="col-sm-6">-->
<#--            <input type="email" name="email" value="<#if user??>${user.email}</#if>"-->
<#--                   class="form-control ${(emailError??)?string('is-invalid', '')}"-->
<#--                   placeholder="some@gmail.com"/>-->
<#--            <#if emailError??>-->
<#--                <div class="invalid-feedback">-->
<#--                    ${emailError}-->
<#--                </div>-->
<#--            </#if>-->
<#--        </div>-->
<#--    </div>-->
<#--    <input type="hidden" name="_csrf" value="${_csrf.token}"/>-->
<#--    <a href="/registration">Зарегистрироваться</a>-->
<#--    <button class="btn btn-primary" type="submit">Войти</button>-->

        <#if error??>
            <h4 style="color: crimson">Неправильный логин или пароль</h4>
        </#if>

        <h1 class="form__title">Login</h1>
        <div class="form__group">
            <input class="form__input" name="email" placeholder=" " type="email">
            <label class="form__label">Email</label>
        </div>
        <div class="form__group">
            <input class="form__input" type="password" name="password" placeholder=" ">
            <label class="form__label">Password</label>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="form_button">Sign in</button>
</form>
</body>
</html>