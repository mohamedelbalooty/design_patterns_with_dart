///About Singleton Design Pattern.
///We have 2 ways about create singleton object.

///This is the first simple way and you can use it with any (Programming Language).
class Singleton {
  static Singleton? _instance;

  static Singleton getInstance() {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = Singleton();
      return _instance!;
    }
  }
}

///This way you can use it with dart.
class Singleton2 {
  Singleton2._(); // Create a private named constructor to prevent object creation from outside (Singleton class)

  factory Singleton2() =>
      _instance; // The object when you want to create an object like a normal way

  static final Singleton2 _instance = Singleton2._();
}
