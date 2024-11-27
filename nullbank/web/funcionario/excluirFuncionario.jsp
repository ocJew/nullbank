<%@page import="br.com.DAO.funcionarioDAO"%>
<%@page import="br.com.DTO.funcionarioDTO"%>
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
                funcionarioDTO objFuncionarioDTO = new funcionarioDTO();
                objFuncionarioDTO.setMatricula(Integer.parseInt(request.getParameter("matricula")));
                objFuncionarioDTO.setIDagencia(Integer.parseInt(request.getParameter("agenciaID")));
                
                funcionarioDAO objFuncionarioDAO = new funcionarioDAO();
                objFuncionarioDAO.excluirFuncionario(objFuncionarioDTO);
        %>
                    <!-- Adicione o botão "Continuar" -->
                    <div>Excluído</div>
                    <form action="listarFuncionario.jsp">
                        <input type="submit" value="Voltar para listagem de funcionários">
                    </form>
        <% 
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
