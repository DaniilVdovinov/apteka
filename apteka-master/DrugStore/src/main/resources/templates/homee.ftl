<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Search</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href="#">
        <img src="/docs/4.3.1/assets/brand/bootstrap-solid.svg" width="30" height="30" class="d-inline-block align-top" alt="">
        Название
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
<!--            <li class="nav-item active">-->
<!--                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>-->
<!--            </li>-->
<!--            <li class="nav-item">-->
<!--                <a class="nav-link" href="#">Link</a>-->
<!--            </li>-->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Город
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Казань</a>
                    <a class="dropdown-item" href="#">Ульяновск</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

    <div class="jumbotron jumbotron-fluid" style="background-color: #e3f2fd !important;margin: 20px">
        <div class="container" style="margin: 30px">
        <h3 class="text-center">Поиск лекарств</h3>
        <form action="/search" method="get" >
            <input id="name" name="name" type="text" class="form-control" placeholder="Введите название">
            <input class="btn btn-outline-primary my-2 my-sm-0" type="submit" value="Поиск">
        </form>
        </div>
    </div>


<div class="container">
    <table>
        <#if items??>
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


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>