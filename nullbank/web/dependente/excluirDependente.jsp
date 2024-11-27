<%@page import="br.com.DAO.dependenteDAO"%>
<%@page import="br.com.DTO.dependenteDTO"%>
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
                dependenteDTO objDependenteDTO = new dependenteDTO();
                objDependenteDTO.setNome(request.getParameter("nome"));
                objDependenteDTO.setMatriculaFuncionario(Integer.parseInt(request.getParameter("matriculaFuncionario")));
                
                dependenteDAO objDependenteDAO = new dependenteDAO();
                objDependenteDAO.excluirDependente(objDependenteDTO);
                
        %>
                    <!-- Adicione o botão "Continuar" -->
                    <div>Excluído</div>
                    <form action="listarDependente.jsp">
                        <input type="submit" value="Voltar para listagem de dependentes">
                    </form>
        <% 
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
