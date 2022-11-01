
// // ignore_for_file: use_key_in_widget_constructors

// import 'package:eca_packages/eca_packages.dart';
// import 'package:flutter/material.dart';

// class ErrorToCopyToTeamWidget extends StatelessWidget {
//   final String? errorToCopy;

//   const ErrorToCopyToTeamWidget({required this.errorToCopy});

//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//       visible: errorToCopy != null,
//       child: GestureDetector(
//         child: Text(
//           'Pressione aqui para copiar o erro para enviar para a equipe do DANÇO CONTIGO',
//           textAlign: TextAlign.center,
//           style: GoogleFonts.poppins(
//             color: Colors.black54,
//             fontSize: 10,
//           ),
//         ),
//         onTap: () => FlutterClipboard.copy(errorToCopy!).then(
//           (value) => showBottomSnackBar(
//               context: context,
//               durationSeconds: 3,
//               title: 'Mensagem copiada.',
//               content: 'Cole ela no Whatsapp da equipe do DANÇO CONTIGO'),
//         ),
//       ),
//     );
//   }
// }
