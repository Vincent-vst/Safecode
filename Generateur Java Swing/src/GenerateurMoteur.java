import java.util.Random;

public class GenerateurMoteur {
	
	FenetreGenerateur fenetre;
	static final String minuscule = "azertyuiopqsdfghjklmwxcvbn";
	static final String majuscule = "AZERTYUIOPQSDFGHJKLMWXCVBN";
	static final String chiffre = "1234567890";
	static final String accent = "יטאשגךûמפהכüןצח";
	static final String special = "&\"#'{([-|`_\\^@)]=}/*-+$€,?;.:/!§";
	
	public GenerateurMoteur(FenetreGenerateur ihm) {
		this.fenetre = ihm;
	}
	
	public String genererMotDePasse() {
		int longueur = fenetre.getLongueur();
		String motDePasse = "";
		String caracteres = minuscule;

		if (fenetre.isCheckedMajuscule()) {
			caracteres += majuscule;
		}
		if (fenetre.isCheckedChiffre()) {
			caracteres += chiffre;
		}
		if (fenetre.isCheckedAccent()) {
			caracteres += accent;
		}
		if (fenetre.isCheckedSpecial()) {
			caracteres += special;
		}
		
		Random rand = new Random();
		int indice=0;
        for (int i = 0; i < longueur; i++) {
        	int taille = caracteres.length();
        	indice = rand.nextInt(taille);
            motDePasse += caracteres.charAt(indice);
            caracteres = caracteres.substring(0, indice) + caracteres.substring(indice+1);
		}
		return motDePasse;
	}
	
}
