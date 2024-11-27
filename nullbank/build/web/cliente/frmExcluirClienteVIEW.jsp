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

        input {
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
            background-color: #dc3545; /* Red color for delete button */
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
        <form action="excluirCliente.jsp" method="POST">

            <label style="font-weight: bold; font-size: 1.2em;">EXCLUSÃO DE CLIENTE</label><br><br>
            <label>Confira os dados do cliente que deseja excluir:</label><br><br>

            <label>CPF:</label>
            <input type="text" name="cpf" value="<%=request.getParameter("cpf")%>" readonly>

            <label>Senha:</label>
            <input type="password" name="senha" value="<%=request.getParameter("senha")%>" readonly>

            <label>Nome:</label>
            <input type="text" name="nome" value="<%=request.getParameter("nome")%>" readonly>

            <label>RG:</label>
            <input type="text" name="rg" value="<%=request.getParameter("rg")%>" readonly>

            <label>Órgão Emissor:</label>
            <input type="text" name="orgaoEmissor" value="<%=request.getParameter("orgaoEmissor")%>" readonly>

            <label>UF:</label>
            <input type="text" name="uf" value="<%=request.getParameter("uf")%>" readonly>

            <label>Data de Nascimento:</label>
            <input type="date" name="dataNascimento" value="<%=request.getParameter("dataNascimento")%>" readonly>

            <label>Tipo de Logradouro:</label>
            <input type="text" name="tipoLogradouro" value="<%=request.getParameter("tipoLogradouro")%>" readonly>

            <label>Nome de Logradouro:</label>
            <input type="text" name="nomeLogradouro" value="<%=request.getParameter("nomeLogradouro")%>" readonly>

            <label>Número:</label>
            <input type="text" name="numero" value="<%=request.getParameter("numero")%>" readonly>

            <label>Bairro:</label>
            <input type="text" name="bairro" value="<%=request.getParameter("bairro")%>" readonly>

            <label>CEP:</label>
            <input type="text" name="cep" value="<%=request.getParameter("cep")%>" readonly>

            <label>Cidade:</label>
            <input type="text" name="cidade" value="<%=request.getParameter("cidade")%>" readonly>

            <label>Estado:</label>
            <input type="text" name="estado" value="<%=request.getParameter("estado")%>" readonly><br><br>

            <button type="submit">EXCLUIR</button>

        </form>
    </main>

    <!-- Include Bootstrap JS and Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyCkzoU8g0gAgn2b8Z+Oqtbz7ukYE98f" crossorigin="anonymous"></script>
</body>
</html>
