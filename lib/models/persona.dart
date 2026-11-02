class Persona { 
  final String firstName; 
  final String secondName;
  final String email; 
  final DateTime birthDate; 
  
  Persona({ 
    required this.firstName,
    required this.secondName, 
    required this.email, 
    required this.birthDate, 
    }); 

  //getters
  String get fullName => '$firstName $secondName';

  //copyWith, per atributs final es fa una copia amb igual referencia per actualitzarla amb un nou calor
  Persona copyWith({
    String? firstName,
    String? secondName,
    String? email,
    DateTime? birthDate,
  }) {
    return Persona(
    firstName: firstName ?? this.firstName, 
    secondName: secondName ?? this.secondName,
    email: email ?? this.email,

    )
  }
  
  
  }