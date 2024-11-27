<%@page import="br.com.DAO.contaEspecialDAO"%>
<%@page import="br.com.DAO.contaPoupancaDAO"%>
<%@page import="br.com.DAO.contaCorrenteDAO"%>
<%@page import="br.com.DTO.contaEspecialDTO"%>
<%@page import="br.com.DTO.contaPoupancaDTO"%>
<%@page import="br.com.DTO.contaCorrenteDTO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="br.com.DAO.contaDAO"%>
<%@page import="br.com.DTO.contaDTO"%>
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
            
                contaDTO objContaDTO = new contaDTO();
                
                objContaDTO.setNumero(Integer.parseInt(request.getParameter("numeroConta")));
                objContaDTO.setAgenciaID(Integer.parseInt(request.getParameter("agenciaID")));
                objContaDTO.setGerenteMatricula(Integer.parseInt(request.getParameter("gerenteMatricula")));
                objContaDTO.setSaldo(Float.parseFloat(request.getParameter("saldo")));
                objContaDTO.setSenha(request.getParameter("senha"));
                objContaDTO.setTipoConta(contaDTO.TipoConta.valueOf(request.getParameter("tipoConta")));
                
                contaDAO objContaDAO = new contaDAO();
                if(objContaDAO.cadastrarConta(objContaDTO)){
                    %>
                        <!-- Adicione o botão "Continuar" -->
                        <div>Inserido</div>
                        <form action="listarContas.jsp">
                            <input type="submit" value="Voltar para listagem de contas bancárias">
                        </form>
                    <%                     
                } else {
                    %>
                        <!-- Adicione o botão "Continuar" -->
                        <div>Erro</div>
                        <form action="frmContaVIEW.html">
                            <input type="submit" value="Tente novamente">
                        </form>
                    <%
                }
                if (request.getParameter("tipoConta").equals("corrente")) {
                    contaCorrenteDTO objContaCorrenteDTO = new contaCorrenteDTO();
                    objContaCorrenteDTO.setDataAniversario(java.sql.Date.valueOf(request.getParameter("dataAniversarioCorrente")));
                    objContaCorrenteDTO.setNumeroConta(Integer.parseInt(request.getParameter("numeroConta")));
                    contaCorrenteDAO objContaCorrenteDAO = new contaCorrenteDAO();
                    objContaCorrenteDAO.cadastrarContaCorrente(objContaCorrenteDTO);
                }
                if (request.getParameter("tipoConta").equals("poupanca")) {
                    contaPoupancaDTO objContaPoupancaDTO = new contaPoupancaDTO();
                    objContaPoupancaDTO.setTaxaJuros(new BigDecimal(request.getParameter("taxaJurosPoupanca")));
                    objContaPoupancaDTO.setNumeroConta(Integer.parseInt(request.getParameter("numeroConta")));
                    contaPoupancaDAO objContaPoupancaDAO = new contaPoupancaDAO();
                    objContaPoupancaDAO.cadastrarContaPoupanca(objContaPoupancaDTO);
                }
                if (request.getParameter("tipoConta").equals("especial")) {
                    contaEspecialDTO objContaEspecialDTO = new contaEspecialDTO();
                    objContaEspecialDTO.setLimiteCredito(Float.parseFloat(request.getParameter("limiteCreditoEspecial")));
                    objContaEspecialDTO.setNumeroConta(Integer.parseInt(request.getParameter("numeroConta")));
                    contaEspecialDAO objContaEspecialDAO = new contaEspecialDAO();
                    objContaEspecialDAO.cadastrarContaEspecial(objContaEspecialDTO);
                }
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        
    </body>
</html>
