import 'dart:ffi';

import 'package:dart_tolk/dart_tolk.dart';
import 'package:ffi/ffi.dart';
import 'package:keyboard/keyboard.dart';
import 'package:win32/win32.dart';

void main() {
  final tolk = Tolk.windows();
  final hWnd = CreateWindow(
    nullptr,
    nullptr,
    WS_CAPTION,
    CW_USEDEFAULT,
    CW_USEDEFAULT,
    CW_USEDEFAULT,
    CW_USEDEFAULT,
    GetActiveWindow(),
    0,
    0,
    nullptr,
  );
  final messagePointer = calloc<MSG>();

  void shutdown() {
    for (final id in [
      moveUpId,
      moveDownId,
      moveLeftId,
      moveRightId,
      sendId,
      quitId,
    ]) {
      UnregisterHotKey(hWnd, id);
    }
    DestroyWindow(hWnd);
    calloc.free(messagePointer);
    tolk.unload();
  }

  try {
    tolk
      ..load()
      ..trySapi = true;
    ShowWindow(hWnd, SW_MAXIMIZE);
    RegisterHotKey(hWnd, moveUpId, 0, moveUpKey);
    RegisterHotKey(hWnd, moveDownId, 0, moveDownKey);
    RegisterHotKey(hWnd, moveLeftId, 0, moveLeftKey);
    RegisterHotKey(hWnd, moveRightId, 0, moveRightKey);
    RegisterHotKey(hWnd, sendId, 0, sendKey);
    RegisterHotKey(hWnd, quitId, 0, quitKey);
    tolk.output('Keyboard ready.');
    int returnValue;
    do {
      returnValue = GetMessage(messagePointer, hWnd, 0, 0);
      if (returnValue == -1) {
        tolk.output('An error occurred.');
        throw StateError('`GetMessage` returned `-1`.');
      }
      final msg = messagePointer.ref;
      if (msg.message == WM_HOTKEY) {
        final id = msg.wParam;
        if (id == quitId) {
          tolk.output('Goodbye.');
          break;
        } else {
          tolk.output(id.toString());
        }
      }
      TranslateMessage(messagePointer);
      DispatchMessage(messagePointer);
    } while (returnValue != 0);
  } finally {
    shutdown();
  }
}
