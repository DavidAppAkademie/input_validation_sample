import 'package:flutter/material.dart';

class ValidationScreen extends StatefulWidget {
  // Attribute
  // (keine)

  // Konstruktor
  const ValidationScreen({super.key});

  @override
  State<ValidationScreen> createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen> {
  // State
  final formKey = GlobalKey<FormState>();
  bool _isButtonDisabled = true;

  // Methoden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Validation Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            onChanged: () {
              setState(() {
                final bool isFormValid = formKey.currentState!.validate();
                _isButtonDisabled = !isFormValid;
              });
            },
            key: formKey,
            child: Column(
              spacing: 16,
              children: [
                Text(
                  'Neuer Account',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(height: 16),
                TextFormField(
                  validator: (String? userInput) {
                    if (userInput == null || userInput == "") {
                      return "Darf nicht leer sein";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Vorname',
                  ),
                ),
                TextFormField(
                  validator: validateUsername,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                    labelText: 'Username*',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'E-Mail',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Passwort',
                  ),
                ),
                SizedBox(height: 16),
                FilledButton(
                  onPressed: _isButtonDisabled
                      ? null
                      : () {
                          final bool isFormValid = formKey.currentState!
                              .validate();
                          if (isFormValid) {
                            // registriere den Nutzer über Firebase Auth
                            // erstelle den AppUser in der (Mock)Datenbank
                          }
                        },
                  child: Text('Registrieren'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // - min. 3 Zeichen  CHECK
  String? validateUsername(String? userInput) {
    if (userInput == null || userInput.length < 3) {
      return "Mindestens 3 Buchstaben";
    }
    if (userInput.length >= 21) {
      return "Maximal 20 Buchstaben";
    }
    if (userInput.contains(" ")) {
      return "Keine Leerzeichen erlaubt";
    }

    String abc = "abcdefghijklmnopqrstuvwxyz";
    String abcUpper = abc.toUpperCase();
    String abcLowerUpper = abc + abcUpper;

    if (!abcLowerUpper.contains(userInput[0])) {
      return "Muss mit Buchstabe beginnen";
    }

    String umlauts = "äüößÄÜÖ";

    for (int i = 0; i < userInput.length; i++) {
      final String letter = userInput[i];
      if (umlauts.contains(letter)) {
        return "Darf keine Sonderzeichen beinhalten";
      }
    }

    return null;
  }
}

/* 
1. Beispieltabelle (Eingabe, Ausgabe)
2. Datentypen
3. Signatur
4. Algorithmus

Schreibe eine Funktion, die eine beliebige Nutzereingabe (String?) entgegennimmt
und 
- im Fehlerfall einen Fehlerstring zurückgibt ("keine Emojis erlaubt")
- und im Erfolgsfall null zurückgibt

Username

- min. 3 Zeichen
- max. 20 Zeichen
- keine Leerzeichen
- sollte mit Buchstaben beginnen
- keine Emojis
- Umlaute verbieten


Eingabe     Ausgabe

Bob         null
Markus      null
markus      null
Jürgen      "Umlaute nicht erlaubt."
Da vut      "Keine Leerzeichen erlaubt."
Li          "Min. 3 Zeichen"
5Mike       "Muss mit Buchstaben beginnen"


Datentypen
Eingabe     Ausgabe

String?     String?


Signatur

String? validateUsername(String? userInput) {
  

}























































Email

- muss ein @ zeichen beinhalten
- muss ein . beinhalten
- darf kein Leerzeichen beinhalten

Passwort

- min. 8 Zeichen
- max. 50 Zeichen
- min. ein Kleinbuchstabe
- min. ein Großbuchstabe
- min. eine Zahl
- min. ein Sonderzeichen
- darf nicht mit bestimmte Worten anfangen wie z.B. Passwort, password, sicher
- darf den Usernamen und Email nicht beinhalten


 */
