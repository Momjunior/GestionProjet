package com.gescollege.controller;


import java.text.DecimalFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gescollege.service.IAnneeScolaireService;
import com.gescollege.service.IInscriptionService;

@Controller
public class WelcomeController {
	
	@Autowired
	private IAnneeScolaireService anneeScolaireService;
	
	@Autowired
	private IInscriptionService inscriptionService;
	
	
	@RequestMapping(value = { "/",      "/index"		    }, method = RequestMethod.GET)
	public String showWelcomePage(ModelMap model) {
		
		String anneeEnCours = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();
		int effectifTotal = inscriptionService.findEffectifTotal();
		float perGarcon = 0;
		float perFille = 0;
				
		int effectifG = inscriptionService.findEffectifTotalGarcon();
		int effectifF = inscriptionService.findEffectifTotalFille();
		if (effectifTotal > 0)
		{
			perGarcon = (effectifG*100)/effectifTotal;
			perFille = (effectifF*100)/effectifTotal;
		}			
    	
		model.put("effectifTotal", effectifTotal);
		model.put("effectifTotalGarcon", effectifG);
		model.put("effectifTotalFille", effectifF);
		model.put("perGarcon", perGarcon);
		model.put("perFille", perFille);
		model.put("anneeScolaire", anneeEnCours);
		return "index";
	}
	

}