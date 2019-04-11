<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Simple Sidebar - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="css/agency.min.css" rel="stylesheet">
    <link href="css/custom-style.css" rel="stylesheet">
    <!-- <link href="css/home.css" rel="stylesheet">
    <script src="script/homejs.js"></script>
   -->

    <style>
        * {
            box-sizing: border-box
        }

        body {
            font-family: Verdana, sans-serif;
        }

        .mySlides {
            display: none
        }

        /* Slideshow container */

        .slideshow-container {
            max-width: 1000px;
            position: relative;
            margin: auto;
        }

        /* Caption text */

        .text {
            color: #f2f2f2;
            font-size: 15px;
            padding: 8px 12px;
            position: absolute;
            bottom: 8px;
            width: 100%;
            text-align: center;
        }

        /* Number text (1/3 etc) */

        .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }

        /* The dots/bullets/indicators */

        .dot {
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }

        .active {
            background-color: #717171;
        }

        /* Fading animation */

        .fade {
            -webkit-animation-name: fade;
            -webkit-animation-duration: 1.5s;
            animation-name: fade;
            animation-duration: 1.5s;
        }

        @-webkit-keyframes fade {
            from {
                opacity: .4
            }
            to {
                opacity: 1
            }
        }

        @keyframes fade {
            from {
                opacity: .4
            }
            to {
                opacity: 1
            }
        }

        /* On smaller screens, decrease text size */

        @media only screen and (max-width: 300px) {
            .text {
                font-size: 11px
            }
        }
    </style>
</head>

<body id="page-top">
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="index.html">
                <img src="img/logo/Logo.png" width="50">
            </a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fa fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav text-uppercase ml-auto">
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="index.do">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="foods.do">Foods</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="desert.do">Deserts</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="drinking.do">Drinking</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="foodsset.do">Foods set</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="order.do">List my order</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="adminlogin.jsp">Admin login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <section style="padding-top: 110px;     padding-bottom: 0px;" class="welcomeFirstpage">

        <img class="welcome w3-animate-fading" src="./FirstPageSlide/one.jpg">
        <img class="welcome w3-animate-fading" src="./FirstPageSlide/two.jpg">
        <img class="welcome w3-animate-fading" src="./FirstPageSlide/three.jpg">
        <img class="welcome w3-animate-fading" src="./FirstPageSlide/four.jpg">
        <img class="welcome w3-animate-fading" src="./FirstPageSlide/five.jpg">
        <img class="welcome w3-animate-fading" src="./FirstPageSlide/six.jpg">
        <img class="welcome w3-animate-fading" src="./FirstPageSlide/seven.jpg">
        <img class="welcome w3-animate-fading" src="./FirstPageSlide/eight.jpg">
        <img class="welcome w3-animate-fading" src="./FirstPageSlide/nine.jpg">
        <img class="welcome w3-animate-fading" src="./FirstPageSlide/ten.jpg">
        <img class="welcome w3-animate-fading" src="./FirstPageSlide/eleven.jpg">
        <img class="welcome w3-animate-fading" src="./FirstPageSlide/Raider.jpg">
        <button type="button" style="position: absolute; top:91px; width: 100%;  font-size: 45px; color: yellow; background-color: cadetblue;"
            class=" btn btn-primary">Welcome to Smart Order Food</button>
        <div   style="position: absolute;  margin-left: 800px; margin-top: -150px; top:550px";class="Madmannanan">
            <div class="loginmodal-container">
                <h1>Identify number of table</h1><br>
              <form>
                <input type="text" name="user" placeholder="Table Number">
                <input type="submit" name="login" class="login loginmodal-submit" value="Enter">
              </form>
                
              
            </div>
        </div>


    </section>


    <script>
        var myIndex = 0;
        carousel();

        function carousel() {
            var i;
            var x = document.getElementsByClassName("welcome");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            myIndex++;
            if (myIndex > x.length) { myIndex = 1 }
            x[myIndex - 1].style.display = "block";
            setTimeout(carousel, 3000);
        }
    </script>



    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>

</html>