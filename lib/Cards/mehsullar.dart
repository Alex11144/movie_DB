import 'package:flutter/material.dart';

class Mehsullar extends StatelessWidget {
  final String text;
  final String image;
  final void Function()? onTap;
  const Mehsullar(
      {Key? key, required this.text, required this.image, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(13),
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        shadowColor: Colors.black,
        surfaceTintColor: Colors.black,
        elevation: 20,
        child: Container(
          width: 73,
          height: 82,
          decoration: const BoxDecoration(
            color: Color.fromARGB(36, 255, 255, 255),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image),
              const SizedBox(
                height: 2,
              ),
              Text(
                text,
                style: const TextStyle(color: Colors.black, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
