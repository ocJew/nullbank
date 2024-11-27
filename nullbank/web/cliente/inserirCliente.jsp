<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.emailDAO"%>
<%@page import="br.com.DAO.telefoneDAO"%>
<%@page import="br.com.DAO.clienteDAO"%>
<%@page import="br.com.DTO.clienteDTO"%>
<%@page import="br.com.DTO.telefoneDTO"%>
<%@page import="br.com.DTO.emailDTO"%>
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
        // Criar o objeto clienteDTO e configurar os valores
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
        objClienteDAO.cadastrarCliente(objClienteDTO);

        telefoneDTO objTelefoneDTO = new telefoneDTO();
        objTelefoneDTO.setClientesCpf(request.getParameter("cpf"));
        objTelefoneDTO.setTelefone(request.getParameter("telefone"));
        telefoneDAO objTelefoneDAO = new telefoneDAO();
        objTelefoneDAO.cadastrarTelefone(objTelefoneDTO);
        if (request.getParameter("telefoneComercial") != null && !request.getParameter("telefoneComercial").isEmpty()) {
            telefoneDTO objTelefoneComercialDTO = new telefoneDTO();
            objTelefoneComercialDTO.setClientesCpf(request.getParameter("cpf"));
            objTelefoneComercialDTO.setTelefone(request.getParameter("telefoneComercial"));
            telefoneDAO objTelefoneComercialDAO = new telefoneDAO();
            objTelefoneComercialDAO.cadastrarTelefone(objTelefoneComercialDTO);
        }

        // Configurar celular (opcional)
        if (request.getParameter("celular1") != null && !request.getParameter("celular1").isEmpty()) {
            telefoneDTO objCelular1DTO = new telefoneDTO();
            objCelular1DTO.setClientesCpf(request.getParameter("cpf"));
            objCelular1DTO.setTelefone(request.getParameter("celular1"));
            telefoneDAO objCelular1DAO = new telefoneDAO();
            objCelular1DAO.cadastrarTelefone(objCelular1DTO);
        }
        emailDTO objEmailDTO = new emailDTO();
        objEmailDTO.setClientesCpf(request.getParameter("cpf"));
        objEmailDTO.setEmail(request.getParameter("email"));
        emailDAO objEmailDAO = new emailDAO();
        objEmailDAO.cadastrarEmail(objEmailDTO);
        if (request.getParameter("emailComercial") != null && !request.getParameter("emailComercial").isEmpty()) {
            emailDTO objEmailComercialDTO = new emailDTO();
            objEmailComercialDTO.setClientesCpf(request.getParameter("cpf"));
            objEmailComercialDTO.setEmail(request.getParameter("emailComercial"));
            emailDAO objEmailComercialDAO = new emailDAO();
            objEmailComercialDAO.cadastrarEmail(objEmailComercialDTO);
        }


    %>
        <!-- Adicione o botão "Continuar" -->
        <div>Inserido</div>
        <form action="listarCliente.jsp">
            <input type="submit" value="Voltar para listagem de clientes">
        </form>
    <%
    } catch (Exception e) {e.printStackTrace();}

%>

</body>
</html>
