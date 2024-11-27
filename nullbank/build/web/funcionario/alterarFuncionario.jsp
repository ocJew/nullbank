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
                objFuncionarioDTO.setNome(request.getParameter("nome"));
                objFuncionarioDTO.setSenha(request.getParameter("senha"));
                objFuncionarioDTO.setEndereco(request.getParameter("endereco"));
                objFuncionarioDTO.setCidade(request.getParameter("cidade"));
                objFuncionarioDTO.setCargo(funcionarioDTO.Cargo.valueOf(request.getParameter("cargo")));
                objFuncionarioDTO.setSexo(funcionarioDTO.Sexo.valueOf(request.getParameter("sexo")));
                objFuncionarioDTO.setDataNascimento(java.sql.Date.valueOf(request.getParameter("dataNascimento")));
                objFuncionarioDTO.setSalario(Float.parseFloat(request.getParameter("salario")));

                funcionarioDAO objFuncionarioDAO = new funcionarioDAO();
                objFuncionarioDAO.alterarFuncionario(objFuncionarioDTO);
                
        %>
                    <!-- Adicione o botão "Continuar" -->
                    <div>Alterado</div>
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

