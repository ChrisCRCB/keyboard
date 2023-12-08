// ignore_for_file: constant_identifier_names, lines_longer_than_80_chars

/// Left mouse button
const lbutton = 0x01;

/// Right mouse button
const rbutton = 0x02;

/// Control-break processing
const cancel = 0x03;

/// Middle mouse button
const mbutton = 0x04;

/// X1 mouse button
const xbutton1 = 0x05;

/// X2 mouse button
const xbutton2 = 0x06;

/// BACKSPACE key
const back = 0x08;

/// TAB key
const tab = 0x09;

/// CLEAR key
const clear = 0x0C;

/// ENTER key
const return_ = 0x0D;

/// SHIFT key
const shift = 0x10;

/// CTRL key
const control = 0x11;

/// ALT key
const menu = 0x12;

/// PAUSE key
const pause = 0x13;

/// CAPS LOCK key
const capital = 0x14;

/// IME Kana mode
const kana = 0x15;

/// IME Hangul mode
const hangul = 0x15;

/// IME On
const ime_on = 0x16;

/// IME Junja mode
const junja = 0x17;

/// IME final mode
const final_ = 0x18;

/// IME Hanja mode
const hanja = 0x19;

/// IME Kanji mode
const kanji = 0x19;

/// IME Off
const ime_off = 0x1A;

/// ESC key
const escape = 0x1B;

/// IME convert
const convert = 0x1C;

/// IME nonconvert
const nonconvert = 0x1D;

/// IME accept
const accept = 0x1E;

/// IME mode change request
const modechange = 0x1F;

/// SPACEBAR
const space = 0x20;

/// PAGE UP key
const prior = 0x21;

/// PAGE DOWN key
const next = 0x22;

/// END key
const end = 0x23;

/// HOME key
const home = 0x24;

/// LEFT ARROW key
const left = 0x25;

/// UP ARROW key
const up = 0x26;

/// RIGHT ARROW key
const right = 0x27;

/// DOWN ARROW key
const down = 0x28;

/// SELECT key
const select = 0x29;

/// PRINT key
const print = 0x2A;

/// EXECUTE key
const execute = 0x2B;

/// PRINT SCREEN key
const snapshot = 0x2C;

/// INS key
const insert = 0x2D;

/// DEL key
const delete = 0x2E;

/// HELP key
const help = 0x2F;

/// 0 key
const digit0 = 0x30;

/// 1 key
const digit1 = 0x31;

/// 2 key
const digit2 = 0x32;

/// 3 key
const digit3 = 0x33;

/// 4 key
const digit4 = 0x34;

/// 5 key
const digit5 = 0x35;

/// 6 key
const digit6 = 0x36;

/// 7 key
const digit7 = 0x37;

/// 8 key
const digit8 = 0x38;

/// 9 key
const digit9 = 0x39;

/// Undefined
const undefined = 0x3A - 40;

/// A key
const letterA = 0x41;

/// B key
const letterB = 0x42;

/// C key
const letterC = 0x43;

/// D key
const letterD = 0x44;

/// E key
const letterE = 0x45;

/// F key
const letterF = 0x46;

/// G key
const letterG = 0x47;

/// H key
const letterH = 0x48;

/// I key
const letterI = 0x49;

/// J key
const letterJ = 0x4A;

/// K key
const letterK = 0x4B;

/// L key
const letterL = 0x4C;

/// M key
const letterM = 0x4D;

/// N key
const letterN = 0x4E;

/// O key
const letterO = 0x4F;

/// P key
const letterP = 0x50;

/// Q key
const letterQ = 0x51;

/// R key
const letterR = 0x52;

/// S key
const letterS = 0x53;

/// T key
const letterT = 0x54;

/// U key
const letterU = 0x55;

/// V key
const letterV = 0x56;

/// W key
const letterW = 0x57;

/// X key
const letterX = 0x58;

/// Y key
const letterY = 0x59;

/// Z key
const letterZ = 0x5A;

/// Left Windows key
const lwin = 0x5B;

/// Right Windows key
const rwin = 0x5C;

/// Applications key
const apps = 0x5D;

/// Computer Sleep key
const sleep = 0x5F;

/// Numeric keypad 0 key
const numpad0 = 0x60;

/// Numeric keypad 1 key
const numpad1 = 0x61;

/// Numeric keypad 2 key
const numpad2 = 0x62;

/// Numeric keypad 3 key
const numpad3 = 0x63;

/// Numeric keypad 4 key
const numpad4 = 0x64;

/// Numeric keypad 5 key
const numpad5 = 0x65;

/// Numeric keypad 6 key
const numpad6 = 0x66;

/// Numeric keypad 7 key
const numpad7 = 0x67;

