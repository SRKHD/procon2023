import 'package:bodquest_2023/domain/value/evaluation_rank.dart';
import 'package:bodquest_2023/presentation/component/chara_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final image = Center(
      child: CharaImage(rank: EvaluationRank.g),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [image],
    );
  }
}
