// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that looks up messages for specific locales by
// delegating to the appropriate library.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:implementation_imports, file_names, unnecessary_new
// ignore_for_file:unnecessary_brace_in_string_interps, directives_ordering
// ignore_for_file:argument_type_not_assignable, invalid_assignment
// ignore_for_file:prefer_single_quotes, prefer_generic_function_type_aliases
// ignore_for_file:comment_references

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
import 'package:intl/src/intl_helpers.dart';

import 'messages_bn.dart' as messages_bn;
import 'messages_en.dart' as messages_en;
import 'messages_gu.dart' as messages_gu;
import 'messages_hi.dart' as messages_hi;
import 'messages_kn.dart' as messages_kn;
import 'messages_ml.dart' as messages_ml;
import 'messages_mr.dart' as messages_mr;
import 'messages_or.dart' as messages_or;
import 'messages_pa.dart' as messages_pa;
import 'messages_ta.dart' as messages_ta;
import 'messages_tu.dart' as messages_tu;

typedef Future<dynamic> LibraryLoader();
Map<String, LibraryLoader> _deferredLibraries = {
  'bn': () => new SynchronousFuture(null),
  'en': () => new SynchronousFuture(null),
  'gu': () => new SynchronousFuture(null),
  'hi': () => new SynchronousFuture(null),
  'kn': () => new SynchronousFuture(null),
  'ml': () => new SynchronousFuture(null),
  'mr': () => new SynchronousFuture(null),
  'or': () => new SynchronousFuture(null),
  'pa': () => new SynchronousFuture(null),
  'ta': () => new SynchronousFuture(null),
  'tu': () => new SynchronousFuture(null),
};

MessageLookupByLibrary? _findExact(String localeName) {
  switch (localeName) {
    case 'bn':
      return messages_bn.messages;
    case 'en':
      return messages_en.messages;
    case 'gu':
      return messages_gu.messages;
    case 'hi':
      return messages_hi.messages;
    case 'kn':
      return messages_kn.messages;
    case 'ml':
      return messages_ml.messages;
    case 'mr':
      return messages_mr.messages;
    case 'or':
      return messages_or.messages;
    case 'pa':
      return messages_pa.messages;
    case 'ta':
      return messages_ta.messages;
    case 'tu':
      return messages_tu.messages;
    default:
      return null;
  }
}

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) {
  var availableLocale = Intl.verifiedLocale(
    localeName,
    (locale) => _deferredLibraries[locale] != null,
    onFailure: (_) => null,
  );
  if (availableLocale == null) {
    return new SynchronousFuture(false);
  }
  var lib = _deferredLibraries[availableLocale];
  lib == null ? new SynchronousFuture(false) : lib();
  initializeInternalMessageLookup(() => new CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);
  return new SynchronousFuture(true);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } catch (e) {
    return false;
  }
}

MessageLookupByLibrary? _findGeneratedMessagesFor(String locale) {
  var actualLocale = Intl.verifiedLocale(
    locale,
    _messagesExistFor,
    onFailure: (_) => null,
  );
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}
