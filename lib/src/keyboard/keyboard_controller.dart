import 'dart:ffi';

import 'package:dart_tolk/dart_tolk.dart';
import 'package:ffi/ffi.dart';
import 'package:recase/recase.dart';
import 'package:win32/win32.dart';

import '../../keyboard.dart';

const _baseId = 100;

/// The below function is used only for comparison.
void _handleString() {}

/// Holds all the keyboard [keys] which can be pressed.
class KeyboardController {
  /// Create an instance.
  KeyboardController({
    required this.tolk,
    this.numpad0Keys = ' 0.',
    this.numpad1Keys = 'pqrs7',
    this.numpad2Keys = 'tuv8',
    this.numpad3Keys = 'wxyz9',
    this.numpad4Keys = 'ghi4',
    this.numpad5Keys = 'jkl5',
    this.numpad6Keys = 'mno6',
    this.numpad7Keys = '.,?!1',
    this.numpad8Keys = 'abc2',
    this.numpad9Keys = 'def3',
    this.numpadEnterKeys = '\n',
    this.numpadMinusKeys = '[](){}<>',
    this.numpadPlusKeys = '"\'`@',
    this.mode = KeyboardMode.normal,
  }) {
    keys = [
      KeyboardKey(
        vk: decimal,
        onActivate: () {
          final s = toBeTyped;
          if (s == null) {
            Beep(440, 100);
          } else {
            tolk.output(s);
          }
        },
      ),
      for (final vk in [
        numpad0,
        numpad1,
        numpad2,
        numpad3,
        numpad4,
        numpad5,
        numpad6,
        numpad7,
        numpad8,
        numpad9,
        add,
        subtract,
        return_,
      ])
        KeyboardKey(vk: vk, onActivate: _handleString),
      KeyboardKey(vk: divide, onActivate: () => throw QuitProgram()),
      KeyboardKey(
        vk: multiply,
        onActivate: () {
          final index = (mode.index + 1) % KeyboardMode.values.length;
          mode = KeyboardMode.values[index];
          tolk.output(mode.name.titleCase);
        },
      ),
    ];
  }

  /// The tolk instance to use.
  final Tolk tolk;

  /// The current keyboard mode.
  KeyboardMode mode;

  /// The characters available on number pad 1.
  final String numpad1Keys;

  /// The characters available on number pad 2.
  final String numpad2Keys;

  /// The characters available on number pad 3.
  final String numpad3Keys;

  /// The characters available on number pad 4.
  final String numpad4Keys;

  /// The characters available on number pad 5.
  final String numpad5Keys;

  /// The characters available on number pad 6.
  final String numpad6Keys;

  /// The characters available on number pad 7.
  final String numpad7Keys;

  /// The characters available on number pad 8.
  final String numpad8Keys;

  /// The characters available on number pad 9.
  final String numpad9Keys;

  /// The characters available on number pad 0.
  final String numpad0Keys;

  /// The characters available on number pad enter.
  final String numpadEnterKeys;

  /// The characters available on number pad plus.
  final String numpadPlusKeys;

  /// The characters available on number pad minus.
  final String numpadMinusKeys;

  /// The keys to be registered and unregistered.
  late final List<KeyboardKey> keys;

  /// The characters to be typed.
  String? toBeTyped;

  /// Register all the [keys] using [RegisterHotKey].
  void registerHotkeys(final int hWnd) {
    for (var i = 0; i < keys.length; i++) {
      final key = keys[i];
      final id = i + _baseId;
      RegisterHotKey(hWnd, id, 0, key.vk);
    }
  }

  /// Unregister [keys] using [UnregisterHotKey].
  void unregisterHotkeys(final int hWnd) {
    for (var i = 0; i < keys.length; i++) {
      final id = i + _baseId;
      UnregisterHotKey(hWnd, id);
    }
  }

  /// Get one of the registered [keys] from [id].
  KeyboardKey getKeyFromId(final int id) => keys[id - _baseId];

  /// Handle a key with the given [id].
  void handleKeyId(final int id) {
    final key = getKeyFromId(id);
    final vk = key.vk;
    if (vk == multiply || vk == divide) {
      key.onActivate();
      return;
    }
    switch (mode) {
      case KeyboardMode.normal:
        if (key.onActivate == _handleString) {
          tolk.output(id.toString());
        } else {
          key.onActivate();
        }
        break;
      case KeyboardMode.navigation:
        final key = navigationKeys[vk];
        if (key == null) {
          errorBeep();
        } else {
          pressKey(key);
        }
        break;
      case KeyboardMode.numbers:
        final number = numbers[vk];
        if (number == null) {
          errorBeep();
        } else {
          pressKey(number);
        }
        break;
    }
  }

  /// Press a key from [vk].
  void pressKey(
    final int vk, {
    final bool control = false,
    final bool shift = false,
    final bool alt = false,
    final bool windows = false,
    final bool capsLock = false,
  }) {
    final modifiers = <int>[
      if (control) lcontrol,
      if (shift) lshift,
      if (alt) lmenu,
      if (windows) lwin,
      if (capsLock) capital,
    ];
    final input = calloc<INPUT>();
    final event = input.ref.ki;
    for (final key in [...modifiers, vk]) {
      event.wVk = key;
      if (SendInput(1, input, sizeOf<INPUT>()) != 1) {
        tolk.output('Problem pressing keys.');
      }
    }
    event.dwFlags = KEYEVENTF_KEYUP;
    for (final key in [vk, ...modifiers]) {
      event.wVk = key;
      if (SendInput(1, input, sizeOf<INPUT>()) != 1) {
        tolk.output('Problem releasing keys.');
      }
    }
    calloc.free(input);
  }

  /// Beep for an error.
  void errorBeep() {
    Beep(440, 100);
  }
}
