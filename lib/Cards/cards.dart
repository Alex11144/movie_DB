// import 'package:flutter/material.dart';
// import 'package:project_from_amirali/favourites/favouite_list.dart';
// import 'package:project_from_amirali/screens/hicabs.dart';
// Color color = Colors.white;
// Icon icon = const Icon(Icons.favorite_outline);
// class Cards extends StatefulWidget {
  
//   final HicabData data;
//   final void Function()? onTap;
//   final void Function()? onTap2;

//   const Cards({Key? key, required this.data, this.onTap, this.onTap2})
//       : super(key: key);

//   @override
//   State<Cards> createState() => _CardsState();
// }

// class _CardsState extends State<Cards> {

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: widget.onTap,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Stack(
//             alignment: Alignment.topRight,
//             children: [
//               Image.asset(widget.data.ImageAsset,
//                   width: 160, height: 170, fit: BoxFit.fill),
//               Material(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 color: Colors.transparent,
//                 child: IconButton(
//                   // color: Colors.red,
//                   onPressed: widget.onTap2
//                   ,
//                   icon: icon,
//                   color: color,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 2,
//           ),
//           Text(widget.data.text),
//         ],
//       ),
//     );
//   }
// }
