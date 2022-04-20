<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="web.CreditModel" %>
    <%
    CreditModel mod=(CreditModel)request.getAttribute("mod");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Simulateur Crédit</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<h1 class="titre">Simulateur de Crédit</h1>
<img alt="Votre simulateur de crédit" src="C:/Users/hp/Documents/Cours_de_Master2/M1_JEE_Spring/Workspace/SimulateurCreditWeb/credit.jpg">
  <div>
  	<form action="controleur.php" method="post">
  	  <table>
  	    <tr>
  	     <td>Montant:</td>
  	     <td><input type="text" name="montant" value="<%= mod.getMontant() %>"/></td>
  	     <td>DH</td>
  	    </tr>
  	     <tr>
  	     <td>Durée:</td>
  	     <td><input type="text" name="duree" value="<%=  mod.getDuree() %>"/></td>
  	     <td>Mois</td>
  	    </tr>
  	     <tr>
  	     <td>Taux:</td>
  	     <td><input type="text" name="taux" value="<%= mod.getTaux() %>"/></td>
  	     <td>%</td>
  	    </tr>
  	     <tr>
  	     <td><input type="submit" value="Calculer"/></td>
  	    </tr>
  	  </table>
  	</form>
  </div>
  <div>
   <table>
    <tr>
      <td>
      Mensualité:
      </td>
      <td>
      <%=mod.getMensualite()%>
      </td>
      <td>DH</td>
    </tr>
   </table>
  </div>
  
  <p class="pied"> Create by Ngarison! </p>

</body>
</html>