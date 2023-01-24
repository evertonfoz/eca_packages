// import 'package:flutter/material.dart';

// /// Criação de uma classe que recebe uma imagem **obrigatoriamente**,
// /// com o seu padrão de tamanho definido, para que todas as imagens deste mesmo programa
// /// possueam o mesmo tamanho
// class WelcomePageBackgroundImage extends StatelessWidget {
//   final String imageURL;

//   const WelcomePageBackgroundImage({
//     Key? key,
//     required this.imageURL,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         SizedBox(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: Image.asset(
//             imageURL,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ],
//     );
//   }
// }
