<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('background.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .error-message {
            color: #d9534f;
            font-weight: bold;
        }

        form {
            margin-top: 20px;
        }

        input[type="text"],
        input[type="password"],
        input[type="submit"] {
            padding: 10px;
            margin: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 200px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #5cb85c;
            color: #fff;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <div class="container">
        <%
            try {
                String usuario = request.getParameter("dba-username");
                String senha = request.getParameter("dba-password");

                if ("Admin".equals(usuario) && "Root".equals(senha)) {
        %>
                    <p>Acesso aceito</p>
                    <!-- Adicione o botão "Continuar" -->
                    <form action="viewDBA.html" method="post">
                        <input type="submit" value="Continuar">
                    </form>
        <%
                } else {
        %>
                    <p class="error-message">Acesso negado</p>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</body>

</html>
