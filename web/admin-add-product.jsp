<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 7/12/2023
  Time: 1:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin | add-product</title>
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet"/>
    <link href="css/styles1.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body>
<%@include file="component/admin_header.jsp" %>
<div id="layoutSidenav">
    <%@include file="component/admin_sidebar.jsp" %>
    <%-- Product Form --%>
    <form action="admin-add-product" id="add-form" method="POST">
        <div>
            <label for="product-name">Product name: </label>
            <input name="product-name" type="text" id="product-name">
        </div>
        <div>
            <label for="product-desc"></label>
            <textarea name="product-desc" id="product-desc" cols="30" rows="10"></textarea>
        </div>
        <div>
            <label for="brands">Brand: </label>
            <section id="brands-wrapper">
                <%-- Brand Forms --%>
                <select name="brand" id="brands">
                    <c:forEach items="${brands}" var="brand">
                        <option value="${brand.id}"
                            ${selectedBrand == brand.id? "selected" : ""}>
                                ${brand.brand_name}
                        </option>
                    </c:forEach>
                </select>
            </section>
        </div>
        <div>
            <label for="categories">Category: </label>
            <section id="categories-wrapper">
                <select name="category" id="categories" onchange="changeCategory(this.value)">
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.id}"
                            ${selectedCategory == category.id? "selected" : ""}>
                                ${category.category_name}
                        </option>
                    </c:forEach>
                </select>
            </section>
        </div>
        <div>
            <label for="subcategories">Sub Category: </label>
            <section id="subcategories-wrapper">
                <%-- Sub Category Forms --%>
                <select name="subcategory" id="subcategories">
                    <c:forEach items="${subcategories}" var="subcategory">
                        <option value="${subcategory.id}"
                                class="category-${subcategory.getCategory().getId()}"
                            ${selectedCategory == subcategory.getCategory().getId()? "" : "style='display:none'"}
                            ${selectedSubcategory == subcategory.id? "selected" : ""}>
                                ${subcategory.subcategory_name}
                        </option>
                    </c:forEach>
                </select>
            </section>
        </div>
        <div>
            <label for="thumbnail">Thumbnail: </label>
            <input name="thumbnail" type="file" id="thumbnail">
        </div>


        <%-- Product Model Forms --%>
        <section id="product-models-wrapper">
            <section class="product-models">
                <div style="display: none">
                    <label for="variant">Model name: </label>
                    <input name="variant" type="text" id="variant">
                </div>
                <div>
                    <label for="origin-price">Price: </label>
                    <input name="origin-price" type="text" id="origin-price">
                </div>
                <div>
                    <label for="sale-price">Sale price: </label>
                    <input name="sale-price" type="text" id="sale-price">
                </div>
                <div>
                    <label for="quantity">Quantity: </label>
                    <input name="quantity" type="text" id="quantity">
                </div>
                <div style="display: none">
                    <label for="image">Image: </label>
                    <input name="image" type="file" id="image">
                </div>
                <div style="display: none">
                    <hr style="color: #000">
                </div>
            </section>
        </section>
        <button id="add-model" type="button" onclick="addModel()">Add model</button>
        <hr style="color: #000">
        <div>
            <button id="add-product" value="Add product" onclick="filterEmpty()">Submit!</button>
        </div>
    </form>
    <script src="js/jquery.js"></script>
    <script>
        function filterEmpty() {
            // jquery to find all element with class product-models then loop through it
            $(".product-models").each(function () {
                // jquery to find all input element of current element with class product-models
                // then loop through it
                $(this).find("input").each(function () {
                    // jquery to check if current input value is empty then change it to "0"
                    if ($(this).val() === "") {
                        $(this).val("0");
                    }
                });
                // jquery find form with id 'add-form' then submit it
                $("#add-form").submit();
            });
        }
        function addModel() {
            //jquery check if there is only one element with class product-models
            // then remove the style display none of every div of that element and
            // remove every input value
            if ($(".product-models").length === 1) {
                $(".product-models div").removeAttr("style");
                $(".product-models input").val("");
            }
            // jquery to find first element with class product-models then copy it
            // then append it to the end of element with id product-models-wrapper
            $(".product-models:first").clone().appendTo("#product-models-wrapper");
        }

        function changeCategory(categoryId) {
            // jquery to hide all option of select element with id subcategories and remove all selected attribute
            $("#subcategories option").hide().removeAttr("selected");

            // jquery to find all element with class category- and category id then show it
            $(".category-" + categoryId).show();
            // jquery to find #subcategory and select the first option of element with class category- and category id
            $("#subcategories").val($(".category-" + categoryId + ":first").val());
        }

    </script>
</body>
</html>
