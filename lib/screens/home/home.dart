import 'package:agenda_contatos/models/contact.dart';
import 'package:agenda_contatos/provider/contacts.dart';
import 'package:agenda_contatos/screens/details.dart';
import 'package:agenda_contatos/style.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{

  //estado inicial da tela
  @override 
 createState()=> _HomeState();
  
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Contatos"),
      ),
      floatingActionButton: 
      FloatingActionButton(
        onPressed: null,
        child: Icon(
          Icons.add
        ),
      ),
      body:ListView.separated(itemBuilder:
      (BuildContext context, int index){
        Contact contact = contacts.elementAt(index);
        
        return ListTile(
          leading: IconButton(
            icon: (contact.isFavorite)?
            Icon(Icons.star)
            :Icon(Icons.star_outline),
            onPressed: (){
              setState(() {
                contact.isFavorite = 
              !contact.isFavorite;
              });
            },
            color: blueTheme,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.chevron_right
              ),
              color: grayTheme,
              onPressed: (){
                Navigator.of(context).push
                (MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Details
                    (contact);
                  },
                  ),
                );
              },
          ),
          title: Row(
            children: [
              ClipOval(
                child: Image.asset(contact.photo,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    style: TextStyle(
                      color: grayTheme,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  Text(
                    contact.phone,
                    style: TextStyle(
                      color: grayTheme,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index){
          return Divider();
        },
        itemCount: contacts.length,
      )
    ); 
  }
}