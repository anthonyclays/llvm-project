// RUN: %clang_analyze_cc1 -x objective-c -analyzer-checker=core -analyzer-output=text -Wno-objc-root-class -fblocks -verify %s

@interface I
- (int)initVar:(int *)var param:(int)param;
@end

@implementation I
- (int)initVar:(int *)var param:(int)param {
  if (param) { // expected-note{{Taking false branch}}
    *var = 1;
    return 0;
  }
  return 1; // expected-note{{Returning without writing to '*var'}}
}
@end

int foo(I *i) {
  int x;                            //expected-note{{'x' declared without an initial value}}
  int out = [i initVar:&x param:0]; //expected-note{{Calling 'initVar:param:'}}
                                    //expected-note@-1{{Returning from 'initVar:param:'}}
  if (out)                          // expected-note{{Taking true branch}}
    return x;                       //expected-warning{{Undefined or garbage value returned to caller}}
                                    //expected-note@-1{{Undefined or garbage value returned to caller}}
  return 0;
}

int initializer1(int *p, int x) {
  if (x) { // expected-note{{Taking false branch}}
    *p = 1;
    return 0;
  } else {
    return 1; // expected-note {{Returning without writing to '*p'}}
  }
}

int initFromBlock() {
  __block int z;
  ^{                     // expected-note {{Calling anonymous block}}
    int p;               // expected-note{{'p' declared without an initial value}}
    initializer1(&p, 0); // expected-note{{Calling 'initializer1'}}
                         // expected-note@-1{{Returning from 'initializer1'}}
    z = p;               // expected-warning{{Assigned value is garbage or undefined}}
                         // expected-note@-1{{Assigned value is garbage or undefined}}
  }();
  return z;
}
