<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jomato - The Taste of Heaven</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: #ff4b5c;
            color: white;
            text-align: center;
            transition: background 0.3s ease;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 50px;
            background: rgba(0, 0, 0, 0.6);
            position: fixed;
            width: 100%;
            top: 0;
            transition: 0.4s;
            z-index: 1000;
        }

        nav.sticky {
            background: black;
            padding: 15px 50px;
        }

        .logo {
            font-size: 28px;
            font-weight: bold;
            color: white;
            letter-spacing: 2px;
        }

        nav ul {
            list-style: none;
            display: flex;
            align-items: center;
        }

        nav ul li {
            margin: 0 15px;
            position: relative;
        }

        nav ul li a {
            text-decoration: none;
            color: white;
            font-size: 16px;
            transition: 0.3s;
            padding: 10px 15px;
            border-radius: 5px;
            position: relative;
            cursor: pointer;
        }

        nav ul li a:hover, nav ul li.active a {
            color: #ffcc00;
        }

        nav ul li:not(.dropdown) a::after {
            content: '';
            display: block;
            width: 0;
            height: 2px;
            background: #ffcc00;
            transition: width 0.3s;
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
        }

        nav ul li:not(.dropdown) a:hover::after, nav ul li.active:not(.dropdown) a::after {
            width: 100%;
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            top: 40px;
            left: 0;
            background: black;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            width: 150px;
        }

        .dropdown.active .dropdown-menu {
            display: block;
        }

        .dropdown-menu a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 10px;
            transition: 0.3s;
            background: #222;
            border-radius: 5px;
            margin-bottom: 5px;
        }

        .dropdown-menu a:hover {
            background: #ffcc00;
            color: black;
        }

        .hero {
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url('https://cdn.pixabay.com/photo/2017/12/10/14/47/pizza-3010062_640.jpg') no-repeat center center/cover;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.7);
        }

        .hero::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
        }

        .hero-content {
            position: relative;
            z-index: 1;
            text-align: center;
        }

        .hero h1 {
            font-size: 60px;
            animation: fadeIn 1.5s ease-in-out;
        }

        .hero p {
            font-size: 20px;
            margin-top: 10px;
        }

        .cta-button {
            background: #ffcc00;
            color: black;
            padding: 15px 30px;
            border-radius: 25px;
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
            text-decoration: none;
            transition: 0.3s;
            display: inline-block;
        }

        .cta-button:hover {
            background: white;
            color: black;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <header>
        <nav>
            <div class="logo">Jomato</div>
            <ul>
                <li><a href="index.jsp" onclick="setActive(this)">Home</a></li>
                <li><a href="#about" onclick="setActive(this)">About</a></li>
                <li><a href="menu" onclick="setActive(this)">Menu</a></li>
                <li><a href="#contact" onclick="setActive(this)">Contact</a></li>
                <li class="dropdown" onclick="toggleDropdown(this)">
                    <a href="#">Manage</a>
                    <div class="dropdown-menu">
                        <a href="createFood.jsp">Create Food Item</a>
                        <a href="all">View All Food Items</a>
                    </div>
                </li>
            </ul>
        </nav>
    </header>
    <section class="hero">
        <div class="hero-content">
            <h1>Welcome to Jomato</h1>
            <p>Discover the best food & drinks at your fingertips.</p>
            <a href="menu" class="cta-button">Explore Menu</a>
        </div>
    </section>
    <script>
        function setActive(element) {
            document.querySelectorAll('nav ul li a').forEach(a => a.parentNode.classList.remove('active'));
            element.parentNode.classList.add('active');
        }

        function toggleDropdown(element) {
            document.querySelectorAll('.dropdown').forEach(dropdown => {
                if (dropdown !== element) {
                    dropdown.classList.remove('active');
                }
            });
            element.classList.toggle('active');
        }

        document.addEventListener('click', function(event) {
            if (!event.target.closest('.dropdown')) {
                document.querySelectorAll('.dropdown').forEach(dropdown => dropdown.classList.remove('active'));
            }
        });
    </script>
</body>
</html>
