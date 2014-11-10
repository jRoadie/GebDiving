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
</head>
<body>
<div class="container" style="margin-top: 100px">
    <div class="row">
        <div class="col-xs-6 col-md-4"></div>
        <div class="col-xs-6 col-md-4">
            <form method="get" action="neighborhood/find" class="form-inline">
                <div class="form-group">
                    <input type="text" class="form-control" name="location" placeholder="Location"/>
                </div>
                <button type="submit" class="form-control btn-primary">Check</button>
            </form>
            <div class="">

            </div>
        </div>
        <div class="col-xs-6 col-md-4"></div>
    </div>
</div>
</body>
</html>