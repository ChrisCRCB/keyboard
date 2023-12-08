import 'dart:ffi';

import 'package:dart_tolk/dart_tolk.dart';
import 'package:ffi/ffi.dart';
import 'package:recase/recase.dart';
import 'package:win32/win32.dart';

import '../exceptions.dart';
import 'keyboard_key.dart';
import 'keyboard_mode.dart';
import 'navigation_keys.dart';
import 'number_keys.dart';

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
        vk: VK_DECIMAL,
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
        VK_NUMPAD0,
        VK_NUMPAD1,
        VK_NUMPAD2,
        VK_NUMPAD3,
        VK_NUMPAD4,
        VK_NUMPAD5,
        VK_NUMPAD6,
        VK_NUMPAD7,
        VK_NUMPAD8,
        VK_NUMPAD9,
        VK_ADD,
        VK_SUBTRACT,
        VK_RETURN,
      ])
        KeyboardKey(vk: vk, onActivate: _handleString),
      KeyboardKey(vk: VK_DIVIDE, onActivate: () => throw QuitProgram()),
      KeyboardKey(
        vk: VK_MULTIPLY,
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
    if (vk == VK_MULTIPLY || vk == VK_DIVIDE) {
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
          pressKey(number.toString().codeUnits.single);
        }
        break;
    }
  }

  /// Press a key from [vk].
  void pressKey(final int vk) {
    final inputs = malloc.allocate<INPUT>(2);
    inputs[0]
      ..type = INPUT_KEYBOARD
      ..ki.wVk = vk;
    inputs[1]
      ..type = INPUT_KEYBOARD
      ..ki.wVk = vk
      ..ki.dwFlags = KEYEVENTF_KEYUP;
    SendInput(2, inputs, sizeOf<INPUT>());
    malloc.free(inputs);
  }

  /// Beep for an error.
  void errorBeep() {
    Beep(440, 100);
  }
}
