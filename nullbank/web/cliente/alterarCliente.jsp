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
                objClienteDTO.setSenha(request.getParameter("senha"));
                objClienteDTO.setNome(request.getParameter("nome"));
                objClienteDTO.setRg(request.getParameter("rg"));
                objClienteDTO.setOrgaoEmissor(request.getParameter("orgaoEmissor"));
                objClienteDTO.setUf(request.getParameter("uf"));
                objClienteDTO.setDataNascimento(java.sql.Date.valueOf(request.getParameter("dataNascimento")));
                objClienteDTO.setTipoLogradouro(request.getParameter("tipoLogradouro"));
                objClienteDTO.setNomeLogradouro(request.getParameter("nomeLogradouro"));
                objClienteDTO.setNumero(request.getParameter("numero"));
                objClienteDTO.setBairro(request.getParameter("bairro"));
                objClienteDTO.setCep(request.getParameter("cep"));
                objClienteDTO.setCidade(request.getParameter("cidade"));
                objClienteDTO.setEstado(request.getParameter("estado"));

                clienteDAO objClienteDAO = new clienteDAO();
                objClienteDAO.alterarCliente(objClienteDTO);
                
        %>
                    <!-- Adicione o botão "Continuar" -->
                    <div>Cliente Alterado</div>
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
