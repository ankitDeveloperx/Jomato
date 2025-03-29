<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Food Items - Jomato</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }

    body {
        background: whitesmoke;
        color: white;
        text-align: center;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 30px;
        background: rgba(0, 0, 0, 0.6);
        position: sticky;
        top: 0;
        width: 100%;
        transition: 0.4s;
        z-index: 1000;
    }

    .logo {
        font-size: 28px;
        font-weight: bold;
        color: white;
    }

    nav ul {
        list-style: none;
        display: flex;
        align-items: center;
    }

    nav ul li {
        margin: 0 10px;
    }

    nav ul li a {
        text-decoration: none;
        color: white;
        font-size: 16px;
        transition: 0.3s;
        padding: 8px 12px;
        border-radius: 5px;
    }

    nav ul li a:hover {
        color: #ffcc00;
    }

    .container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
        padding: 20px;
    }

    /* Card Styling */
    .card {
        display: flex;
        align-items: center;
        background: white;
        width: 500px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        overflow: hidden;
        transition: transform 0.3s ease-out, box-shadow 0.3s ease-out;
        padding: 15px;
        opacity: 1;
        animation: fadeIn 0.5s forwards;
    }

    /* Hover Effect - Entire Card Moves Outward */
    .card:hover {
        transform: translateY(-10px) scale(1.05);
        box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.3);
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* Image - No Zoom Effect */
    .card img {
        width: 180px;
        height: 180px;
        object-fit: cover;
        border-radius: 10px;
    }

    .card-content {
        padding: 15px;
        flex: 1;
        text-align: left;
    }

    .card-content h3 {
        margin-bottom: 5px;
        color: #333;
    }

    .card-content p {
        font-size: 14px;
        color: #555;
        margin-bottom: 8px;
    }

    .btn-group {
        display: flex;
        margin-top: 10px;
        gap: 1vw;
    }

    .btn {
        color: white;
        padding: 8px 12px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
        transition: background 0.3s;
    }

    #u-btn {
        background: rgb(0, 100, 0);
    }

    #d-btn {
        background: rgb(100, 0, 0);
    }

    #u-btn:hover {
        background: rgb(0, 200, 0);
        color: black;
    }

    #d-btn:hover {
        background: rgb(200, 0, 0);
        color: black;
    }
    
    #display-del-msg{
    	color: red;
        font-size: 18px;
        font-weight: bold;
        animation: blink 1s infinite alternate;
        margin-top:8vh;
    }
    
    @keyframes blink {
        from { opacity: 1; }
        to { opacity: 0; }
    }
</style>
</head>
<body>

    <nav>
        <div class="logo">Jomato</div>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="menu">Menu</a></li>
            <li><a href="#contact">Contact</a></li>
            <li><a href="createFood.jsp">Create Food Item</a></li>
        </ul>
    </nav>
    
    	<h1 style="color:black">Food Items Available</h1>
		
		<h1 id="display-del-msg">${del }</h1>
		
    <div class="container">
        <c:if test="${not empty fil}">
            <c:forEach var="f" items="${fil}">
                <div class="card">
                    <!-- Image as an anchor, opens original image in new tab -->
                    <a href="${f.image}" target="_blank">
                        <img src="${f.image}" alt="Food Image">
                    </a>
                    <div class="card-content">
                        <h3>${f.name}</h3>
                        <p><strong>Item id:</strong> ${f.id}</p>
                        <p><strong>Description:</strong> ${f.description}</p>
                        <p><strong>Category:</strong> ${f.category}</p>
                        <p><strong>Type:</strong> ${f.type}</p>
                        <p><strong>Price:</strong> &#8377 ${f.price}</p>
                        <p><strong>Quantity Available:</strong> ${f.rating}</p>
                        <div class="btn-group">
                            <a href="updateFoodPage?id=${f.id}"><button class="btn" id="u-btn">⚙ Update</button></a>
                            <a href="deleteItem?id=${f.id}"><button class="btn" id="d-btn">❌ Delete</button></a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        
        <c:if test="${empty fil}">
            <p>No food items available.</p>
        </c:if>
    </div>

</body>
</html>
