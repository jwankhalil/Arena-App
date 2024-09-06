// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Devices`
  String get title {
    return Intl.message(
      'Devices',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `devic name`
  String get deviceName {
    return Intl.message(
      'devic name',
      name: 'deviceName',
      desc: '',
      args: [],
    );
  }

  /// `devic type`
  String get deviceType {
    return Intl.message(
      'devic type',
      name: 'deviceType',
      desc: '',
      args: [],
    );
  }

  /// `hourly price`
  String get devicePrice {
    return Intl.message(
      'hourly price',
      name: 'devicePrice',
      desc: '',
      args: [],
    );
  }

  /// `customer name`
  String get customerName {
    return Intl.message(
      'customer name',
      name: 'customerName',
      desc: '',
      args: [],
    );
  }

  /// `start session`
  String get startSession {
    return Intl.message(
      'start session',
      name: 'startSession',
      desc: '',
      args: [],
    );
  }

  /// `back`
  String get back {
    return Intl.message(
      'back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `close session`
  String get endSession {
    return Intl.message(
      'close session',
      name: 'endSession',
      desc: '',
      args: [],
    );
  }

  /// `delete`
  String get delete {
    return Intl.message(
      'delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `edit`
  String get edit {
    return Intl.message(
      'edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `l.s / h`
  String get currency {
    return Intl.message(
      'l.s / h',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `pick a time`
  String get date {
    return Intl.message(
      'pick a time',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `close`
  String get close {
    return Intl.message(
      'close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `customer bill`
  String get customerBill {
    return Intl.message(
      'customer bill',
      name: 'customerBill',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
