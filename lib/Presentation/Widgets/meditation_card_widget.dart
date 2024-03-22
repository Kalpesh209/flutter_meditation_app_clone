import 'package:flutter/material.dart';

class MeditationCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final VoidCallback? onPressed;
  const MeditationCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/$image',
                    width: 80,
                    height: 80,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0, top: 15),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
