import 'package:win32/win32.dart';

/// Move up.
const moveUpKey = VK_NUMPAD8;

/// Move down.
const moveDownKey = VK_NUMPAD2;

/// Move left.
const moveLeftKey = VK_NUMPAD4;

/// Move right.
const moveRightKey = VK_NUMPAD6;

/// Send the key.
const sendKey = VK_NUMPAD5;

/// The quit key.
const quitKey = VK_SUBTRACT;

/// The ID for moving up.
const moveUpId = 100;

/// The ID for moving down.
const moveDownId = moveUpId + 1;

/// The ID for moving Left.
const moveLeftId = moveDownId + 1;

/// The ID for moving right.
const moveRightId = moveLeftId + 1;

/// The ID for sending letters.
const sendId = moveRightId + 1;

/// The quit ID.
const quitId = sendId + 1;
