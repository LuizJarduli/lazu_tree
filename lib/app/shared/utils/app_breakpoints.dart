/// A utility class that defines layout breakpoints for responsive design.
///
/// Based on bootstrap breakpoints. [See](https://getbootstrap.com/docs/5.3/layout/breakpoints/)
class AppBreakpoints {
  /// Breakpoint for extra-large screens (e.g., desktops).
  static int get extraLarge => 1200;

  /// Breakpoint for large screens (e.g., tablets in landscape mode).
  static int get large => 992;

  /// Breakpoint for small screens (e.g., tablets in portrait mode).
  static int get medium => 768;

  /// Breakpoint for small screens (e.g., large phones).
  static int get small => 576;

  /// Breakpoint for extra-extra-large screens (e.g., large desktops).
  static int get xxLarge => 1400;
}
