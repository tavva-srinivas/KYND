import 'package:flutter/material.dart';

class Cutom_title_text extends StatelessWidget {

  final String text;
  final bool small;
  final int maxline;
  final TextAlign? textAlign;

  const Cutom_title_text({super.key,
    required this.text,
     this.small = true,
    this.maxline = 2,
    this.textAlign = TextAlign.left});


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: small ? Theme.of(context).textTheme.titleMedium!.apply() : Theme.of(context).textTheme.headlineMedium,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}
