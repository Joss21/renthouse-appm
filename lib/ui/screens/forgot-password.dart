/* import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renthouse/ui/pallete.dart';
import 'package:renthouse/ui/widgets/widgets.dart';
import 'package:flutter/services.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/img/upload.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton( 
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: kwhite,
                ),
            ),
            title: Text(
              'Recupera tu cuenta',
              style: kBodyText,
            ),
            centerTitle: true,
            ),
            body: Column(
              children:[
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: Text('Ingrese su correo electrónico, le enviaremos instrucciones para restablecer su contraseña ',
                      style: kBodyText,),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextInputField(
                      icon: FontAwesomeIcons.envelope,
                       hint: 'Correo Electrónico',
                       inputType: TextInputType.emailAddress,
                       inputAction: TextInputAction.done,),
                       SizedBox(
                      height: 20,
                    ),
                    RoundedButton(buttonName: "Enviar")
                  ],
                ),
              )
            ]),
            )
      ],
    );
  }
} */