<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Search</title>
    <link rel="stylesheet" type="text/css" href="../static/css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<#--<script>-->
<#--    function show(id) {-->
<#--        elem = document.getElementById(id);-->
<#--        state = elem.style.display;-->
<#--        if (state === 'none') elem.style.display = '';-->
<#--    }-->
<#--</script>-->

<body>
<nav class="navigation" style="background-color: #ffffff;">
    <a href="/home">
        <img class="nav-img" src='https://s8.hostingkartinok.com/uploads/images/2019/06/df320380ecdc2f42f71085655399e267.png' alt='Logo.png' />
    </a>
    <div class="login-out">
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input type="submit" value="Sign Out"/>
        </form>
    </div>
</nav>

<#--<a href="#" id="btn-up" title="Вернуться к началу" class="topbutton" style="display: none;">Наверх</a>-->

<h5>${firstName} ${lastName}</h5>

<div class="container">
    <#if items??>
    <table>
        <#list items as item>
            <div class="product-item">
                <div class="row" style="margin: 0 0 20px 0;">
                    <div class="col-3" style="padding: 0 0 0 80px;"><img src="${item.img}"
                                                                         style="width: 100px; height: 100px; text-align: right">
                    </div>
                    <div class="col-9" style="padding:30px">
                        <h3>${item.name}</h3>
                        <span class="price1">Стоимость: ${item.price} руб.</span>
                        <p><a href="${item.href}"> В аптеку</a></p>
                    </div>
                </div>
            </div>
        </#list>
        </#if>
    </table>
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