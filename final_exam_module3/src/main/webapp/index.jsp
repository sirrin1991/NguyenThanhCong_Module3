<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <script src="jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <style>
        body {
            background-image: url("/new_folder/BG2.jpg");
            background-position: right bottom;
            background-repeat: no-repeat;
            background-size: contain;
            background-attachment: fixed;
        }

        ul>li {
            text-align: left;
        }
        .t-l {
            text-align: left;
        }

    </style>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-12">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="/home">Home</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="/product">Product<span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>
<div class="container">
    <div class="row mt-5">
        <div class="col-12">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="/new_folder/saigon-soul-pool-party.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="/new_folder/photo-1-1486440443153.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="/new_folder/mua-he.jpg" class="d-block w-100" alt="...">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
</div>
<footer>
    <div class="container-fluid text-center mt-5" style="background-color: #cfffe2">
        <div class="row">
            <div class="col-3 mt-5">
                <div class="row ml-2">
                    <div class="col-12" >
                        <h3>CHƯƠNG TRÌNH</h3>
                        <ul>
                            <li>Career</li>
                            <li>Premium</li>
                            <li>Accelerator</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="row">
                    <div class="col-4"></div>
                    <div class="col-8">
                        <div class="row mt-5">
                            <ul>
                                <li>Lộ trình đào tạó</li><br>
                                <li>Codegym's Blog</li><br>
                                <li>Tuyển Dụng</li><br>
                                <li>Liên Hệ</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="row mt-5">
                    <div class="col-12">
                        <h3 style="color: sandybrown;text-align: left">TRUNG TÂM ĐÀO TẠO LẬP TRÌNH VIÊN CODEGYM ĐÀ NẴNG</h3>
                        <p class="t-l">Địa chỉ: Số 295 Nguyễn Tất Thành, Thanh Bình, Hải Châu, Đà Nẵng</p>
                        <p class="t-l">Điện thoại: 0236 6517 021</p>
                        <p class="t-l">Lịch hẹn : facebook.com</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>
