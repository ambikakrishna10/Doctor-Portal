<!DOCTYPE html>
<html>
<head>
    <title>Doctor Portal - Home</title>


    <style>
        body {
            margin: 0;
            padding: 20px;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #f2f6fc;
            font-family: 'Segoe UI', Arial, sans-serif;
            box-sizing: border-box;
        }

        .home-card {
            width: 100%;
            max-width: 430px;
            padding: 45px 35px;
            background: #ffffff;
            border-radius: 18px;
            text-align: center;
            box-shadow: 0 8px 30px rgba(36, 87, 167, 0.12);
            box-sizing: border-box;
        }

        .logo {
            width: 90px;
            height: 90px;
            margin: 0 auto 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #eaf2ff;
            border-radius: 22px;
            color: #2457a7;
            font-size: 55px;
            font-weight: bold;
        }

        .home-card h1 {
            color: #2457a7;
            font-size: 30px;
            margin-bottom: 12px;
        }

        .home-card h2 {
            color: #26364d;
            font-size: 19px;
            margin-bottom: 12px;
        }

        .home-card p {
            color: #718096;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .home-btn {
            display: block;
            width: 100%;
            padding: 14px;
            margin-top: 15px;
            border-radius: 7px;
            text-decoration: none;
            font-size: 15px;
            font-weight: 600;
            box-sizing: border-box;
            transition: 0.3s ease;
        }

        .register-btn {
            background: #2457a7;
            color: white;
        }

        .register-btn:hover {
            background: #173d78;
            transform: translateY(-2px);
        }

        .view-btn {
            border: 1px solid #2457a7;
            color: #2457a7;
            background: white;
        }

        .view-btn:hover {
            background: #eaf2ff;
            transform: translateY(-2px);
        }

        .footer-text {
            margin-top: 30px;
            color: #9aa5b5;
            font-size: 12px;
        }

        @media (max-width: 480px) {
            .home-card {
                padding: 35px 22px;
            }

            .home-card h1 {
                font-size: 26px;
            }
        }
    </style>
</head>

<body>

    <div class="home-card">

        <div class="logo">
		    <svg xmlns="http://www.w3.org/2000/svg"
		         width="55" height="55"
		         viewBox="0 0 24 24"
		         fill="none"
		         stroke="#2457a7"
		         stroke-width="1.7"
		         stroke-linecap="round"
		         stroke-linejoin="round">
		
		        <path d="M6 3v5a4 4 0 0 0 8 0V3"/>
		        <path d="M6 3H4"/>
		        <path d="M14 3h2"/>
		        <path d="M10 12v2a6 6 0 0 0 12 0v-2"/>
		        <circle cx="22" cy="10" r="2"/>
		        <circle cx="10" cy="3" r="1"/>
		    </svg>
		</div>

        <h1>Doctor Portal</h1>

        <h2>Welcome to Doctor Management System</h2>

        <p>
            Manage doctor information easily and efficiently.
            Register new doctors or view existing doctor details
            using the options below.
        </p>

        <a href="<%=request.getContextPath()%>/registerDoctor"
           class="home-btn register-btn">
            Register Doctor
        </a>

        <a href="<%=request.getContextPath()%>/viewDoctors"
           class="home-btn view-btn">
            View Doctors
        </a>

        <div class="footer-text">
            Doctor Management System
        </div>

    </div>

</body>
</html>