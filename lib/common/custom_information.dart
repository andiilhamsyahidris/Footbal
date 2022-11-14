import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomInformation extends StatelessWidget {
  final String assets;
  final String title;
  final String subtitle;

  const CustomInformation({
    super.key,
    required this.assets,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            assets,
            width: 80,
            fit: BoxFit.fill,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white38),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
