import 'package:flutter/cupertino.dart';

class noWeather extends StatelessWidget {
  const noWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'there is no weather 😔 start',
            style: TextStyle(
              fontSize: 26,
            ),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(
              fontSize: 26,
            ),
          )
        ],
      ),
    );
  }
}
