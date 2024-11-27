<%@page import="br.com.DTO.contaDTO"%>
<%@page import="br.com.DAO.contaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nullbank - Excluir Conta</title>
    <script>
        function voltar() {
            window.location.href = 'listarContas.jsp';
        }
    </script>
</head>
<body>
    <button onclick="voltar()">Voltar para a Lista de Contas</button><br><br>

    <label style="font-weight: bold; font-size: 1.2em;">EXCLUSÃO DE CONTA BANCÁRIA</label><br><br>

    <%
        try {
            int numeroConta = Integer.parseInt(request.getParameter("numeroConta"));
            int agenciaID = Integer.parseInt(request.getParameter("cpfCliente"));
            int gerenteMatricula = Integer.parseInt(request.getParameter("gerenteMatricula"));
            float saldo = Float.parseFloat(request.getParameter("saldo"));
            String senha = request.getParameter("senha");
            String tipoConta = request.getParameter("tipoConta");

            contaDTO conta = new contaDTO();
            conta.setNumero(numeroConta);
            conta.setAgenciaID(agenciaID);
            conta.setGerenteMatricula(gerenteMatricula);
            conta.setSaldo(saldo);
            conta.setSenha(senha);
            conta.setTipoConta(contaDTO.TipoConta.valueOf(tipoConta));

            contaDAO contaDAO = new contaDAO();
            contaDAO.excluirConta(conta.getNumero(), conta.getAgenciaID());
    %>

    <div>
        A conta bancária foi excluída com sucesso.
    </div>

    <%
        } catch (Exception e) {
            e.printStackTrace();
    }
    %>
</body>
</html>
