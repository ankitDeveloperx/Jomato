<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Food Item - Jomato</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: url('https://cdn.pixabay.com/photo/2017/08/05/12/33/flat-lay-2583213_640.jpg') no-repeat center center/cover;
            color: white;
            text-align: center;
            height: 100vh;
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
            position: relative;
        }

        nav ul li a {
            text-decoration: none;
            color: white;
            font-size: 16px;
            transition: 0.3s;
            padding: 8px 12px;
            border-radius: 5px;
            position: relative;
        }

        nav ul li a:hover, nav ul li.active a {
            color: #ffcc00;
        }

        nav ul li a::after {
            content: '';
            display: block;
            width: 0;
            height: 2px;
            background: #ffcc00;
            transition: width 0.3s;
            position: absolute;
            bottom: -5px;
            left: 50%;
            transform: translateX(-50%);
        }

        nav ul li a:hover::after, nav ul li.active a::after {
            width: 100%;
        }

        .container {
            display: flex;
            margin-left:98vw;
            align-items: center;
            height: calc(100vh - 60px);
            width: 100%;
            padding-top: 50px;
        }

        .card {
        	margin-top:5vh;
            background: white;
            color: black;
            width: 400px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: left;
        }

        .card h2 {
            margin-bottom: 15px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 12px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group input:focus, .form-group select:focus {
            outline: none;
            border-color: #ff4b5c;
        }

        .form-group img {
            max-width: 100%;
            margin-top: 10px;
            border-radius: 5px;
        }

        .btn {
            background: #ff4b5c;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
        }

        .btn:hover {
            background: #d63c4a;
        }
    </style>
</head>
<body>
    <nav>
        <div class="logo">Jomato</div>
        <ul>
            <li><a href="index.jsp" class="active">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="menu">Menu</a></li>
            <li><a href="#contact">Contact</a></li>
            <li><a href="all" id="food-available">Food Available</a></li>
        </ul>
    </nav>

    <div class="container">
        <div class="card">
            <h2>Update Food Item</h2>
            <form action="updateFood" method="post">
            	<div class="form-group">
                    <label>Item id:</label>
                    <input type="number" name="id" readonly="readonly" value="${f.id }">
                </div>
            
                <div class="form-group">
                    <label>Food Name:</label>
                    <input type="text" name="name" value="${f.name }">
                </div>

                <div class="form-group">
                    <label>Description:</label>
                    <input type="text" name="description" value="${f.description }" >
                </div>

                <div class="form-group">
                    <label>Category:</label>
                    <input type="text" name="category" value="${f.category }" >
                </div>

                <div class="form-group">
                    <label>Type:</label>
                    <input type="text" name="type" value="${f.type }" >
                </div>

                <div class="form-group">
                    <label>Price:</label>
                    <input type="number" step="0.01" name="price" value="${f.price }">
                </div>

                <div class="form-group">
                    <label>Quantity Available:</label>
                    <input type="number" step="0.1" name="rating" value="${f.rating }">
                </div>

                <div class="form-group">
                    <label>Image URL:</label>
                    <input type="text" name="image" id="image-url" value="${f.image }">
                    <img id="preview" src="" style="display: none;">
                </div>

                <button type="submit" class="btn">Update Food Item</button>
            </form>
        </div>
    </div>

    <script>
        document.getElementById('image-url').addEventListener('input', function() {
            let imgPreview = document.getElementById('preview');
            imgPreview.src = this.value;
            imgPreview.style.display = this.value ? 'block' : 'none';
        });
    </script>
</body>
</html>
