<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style><%@ include file="css/style.css"%></style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>Responsive Dashboard Design #2 | AsmrProg</title>
    <style>
        .low-level {
            font-size: 10px;
            padding: 6px 16px;
            background-color: red;
            border-radius: 20px;
            font-weight: 700;
            color: white;
        }
        .normal-level {
            font-size: 10px;
            padding: 6px 16px;
            background-color: green;
            border-radius: 20px;
            font-weight: 700;
            color: white;
        }
        .high-level {
            font-size: 10px;
            padding: 6px 16px;
            background-color: darkred;
            border-radius: 20px;
            font-weight: 700;
            color: white;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 30px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            position: relative;
        }
        .close-button {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
        .close-button:hover,
        .close-button:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .formA {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            width: 100%;
            box-sizing: border-box;
        }
        .formA div {
            margin-bottom: 20px;
            position: relative;
        }
        label {
            position: absolute;
            top: -12px;
            left: 15px;
            background: rgba(255, 255, 255, 0.9);
            padding: 0 5px;
            font-size: 14px;
            color: #333;
            transition: all 0.3s;
        }
        input[type="text"],
        input[type="date"],
        input[type="time"],
        input[type="number"],
        textarea,
        select {
            width: calc(100% - 30px);
            padding: 12px 15px;
            margin: 5px 0;
            border: 1px solid #ccd1d9;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        input[type="text"]:focus,
        input[type="date"]:focus,
        input[type="time"]:focus,
        input[type="number"]:focus,
        textarea:focus,
        select:focus {
            border-color: #5b93c8;
            box-shadow: 0 0 8px rgb(10, 62, 112);
        }
        button {
            width: 100%;
            padding: 15px;
            background: #0a3e70;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s, box-shadow 0.3s;
        }
        button:hover {
            background: #44729a;
        }

        .btn{
            padding-left: 35px;
        }
    </style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <a href="#" class="logo">
        <i class='bx bx-code-alt'></i>
        <div class="logo-name"><span>Asmr</span>Prog</div>
    </a>
    <ul class="side-menu">
        <li><a href="#"><i class='bx bxs-dashboard'></i>Dashboard</a></li>
        <li><a href="#"><i class='bx bx-store-alt'></i>Shop</a></li>
        <li class="active"><a href="#"><i class='bx bx-analyse'></i>Analytics</a></li>
        <li><a href="#"><i class='bx bx-message-square-dots'></i>Tickets</a></li>
        <li><a href="#"><i class='bx bx-group'></i>Users</a></li>
        <li><a href="#"><i class='bx bx-cog'></i>Settings</a></li>
    </ul>
    <ul class="side-menu">
        <li>
            <a href="#" class="logout">
                <i class='bx bx-log-out-circle'></i>
                Logout
            </a>
        </li>
    </ul>
</div>
<!-- End of Sidebar -->

<!-- Main Content -->
<div class="content">
    <!-- Navbar -->
    <nav>
        <i class='bx bx-menu'></i>
        <form action="#">
            <div class="form-input">
                <input type="search" placeholder="Search...">
                <button class="search-btn" type="submit"><i class='bx bx-search'></i></button>
            </div>
        </form>
        <input type="checkbox" id="theme-toggle" hidden>
        <label for="theme-toggle" class="theme-toggle"></label>
        <a href="#" class="notif">
            <i class='bx bx-bell'></i>
            <span class="count">12</span>
        </a>
        <a href="#" class="profile">
            <img src="images/logo.png">
        </a>
    </nav>
    <!-- End of Navbar -->

    <main>
        <div class="header">
            <div class="left">
                <h1>Dashboard</h1>
                <ul class="breadcrumb">
                    <li><a href="#">Analytics</a></li> /
                    <li><a href="" class="active">Shop</a></li>
                </ul>
            </div>
            <a href="#" class="report" onclick="openForm('modalFormGlycemia')">
                <img src="https://img.icons8.com/?size=100&id=110235&format=png&color=000000" width="50px" height="50px">
                <span>Ajouter Glycema </span>
            </a>
        </div>

        <!-- Insights -->
        <ul class="insights">
            <li>
                <i class='bx bx-calendar-check'></i>
                <span class="info">
                    <h3>1,074</h3>
                    <p>Paid Order</p>
                </span>
            </li>
            <li>
                <i class='bx bx-show-alt'></i>
                <span class="info">
                    <h3>3,944</h3>
                    <p>Site Visit</p>
                </span>
            </li>
            <li>
                <i class='bx bx-line-chart'></i>
                <span class="info">
                    <h3>14,721</h3>
                    <p>Searches</p>
                </span>
            </li>
            <li>
                <i class='bx bx-dollar-circle'></i>
                <span class="info">
                    <h3>$6,742</h3>
                    <p>Total Sales</p>
                </span>
            </li>
        </ul>
        <!-- End of Insights -->

        <div class="bottom-data">
            <div class="orders">
                <div class="header">
                    <i class='bx bx-receipt'></i>
                    <h3>Recent Orders</h3>
                    <i class='bx bx-filter'></i>
                    <i class='bx bx-search'></i>
                </div>
                <table>
                    <thead>
                    <tr>
                        <th>PATIENT NAME</th>
                        <th>DATE</th>
                        <th>Time</th>
                        <th>Level</th>
                        <th>Supprimer</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${shows}" var="glycemia">
                        <tr>
                            <td>${glycemia.name_patient}</td>
                            <td>${glycemia.date}</td>
                            <td>${glycemia.time}</td>
                            <td>${glycemia.level}</td>
                            <td>
                                <a href="delete/${glycemia.idGlycemia}" class="btn btn-outline-danger">
                                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="30" height="30" viewBox="0 0 100 100">
                                        <path fill="#f37e98" d="M25,30l3.645,47.383C28.845,79.988,31.017,82,33.63,82h32.74c2.613,0,4.785-2.012,4.985-4.617L75,30"></path><path fill="#f15b6c" d="M65 38v35c0 1.65-1.35 3-3 3s-3-1.35-3-3V38c0-1.65 1.35-3 3-3S65 36.35 65 38zM53 38v35c0 1.65-1.35 3-3 3s-3-1.35-3-3V38c0-1.65 1.35-3 3-3S53 36.35 53 38zM41 38v35c0 1.65-1.35 3-3 3s-3-1.35-3-3V38c0-1.65 1.35-3 3-3S41 36.35 41 38zM77 24h-4l-1.835-3.058C70.442 19.737 69.14 19 67.735 19h-35.47c-1.405 0-2.707.737-3.43 1.942L27 24h-4c-1.657 0-3 1.343-3 3s1.343 3 3 3h54c1.657 0 3-1.343 3-3S78.657 24 77 24z"></path><path fill="#1f212b" d="M66.37 83H33.63c-3.116 0-5.744-2.434-5.982-5.54l-3.645-47.383 1.994-.154 3.645 47.384C29.801 79.378 31.553 81 33.63 81H66.37c2.077 0 3.829-1.622 3.988-3.692l3.645-47.385 1.994.154-3.645 47.384C72.113 80.566 69.485 83 66.37 83zM56 20c-.552 0-1-.447-1-1v-3c0-.552-.449-1-1-1h-8c-.551 0-1 .448-1 1v3c0 .553-.448 1-1 1s-1-.447-1-1v-3c0-1.654 1.346-3 3-3h8c1.654 0 3 1.346 3 3v3C57 19.553 56.552 20 56 20z"></path><path fill="#1f212b" d="M77,31H23c-2.206,0-4-1.794-4-4s1.794-4,4-4h3.434l1.543-2.572C28.875,18.931,30.518,18,32.265,18h35.471c1.747,0,3.389,0.931,4.287,2.428L73.566,23H77c2.206,0,4,1.794,4,4S79.206,31,77,31z M23,25c-1.103,0-2,0.897-2,2s0.897,2,2,2h54c1.103,0,2-0.897,2-2s-0.897-2-2-2h-4c-0.351,0-0.677-0.185-0.857-0.485l-1.835-3.058C69.769,20.559,68.783,20,67.735,20H32.265c-1.048,0-2.033,0.559-2.572,1.457l-1.835,3.058C27.677,24.815,27.351,25,27,25H23z"></path><path fill="#1f212b" d="M61.5 25h-36c-.276 0-.5-.224-.5-.5s.224-.5.5-.5h36c.276 0 .5.224.5.5S61.776 25 61.5 25zM73.5 25h-5c-.276 0-.5-.224-.5-.5s.224-.5.5-.5h5c.276 0 .5.224.5.5S73.776 25 73.5 25zM66.5 25h-2c-.276 0-.5-.224-.5-.5s.224-.5.5-.5h2c.276 0 .5.224.5.5S66.776 25 66.5 25zM50 76c-1.654 0-3-1.346-3-3V38c0-1.654 1.346-3 3-3s3 1.346 3 3v25.5c0 .276-.224.5-.5.5S52 63.776 52 63.5V38c0-1.103-.897-2-2-2s-2 .897-2 2v35c0 1.103.897 2 2 2s2-.897 2-2v-3.5c0-.276.224-.5.5-.5s.5.224.5.5V73C53 74.654 51.654 76 50 76zM62 76c-1.654 0-3-1.346-3-3V47.5c0-.276.224-.5.5-.5s.5.224.5.5V73c0 1.103.897 2 2 2s2-.897 2-2V38c0-1.103-.897-2-2-2s-2 .897-2 2v1.5c0 .276-.224.5-.5.5S59 39.776 59 39.5V38c0-1.654 1.346-3 3-3s3 1.346 3 3v35C65 74.654 63.654 76 62 76z"></path><path fill="#1f212b" d="M59.5 45c-.276 0-.5-.224-.5-.5v-2c0-.276.224-.5.5-.5s.5.224.5.5v2C60 44.776 59.776 45 59.5 45zM38 76c-1.654 0-3-1.346-3-3V38c0-1.654 1.346-3 3-3s3 1.346 3 3v35C41 74.654 39.654 76 38 76zM38 36c-1.103 0-2 .897-2 2v35c0 1.103.897 2 2 2s2-.897 2-2V38C40 36.897 39.103 36 38 36z"></path>
                                    </svg>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Reminders -->
            <div class="reminders">
                <div class="header">
                    <i class='bx bx-note'></i>
                    <h3>Reminders</h3>
                </div>
                <canvas id="glycemiaChart"></canvas>
            </div>
            <!-- End of Reminders -->
        </div>
    </main>
</div>

<!-- Add Glycema Modal -->
<div id="modalFormGlycemia" class="modal">
    <div class="modal-content">
        <span class="close-button" onclick="closeForm('modalFormGlycemia')">&times;</span>
        <form action="add" method="post" class="formA">
            <div>
                <label for="date">Date:</label>
                <input type="date" id="date" name="date" required>
            </div>
            <div>
                <label for="time">Heure:</label>
                <input type="time" id="time" name="time" required>
            </div>
            <div>
                <label for="level">Niveau:</label>
                <input type="text" id="level" name="level" required>
            </div>
            <div>
                <label for="name_patient">Nom du patient:</label>
                <input type="text" id="name_patient" name="name_patient" required>
            </div>
            <button type="submit">Ajouter</button>
        </form>
    </div>
</div>

<script src="index.js"></script>
<script>
    const glycemiaData = [];
    const labels = [];
    <c:forEach var="reading" items="${glycemiaReadings}">
    labels.push('${reading.date}');
    glycemiaData.push(${reading.glycemia});
    </c:forEach>

    const ctx = document.getElementById('glycemiaChart').getContext('2d');
    const glycemiaChart = new Chart(ctx, {

    type: 'line',
    data: {
    labels: labels,
    datasets: [{
    label: 'Tasks Completed',
    data: glycemiaData,
    backgroundColor: 'rgba(75, 192, 192, 0.2)',
    borderColor: 'rgba(75, 192, 192, 1)',
    borderWidth: 1,
    pointBackgroundColor: 'rgba(153, 102, 255, 1)',
    pointBorderColor: '#fff',
    pointBorderWidth: 2,
    pointRadius: 5,
    pointHoverRadius: 7,
    pointHoverBackgroundColor: 'rgba(255, 159, 64, 1)',
    pointHoverBorderColor: 'rgba(255, 159, 64, 1)',
    pointHoverBorderWidth: 2,
    }]
    },
    options: {
    scales: {
    y: {
    beginAtZero: true
    }
    },
    plugins: {
    legend: {
    display: true,
    labels: {
    color: 'rgb(75, 192, 192)'
    }
    }
    },
    elements: {
    point: {
    pointStyle: 'circle'
    }
    }
    }
    });


    // level
    document.addEventListener('DOMContentLoaded', () => {
        fetch('/api/levels')
            .then(response => response.json())
            .then(data => {
                const tableBody = document.querySelector('#levels-table tbody');
                data.forEach(item => {
                    const row = document.createElement('tr');
                    const levelClass = item.level < 1.0 ? 'low-level' : item.level <= 1.4 ? 'normal-level' : 'high-level';
                    row.classList.add(levelClass);
                    tableBody.appendChild(row);
                });
            });
    });
// model
    function openForm(formId) {
        document.getElementById(formId).style.display = "flex";
    }

    function closeForm(formId) {
        document.getElementById(formId).style.display = "none";
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script><%@ include file="index.js"%></script>
</body>

</html>
