

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fDi" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cDi"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <title>Quản Lý Người Dùng</title>
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
    <body data-spy="scroll" data-target=".navbar" data-offset="60" >
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="home/home.htm">  <img style="width: 120px; margin-top:-9px;" src="image/logo.png" alt=""/></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="home/home.htm#GioiThieu">Giới Thiệu</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="home/home.htm#SanPham">Sản Phẩm
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="sanpham/SanPham.htm">Quản Lý Sản Phẩm</a></li> 
                                <li class="divider"></li>
                                <li><a href="cuahang/Cuahang.htm">Quản Lý Cửa Hàng</a></li> 
                            </ul>
                        </li>
                        <li><a href="home/home.htm#TinTuc">Tin tức & Sự kiện</a></li>
                        <li><a href="home/home.htm#DanhGia">Đánh Giá</a></li>
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
        <fDi:form class="container-fluid bg-grey" action="user/save.htm.htm" modelAttribute="NguoiDung">
            <div class="sidebarct">
                <h2>Quản Lý Người Dùng</h2><br>
            </div>
            <div class="row" style="margin-left: 10px; ">
                <div class="col-sm-4">
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="text-align: center">Quản Lý Người Dùng</div>
                            <div class="panel-body">
                            ${message}
                            <div class="form-group">
                                <label>Username</label>
                                <fDi:input path="username" class="form-control" readonly="true"/>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <fDi:input path="password" type="password" class="form-control"/>
                            </div>
                            <button class="btn btn-default pull-left" type="submit">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <cDi:forEach var="s" items="${nguoidungs }">
                                <tr>
                                    <td>${s.username}</td>
                                    <td>${s.password}</td>
                                    <td><a class="btn btn-default pull-left" href="user/edit/${s.username}.htm">Edit</a>
                                        <a class="btn btn-default pull-left" href="user/delete/${s.username}.htm">Delete</a></td>
                                </tr>
                            </cDi:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </fDi:form>

    </body>
</html>