/// Numeric keypad 8 key
const numpad8 = 0x68;

/// Numeric keypad 9 key
const numpad9 = 0x69;

/// Multiply key
const multiply = 0x6A;

/// Add key
const add = 0x6B;

/// Separator key
const separator = 0x6C;

/// Subtract key
const subtract = 0x6D;

/// Decimal key
const decimal = 0x6E;

/// Divide key
const divide = 0x6F;

/// F1 key
const f1 = 0x70;

/// F2 key
const f2 = 0x71;

/// F3 key
const f3 = 0x72;

/// F4 key
const f4 = 0x73;

/// F5 key
const f5 = 0x74;

/// F6 key
const f6 = 0x75;

/// F7 key
const f7 = 0x76;

/// F8 key
const f8 = 0x77;

/// F9 key
const f9 = 0x78;

/// F10 key
const f10 = 0x79;

/// F11 key
const f11 = 0x7A;

/// F12 key
const f12 = 0x7B;

/// F13 key
const f13 = 0x7C;

/// F14 key
const f14 = 0x7D;

/// F15 key
const f15 = 0x7E;

/// F16 key
const f16 = 0x7F;

/// F17 key
const f17 = 0x80;

/// F18 key
const f18 = 0x81;

/// F19 key
const f19 = 0x82;

/// F20 key
const f20 = 0x83;

/// F21 key
const f21 = 0x84;

/// F22 key
const f22 = 0x85;

/// F23 key
const f23 = 0x86;

/// F24 key
const f24 = 0x87;

/// NUM LOCK key
const numlock = 0x90;

/// SCROLL LOCK key
const scroll = 0x91;

/// Left SHIFT key
const lshift = 0xA0;

/// Right SHIFT key
const rshift = 0xA1;

/// Left CONTROL key
const lcontrol = 0xA2;

/// Right CONTROL key
const rcontrol = 0xA3;

/// Left ALT key
const lmenu = 0xA4;

/// Right ALT key
const rmenu = 0xA5;

/// Browser Back key
const browser_back = 0xA6;

/// Browser Forward key
const browser_forward = 0xA7;

/// Browser Refresh key
const browser_refresh = 0xA8;

/// Browser Stop key
const browser_stop = 0xA9;

/// Browser Search key
const browser_search = 0xAA;

/// Browser Favorites key
const browser_favorites = 0xAB;

/// Browser Start and Home key
const browser_home = 0xAC;

/// Volume Mute key
const volume_mute = 0xAD;

/// Volume Down key
const volume_down = 0xAE;

/// Volume Up key
const volume_up = 0xAF;

/// Next Track key
const media_next_track = 0xB0;

/// Previous Track key
const media_prev_track = 0xB1;

/// Stop Media key
const media_stop = 0xB2;

/// Play/Pause Media key
const media_play_pause = 0xB3;

/// Start Mail key
const launch_mail = 0xB4;

/// Select Media key
const launch_media_select = 0xB5;

/// Start Application 1 key
const launch_app1 = 0xB6;

/// Start Application 2 key
const launch_app2 = 0xB7;

/// Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the ;: key
const oem_1 = 0xBA;

/// For any country/region, the + key
const oem_plus = 0xBB;

/// For any country/region, the , key
const oem_comma = 0xBC;

/// For any country/region, the - key
const oem_minus = 0xBD;

/// For any country/region, the . key
const oem_period = 0xBE;

/// Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the /? key
const oem_2 = 0xBF;

/// Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the `~ key
const oem_3 = 0xC0;

/// Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the [{ key
const oem_4 = 0xDB;

/// Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the \\| key
const oem_5 = 0xDC;

/// Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the ]} key
const oem_6 = 0xDD;

/// Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the '" key
const oem_7 = 0xDE;

/// Used for miscellaneous characters; it can vary by keyboard.
const oem_8 = 0xDF;

/// The <> keys on the US standard keyboard, or the \\| key on the non-US 102-key keyboard
const oem_102 = 0xE2;

/// IME PROCESS key
const processkey = 0xE5;

/// Used to pass Unicode characters as if they were keystrokes. The VK_PACKET key is the low word of a 32-bit Virtual Key value used for non-keyboard input methods. For more information, see Remark in KEYBDINPUT, SendInput, WM_KEYDOWN, and WM_KEYUP
const packet = 0xE7;

/// Attn key
const attn = 0xF6;

/// CrSel key
const crsel = 0xF7;

/// ExSel key
const exsel = 0xF8;

/// Erase EOF key
const ereof = 0xF9;

/// Play key
const play = 0xFA;

/// Zoom key
const zoom = 0xFB;

/// PA1 key
const pa1 = 0xFD;

/// Clear key
const oem_clear = 0xFE;
