<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search</title>
    <link rel="stylesheet" type="text/css" href="../static/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://api-maps.yandex.ru/2.1/?apikey=f2063206-fe46-4935-9921-9abf9987ebec&lang=ru_RU" type="text/javascript"></script>
    <script>
        ymaps.ready(init);
        function init(){
            var myMap = new ymaps.Map("map", {
                center: [55.79, 49.11],
                zoom: 12
            });
            yellowCollection = new ymaps.GeoObjectCollection(null, {
                preset: 'islands#yellowIcon'
            });
            blueCollection = new ymaps.GeoObjectCollection(null, {
                preset: 'islands#blueIcon'
            })
            greenCollection = new ymaps.GeoObjectCollection(null, {
                preset: 'islands#greenIcon'
            })
            for (var i = 0, l = AptekaRuMarkers.length; i < l; i++) {
                yellowCollection.add(new ymaps.Placemark(AptekaRuMarkers[i].geometry.coordinates, {
                    hintContent: 'AptekaRu'
                }));
            }
            for(var i = 0, l = RiglaMarkers.length; i < l; i++){
                blueCollection.add(new ymaps.Placemark(RiglaMarkers[i].geometry.coordinates,{
                    hintContent: 'Аптека Ригла'
                }));
            }
            for(var i = 0, l = SakuraMarkers.length; i < l; i++){
                greenCollection.add(new ymaps.Placemark(SakuraMarkers[i].geometry.coordinates,{
                    hintContent: 'Аптека Сакура'
                }));
            }
            myMap.geoObjects.add(yellowCollection).add(blueCollection).add(greenCollection);
        }
    </script>
</head>

<script>
    function show(id) {
        elem = document.getElementById(id);
        state = elem.style.display;
        if (state === 'none') elem.style.display = '';
    }
</script>

<body onscroll="show('btn-up')">
<nav class="navigation">
    <img class="nav-img" src='https://s8.hostingkartinok.com/uploads/images/2019/06/df320380ecdc2f42f71085655399e267.png' alt='Logo.png' />
    <div class="login-out">
        <form action="/user/profile" method="get" style="display: inline; float: right; padding-right: 3px">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="submit" value="Профиль"/>
        </form>
        <form action="/logout" method="post" style="display: inline; float: right; padding-left: 3px">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="submit" value="Sign Out"/>
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
    <h4 style="margin-left: 20px; margin-bottom: 10px">Введите название лекарства и нажмите "Поиск"</h4>
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
                    </div>
                    <hr width="700" color="#000000" size="1">
                </div>
            </#list>
        </table>
    </#if>
</div>

<style>
    .navigation {
        background-color: white;
        border-bottom: 3px solid #c64d43;
    }
    .nav-img {
        width: 30%;
        display: inline;
    }
    .login-out {
        float: right;
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
    .btn-search {
        float: left;
        display: inline;
        font-weight: 400;
        margin-left: 6px;
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
    #map {
        width: 600px;
        height: 400px;
        position: fixed;
        right: 30px;
        border: 3px solid gray;
        border-radius: 5px;
    }
    .searching-form {
        margin: 20px;
        width: 700px;
        vertical-align: center;
        border: 3px solid #c64d43;
        border-radius: 10px;
    }
    .container {
        float: left;
    }
    .product-item {
        float: left !important;
        vertical-align: middle !important;
        height: auto;
        width: 700px;
        margin-bottom: 5px;
        margin-left: 6px;
    }
    .col-3 {
        text-align: center !important;
    }
    #img {
        width: 100px;
        height: 100px;
        text-align: center !important;
    }
    .topbutton {
        width:100px;
        border: 1px solid #87CEEB;
        background:#f7f7f7;
        text-align:center;
        padding:10px;
        position:fixed;
        bottom:50px;
        right:50px;
        cursor:pointer;
        color:#333;
        font-family:verdana;
        font-size:12px;
        border-radius: 5px;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        -khtml-border-radius: 5px;
    }
    .topbutton:hover {
        color: #000000;
        background-color: rgba(168, 216, 255, .5);
        border-color: #87CEEB;
    }
    .topbutton:focus {
        box-shadow: 0 0 0 .2rem rgba(168, 216, 255, .5);
    }
    #btnGroupDrop1 {
        background-color: #e3f2fd;
        border-color: #87CEEB !important;
        margin-top: 6px;
        color: black;
    }
    #btnGroupDrop1:hover {
        color: black;
        background-color: rgba(168, 216, 255, .5);
        border-color: #87CEEB;
    }
    #btnGroupDrop1:focus {
        box-shadow: 0 0 0 .2rem rgba(168, 216, 255, .5);
    }
    #btnGroupDrop1:target {
        background-color: rgba(168, 216, 255, .5);
    }
