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

        objDependenteDTO.setMatriculaFuncionario(Integer.parseInt(request.getParameter("matriculaFuncionario")));
        objDependenteDTO.setNome(request.getParameter("nome"));
        objDependenteDTO.setDataNascimento(java.sql.Date.valueOf(request.getParameter("dataNascimento")));
        objDependenteDTO.setParentesco(dependenteDTO.Parentesco.valueOf(request.getParameter("parentesco")));
        
        dependenteDAO objDependenteDAO = new dependenteDAO();
        if(objDependenteDAO.cadastrarDependente(objDependenteDTO)){
            %>
                <div>Inserido</div>
                <form action="listarDependente.jsp">
                    <input type="submit" value="Voltar para listagem de dependentes">
                </form>
            <% 
        }else{
            %>
                <!-- Adicione o botão "Continuar" -->
                <div>Erro</div>
                <form action="frmDependenteVIEW.html">
                    <input type="submit" value="Tente novamente">
                </form>
            <%
        }

    } catch (Exception e) {
        e.printStackTrace();
}
%>

</body>
</html>
