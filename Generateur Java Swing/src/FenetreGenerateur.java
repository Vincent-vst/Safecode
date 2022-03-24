
import java.awt.*;
import java.awt.datatransfer.StringSelection;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

public class FenetreGenerateur extends JFrame {
	private class JSliderChangeJLabel implements ChangeListener {
		public void stateChanged(ChangeEvent e) {
			JSlider source = (JSlider)e.getSource();
			modifierMotDePasse(moteur.genererMotDePasse());
			modifierLongueurJLabel(source.getValue());
		}
	}

	private class JCheckBoxChange implements ItemListener {
		public void itemStateChanged(ItemEvent e) {
			modifierMotDePasse(moteur.genererMotDePasse());
		}
		
	}
	
	
	static final int LONG_MIN = 4;
	static final int LONG_MAX = 32;
	static final int LONG_INIT = 12;
	
	JLabel motDePasse;
	JSlider longueur;
	JLabel longueurLabel;
	JCheckBox cbMajuscule;
	JCheckBox cbChiffre;
	JCheckBox cbAccent;
	JCheckBox cbSpecial;
	GenerateurMoteur moteur;
	
	public FenetreGenerateur() {
		super();
		moteur = new GenerateurMoteur(this);
		constrFen();
		motDePasse.setText(moteur.genererMotDePasse());
	}

	private void constrFen() {
		this.setSize(400, 500);
		this.setTitle("Générateur de mots de passe");
		this.setLocationRelativeTo(null);
		this.setResizable(false);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setContentPane(constrPane());
		this.setVisible(true);
		
	}

	private Container constrPane() {
		JPanel panel = new JPanel();
		BoxLayout layout = new BoxLayout(panel, BoxLayout.Y_AXIS);
		panel.setLayout(layout);
		
		panel.add(new JLabel("Générateur de mots de passe"));
		
		this.motDePasse = new JLabel(" ");
		panel.add(motDePasse);
		
		
		JPanel boutons = new JPanel();
		JButton recreer = new JButton("Recréer");
		recreer.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				modifierMotDePasse(moteur.genererMotDePasse());
			}
			
		});
		boutons.add(recreer);
		
		JButton copier = new JButton("Copier");
		copier.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//https://stackoverflow.com/questions/6710350/copying-text-to-the-clipboard-using-java
				Toolkit.getDefaultToolkit().getSystemClipboard().setContents(new StringSelection(motDePasse.getText()), null);
			}
		});
		boutons.add(copier);
		panel.add(boutons);
		
		
		this.longueur = new JSlider(JSlider.HORIZONTAL, LONG_MIN, LONG_MAX, LONG_INIT);
		this.longueur.addChangeListener(new JSliderChangeJLabel());
		this.longueurLabel = new JLabel(LONG_INIT + "");
		JPanel sliderPan = new JPanel();
		sliderPan.add(new JLabel("Longueur :"));
		sliderPan.add(longueur);
		sliderPan.add(longueurLabel);
		panel.add(sliderPan);
		
		
		this.cbMajuscule = new JCheckBox("Majuscule");
		this.cbMajuscule.addItemListener(new JCheckBoxChange());
		
		this.cbChiffre = new JCheckBox("Chiffre");
		this.cbChiffre.setSelected(true);
		this.cbChiffre.addItemListener(new JCheckBoxChange());
		
		this.cbAccent = new JCheckBox("Lettre accentuée");
		this.cbAccent.addItemListener(new JCheckBoxChange());
		
		this.cbSpecial = new JCheckBox("Caractère spécial");
		this.cbSpecial.addItemListener(new JCheckBoxChange());
		panel.add(cbMajuscule);
		panel.add(cbChiffre);
		panel.add(cbAccent);
		panel.add(cbSpecial);
		
		
		return panel;
	}
	
	private void modifierMotDePasse(String motDePasse) {
		this.motDePasse.setText(motDePasse);
	}
	
	private void modifierLongueurJLabel(int longueur) {
		this.longueurLabel.setText(longueur + "");
	}
	
	public int getLongueur() {
		int longueur = this.longueur.getValue();
		return longueur;
	}
	
	public boolean isCheckedMajuscule() {
		return cbMajuscule.isSelected();
	}
	
	public boolean isCheckedChiffre() {
		return cbChiffre.isSelected();
	}
	
	public boolean isCheckedAccent() {
		return cbAccent.isSelected();
	}
	
	public boolean isCheckedSpecial() {
		return cbSpecial.isSelected();
	}
	
}
