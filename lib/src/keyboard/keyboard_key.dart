/// The type of a function which will be called when a [KeyboardKey] is
/// activated.
typedef OnActivate = void Function();

/// A possible keyboard key.
class KeyboardKey {
  /// Create an instance.
  const KeyboardKey({
    required this.vk,
    required this.onActivate,
  });

  /// The ID of the key which will trigger this key.
  final int vk;

  /// The function to call when this key is activated.
  final OnActivate onActivate;
}
