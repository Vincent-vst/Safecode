import 'dart:math';

class PasswordGeneratorMoteur {
  static const String minuscules = "abcdefghijklmnopqrstuvwxyz";
  static const String majuscules = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  static const String chiffres = "0123456789";
  static const String speciaux = " !\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
  static final Random _randomNumberGenerator = Random.secure();

  static String _getListeCaracteres(bool mins, bool majs, bool chifs, bool specs) {
    String caracteres = "";
    if (mins) {
      caracteres += minuscules;
    }
    if (majs) {
      caracteres += majuscules;
    }
    if (chifs) {
      caracteres += chiffres;
    }
    if (specs) {
      caracteres += speciaux;
    }
    return caracteres;
  }

  static String _getPremierCaractere(bool mins, bool majs, bool chifs, bool specs) {
    String premierCaracteres = "";
    if (mins) {
      premierCaracteres += minuscules[_randomNumberGenerator.nextInt(minuscules.length)];
    }
    if (majs) {
      premierCaracteres += majuscules[_randomNumberGenerator.nextInt(majuscules.length)];
    }
    if (chifs) {
      premierCaracteres += chiffres[_randomNumberGenerator.nextInt(chiffres.length)];
    }
    if (specs) {
      premierCaracteres += speciaux[_randomNumberGenerator.nextInt(speciaux.length)];
    }
    return premierCaracteres;
  }

  static String _melangerMotDePasse(String motDePasse) {
    int i = motDePasse.length;
    while (i > 1) {
      int pos = _randomNumberGenerator.nextInt(i);
      i--;
      var tmp1 = motDePasse[pos];
      motDePasse = motDePasse.substring(0, pos) + motDePasse.substring(pos + 1) + tmp1;
    }
    return motDePasse;
  }

  static String genererMotDePasse(int longueur, bool mins, bool majs, bool chifs, bool specs) {
    if (longueur <= 0 || !(mins || majs || chifs || specs)) {
      return "";
    }
    String caracteres = _getListeCaracteres(mins, majs, chifs, specs);
    String motDePasse = _getPremierCaractere(mins, majs, chifs, specs);

    int taille = caracteres.length;
    int i = motDePasse.length;
    while (i < longueur) {
      motDePasse += caracteres[_randomNumberGenerator.nextInt(taille)];
      i++;
    }
    motDePasse = _melangerMotDePasse(motDePasse);
    return motDePasse;
  }
}
