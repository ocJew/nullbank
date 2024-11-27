<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.clienteDAO"%>
<%@page import="br.com.DTO.clienteDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                clienteDTO objClienteDTO = new clienteDTO();
                
                objClienteDTO.setCpf(request.getParameter("cliente-cpf"));
                objClienteDTO.setSenha(request.getParameter("cliente-password"));
                
                clienteDAO objClienteDAO = new clienteDAO();
                if(objClienteDAO.verificarLogin(objClienteDTO)){
                    // Login bem-sucedido! Redirecionando para a página principal...
                    response.sendRedirect("../conta/listarContas.jsp?cpf=" + objClienteDTO.getCpf());
                } else {
                    // Se as credenciais não são válidas, imprime uma mensagem de erro
                    out.println("Credenciais inválidas. Tente novamente.");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
