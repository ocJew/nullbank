<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyCkzoU8g0gAgn2b8Z+Oqtbz7ukYE98f" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        main {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }

        input,
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 12px;
            box-sizing: border-box;
        }

        button {
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            background-color: #007bff; /* Blue color for alter button */
            color: white;
            width: 100%;
        }

        button:hover {
            filter: brightness(85%);
        }
    </style>
</head>
<body>
    <main>
        <form action="alterarFuncionario.jsp" method="POST">

            <label style="font-weight: bold; font-size: 1.2em;">ALTERAÇÃO DE FUNCIONÁRIO</label><br><br>

            <label>Matrícula:</label>
            <input type="text" name="matricula" value="<%=request.getParameter("matricula")%>">

            <label>ID da agência:</label>
            <input type="text" name="agenciaID" value="<%=request.getParameter("agenciaID")%>">

            <label>Nome:</label>
            <input type="text" name="nome" value="<%=request.getParameter("nome")%>">

            <label>Senha:</label>
            <input type="password" name="senha" value="<%=request.getParameter("senha")%>">

            <label>Endereço:</label>
            <input type="text" name="endereco" value="<%=request.getParameter("endereco")%>">

            <label>Cidade:</label>
            <input type="text" name="cidade" value="<%=request.getParameter("cidade")%>">

            <label>Cargo:</label>
            <select name="cargo">
                <option value="gerente" <%=request.getParameter("cargo").equals("gerente") ? "selected" : ""%>>Gerente</option>
                <option value="atendente" <%=request.getParameter("cargo").equals("atendente") ? "selected" : ""%>>Atendente</option>
                <option value="caixa" <%=request.getParameter("cargo").equals("caixa") ? "selected" : ""%>>Caixa</option>
            </select>

            <label>Sexo:</label>
            <select name="sexo">
                <option value="M" <%=request.getParameter("sexo").equals("M") ? "selected" : ""%>>Masculino</option>
                <option value="F" <%=request.getParameter("sexo").equals("F") ? "selected" : ""%>>Feminino</option>
            </select>

            <label>Data de Nascimento:</label>
            <input type="date" name="dataNascimento" value="<%=request.getParameter("dataNascimento")%>">

            <label>Salário:</label>
            <input type="text" name="salario" value="<%=request.getParameter("salario")%>">

            <button type="submit">ALTERAR</button>

        </form>
    </main>

    <!-- Include Bootstrap JS and Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyCkzoU8g0gAgn2b8Z+Oqtbz7ukYE98f" crossorigin="anonymous"></script>
</body>
</html>
