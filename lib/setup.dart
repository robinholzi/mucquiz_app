
import 'package:flutter/widgets.dart';
import 'package:munich_data_quiz/controller/state/state.dart';
import 'package:munich_data_quiz/root.dart';
import 'package:munich_data_quiz/view/screen/home.dart';
import 'package:munich_data_quiz/view/screen/setup/init.dart';
import 'package:munich_data_quiz/view/screen/waiting.dart';
import 'package:provider/provider.dart';

class SetupSequence extends StatefulWidget {
  const SetupSequence({Key? key}) : super(key: key);

  @override
  _SetupSequenceState createState() => _SetupSequenceState();

  static _SetupSequenceState of(BuildContext context) {
    return context.findAncestorStateOfType<_SetupSequenceState>()!;
  }

}

class _SetupSequenceState extends State<SetupSequence> {

  StateHandler stateHandler = StateHandler.normalStart();

  @override
  void initState() {
    stateHandler.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<LanguageStateHandler>.value(
    //   value: languageStateHandler,
    //   builder: (ctx, child) {
        return MQApp(
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider<StateHandler>
                  .value(value: stateHandler),
            ],
            builder: (ctx, child) {
              var handler = ctx.watch<StateHandler>();
              switch (ctx.watch<StateHandler>().state) {
                case AppState.INITIALIZATION: return InitScreen();
                case AppState.LOADING:        return const WaitingScreen();
                case AppState.LANDING_HOME:   return const HomePage();
                default:                      return const HomePage();
              }
            },
          ),
        );
    //   },
    // );
  }
}
