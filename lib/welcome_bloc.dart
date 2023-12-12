// welcome_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

// Événements
abstract class WelcomeEvent {}

class StartAnimation extends WelcomeEvent {}

// États
abstract class WelcomeState {}

class AnimationStarted extends WelcomeState {}

class AnimationFinished extends WelcomeState {}

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(AnimationFinished());

  @override
  Stream<WelcomeState> mapEventToState(WelcomeEvent event) async* {
    if (event is StartAnimation) {
      yield AnimationStarted();
      await Future.delayed(Duration(seconds: 2));
      yield AnimationFinished();
    }
  }
}
