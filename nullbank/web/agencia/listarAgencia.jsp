<%@page import="br.com.DTO.agenciaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.agenciaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nullbank - Agências</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #333;
            color: white;
            padding: 1em;
            text-align: center;
        }

        nav {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        nav a {
            margin: 0 10px;
            color: white;
            text-decoration: none;
        }

        main {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            text-align: center;
            background-color: #ddd; /* Cor de fundo cinza */
            padding: 10px;
            border-radius: 8px;
        }

        /* Estilo para a tabela */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: white;
        }

        /* Estilo para o formulário */
        form {
            margin-top: 20px;
        }

        label {
            display: flex;
            justify-content: center;
            margin-bottom: 8px;
            font-weight: bold;
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
        }

        button:hover {
            filter: brightness(85%);
        }

        .add-button {
            background-color: #28a745;
            color: white;
        }

        .add-button:hover {
            background-color: #218838;
        }

        .edit-button, .delete-button {
            padding: 8px 12px;
            margin: 4px;
            text-align: center;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            border-radius: 4px;
        }

        .edit-button {
            background-color: #007bff;
            color: white;
        }

        .edit-button:hover {
            background-color: #0056b3;
        }

        .delete-button {
            background-color: #dc3545;
            color: white;
        }

        .delete-button:hover {
            background-color: #c82333;
        }
        
    </style>
    <script>
        function voltar() {
            window.location.href = '../viewDBA.html';
        }
    </script>
</head>
<body>
    <main>
        <h2>LISTAGEM DE AGÊNCIAS</h2><br>
        <button onclick="voltar()">Início</button><br><br>

        <%
            try {
                out.print("<button class='add-button' onclick=\"location.href='frmAgenciaVIEW.html'\">Adicionar</button><br><br>");

                agenciaDAO agencia = new agenciaDAO();
                ArrayList<agenciaDTO> lista = agencia.PesquisarAgencia();

                for(int num = 0; num < lista.size(); num++) {
        %>
        <div class="agency-container">
            <br>
            <table>
                <tr>
                    <td>Código:</td>
                    <td><%= lista.get(num).getNumero() %></td>
                </tr>
                <tr>
                    <td>Nome:</td>
                    <td><%= lista.get(num).getNome() %></td>
                </tr>
                <tr>
                    <td>Montante Total:</td>
                    <td><%= lista.get(num).getMontante() %></td>
                </tr>
                <tr>
                    <td>Cidade:</td>
                    <td><%= lista.get(num).getCidade() %></td>
                </tr>
            </table>
            <button class='edit-button' onclick="location.href='frmAlterarAgenciaVIEW.jsp?id=<%= lista.get(num).getNumero() %>&nome=<%= lista.get(num).getNome() %>&montante=<%= lista.get(num).getMontante() %>&cidade=<%= lista.get(num).getCidade() %>'">Alterar</button>
            <button class='delete-button' onclick="location.href='frmExcluirAgenciaVIEW.jsp?id=<%= lista.get(num).getNumero() %>&nome=<%= lista.get(num).getNome() %>&montante=<%= lista.get(num).getMontante() %>&cidade=<%= lista.get(num).getCidade() %>'">Excluir</button>
        </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </main>
</body>
</html>
