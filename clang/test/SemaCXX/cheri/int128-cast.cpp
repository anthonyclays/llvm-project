// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
// RUN: %cheri_purecap_cc1 -std=c++11 -o - -emit-llvm -O0 %s | FileCheck %s
// Reduced testcase from ubsan runtime
typedef __uintcap_t uptr;
class Value {
  uptr Val;
public:
__int128 getSIntValue() const;
};
__int128 Value::getSIntValue() const {
  return __int128(Val);
  // CHECK: [[VAL:%.+]] = call i64 @llvm.cheri.cap.address.get.i64(i8 addrspace(200)* %{{.+}})
  // CHECK-NEXT: [[RESULT:%.+]] = zext i64 [[VAL]] to i128
  // CHECK-NEXT: ret i128 [[RESULT]]
}
