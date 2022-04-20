package web;

import java.io.IOException;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.CreditMetier;
//Annotaion pour déployer la servlet
@WebServlet(name ="cs",urlPatterns = {"/controleur","*.php"})
public class ControleurServlet extends HttpServlet {
	
	private CreditMetier metier;
	
	@Override
	public void init() throws ServletException {
		
		metier = new CreditMetier();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("mod", new CreditModel());
		request.getRequestDispatcher("VueCredit.jsp").forward(request,response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		double montant =Double.parseDouble(request.getParameter("montant")); 
		double taux = Double.parseDouble(request.getParameter("taux")); 
		int duree = Integer.parseInt(request.getParameter("duree")); 
	
		//Généralement après on vérifie la validation des données;
		
		CreditModel model = new CreditModel();
		model.setMontant(montant);
		model.setTaux(taux);
		model.setDuree(duree);
		
		
		double result= metier.calculMensualite(montant, duree, taux);
		model.setMensualite(result);
		
		request.setAttribute("mod", model);
		
		request.getRequestDispatcher("VueCredit.jsp").forward(request,response);
		
	}

}
