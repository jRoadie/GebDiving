<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Geb Test Dive</title>
    <!-- Stylesheets -->
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/GebDiving/bootstrap/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/GebDiving/bootstrap/css/bootstrap-theme.min.css"/>
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/GebDiving/css/base.css"/>

    <!-- Scripts -->
    <script type="text/javascript" src="http://localhost:8080/GebDiving/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="http://localhost:8080/GebDiving/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://localhost:8080/GebDiving/js/app.js"></script>
</head>
<body>
<div class="container" style="margin-top: 100px">
    <div class="row">
        <div class="col-xs-3 col-md-2"></div>
        <div class="col-xs-12 col-md-8">
            <div style="width: 270px; margin: 0 auto 30px;">
                <form method="get" action="/GebDiving/neighborhood/find" class="form-inline">
                    <div class="form-group">
                        <input type="text" class="form-control" name="location" placeholder="Location" value="${params.location}"/>
                    </div>
                    <button type="submit" class="form-control btn-primary">Check</button>
                </form>
            </div>
            <div class="neighborhood-list">
                <g:each in="${neighborhoods}" var="neighborhood" status="n">
                    <div class="row">
                        <div class="col-xs-18 col-md-12">
                            <div style="margin: 0 auto;">
                                <div id="carousel-${n}" class="carousel slide" data-ride="carousel">
                                    <!-- Indicators -->
                                    <g:if test="${neighborhood.images.size() > 1}">
                                        <ol class="carousel-indicators">
                                            <g:each in="${neighborhood.images}" var="image" status="idx">
                                                <li data-target="#carousel-${n}" data-slide-to="${idx}" class="${idx == 0 ? 'active' : ''}"></li>
                                            </g:each>
                                        </ol>
                                    </g:if>
                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner" role="listbox">
                                        <g:each in="${neighborhood.images}" var="image" status="i">
                                            <div class="item ${i == 0 ? 'active' : ''}">
                                                <img src="${image}" alt="">
                                            </div>
                                        </g:each>
                                    </div>
                                    <!-- Controls -->
                                    <g:if test="${neighborhood.images.size() > 1}">
                                        <a class="left carousel-control" href="#carousel-${n}" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="right carousel-control" href="#carousel-${n}" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </g:if>
                                </div>
                                <div class="page-header">
                                    <h3>${neighborhood.title}</h3>
                                    <h4><small>${neighborhood.address}</small></h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </g:each>
            </div>
        </div>
        <div class="col-xs-3 col-md-2"></div>
    </div>
</div>
</body>
</html>