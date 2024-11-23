import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pcplus/themes/text_decor.dart';

class DetailProfileInput extends StatefulWidget {
  const DetailProfileInput({super.key});

  @override
  State<DetailProfileInput> createState() => _DetailProfileInputState();
}

class _DetailProfileInputState extends State<DetailProfileInput> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: size.height,
          width: size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(30),
              Text(
                'Complete Your Profile',
                style: TextDecor.profileTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
