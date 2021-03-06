// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
// RUN: %cheri_purecap_cc1 %s -O0 -o - -S -mllvm -cheri-cap-table-abi=pcrel -emit-llvm | %cheri_FileCheck %s -check-prefixes CHECK,%cheri_type
// REQUIRES: mips-registered-target

typedef unsigned u_int;
typedef unsigned pid_t;

struct procctl_reaper_pidinfo {
  pid_t pi_pid;
  pid_t pi_subtree;
  u_int pi_flags;
  u_int pi_pad0[15];
};

struct procctl_reaper_pids {
  u_int rp_count;
  u_int rp_pad0[15];
  struct procctl_reaper_pidinfo *rp_pids;
};

typedef int idtype_t;
#define P_PID 0
#define PROC_REAP_GETPIDS 22

extern int procctl(idtype_t, pid_t, int, void *);

// CHECK-LABEL: @test(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[PARENT_ADDR:%.*]] = alloca i32, align 4, addrspace(200)
// CHECK-NEXT:    [[INFO:%.*]] = alloca [10 x %struct.procctl_reaper_pidinfo], align 4, addrspace(200)
// CHECK-NEXT:    [[R:%.*]] = alloca i32, align 4, addrspace(200)
// CHECK-NEXT:    [[DOTCOMPOUNDLITERAL:%.*]] = alloca [[STRUCT_PROCCTL_REAPER_PIDS:%.*]], align [[$CAP_SIZE]], addrspace(200)
// CHECK-NEXT:    store i32 [[PARENT:%.*]], i32 addrspace(200)* [[PARENT_ADDR]], align 4
// CHECK-NEXT:    [[ARRAYDECAY:%.*]] = getelementptr inbounds [10 x %struct.procctl_reaper_pidinfo], [10 x %struct.procctl_reaper_pidinfo] addrspace(200)* [[INFO]], i64 0, i64 0
// CHECK-NEXT:    [[TMP0:%.*]] = bitcast [[STRUCT_PROCCTL_REAPER_PIDINFO:%.*]] addrspace(200)* [[ARRAYDECAY]] to i8 addrspace(200)*
// CHECK-NEXT:    call void @llvm.memset.p200i8.i64(i8 addrspace(200)* align 4 [[TMP0]], i8 0, i64 720, i1 false)
// CHECK-NEXT:    [[TMP1:%.*]] = load i32, i32 addrspace(200)* [[PARENT_ADDR]], align 4

// FIXME: for some reason CHERI256 does a memset plus a cap store here
// CHERI256-NEXT:    [[RP_COUNT:%.*]] = getelementptr inbounds [[STRUCT_PROCCTL_REAPER_PIDS]], [[STRUCT_PROCCTL_REAPER_PIDS]] addrspace(200)* [[DOTCOMPOUNDLITERAL]], i32 0, i32 0
// CHERI256-NEXT:    store i32 10, i32 addrspace(200)* [[RP_COUNT]], align 32
// CHERI256-NEXT:    [[RP_PAD0:%.*]] = getelementptr inbounds [[STRUCT_PROCCTL_REAPER_PIDS]], [[STRUCT_PROCCTL_REAPER_PIDS]] addrspace(200)* [[DOTCOMPOUNDLITERAL]], i32 0, i32 1
// CHERI256-NEXT:    [[TMP2:%.*]] = bitcast [15 x i32] addrspace(200)* [[RP_PAD0]] to i8 addrspace(200)*
// CHERI256-NEXT:    call void @llvm.memset.p200i8.i64(i8 addrspace(200)* align 4 [[TMP2]], i8 0, i64 60, i1 false)

// CHERI128-NEXT:    [[TMP2:%.*]] = bitcast [[STRUCT_PROCCTL_REAPER_PIDS]] addrspace(200)* [[DOTCOMPOUNDLITERAL]] to i8 addrspace(200)*
// CHERI128-NEXT:    call void @llvm.memset.p200i8.i64(i8 addrspace(200)* align [[$CAP_SIZE]] [[TMP2]], i8 0, i64 80, i1 false)
// CHERI128-NEXT:    [[RP_COUNT:%.*]] = getelementptr inbounds [[STRUCT_PROCCTL_REAPER_PIDS]], [[STRUCT_PROCCTL_REAPER_PIDS]] addrspace(200)* [[DOTCOMPOUNDLITERAL]], i32 0, i32 0
// CHERI128-NEXT:    store i32 10, i32 addrspace(200)* [[RP_COUNT]], align [[$CAP_SIZE]]

// CHECK-NEXT:    [[RP_PIDS:%.*]] = getelementptr inbounds [[STRUCT_PROCCTL_REAPER_PIDS]], [[STRUCT_PROCCTL_REAPER_PIDS]] addrspace(200)* [[DOTCOMPOUNDLITERAL]], i32 0, i32 2
// CHECK-NEXT:    [[ARRAYDECAY1:%.*]] = getelementptr inbounds [10 x %struct.procctl_reaper_pidinfo], [10 x %struct.procctl_reaper_pidinfo] addrspace(200)* [[INFO]], i64 0, i64 0
// CHECK-NEXT:    store [[STRUCT_PROCCTL_REAPER_PIDINFO]] addrspace(200)* [[ARRAYDECAY1]], [[STRUCT_PROCCTL_REAPER_PIDINFO]] addrspace(200)* addrspace(200)* [[RP_PIDS]], align [[$CAP_SIZE]]
// CHECK-NEXT:    [[TMP3:%.*]] = bitcast [[STRUCT_PROCCTL_REAPER_PIDS]] addrspace(200)* [[DOTCOMPOUNDLITERAL]] to i8 addrspace(200)*
// CHECK-NEXT:    [[CALL:%.*]] = call signext i32 @procctl(i32 signext 0, i32 signext [[TMP1]], i32 signext 22, i8 addrspace(200)* [[TMP3]])
// CHECK-NEXT:    store i32 [[CALL]], i32 addrspace(200)* [[R]], align 4
// CHECK-NEXT:    [[TMP4:%.*]] = load i32, i32 addrspace(200)* [[R]], align 4
// CHECK-NEXT:    ret i32 [[TMP4]]


