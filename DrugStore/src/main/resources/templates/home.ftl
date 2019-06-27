<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Search</title>
    <link rel="stylesheet" type="text/css" href="../static/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <script src="map/AptekaRu.js" type="text/javascript"></script>
    <script src="map/Rigla.js" type="text/javascript"></script>
    <script src="map/Sakura.js" type="text/javascript"></script>
    <script src="https://api-maps.yandex.ru/2.1/?apikey=f2063206-fe46-4935-9921-9abf9987ebec&lang=ru_RU" type="text/javascript"></script>
    <script src="map/Map.js" type="text/javascript"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <img style="width:100%" src='https://s8.hostingkartinok.com/uploads/images/2019/06/df320380ecdc2f42f71085655399e267.png' alt='Logo.png' />
    <a class="navbar-brand" href="/home">
<#--        <img src="/docs/4.3.1/assets/brand/bootstrap-solid.svg" width="30" height="30" class="d-inline-block align-top"-->
<#--             alt="">-->
    </a>
    <form action="/user/profile" method="get">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <input type="submit" value="Профиль"/>
    </form>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <input type="submit" value="Sign Out"/>
    </form>
</nav>

<div id="map" style="width: 600px; height: 400px"></div>

<div class="jumbotron jumbotron-fluid" style="background-color: #e3f2fd !important;margin: 20px">
    <div class="container" style="margin: 30px">
        <h3 class="text-center">Поиск лекарств</h3>
        <form action="/search" method="get">
            <input id="name" name="name" type="text" class="form-control" placeholder="Введите название">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input class="btn btn-outline-primary my-2 my-sm-0" type="submit" value="Поиск">
        </form>
    </div>
</div>

<#if error??>
    <h4>Введите название лекарства и нажмите "Поиск"</h4>
</#if>
<div class="container">
    <#if items??>

    <div class="text-right">
        <div class="btn-group" role="group">
            <button id="btnGroupDrop1" type="button" class="btn btn-outline-primary dropdown-toggle"
                    data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                Цена по
            </button>
            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                <a class="dropdown-item" href="/sort/sort">По возрастанию</a>
                <a class="dropdown-item" href="/sort/reverse">По убыванию</a>
            </div>
        </div>
    </div>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.2/TweenMax.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/3.2.0/imagesloaded.pkgd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.5/ScrollMagic.min.js"></script>

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