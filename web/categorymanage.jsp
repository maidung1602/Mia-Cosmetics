<%-- 
    Document   : admin
    Created on : Jul 7, 2023, 4:50:10 PM
    Author     : maidu
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Mia Cosmetics</title>
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles1.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            .datatable-pagination a {
                text-decoration: none;
                color: black !important;
            }

            th {
                display: none;
            }
            .cate {
                text-align: center;
                box-shadow: 1px 1px 6px #ccc;
                padding: 32px;
                margin: 20px;
                width:20%;
                border-radius: 10px;
                line-height: 28px;
            }

        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="component/admin_header.jsp" %>
        <div id="layoutSidenav">
            <%@include file="component/admin_sidebar.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 style="padding-bottom: 20px" class="mt-4">Categories</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                List of categories
                            </div>
                            <div class="card-body">
                                <button type="button" class="btn" style="float:right; background-color: #eee; margin-left: 20px;" 
                                        data-mdb-ripple-color="dark">Add new</button>
                                <div class="row" style="padding-top: 20px">
                                    <c:forEach items="${categories}" var="c">
                                        <div class="cate">
                                             <h4>${c.category_name}</h4>
                                             <div style="padding-bottom: 4px">ID: ${c.id}</div>
                                        <div>
                                            <a href=""><button type="button" class="btn" style="background-color: #fa8a93; color: white;">Edit</button></a>
                                            <a href=""><button type="button" class="btn" style="background-color: #fa8a93cb; color: white;">Delete</button></a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
            </div>
        </main>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
