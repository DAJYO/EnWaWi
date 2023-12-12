import 'package:EnWaWi/agro.dart';
import 'package:EnWaWi/welcome_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Welcome extends StatelessWidget {
  final WelcomeBloc _welcomeBloc = WelcomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _welcomeBloc,
      child: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          var animatedButton = AnimatedButton(
            width: MediaQuery.of(context).size.width * 0.8,
            text: "Suivi Agricole",
            selectedTextColor: Colors.yellow,
            transitionType: TransitionType.LEFT_TO_RIGHT,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              letterSpacing: 2,
              color: Colors.deepOrange,
            ),
            onPress: () {
              //_welcomeBloc.add(StartAnimation());
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Agro()),
              );
            },
          );

          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/countryside-woman-holding-plant-leaves.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: constraints.maxHeight * 0.2),
                        animatedButton,
                        SizedBox(height: constraints.maxHeight * 0.1),
                        const Text(
                          "Agriculture Intelligente",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.2),
                        const Text(
                          "www.enwawi.com",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