</style>

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
<script>
    var AptekaRuMarkers = [{
        "type": "Feature",
        "id": 308970,
        "geometry": {
            "type": "Point",
            "coordinates": [55.9672, 48.3647]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 308970,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1446958,
        "geometry": {
            "type": "Point",
            "coordinates": [55.9611, 48.4119]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1446958,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 270216,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8672, 48.3375]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 270216,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 272125,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8394, 48.2389]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 272125,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 277161,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8392, 48.2425]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 277161,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 284227,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8706, 48.3378]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 284227,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 293268,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8397, 48.2447]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 293268,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 293929,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8539, 48.3842]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 293929,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 305751,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8608, 48.3775]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 305751,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 306618,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8656, 48.3589]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 306618,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 308635,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8661, 48.3542]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 308635,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 311735,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8828, 48.3819]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 311735,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 313726,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8789, 48.3506]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 313726,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 318286,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8514, 48.4969]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 318286,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 319904,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8678, 48.3478]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 319904,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 340417,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8506, 48.5008]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 340417,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1421475,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8683, 48.3506]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1421475,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1427230,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8667, 48.3561]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1427230,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1458556,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8469, 48.5]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1458556,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1499156,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8828, 48.3781]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1499156,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 272926,
        "geometry": {
            "type": "Point",
            "coordinates": [55.4081, 48.1864]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 272926,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 245922,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8578, 48.5561]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 245922,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 293358,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8372, 48.7053]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 293358,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 312054,
        "geometry": {
            "type": "Point",
            "coordinates": [55.835, 48.66]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 312054,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1465782,
        "geometry": {
            "type": "Point",
            "coordinates": [55.86, 48.5711]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1465782,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1474243,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8561, 48.5314]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1474243,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1499758,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8478, 48.5603]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1499758,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 236732,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8728, 49.0203]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 236732,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 236733,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8264, 49.1011]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 236733,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 236738,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8614, 49.1069]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 236738,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 245675,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8211, 49.1044]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 245675,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 246101,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7925, 49.1017]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 246101,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 246855,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7758, 49.1422]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 246855,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 247125,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8364, 49.1389]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 247125,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 248917,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8092, 49.1819]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 248917,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 249370,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7683, 49.1656]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 249370,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 263325,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8306, 49.1481]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 263325,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 264123,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7908, 49.1169]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 264123,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 264160,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8375, 49.0875]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 264160,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 272299,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8353, 49.13]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 272299,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 274851,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7761, 49.1442]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 274851,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 285431,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8014, 49.1864]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 285431,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 289462,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7803, 49.1136]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 289462,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 290813,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8375, 49.1467]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 290813,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 293806,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8344, 49.1006]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 293806,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 294682,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7875, 49.1694]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 294682,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 296118,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8361, 49.1575]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 296118,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 298451,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7778, 49.1728]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 298451,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 299458,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7808, 49.1706]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 299458,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 300159,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7886, 49.1142]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 300159,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 304666,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7903, 49.1161]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 304666,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 307673,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8672, 49.0911]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 307673,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 307681,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7914, 49.1014]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 307681,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 314052,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7856, 49.1081]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 314052,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 314596,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7878, 49.1719]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 314596,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 318634,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7833, 49.1506]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 318634,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 323777,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8242, 49.0786]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 323777,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 324961,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8672, 49.0192]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 324961,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 334272,
        "geometry": {
            "type": "Point",
            "coordinates": [55.82, 49.1144]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 334272,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 339464,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7908, 49.1817]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 339464,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 339650,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8053, 49.1831]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 339650,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1275254,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8206, 49.1172]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1275254,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1408279,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7692, 49.1328]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1408279,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1408479,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8192, 49.0992]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1408479,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1408895,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8228, 49.1325]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1408895,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1411619,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8264, 49.1092]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1411619,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1419590,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8503, 48.895]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1419590,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1420961,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8267, 49.0792]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1420961,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1421341,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8392, 49.0786]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1421341,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1421902,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8072, 49.1947]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1421902,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1421903,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8261, 49.1328]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1421903,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1421905,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7983, 49.0575]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1421905,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1421906,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8631, 49.0797]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1421906,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1426894,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8328, 49.0722]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1426894,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1427732,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8389, 49.0936]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1427732,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1443828,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8194, 48.8853]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1443828,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1446221,
        "geometry": {
            "type": "Point",
            "coordinates": [55.865, 49.1028]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1446221,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1453118,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8689, 49.0828]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1453118,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1458158,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8117, 49.0814]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1458158,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1460185,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7889, 49.1831]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1460185,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1461098,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8361, 49.1508]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1461098,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1461254,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7975, 49.1922]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1461254,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1462871,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7864, 49.1203]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1462871,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1462922,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8361, 49.1444]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1462922,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1466534,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8064, 49.1922]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1466534,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1472733,
        "geometry": {
            "type": "Point",
            "coordinates": [55.82, 49.1825]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1472733,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1473729,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7731, 49.1011]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1473729,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1480968,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7867, 49.1883]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1480968,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1480999,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8364, 49.1436]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1480999,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1484021,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8411, 49.2011]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1484021,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1485688,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8647, 49.0778]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1485688,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1485689,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8047, 49.2053]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1485689,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1488178,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8286, 49.0825]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1488178,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1488558,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7853, 49.1264]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1488558,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1488868,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8536, 49.0836]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1488868,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1489875,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7703, 49.1442]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1489875,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1491250,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8311, 49.1344]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1491250,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1496304,
        "geometry": {
            "type": "Point",
            "coordinates": [55.83, 49.0483]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1496304,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1496381,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8306, 49.1467]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1496381,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1496722,
        "geometry": {
            "type": "Point",
            "coordinates": [55.77, 49.1317]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1496722,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1498034,
        "geometry": {
            "type": "Point",
            "coordinates": [55.86, 49.0772]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1498034,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1500338,
        "geometry": {
            "type": "Point",
            "coordinates": [55.82, 49.1311]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1500338,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1503690,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7958, 49.1817]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1503690,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1503736,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8008, 49.1833]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1503736,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1504786,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8644, 48.8719]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1504786,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1506279,
        "geometry": {
            "type": "Point",
            "coordinates": [55.82, 49.1233]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1506279,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1506280,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8503, 48.8964]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1506280,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1507971,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7836, 49.1956]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1507971,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 225783,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7331, 49.1731]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 225783,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 247303,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7331, 49.1456]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 247303,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 248898,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7533, 49.1597]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 248898,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 265078,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7425, 49.1989]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 265078,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 301004,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7467, 49.2128]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 301004,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 303077,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7069, 49.1453]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 303077,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 324312,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7383, 49.2031]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 324312,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 339324,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7369, 49.1453]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 339324,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1356675,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7472, 49.1981]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1356675,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1442317,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7519, 49.21]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1442317,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1447531,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7425, 49.2117]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1447531,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1448074,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7489, 49.2117]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1448074,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1448622,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7492, 49.1042]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1448622,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1459251,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7319, 49.1311]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1459251,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1467967,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7511, 49.2081]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1467967,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1478324,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7308, 49.175]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1478324,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1488298,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7503, 49.1842]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1488298,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1489126,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7483, 49.1892]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1489126,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1497901,
        "geometry": {
            "type": "Point",
            "coordinates": [55.6764, 49.1256]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1497901,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1499760,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7361, 49.1728]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1499760,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1506081,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7253, 49.1731]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1506081,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1505055,
        "geometry": {
            "type": "Point",
            "coordinates": [56.0039, 49.5139]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1505055,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 247012,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7717, 49.2306]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 247012,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 262175,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7583, 49.2389]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 262175,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 270261,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7797, 49.2367]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 270261,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 297245,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7672, 49.2236]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 297245,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 330260,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7853, 49.2319]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 330260,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 333133,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7789, 49.2314]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 333133,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1432150,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7925, 49.2239]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1432150,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1436148,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7886, 49.225]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1436148,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1438498,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7672, 49.2219]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1438498,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1448035,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7819, 49.2236]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1448035,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1448054,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8625, 49.2206]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1448054,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1448065,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7856, 49.2331]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1448065,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1458160,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8714, 49.2242]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1458160,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1458552,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7828, 49.2239]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1458552,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1466533,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7872, 49.23]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1466533,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1489803,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7833, 49.2272]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1489803,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1496530,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7628, 49.2303]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1496530,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1499831,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7764, 49.2306]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1499831,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1500834,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7794, 49.2367]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1500834,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1505046,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7883, 49.225]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1505046,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1506108,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8122, 49.4392]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1506108,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1447751,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7428, 49.2803]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1447751,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1448050,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7456, 49.2194]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1448050,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1457041,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7486, 49.225]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1457041,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1465779,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7514, 49.2308]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1465779,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1471721,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7511, 49.2447]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1471721,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1485782,
        "geometry": {
            "type": "Point",
            "coordinates": [55.4022, 49.5506]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1485782,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1424609,
        "geometry": {
            "type": "Point",
            "coordinates": [56.0975, 49.86]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1424609,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 1467649,
        "geometry": {
            "type": "Point",
            "coordinates": [56.0892, 49.8739]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 1467649,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 260190,
        "geometry": {
            "type": "Point",
            "coordinates": [55.8247, 49.6981]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 260190,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 301298,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7492, 49.6506]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 301298,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }, {
        "type": "Feature",
        "id": 332021,
        "geometry": {
            "type": "Point",
            "coordinates": [55.7572, 49.65]
        },
        "properties": {
            "balloonContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...",
            "drugStoreId": 332021,
            "hasBalloon": true,
            "hintContent": "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."
        }
    }];
    var RiglaMarkers = [{
        "geometry": {
            "type": "Point",
            "coordinates": [55.779804, 49.210784]
        }
    }, {
        "geometry": {
            "type": "Point",
            "coordinates": [55.769614, 49.216915]
        }
    },{
        "geometry": {
            "type": "Point",
            "coordinates": [55.789798, 49.147005]
        }
    }, {
        "geometry": {
            "type": "Point",
            "coordinates": [55.831642, 49.062950]
        }
    }, {
        "geometry": {
            "type": "Point",
            "coordinates": [55.769002, 49.233000]
        }
    }, {
        "geometry": {
            "type": "Point",
            "coordinates": [55.740950, 49.194389]
        }
    }, {
        "geometry": {
            "type": "Point",
            "coordinates": [55.748124, 49.210616]
        }
    }
    ];
    var SakuraMarkers =[{
        "geometry": {
            "type": "Point",
            "coordinates": [55.786981226855, 49.159473542328]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.789623726347, 49.151048872908]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.796751087690, 49.121251559525]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.796382440728, 49.132946013361]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.767313082844, 49.223759648741]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.871122354812, 49.223914000000]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.779026139827, 49.231654915344]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.801145863429, 49.183698034393]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.788704586391, 49.230153542328]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.789231684882, 49.223978322754]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.786823068087, 49.171739644180]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.771023358944, 49.142752373016]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.753221177205, 49.230070101852]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.776111305928, 49.144553186508]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.816336020391, 49.134909661377]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.830748597593, 49.157141644180]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.834603094863, 49.090976119049]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.829171446180, 49.132836457672]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.836321282610, 49.144685813492]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.819929054746, 49.146794728836]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.837014469698, 49.081485456345]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.829216213333, 49.077889186508]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.834413778700, 49.081053271164]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.816741468466, 49.063535271164]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.866320148504, 49.086309711639]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.854139808058, 49.083783915344]}},
        {
            "geometry": {
                "type": "Point",
                "coordinates": [55.867147786352, 49.092047441803]}}
    ];
</script>
</body>
</html>