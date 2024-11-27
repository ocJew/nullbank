<%-- 
    Document   : inserirAgencia
    Created on : 18 de nov. de 2023, 16:42:42
    Author     : User
--%>

<%@page import="br.com.DAO.agenciaDAO"%>
<%@page import="br.com.DTO.agenciaDTO"%>
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
            
                agenciaDTO objAgenciaDTO = new agenciaDTO();
                
                objAgenciaDTO.setNome(request.getParameter("nome"));
                objAgenciaDTO.setCidade(request.getParameter("cidade"));
                
                agenciaDAO objAgenciaDAO = new agenciaDAO();
                objAgenciaDAO.cadastrarAgencia(objAgenciaDTO);
                %>
                <div>Adicionada</div>
                <form action="listarAgencia.jsp">
                    <input type="submit" value="Voltar para listagem de agências">
                </form>
                <%                
            } catch (Exception e) {e.printStackTrace();}
        %>
        
    </body>
</html>
