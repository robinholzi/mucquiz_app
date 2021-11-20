
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munich_data_quiz/controller/db/app_db.dart';
import 'package:munich_data_quiz/controller/preferences/app_preferences.dart';

enum AppState {
  INITIALIZATION,
  LOADING,
  LANDING_HOME,
}

class StateHandler extends ChangeNotifier {
  StateHandler.normalStart() :
        _state=AppState.INITIALIZATION;

  AppState _state;
  AppState get state => _state;

  // Future<void> resetAndInit(LanguageStateHandler languageStateHandler) async {
  //   transitionTo(SetupState.INITIALIZATION);
  //   await deimosisPreferences.resetApp();
  //   await deimosisDb.resetApp();
  //   await initializeAppPreUnlock(languageStateHandler);
  // }

  Future<void> initialize() async {
    assert(state == AppState.INITIALIZATION);
    transitionTo(AppState.LOADING);

    await mqPreferences.init();
    await mqDb.init();


    // TODO check shared prefs integrity before launching feed

    // TODO remove wait
    await Future.delayed(const Duration(seconds: 2));

    // await languageStateHandler.setLanguage(deimosisPreferences.language);

    transitionTo(AppState.LANDING_HOME);
  }

  // =============================================================

  void transitionTo(AppState newState) {
    _state = newState;

    // TODO
    // if (_state == SetupState.AUTH) {
    //   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     systemNavigationBarColor: MQColor.bgColorLight,
    //     systemNavigationBarIconBrightness: Brightness.light,
    //   ));
    // } else if (_state == SetupState.FEED) {
    //   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     systemNavigationBarColor: MQColor.bottomNavBar,
    //     systemNavigationBarIconBrightness: Brightness.dark,
    //   ));
    // } else {
    //   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     systemNavigationBarColor: MQColor.bgColorDark,
    //     systemNavigationBarIconBrightness: Brightness.light,
    //   ));
    // }

    notifyListeners();
  }

  void toLoading() {
    transitionTo(AppState.LOADING);
  }

  // void toSetupLanguage() {
  //   if (mqPreferences.setupLanguageDone) toSetupLanding();
  //   else transitionTo(SetupState.LANG_SELECT);
  // }

  Future<void> toLandingHome() async {
    transitionTo(AppState.LANDING_HOME);
  }

  /// should not mutate any data
  AppState _prevStat() {
    switch(_state) {
      case AppState.INITIALIZATION: return AppState.INITIALIZATION; // no prev
      case AppState.LOADING:        return AppState.LOADING; // no prev
      case AppState.LANDING_HOME:   return AppState.LANDING_HOME; // no prev
      default:
        return AppState.LANDING_HOME;
    }
  }

  bool canBack() { // can back if prevState differs from current
    return _state != _prevStat();
  }

  void back() {
    transitionTo(_prevStat());
  }

}