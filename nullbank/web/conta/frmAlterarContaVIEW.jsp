<%@page import="br.com.DTO.contaDTO"%>
<%@page import="br.com.DAO.contaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nullbank - Alterar Conta</title>
    <script>
        function voltar() {
            window.location.href = 'listarContas.jsp';
        }
    </script>
</head>
<body>
    <button onclick="voltar()">Voltar para a Lista de Contas</button><br><br>

    <label style="font-weight: bold; font-size: 1.2em;">ALTERAÇÃO DE CONTA BANCÁRIA</label><br><br>

    <%
        try {
            int numeroConta = Integer.parseInt(request.getParameter("numeroConta"));
            int agenciaID = Integer.parseInt(request.getParameter("agenciaNumero"));
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
            contaDAO.alterarConta(conta);
    %>

    <form action="alterarConta.jsp" method="POST">
        <input type="hidden" name="numeroConta" value="<%= conta.getNumero() %>">
        <input type="hidden" name="agenciaID" value="<%= conta.getAgenciaID() %>">
        <input type="hidden" name="gerenteMatricula" value="<%= conta.getGerenteMatricula() %>">
        <label>Novo Saldo: </label><br>
        <input type="text" name="novoSaldo"><br>

        <label>Nova Senha: </label><br>
        <input type="password" name="novaSenha"><br>

        <br>
        <button type="submit">ALTERAR</button>
    </form>

    <%
        } catch (Exception e) {
            e.printStackTrace();
    }
    %>
</body>
</html>
