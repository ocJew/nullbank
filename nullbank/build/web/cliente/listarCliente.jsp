<%@page import="java.util.List"%>
<%@page import="br.com.DTO.telefoneDTO"%>
<%@page import="br.com.DAO.telefoneDAO"%>
<%@page import="br.com.DTO.emailDTO"%>
<%@page import="br.com.DAO.emailDAO"%>
<%@page import="br.com.DTO.clienteDTO"%>
<%@page import="br.com.DAO.clienteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nullbank - Clientes</title>
    <script>
        function voltar() {
            window.location.href = '../viewDBA.html';
        }
    </script>
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
</head>

<body>
    <main>
        <h2>LISTAGEM DE CLIENTES</h2><br>
        <button onclick="voltar()">Início</button><br><br>

        <%
            try {
                out.print("<button class='add-button' onclick=\"location.href='frmClienteVIEW.html'\">Adicionar</button>");
                %> <br><br> <%
                
                clienteDAO cliente = new clienteDAO();
                ArrayList<clienteDTO> lista = cliente.pesquisarCliente();
                
                for (int num = 0; num < lista.size(); num++) {
        %>
        <div class="client-container">
            
            <table>
                <tr>
                    <td>CPF:</td>
                    <td><%=lista.get(num).getCpf()%></td>
                </tr>
                <tr>
                    <td>Nome:</td>
                    <td><%=lista.get(num).getNome()%></td>
                </tr>
                <!-- Uncomment the following lines if you want to display the password -->
                <!--
                <tr>
                    <td>Senha:</td>
                    <td><%=lista.get(num).getSenha()%></td>
                </tr>
                -->
                <tr>
                    <td>RG:</td>
                    <td><%=lista.get(num).getRg()%></td>
                </tr>
                <tr>
                    <td>Órgão Emissor:</td>
                    <td><%=lista.get(num).getOrgaoEmissor()%></td>
                </tr>
                <tr>
                    <td>UF:</td>
                    <td><%=lista.get(num).getUf()%></td>
                </tr>
                <tr>
                    <td>Data de Nascimento:</td>
                    <td><%=lista.get(num).getDataNascimento()%></td>
                </tr>
                <tr>
                    <td>Tipo de Logradouro:</td>
                    <td><%=lista.get(num).getTipoLogradouro()%></td>
                </tr>
            </table>

            <table>
                <tr>
                    <td>Nome de Logradouro:</td>
                    <td><%=lista.get(num).getNomeLogradouro()%></td>
                </tr>
                <tr>
                    <td>Número:</td>
                    <td><%=lista.get(num).getNumero()%></td>
                </tr>
                <tr>
                    <td>CEP:</td>
                    <td><%=lista.get(num).getCep()%></td>
                </tr>
                <tr>
                    <td>Cidade:</td>
                    <td><%=lista.get(num).getCidade()%></td>
                </tr>
                <tr>
                    <td>Estado:</td>
                    <td><%=lista.get(num).getEstado()%></td>
                </tr>
                <tr>
                    <td>E-mails:</td>
                    <td>
                        <%
                            emailDAO emailDao = new emailDAO();
                            String A = lista.get(num).getCpf();
                            List<String> emails = emailDao.getEmailsByCliente(A);
                            for (String email : emails) {
                                out.print(email + "  -  ");
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td>Telefones:</td>
                    <td>
                        <%
                            telefoneDAO telefoneDao = new telefoneDAO();
                            List<telefoneDTO> telefones = telefoneDao.getTelefonesByCliente(A);
                            for (telefoneDTO telefone : telefones) {
                                out.print(telefone.getTelefone() + "  -  ");
                            }
                        %>
                    </td>
                </tr>
            </table>
                    <button class="edit-button" onclick="location.href='frmAlterarClienteVIEW.jsp?cpf=<%=lista.get(num).getCpf()%>&senha=<%=lista.get(num).getSenha()%>&nome=<%=lista.get(num).getNome()%>&rg=<%=lista.get(num).getRg()%>&orgaoEmissor=<%=lista.get(num).getOrgaoEmissor()%>&uf=<%=lista.get(num).getUf()%>&dataNascimento=<%=lista.get(num).getDataNascimento()%>&tipoLogradouro=<%=lista.get(num).getTipoLogradouro()%>&nomeLogradouro=<%=lista.get(num).getNomeLogradouro()%>&numero=<%=lista.get(num).getNumero()%>&bairro=<%=lista.get(num).getBairro()%>&cep=<%=lista.get(num).getCep()%>&cidade=<%=lista.get(num).getCidade()%>&estado=<%=lista.get(num).getEstado()%>'">Alterar</button>
                    <button class="delete-button" onclick="location.href='frmExcluirClienteVIEW.jsp?cpf=<%=lista.get(num).getCpf()%>&senha=<%=lista.get(num).getSenha()%>&nome=<%=lista.get(num).getNome()%>&rg=<%=lista.get(num).getRg()%>&orgaoEmissor=<%=lista.get(num).getOrgaoEmissor()%>&uf=<%=lista.get(num).getUf()%>&dataNascimento=<%=lista.get(num).getDataNascimento()%>&tipoLogradouro=<%=lista.get(num).getTipoLogradouro()%>&nomeLogradouro=<%=lista.get(num).getNomeLogradouro()%>&numero=<%=lista.get(num).getNumero()%>&bairro=<%=lista.get(num).getBairro()%>&cep=<%=lista.get(num).getCep()%>&cidade=<%=lista.get(num).getCidade()%>&estado=<%=lista.get(num).getEstado()%>'">Excluir</button>

            <br><br>
            
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
