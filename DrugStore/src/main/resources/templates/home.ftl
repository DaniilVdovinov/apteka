<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search</title>
    <link rel="stylesheet" type="text/css" href="../static/css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body onscroll="show('btn-up')">
<nav class="navigation">
    <img class="nav-img"
         src='https://s8.hostingkartinok.com/uploads/images/2019/06/df320380ecdc2f42f71085655399e267.png'
         alt='Logo.png'/>
    <div class="login-out" style="right: 70px !important; top: 50px !important;">
        <form action="/logout" method="post" style="display: inline; float: right; padding-left: 3px">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="form-button" type="submit">Sign Out</button>
        </form>
        <form action="/profile" method="get" style="display: inline; float: right; padding-right: 3px">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="form-button" type="submit">Профиль</button>
        </form>
    </div>
</nav>

<div class="searching-form">
    <div class="search-container">
        <#if items??>
            <div id="map"></div>
        </#if>
        <form action="/search" method="get">
            <input id="name" name="name" type="text" class="form-control" placeholder="Введите название лекарства...">
            <input class="btn-search" type="submit" value="Поиск">
        </form>

        <div class="text-left">
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
    </div>
</div>

<a href="#" id="btn-up" title="Вернуться к началу" class="topbutton" style="display: none;">Наверх</a>

<#if error??>
</#if>
<div class="container">
    <#if items??>
        <table>
            <#list items as item>
            <div class="product-item">
                <div class="row">
                    <div class="col-3">
                        <img src="${item.img}" id="img">
                    </div>
                    <div class="col-9">
                        <h3>${item.name}</h3>
                        <span class="price1">Стоимость: ${item.price} руб.</span>
                        <p><a href="${item.href}"> В аптеку</a></p>
                    </div>
                    <div class="col-2">
                        <input type="submit" aria-label="Favorite" id="${item.href}" name="${item.href}" onclick="sendHref(${item.href})" value="В избранное">
                    </div>
                    <hr width="700" color="#000000" size="1">
                </div>
                </#list>
        </table>
    </#if>
</div>

<style>
    .form-button {
        background-color: #c64d43 !important;
        width: 120px !important;
        height: 50px !important;
        border-radius: 5px solid #c64d43;
        color: white;
    }

    .btn-search {
        float: left;
        display: inline !important;
        font-weight: 400;
        margin-left: 6px !important;
        color: #212529;
        background-color: #e3f2fd;
        text-align: center;
        vertical-align: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        opacity: 50%;
        border: 1px solid #87CEEB;
        padding: .375rem .75rem;
        font-size: 1rem;
        line-height: 1.5;
        border-radius: .25rem;
        transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out
    }

    .btn-search:hover {
        color: #000000;
        background-color: rgba(168, 216, 255, .5);
        border-color: #87CEEB;
    }

    .btn-search:focus {
        box-shadow: 0 0 0 .2rem rgba(168, 216, 255, .5);
    }

    .search-container {
        vertical-align: center;
        margin: 30px;
        display: inline-block;
    }

    .form-control {
        display: inline;
        float: left;
        width: 547px;
        height: calc(1.5em + .75rem + 2px);
        padding: .375rem .75rem;
        font-size: 1rem;
        font-weight: 400;
        line-height: 1.5;
        color: #495057;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #ced4da;
        border-radius: .25rem;
        transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out
    }
</style>

<script>
    // function sender(href) {
    //     console.log(href);
    //     $.ajax({
    //         type: 'post',
    //         url: '/search/add',
    //         data: {
    //             href: href
    //         }
    //     })
    // }

    function sendHref(href) {
        $.ajax({
            type: 'get',
            url: '/add?href=' + href,
            data: {
                href: href
            }
        }).done(function (data) {
            location.reload();
        })
    }

    function show(id) {
        elem = document.getElementById(id);
        state = elem.style.display;
        if (state === 'none') elem.style.display = '';
    }
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://api-maps.yandex.ru/2.1/?apikey=f2063206-fe46-4935-9921-9abf9987ebec&lang=ru_RU"
        type="text/javascript"></script>
<script src="../static/js/map/Map.js"></script>
<script src="../static/js/map/AptekaRu.js"></script>
<script src="../static/js/map/Rigla.js"></script>
<script src="../static/js/map/Sakura.js"></script>

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