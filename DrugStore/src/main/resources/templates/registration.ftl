<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Регистрация</title>
</head>
<body>
<h1>Регистрация</h1>
<div>
    <#if message??>
        Пользователь с такими данными уже существует!
    </#if>
</div>
<form action="/registration" method="post">
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
<#--        <label class="col-sm-2 col-form-label">Пароль:</label>-->
<#--        <div class="col-sm-6">-->
<#--            <input type="password" name="password2"-->
<#--                   class="form-control ${(password2Error??)?string('is-invalid', '')}"-->
<#--                   placeholder="Введите пароль еще раз"/>-->
<#--            <#if password2Error??>-->
<#--                <div class="invalid-feedback">-->
<#--                    ${password2Error}-->
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
<#--    <button class="btn btn-primary" type="submit">Зарегистрироваться</button>-->

    <h1 class="form__title">Sign Up</h1>
    <div class="form__group">
        <input class="form__input" name='username' placeholder=" ">
        <label class="form__label">First Name</label>
    </div>
    <div class="form__group">
        <input class="form__input" id="email" name='email' type="email" placeholder=" " value="" pattern="^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$">
        <label class="form__label">Email</label>
    </div>
    <div class="form__group">
        <input class="form__input" name="password" type="password" placeholder=" ">
        <label class="form__label">Password</label>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button class="form_button">Sign Up</button>
</form>
</body>
</html>