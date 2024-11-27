<%@page import="br.com.DTO.funcionarioDTO.Cargo"%>
<%@page import="java.util.ArrayList"%>
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
                
                objFuncionarioDTO.setMatricula(Integer.parseInt(request.getParameter("funcionario-username")));
                objFuncionarioDTO.setSenha(request.getParameter("funcionario-password"));
                
                funcionarioDAO objFuncionarioDAO = new funcionarioDAO();
                if(objFuncionarioDAO.verificarLogin(objFuncionarioDTO)){
                    int matricula = Integer.parseInt(request.getParameter("funcionario-username"));
                    Cargo cargo = objFuncionarioDAO.obterCargoPorMatricula(matricula);
                    
                    if (Cargo.gerente.equals(cargo)) {
                        %>
                            <p>Acesso aceito como gerente</p>

                            <div class="container">
                                <h1>Dados</h1>
                                <form action="../conta/listarContaF.jsp" method="post">
                                    <!-- Outros campos do formulário aqui -->

                                    <!-- Adicione um campo hidden para a matrícula -->
                                    <input type="hidden" id="funcionario-username" name="matricula" value="<%= matricula %>" required>

                                    <input type="submit" value="Lista de contas">
                                </form>
                            </div>
                        <%
                    } else if (Cargo.caixa.equals(cargo)) {
                        %>
                            <p>Acesso aceito como caixa</p>
                            <!-- Adicione o botão "Continuar" -->
                            <form action="viewCaixa.html" method="post">
                                <input type="submit" value="Continuar">
                            </form>
                        <%
                    } else if (Cargo.atendente.equals(cargo)) {
                        %>
                            <p>Acesso aceito como atendente</p>
                            <!-- Adicione o botão "Continuar" -->
                            <form action="viewAtendente.html" method="post">
                                <input type="submit" value="Continuar">
                            </form>
                        <%
                    } else {
                        out.println("Cargo desconhecido ou inexistente");
                    }
                    %> 
  
                    <%
                    
                } else {
                    // Se as credenciais não são válidas, imprime uma mensagem de erro
                    out.println("Credenciais inválidas. Tente novamente.");
                }
            } catch (Exception e) {e.printStackTrace();}
        %>
    </body>
</html>
