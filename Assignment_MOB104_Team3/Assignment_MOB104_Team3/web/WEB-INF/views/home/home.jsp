<%-- 
    Document   : danhgia
    Created on : 29-07-2020, 19:22:36
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fDi" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="cDi"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quản lý bánh ngọt</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <base href="${pageContext.servletContext.contextPath}/">
        <style>

            body {
                font: 400 15px Lato, sans-serif;
                line-height: 1.8;
                color: #818181;
            }
            h2 {
                font-size: 24px;
                text-transform: uppercase;
                color: #303030;
                font-weight: 600;
                margin-bottom: 30px;
            }
            h4 {
                font-size: 19px;
                line-height: 1.375em;
                color: #303030;
                font-weight: 400;
                margin-bottom: 30px;
            }  
            .jumbotron {
                background-color: #f4511e;
                color: #fff;
                padding: 100px 25px;
                font-family: Montserrat, sans-serif;
            }
            .container-fluid {
                padding: 60px 50px;
            }
            .sanpham{
                background-image: url(image/bgspc.png);
                background-color: #F6F6F6;
            }
            .bg-grey {
                background-color: #fff;
            }
            .logo-small {
                color: #f4511e;
                font-size: 50px;
            }
            .logo {
                color: #f4511e;
                font-size: 200px;
            }
            .thumbnail {
                padding: 0 0 10px 0;
                border: none;
                border-radius: 0;

            }
            .thumbnail img {

                width: 700px;
                margin-bottom: 10px;
                border-bottom-right-radius: 50px;
                border-bottom-left-radius: 50px;
                border-top-left-radius: 50px;
                border-top-right-radius: 50px;
            }
            .carousel-control.right, .carousel-control.left {
                background-image: none;
                color: #f4511e;
            }
            .carousel-indicators li {
                border-color: #f4511e;
            }
            .carousel-indicators li.active {
                background-color: #f4511e;
            }
            .item h4 {
                font-size: 19px;
                line-height: 1.375em;
                font-weight: 400;
                font-style: italic;
                margin: 70px 0;
            }
            .item img {
                border-bottom-right-radius: 50px;
                border-bottom-left-radius: 50px;
                border-top-left-radius: 50px;
                border-top-right-radius: 50px;
                width: 600px;
            }
            .panel {
                border: 1px solid #f4511e; 
                border-radius:0 !important;
                transition: box-shadow 0.5s;
            }
            .panel:hover {
                box-shadow: 5px 0px 40px rgba(0,0,0, .2);
            }
            .panel-footer .btn:hover {
                border: 1px solid #f4511e;
                background-color: #fff !important;
                border-radius: 50px;
                color: #f4511e;
            }
            .panel-heading {
                color: #fff !important;
                background-color: #f4511e !important;
                padding: 25px;
                border-bottom: 1px solid transparent;
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
                border-bottom-left-radius: 0px;
                border-bottom-right-radius: 0px;
            }
            .panel-footer {
                background-color: white !important;
            }

            .panel-footer h3 {
                font-size: 32px;


            }
            .panel-footer h4 {
                color: #aaa;
                font-size: 14px;
            }
            .panel-footer .btn {
                margin: 15px 0;
                background-color: #f4511e;
                color: #fff;
            }
            .navbar {
                margin-bottom: 0;
                background-color: #f4511e;
                z-index: 9999;
                border: 0;
                font-size: 12px !important;
                line-height: 1.42857143 !important;
                letter-spacing: 4px;
                border-radius: 0;
                font-family: Montserrat, sans-serif;
            }
            .navbar li a, .navbar .navbar-brand {
                font-size: 14px;
                color: #000000 !important;
            }
            .navbar-nav li a:hover, .navbar-nav li.active a {
                color: #f4511e !important;
                background-color: #fff !important;
                display: table-cell;
            }
            .navbar-default .navbar-toggle {
                border-color: transparent;
                color: #fff !important;
            }
            footer .glyphicon {
                font-size: 20px;
                margin-bottom: 20px;
                color: #f4511e;
            }

            .slideanim img{
                width: 250px;
                border-top-left-radius: 30px;
                border-top-right-radius: 30px;
                border-bottom-left-radius: 30px;
                border-bottom-right-radius: 30px;
            }
            .slideanim h4{
                color: #EE9F1F;
                font-size: 15px;
            }
            .slideanim p{
                float: bottom;
                color: #581008;
                font-size: 17px;
            }
            .slide {
                animation-name: slide;
                -webkit-animation-name: slide;
                animation-duration: 1s;
                -webkit-animation-duration: 1s;
                visibility: visible;
            }
            @keyframes slide {
                0% {
                    opacity: 0;
                    transform: translateY(70%);
                } 
                100% {
                    opacity: 1;
                    transform: translateY(0%);
                }
            }
            @-webkit-keyframes slide {
                0% {
                    opacity: 0;
                    -webkit-transform: translateY(70%);
                } 
                100% {
                    opacity: 1;
                    -webkit-transform: translateY(0%);
                }
            }
            @media screen and (max-width: 768px) {
                .col-sm-4 {
                    text-align: center;
                    margin: 25px 0;
                }
                .btn-lg {
                    width: 100%;
                    margin-bottom: 35px;

                }
            }
            @media screen and (max-width: 480px) {
                .logo {
                    font-size: 150px;

                }
            }
            .sidebarct h2 {
                letter-spacing: 4px;
                font-family: 'MTD';
                font-size: 36px;
                color: #EE9F1F;
                text-transform: capitalize;
                text-align: center;
                margin: 0 auto;
                margin-bottom: 30px;
                position: relative;
            }
            p.commet_b {
                color: #581008;
                margin: 0 0 10px;
            }
            .xt a {
                color: #581008;
                font-size: 12px;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 3px;

            }
            strong {
                font-size: 16px;
                color: #EE9F1F;
                font-weight: 700;
            }

            .linkp11 button{
                background: transparent linear-gradient(38deg, #df853d 0%, #e7b25d 100%) 0% 0% no-repeat padding-box;
                font-size: 14px;
                border-radius: 50px;
                padding: 2% 7% 2% 7%;
                color: white;
                font-weight: 700;
            }
            .thongtin{
                background-image: url(image/bgp1.png);

            }
            .thongtin img{
                border-top-left-radius: 30px;
                border-top-right-radius: 30px;
                border-bottom-left-radius: 30px;
                border-bottom-right-radius: 30px;
            }
            .tintuc{
                background-image: url(image/bgspbc.png);
                background-repeat: no-repeat;
            }
            .spc{
                background-image: url(image/bgttsk.png);
            }
            .dropdown:hover .dropdown-menu {
                display: block;
            }
        </style>
    </head>
    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="#myPage">  <img style="width: 120px; margin-top:-9px;" src="image/logo.png" alt=""/></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#GioiThieu">Giới Thiệu</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#SanPham">Sản Phẩm
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="sanpham/SanPham.htm">Quản Lý Sản Phẩm</a></li> 
                                 <li class="divider"></li>
                                <li><a href="cuahang/Cuahang.htm">Quản Lý Cửa Hàng</a></li> 
                            </ul>
                     
                        </li>
                        <li><a href="#TinTuc">Tin tức & Sự kiện</a></li>
                        <li><a href="#DanhGia">Đánh Giá</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown">Người Dùng
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Đăng Ký</a></li>
                                <li><a href="user/user.htm">Quản Lý Tài Khoản</a></li>
                                <li class="divider"></li>
                                <li><a href="user/login.htm">Đăng Xuất</a></li> 
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--main-->
        <!-- Giới Thiệu (About Section) -->
        <div id="GioiThieu" class="container-fluid thongtin">
            <br>
            <div class="sidebarct">
                <h2>Thông tin các loại bánh</h2><br>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <img style="width: 450px" src="image/product/Chesse-Cake-2.jpeg" alt=""/>
                </div>
                <div class="col-sm-6">
                    <h2>Chesse Cake</h2>
                    <p>Đây là loại bánh ngọt được làm chủ yếu từ phô mai, tạo vị béo ngậy. Phía trên người ta có thể phủ thêm mứt. Chiếc bánh pho mát kem được làm từ những năm 1800 và trở thành một trong những món bánh quen thuộc của người dân New York.</p>
                    <div class="linkp11">
                        <br><button class="btn btn-default btn-lg">Xem Thêm</button>
                    </div>
                </div>
            </div>
            <br><br>
            <div class="row">
                <div class="col-sm-4">
                    <img style="width: 450px" src="image/product/macaron.jpg" alt=""/>
                </div>
                <div class="col-sm-6">
                    <h2>macaron</h2>
                    <p>Đây là một loại bánh ngọt của Pháp, bánh được làm từ lòng trắng trứng, đường bột, đường cát, bột hạnh nhân và một ít phẩm màu tự nhiên. Nhân bánh thường là mứt, chocolate hoặc kem bơ kẹp ở giữa.Bánh macaron nổi bật với những hương vị truyền thống như mâm xôi, chocolate và những hương vị mới như nấm và trà xanh.</p>
                    <div class="linkp11">
                        <br><button class="btn btn-default btn-lg">Xem Thêm</button>
                    </div>
                </div>
            </div>
            <br><br>
            <div class="row">
                <div class="col-sm-4">
                    <img style="width: 450px" src="image/product/pandan-chiffon-cake.jpg" alt=""/>
                </div>
                <div class="col-sm-6">
                    <h2>Pandan</h2>
                    <p>Bánh Pandan còn có tên gọi khác là bánh bông lan lá dứa. Bánh có màu xanh tự nhiên đẹp mắt, mùi thơm của lá dứa và mềm mịn, tơi xốp nhưng cũng không quá ngọt. Đây là món bánh rất nổi tiếng ở Singapore, thường được nhiều du khách mua về làm quà.</p>
                    <div class="linkp11">
                        <br><button class="btn btn-default btn-lg">Xem Thêm</button>
                    </div>
                </div>
            </div>
        </div>
        <!--Sản Phẩm-->   
        <div id="SanPham" class="container-fluid text-center sanpham">

            <div class="sidebarct">
                <h2>Sản Phẩm</h2><br>
            </div>
            <br>
            <div class="row slideanim">
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <img src="image/product/banh bông lan trung muoi.jpg" alt=""/>
                    <br>
                    <h4>Bánh Bông Lan Trứng Muối</h4>
                    <p>50,000VNĐ</p>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <img src="image/product/banh kem khoai mon dai loan.jpg" alt=""/>
                    <h4>Bánh Kem Phô Mai Đài Loan</h4>
                    <p>200,000VNĐ</p>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <img src="image/product/banh kem pho mai.jpg" alt=""/>
                    <h4>Bánh Kem Bắp Phô Mai</h4>
                    <p>200,000VNĐ</p>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <img src="image/product/banh bao trai dao.png" alt=""/>
                    <h4>Bánh Bao Trái Đào</h4>
                    <p>8,000VNĐ</p>
                </div>
            </div>
            <br><br>
            <div class="row slideanim">
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <img src="image/product/banh kem sua tuoi.jpg" alt=""/>
                    <br>
                    <h4>Bánh Kem Sữa Tươi</h4>
                    <p>150,000</p>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <img src="image/product/banh kem tiramisu.jpg" alt=""/>
                    <h4>Bánh kem Tiramisu</h4>
                    <p>170,000VNĐ</p>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <img src="image/product/banh kem giang sinh.jpg" alt=""/>
                    <h4>Bánh Kem Giáng Sinh</h4>
                    <p>170,000VNĐ</p>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <img src="image/product/ban kem socola trai cay.jpg" alt=""/>
                    <h4>Bánh Kem Socola Trái Cây</h4>
                    <p>160,000VNĐ</p>
                </div>
            </div>
        </div>      
        <!--Tin Tức-->
        <div id="TinTuc" class="container-fluid text-center bg-grey tintuc">
            <div class="sidebarct">
                <h2>Tin tức & Sự kiện</h2><br>
            </div>
            <div class="row text-center">
                <div class="col-sm-4">
                    <div class="thumbnail">
                        <img src="image/article/1.jpg" alt=""/>
                        <p><strong>Bơ Làm Bánh - Các Loại Bơ Làm Bánh<br>Cách Phân Biệt Và Bảo Quản Đúng Cách</strong></p>
                        <p class="commet_b">Cake xin gửi đến các bạn những thông tin hữu ích xoay quanh vấn đề bơ làm bánh là gì? Các loại bơ làm bánh, cách bảo quản... </p>
                        <div class="xt" style="clear: both">
                            <a>XEM THÊM</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="thumbnail">
                        <img src="image/article/3.jpg" alt=""/>
                        <p><strong>Tổng hợp 7 tiệm bánh ngọt - bánh<br> kem ngon nhất Đà Nẵng</strong></p>
                        <p class="commet_b">Với những tín đồ của bánh ngọt, bạn không thể bỏ qua danh sách tổng hợp những tiệm bánh ngọt Đà Nẵng nổi tiếng của chúng tôi. </p>
                        <div class="xt" style="clear: both">
                            <a>XEM THÊM</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="thumbnail">
                        <img src="image/article/2.jpg" alt=""/>
                        <p><strong>Phụ gia bánh mì và những điều cần biết</strong></p>
                        <p class="commet_b">Theo khảo sát thì có rất nhiều chủ cơ sở sản xuất bánh mì có chung nhận định rằng: “Bánh mì ngày xưa làm rất khó, học nghề hai năm chưa chắc làm được ổ bánh đạt yêu cầu”.</p>
                        <div class="xt" style="clear: both">
                            <a>XEM THÊM</a>
                        </div>
                    </div>
                </div>

            </div><br>
        </div>
        <!--Sản Phẩm Chính-->
        <div class="spc">
            <div class="sidebarct">
                <h2>Sản Phẩm Chính</h2><br>
            </div>
            <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <center><img src="image/product/Apple-Pie.jpg" alt=""/></center> 
                        <h4>Apple Pie</h4>
                    </div>
                    <div class="item">
                        <center><img src="image/product/macaron.jpg" alt=""/></center>
                        <h4>Macaron</h4>
                    </div>
                    <div class="item">
                        <center><img src="image/product/Pavlova.jpg" alt=""/></center>
                        <h4>Pavlova</h4>
                    </div>
                    <div class="item">
                        <center><img src="image/product/pandan-chiffon-cake.jpg" alt=""/></center>
                        <h4>Pandan</h4>
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <!--Đánh Giá (Contact Section)--> 
        <div id="DanhGia" class="container-fluid bg-grey">
            <fDi:form action="home/insert.htm" modelAttribute="DanhGia">   
                <h2 class="text-center">ĐÁNH GIÁ</h2>
                <div class="row">
                    <div class="col-sm-5">
                        <p>Contact us and we'll get back to you within 24 hours.</p>
                        <p><span class="glyphicon glyphicon-map-marker"></span> Cần Thơ</p>
                        <p><span class="glyphicon glyphicon-phone"></span> +0123456789</p>
                        <p><span class="glyphicon glyphicon-envelope"></span> cake@gmail.com</p>
                    </div>
                    <div class="col-sm-7 slideanim">
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <fDi:input class="form-control" path="email" name="email" placeholder="Email" type="text"/>
                            </div>
                            <div class="col-sm-6 form-group">
                                <fDi:select class="form-control" path="sanpham.maSP"
                                            items="${sanphams}" itemValue="maSP" itemLabel="tenSP"/>
                            </div>
                        </div>
                        <fDi:textarea class="form-control" path="danhGia" name="comments" placeholder="Comment" rows="5"/>
                        <div class="row">
                            <div class="col-sm-12 form-group">
                                <button class="btn btn-default pull-right" type="submit">Send</button>
                            </div>
                        </div>
                    </div>
                    ${message}
                </div>
            </fDi:form>
        </div>
        
     

        <footer class="container-fluid text-center">
            <a href="#myPage" title="To Top">
                <span class="glyphicon glyphicon-chevron-up"></span>
            </a>
            <p>Quản lý bánh ngọt</p>
        </footer>

        <script>
            $(document).ready(function () {
                // Add smooth scrolling to all links in navbar + footer link
                $(".navbar a, footer a[href='#myPage']").on('click', function (event) {
                    // Make sure this.hash has a value before overriding default behavior
                    if (this.hash !== "") {
                        // Prevent default anchor click behavior
                        event.preventDefault();

                        // Store hash
                        var hash = this.hash;

                        // Using jQuery's animate() method to add smooth page scroll
                        // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                        $('html, body').animate({
                            scrollTop: $(hash).offset().top
                        }, 900, function () {

                            // Add hash (#) to URL when done scrolling (default click behavior)
                            window.location.hash = hash;
                        });
                    } // End if
                });

                $(window).scroll(function () {
                    $(".slideanim").each(function () {
                        var pos = $(this).offset().top;

                        var winTop = $(window).scrollTop();
                        if (pos < winTop + 600) {
                            $(this).addClass("slide");
                        }
                    });
                });
            })

        </script>

    </body>
</html>
