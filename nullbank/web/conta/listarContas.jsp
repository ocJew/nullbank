<%@page import="br.com.DTO.contaDTO"%>
<%@page import="br.com.DAO.contaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nullbank - Contas</title>
        <script>
            function voltar() {
                window.location.href = '../viewDBA.html';
            }
        </script>
    </head>
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
    <body>
        <main>
            <button onclick="voltar()">Início</button><br><br>
            <label style="font-weight: bold; font-size: 1.2em;">LISTAGEM DE CONTAS</label><br><br>

            <%
                try {
                    out.print("<button class='add-button' onclick=\"location.href='frmContaVIEW.html'\">Adicionar</button><br><br>");

                    contaDAO conta = new contaDAO();
                    ArrayList<contaDTO> lista = conta.listarContas();

                    for (int num = 0; num < lista.size(); num++) {
            %>
            <div class="account-container">
               
                <table>
                    <tr>
                        <td>Número da Conta:</td>
                        <td><%= lista.get(num).getNumero() %></td>
                    </tr>
                    <tr>
                        <td>Número da Agência:</td>
                        <td><%= lista.get(num).getAgenciaID() %></td>
                    </tr>
                    <tr>
                        <td>Matrícula do Gerente:</td>
                        <td><%= lista.get(num).getGerenteMatricula() %></td>
                    </tr>
                    <tr>
                        <td>Saldo:</td>
                        <td><%= lista.get(num).getSaldo() %></td>
                    </tr>
                    <tr>
                        <td>Senha:</td>
                        <td><%= lista.get(num).getSenha() %></td>
                    </tr>
                    <tr>
                        <td>Tipo de Conta:</td>
                        <td><%= lista.get(num).getTipoConta() %></td>
                    </tr>
                </table>
                <button class='edit-button' onclick="location.href='frmAlterarContaVIEW.jsp?numeroConta=<%= lista.get(num).getNumero() %>&agenciaNumero=<%= lista.get(num).getAgenciaID() %>&gerenteMatricula=<%= lista.get(num).getGerenteMatricula() %>&saldo=<%= lista.get(num).getSaldo() %>&senha=<%= lista.get(num).getSenha() %>&tipoConta=<%= lista.get(num).getTipoConta() %>'">Alterar</button>
                <button class='delete-button' onclick="location.href='frmExcluirContaVIEW.jsp?numeroConta=<%= lista.get(num).getNumero() %>&agenciaNumero=<%= lista.get(num).getAgenciaID() %>&gerenteMatricula=<%= lista.get(num).getGerenteMatricula() %>&saldo=<%= lista.get(num).getSaldo() %>&senha=<%= lista.get(num).getSenha() %>&tipoConta=<%= lista.get(num).getTipoConta() %>'">Excluir</button>
            </div>
            <%
                    }
                } catch (Exception e) {e.printStackTrace();}
            %>
        </main>
    </body>
</html>
