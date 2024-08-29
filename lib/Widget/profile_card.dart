import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.email,required this.onTap});
  final String imagePath;
  final String name;
  final String email;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(39, 39, 39, 0.1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.network(
                    imagePath,
                    height: 70,
                    width: 70,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        email,
                        style: const TextStyle(
                            color: Color.fromRGBO(39, 39, 39, 0.5),
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                onPressed:onTap,
                icon: const Icon(
                  CupertinoIcons.arrow_right_circle_fill,
                  size: 35,
                ),
                color: Colors.grey[500],
              ),
            )
          ],
        ),
      ),
    );
  }
}
