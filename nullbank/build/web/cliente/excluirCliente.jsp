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
                objClienteDTO.setCpf(request.getParameter("cpf"));
                
                clienteDAO objClienteDAO = new clienteDAO();
                objClienteDAO.excluirCliente(objClienteDTO);
        %>
                    <!-- Adicione o botão "Continuar" -->
                    <div>Cliente Excluído</div>
                    <form action="listarCliente.jsp">
                        <input type="submit" value="Voltar para listagem de clientes">
                    </form>
        <% 
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