// CCERI256-LABEL: @test(
// CCERI256-NEXT:  entry:
// CCERI256-NEXT:    [[PARENT_ADDR:%.*]] = alloca i32, align 4, addrspace(200)
// CCERI256-NEXT:    [[INFO:%.*]] = alloca [10 x %struct.procctl_reaper_pidinfo], align 4, addrspace(200)
// CCERI256-NEXT:    [[R:%.*]] = alloca i32, align 4, addrspace(200)
// CCERI256-NEXT:    [[DOTCOMPOUNDLITERAL:%.*]] = alloca [[STRUCT_PROCCTL_REAPER_PIDS:%.*]], align 32, addrspace(200)
// CCERI256-NEXT:    store i32 [[PARENT:%.*]], i32 addrspace(200)* [[PARENT_ADDR]], align 4
// CCERI256-NEXT:    [[ARRAYDECAY:%.*]] = getelementptr inbounds [10 x %struct.procctl_reaper_pidinfo], [10 x %struct.procctl_reaper_pidinfo] addrspace(200)* [[INFO]], i64 0, i64 0
// CCERI256-NEXT:    [[TMP0:%.*]] = bitcast [[STRUCT_PROCCTL_REAPER_PIDINFO:%.*]] addrspace(200)* [[ARRAYDECAY]] to i8 addrspace(200)*
// CCERI256-NEXT:    call void @llvm.memset.p200i8.i64(i8 addrspace(200)* align 4 [[TMP0]], i8 0, i64 720, i1 false)
// CCERI256-NEXT:    [[TMP1:%.*]] = load i32, i32 addrspace(200)* [[PARENT_ADDR]], align 4
// CCERI256-NEXT:    [[RP_COUNT:%.*]] = getelementptr inbounds [[STRUCT_PROCCTL_REAPER_PIDS]], [[STRUCT_PROCCTL_REAPER_PIDS]] addrspace(200)* [[DOTCOMPOUNDLITERAL]], i32 0, i32 0
// CCERI256-NEXT:    store i32 10, i32 addrspace(200)* [[RP_COUNT]], align 32
// CCERI256-NEXT:    [[RP_PAD0:%.*]] = getelementptr inbounds [[STRUCT_PROCCTL_REAPER_PIDS]], [[STRUCT_PROCCTL_REAPER_PIDS]] addrspace(200)* [[DOTCOMPOUNDLITERAL]], i32 0, i32 1
// CCERI256-NEXT:    [[TMP2:%.*]] = bitcast [15 x i32] addrspace(200)* [[RP_PAD0]] to i8 addrspace(200)*
// CCERI256-NEXT:    call void @llvm.memset.p200i8.i64(i8 addrspace(200)* align 4 [[TMP2]], i8 0, i64 60, i1 false)
// CCERI256-NEXT:    [[RP_PIDS:%.*]] = getelementptr inbounds [[STRUCT_PROCCTL_REAPER_PIDS]], [[STRUCT_PROCCTL_REAPER_PIDS]] addrspace(200)* [[DOTCOMPOUNDLITERAL]], i32 0, i32 2
// CCERI256-NEXT:    [[ARRAYDECAY1:%.*]] = getelementptr inbounds [10 x %struct.procctl_reaper_pidinfo], [10 x %struct.procctl_reaper_pidinfo] addrspace(200)* [[INFO]], i64 0, i64 0
// CCERI256-NEXT:    store [[STRUCT_PROCCTL_REAPER_PIDINFO]] addrspace(200)* [[ARRAYDECAY1]], [[STRUCT_PROCCTL_REAPER_PIDINFO]] addrspace(200)* addrspace(200)* [[RP_PIDS]], align 32
// CCERI256-NEXT:    [[TMP3:%.*]] = bitcast [[STRUCT_PROCCTL_REAPER_PIDS]] addrspace(200)* [[DOTCOMPOUNDLITERAL]] to i8 addrspace(200)*
// CCERI256-NEXT:    [[CALL:%.*]] = call signext i32 @procctl(i32 signext 0, i32 signext [[TMP1]], i32 signext 22, i8 addrspace(200)* [[TMP3]])
// CCERI256-NEXT:    store i32 [[CALL]], i32 addrspace(200)* [[R]], align 4
// CCERI256-NEXT:    [[TMP4:%.*]] = load i32, i32 addrspace(200)* [[R]], align 4
// CCERI256-NEXT:    ret i32 [[TMP4]]
//
int test(pid_t parent) {
  struct procctl_reaper_pidinfo info[10];
  __builtin_memset(info, '\0', sizeof(info));
  int r = procctl(P_PID, parent, PROC_REAP_GETPIDS,
                  &(struct procctl_reaper_pids){
                      .rp_count = sizeof(info) / sizeof(info[0]),
                      .rp_pids = info});
  return r;
}
