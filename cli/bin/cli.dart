//go to folder in CLI and type 'dart run'

class AClass {
  //can use [] positional arguments instead of {} named
  AClass(this.c, {required this.d, required e, this.g = 10, int? h}) 
    : _e = e,
      _h = h ?? 20;

  // Initialized with a default value.
  // Can be used as a setter to change in main().
  int a = 0;

  // Only use final if the initialization could only be done at runtime.
  // ex. can do a DateTime.now() calculation
  // Cannot be used as a setter to change in main().
  final int aa = 1;

  // static determines visibility outside a function or variable's lifespan.
  // Cannot be used as a setter to change in main().
  static int aaa = 1;
  void changeAAA() => {aaa = 400};

  // const has to be determined at compile time - ex. can't do a DateTime.now().
  // Only static fields can be marked const
  // const means it won't be changed after initialized so it can't change in main().
  static const int aaaa = 1;

  // final is used if you don't know the value at compile time,
  // and it will be calculated/grabbed at runtime.
  // Can be reassigned.
  // Cannot be used as a setter to change in main().
  static final int aaaaa = 1;

  // Marked late to indicate it will be set later.
  // Dart doesn't check to ensure it is set at compile.
  // Can produce a runtime error.
  // Used for lazy initialization (doesn't initialize untill accessed)
  late int b;

  // Constructor uses this.c to assign it from a positional argument.
  // This is the most common approach.
  int c;

  // Constructor uses this.d to assign it from a named argument.
  int d;

  // Initializing list in constructor assigns it from argument.
  // Useful when you want to keep a field private.
  int _e;

  // Initialized with a default of null. Can't be used in sum unitl
  // it's initialized with a value.
  int? f;

  // Is optional argument but defaults to 10.
  int g;

  // Is optional argument but defaults to 20 in initializer list.
  int _h;

  int sum() {
    int b = 2;
    return (a + aaa + b + c + d + _e + g + _h);
  }
}

void main() {
// g: is optional argument
  var point1 = AClass(3, d: 4, e: 5,);

// can optionally use the setter to change
  point1.a = 1;

// can't be used as a setter because it's final
// point1.aa = 3;

// static setter can't be accessed through an instance
// point1.aaa = 0;
// however, can call a class function:
// point1.changeAAA();

// const variables can't be assigned a value
// point1.aaaa = 0;

// can be assigned here, but is override in .sum
  point1.b = 2000;

  print(point1.sum());
}
