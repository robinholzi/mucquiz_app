
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

MQPreferences mqPreferences = MQPreferences();

class InvalidCredentialsError extends Error {}
class InvalidEncryptStateError extends Error {}

class MQPreferences {

  MQPreferences();

  bool _initialized = false;
  SharedPreferences? _sp;
  FlutterSecureStorage? _ssp;

  // ===========================================================================
  // ===========================================================================

  /// SECURITY LEVELS:
  /// > medium critical data is only secured
  /// by FlutterSecureStorage SharedPrefs.
  /// > uncritical data like app theme, language etc.
  /// only stored in sharedPrefs.

  // ===========================================================================
  // basic shared prefs prefs ==================================================

  // example:
  // bool _setupLanguageDone = false;
  // Lang _language = DeimosLang.EN_ENGLISH;

  // Getters -------------------------------------------------------------------
  // example: bool get setupLanguageDone => _setupLanguageDone;
  // Lang get language => _language;
  // bool get authDataEntered => _authDataEntered;
  // ===========================================================================

  // secureSharedPrefs =========================================================

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    _sp = await SharedPreferences.getInstance();
    _ssp = const FlutterSecureStorage();
    print("Prefs: initialized!");

    // ----------------------------
    // default prefs (level 1)

    // example: _setupLanguageDone = _readLanguagePrefsDone();

    // ----------------------------
    // secure prefs (level 2) (with encrypted data from level 3)

    // l2
    // example: _biometricsSet = await _readBiometricsSet();

    _initialized = true;
    print("Prefs: read!");
  }

  Future<void> resetApp() async {
    // example: await _deleteLanguagePrefsDone();

    mqPreferences = MQPreferences(); // reset
  }

  /// ENCR HELPERS -------------------------------------------------------------

  /// private
  Future<bool> _containsKeyEncr(String key) async {
    assert(_ssp != null);

    return _ssp!.containsKey(key: key);
  }

  Future<String?> _readEncr(String key) async {
    assert(_ssp != null);
    final String? val = await _ssp!.read(key: key);
    return val;
  }

  Future<int> _readEncrInt(String key, {int default_ = 0}) async {
    assert(_ssp != null);
    return int.parse(await _ssp!.read(key: key) ?? default_.toString());
  }

  Future<bool> _readEncrBool(String key) async {
    return (await _readEncr(key) ?? "false") == "true";
  }

  Future<void> _writeEncr(String key, String value) async {
    assert(_ssp != null);
    await _ssp!.write(key: key, value: value);
  }

  Future<void> _writeEncrInt(String key, int value) async {
    await _writeEncr(key, value.toString());
  }

  Future<void> _writeEncrBool(String key, bool value) async {
    await _writeEncr(key, value ? "true" : "false");
  }

  Future<void> _deleteEncr(String key) async {
    await _ssp!.delete(key: key);
  }

  /// public (initialization needed)
  Future<bool> containsKeyEncr(String key) async {
    assert(_initialized);
    return _containsKeyEncr(key);
  }

  Future<String?> readEncr(String key) async {
    assert(_initialized);
    return _readEncr(key);
  }

  Future<bool> readEncrBool(String key) async {
    assert(_initialized);
    return _readEncrBool(key);
  }

  Future<void> writeEncr(String key, String value) async {
    assert(_initialized);
    return _writeEncr(key, value);
  }

  Future<void> writeEncrBool(String key, bool value) async {
    assert(_initialized);
    return _writeEncrBool(key, value);
  }

  Future<void> deleteEncr(String key) async {
    assert(_initialized);
    return _deleteEncr(key);
  }

  /// ==========================================================================
///
  // example:
  // Future<void> setLanguagePrefsDone({bool done = true}) async {
  //   assert(_sp != null && _initialized);
  //   await _sp!.setBool(_KEY_SETUP_LANG_DONE, _setupLanguageDone = done);
  // }
  //
  // bool _readLanguagePrefsDone() {
  //   return _sp!.getBool(_KEY_SETUP_LANG_DONE) ?? false;
  // }
  //
  // bool containsLanguagePref() {
  //   return _sp!.containsKey(_KEY_LANGUAGE);
  // }
  //
  // Future<void> setLanguage(DeimosLang lang) async {
  //   assert(_sp != null && _initialized);
  //   await _sp!.setString(_KEY_LANGUAGE,
  //       DeimosLanguages.getString(_language = lang));
  // }
  //
  // /// should probably never be used
  // Future<bool> _deleteLanguage() {
  //   _language = DeimosLang.EN_ENGLISH;
  //   return _sp!.remove(_KEY_LANGUAGE);
  // }

  // ===========================================================================

  // example:
  // Future<bool> _containsEncryptSecret() async {
  //   assert(_ssp != null);
  //   return _containsKeyEncr(_KEY_SECRET_ENCR);
  // }
  //
  // Future<String?> _readEncryptSecret() async {
  //   assert(_ssp != null);
  //   return _readEncr(_KEY_SECRET_ENCR);
  // }
  //
  // Future<void> _writeEncryptSecret() async {
  //   assert(_ssp != null && _encryptSecret != null && _encryptSecret.isNotEmpty);
  //   return _writeEncr(_KEY_SECRET_ENCR, _encryptSecret);
  // }
  //
  // Future<void> _deleteEncryptSecret() async {
  //   assert(_ssp != null);
  //   _encryptSecret = "";
  //   return _deleteEncr(_KEY_SECRET_ENCR);
  // }

  //---

  /// ==========================================================================

  // key-constants +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  // basic shared prefs prefs ==================
  // example: static const String _KEY_SETUP_LANG_DONE = "setup_language_done";

  // secureSharedPrefs =========================
  // example: static const String _KEY_SECRET_ENCR = "encr_key";

}
