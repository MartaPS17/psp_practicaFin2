import 'package:flutter/material.dart';
import '../models/persona.dart';
import 'personal_screen.dart';
import 'widget_screen.dart';

//Justificació: StatefulWidget perque sa pantalla ha de manternir s'estat local de obj Persona i actualitzar sa interifcies d'usuair quan rep una modificacio des de PersonalScreen

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//guarda infode l'usuari a la variable _persona - les dades per defecte que surten sa primera vegada que sa app s'op
class _HomeScreenState extends State<HomeScreen>{
  Persona _persona = Persona(firstName: 'Nom', secondName: 'Cognom', email: 'usuari@gmail.com', birthDate: DateTime(2000,01,1),
);

//funció per anar a editar es perfil - navigator.push op sa pantalla PersonalScreen i envia dades -- await espera a s'usuari 
Future<void>_navigateToEditProfile() async {
  final updatePersona = await Navigator.push<Persona>(
    context,
    MaterialPageRoute(
      builder: (context) => PersonalScreen(persona: _persona),
    ),
  );

  //
//setState actualitza _persona i la dibuixa per mostrar les dades
  if (updatePersona != null){
    setState(() {
      _persona = updatePersona;
    });
  }
}

//funció per anar a Showcase --> op pantalla WidgetScreen
void _navigateToWidgetShowCase(){
  Navigator.push(
    context, 
    MaterialPageRoute(
      builder:(context) => const WidgetScreen(),
  ),
  );
}

//Estructura de sa pantalla. Pinta es esquelet amb Scaffold i AppBar
@override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(
      title: const Text('DevProfile M3'),
    ),
  body: Padding(
    padding: const EdgeInserts.all(16.0),
    child: Column(
      children: [
      Card(
        child: ListTile( 
          leading: const CircleAvatar( 
            child:Icon(Icons.person), 
          ),
          title: Text(_persona.fullName),
          subtitle: Text(
            '${_persona.email\}\nData de naixement: ${_persona.birthDate.day}/${_persona.birthDate.month}/${_persona.birthDate.year}',
        ),
      ),
      ),
      const SizedBox(height:20),


      //boto 
      ElevatedButton(onPressed: _navigateToEditProfile, child: const Text('Edit Porfile'),
      ),
      const SizedBox(height: 10),

  // Botó per anar a WidgetScreen 
  ElevatedButton( 
    onPressed: _navigateToWidgetShowCase, 
    child: const Text('Explore Widget Showcase'), 
  ),
      ],
    ),
  ),
  );
  }
}