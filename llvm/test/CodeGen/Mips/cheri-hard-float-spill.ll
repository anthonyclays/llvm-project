; RUN: llc %s -mtriple=cheri-unknown-freebsd -target-abi sandbox -o -
; ModuleID = 'bugpoint-reduced-simplified.bc'
target datalayout = "E-m:m-pf200:256:256-i8:8:32-i16:16:32-i64:64-n32:64-S128-A200"
target triple = "cheri-unknown-freebsd"

%struct.site.5.59.89.167.203.227.257.329.347.443.779 = type { i16, i16, i16, i16, i8, i32, %struct.double_prn.0.54.84.162.198.222.252.324.342.438.774, i32, [4 x %struct.su3_matrix.2.56.86.164.200.224.254.326.344.440.776], [4 x %struct.anti_hermitmat.3.57.87.165.201.225.255.327.345.441.777], [4 x double], %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778, [4 x %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778], [4 x %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778], %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778, %struct.su3_matrix.2.56.86.164.200.224.254.326.344.440.776, %struct.su3_matrix.2.56.86.164.200.224.254.326.344.440.776 }
%struct.double_prn.0.54.84.162.198.222.252.324.342.438.774 = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, double }
%struct.anti_hermitmat.3.57.87.165.201.225.255.327.345.441.777 = type { %struct.complex.1.55.85.163.199.223.253.325.343.439.775, %struct.complex.1.55.85.163.199.223.253.325.343.439.775, %struct.complex.1.55.85.163.199.223.253.325.343.439.775, double, double, double, double }
%struct.complex.1.55.85.163.199.223.253.325.343.439.775 = type { double, double }
%struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 = type { [3 x %struct.complex.1.55.85.163.199.223.253.325.343.439.775] }
%struct.su3_matrix.2.56.86.164.200.224.254.326.344.440.776 = type { [3 x [3 x %struct.complex.1.55.85.163.199.223.253.325.343.439.775]] }

@act_path_coeff = external hidden unnamed_addr addrspace(200) global [6 x double], align 8
@sites_on_node = external addrspace(200) global i32, align 4
@lattice = external addrspace(200) global %struct.site.5.59.89.167.203.227.257.329.347.443.779 addrspace(200)*, align 32

; Function Attrs: nounwind argmemonly
declare void @llvm.lifetime.start.p200i8(i64, i8 addrspace(200)* nocapture) #0

; Function Attrs: nounwind argmemonly
declare void @llvm.lifetime.end.p200i8(i64, i8 addrspace(200)* nocapture) #0

; Function Attrs: nounwind
declare noalias i8 addrspace(200)* @calloc(i64 zeroext, i64 zeroext) #1

; Function Attrs: nounwind argmemonly
declare void @llvm.memcpy.p200i8.p200i8.i64(i8 addrspace(200)* nocapture, i8 addrspace(200)* nocapture readonly, i64, i32, i1) #0

; Function Attrs: nounwind
declare void @free(i8 addrspace(200)* nocapture) #1

; Function Attrs: nounwind
define void @eo_fermion_force(double %eps, i32 signext %nflavors, i32 signext %x_off) #1 {
entry:
  %0 = load double, double addrspace(200)* getelementptr inbounds ([6 x double], [6 x double] addrspace(200)* @act_path_coeff, i64 0, i64 5), align 8
  %mul5 = fmul double undef, undef
  %mul6 = fmul double undef, 0.000000e+00
  %mul7 = fmul double undef, %0
  br i1 undef, label %for.body.24.lr.ph, label %for.cond.30.preheader

for.body.24.lr.ph:                                ; preds = %entry
  unreachable

for.cond.30.preheader:                            ; preds = %entry
  %sub51 = fsub double -0.000000e+00, undef
  %sub116 = fsub double -0.000000e+00, %mul6
  %div124 = fdiv double %mul6, %mul5
  %sub148 = fsub double -0.000000e+00, %mul5
  %div153 = fdiv double %mul5, undef
  %div193 = fdiv double %mul7, undef
  %cmp46 = icmp slt i64 0, 4
  br label %for.body.37

for.body.37:                                      ; preds = %for.inc.246, %for.cond.30.preheader
  %or.cond464 = or i1 undef, undef
  br i1 %or.cond464, label %for.inc.246, label %if.then

if.then:                                          ; preds = %for.body.37
  tail call void @u_shift_fermion(%struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, i32 signext undef)
  br i1 %cmp46, label %if.then.48, label %for.body.55

if.then.48:                                       ; preds = %if.then
  tail call void @add_force_to_mom(%struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, i32 signext undef, double %sub51)
  unreachable

for.body.55:                                      ; preds = %for.inc.172, %if.then
  br i1 undef, label %for.inc.172, label %if.then.69

if.then.69:                                       ; preds = %for.body.55
  br i1 %cmp46, label %if.then.77, label %for.body.84

if.then.77:                                       ; preds = %if.then.69
  tail call void @add_force_to_mom(%struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, i32 signext undef, double %mul5)
  unreachable

for.body.84:                                      ; preds = %for.inc.143, %if.then.69
  br i1 undef, label %for.inc.143, label %if.then.105

if.then.105:                                      ; preds = %for.body.84
  br i1 %cmp46, label %if.then.113, label %if.else.i.critedge

if.then.113:                                      ; preds = %if.then.105
  tail call void @add_force_to_mom(%struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, i32 signext undef, double %sub116)
  tail call void @add_force_to_mom(%struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, i32 signext undef, double %mul6) #3
  br i1 undef, label %for.body.128, label %for.inc.143

if.else.i.critedge:                               ; preds = %if.then.105
  unreachable

for.body.128:                                     ; preds = %for.body.128, %if.then.113
  tail call void @scalar_mult_add_su3_vector(%struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, double %div124, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef) #3
  br i1 undef, label %for.body.128, label %for.inc.143

for.inc.143:                                      ; preds = %for.body.128, %if.then.113, %for.body.84
  br i1 undef, label %for.end.145, label %for.body.84

for.end.145:                                      ; preds = %for.inc.143
  br i1 %cmp46, label %if.then.6.i.413, label %if.else.8.i.415

if.then.6.i.413:                                  ; preds = %for.end.145
  unreachable

if.else.8.i.415:                                  ; preds = %for.end.145
  tail call void @add_force_to_mom(%struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, i32 signext undef, double %sub148) #3
  br i1 undef, label %for.body.157, label %for.inc.172

for.body.157:                                     ; preds = %for.body.157, %if.else.8.i.415
  tail call void @scalar_mult_add_su3_vector(%struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, double %div153, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef) #3
  br i1 undef, label %for.body.157, label %for.inc.172

for.inc.172:                                      ; preds = %for.body.157, %if.else.8.i.415, %for.body.55
  %exitcond470 = icmp eq i32 undef, 8
  br i1 %exitcond470, label %for.end.174, label %for.body.55

for.end.174:                                      ; preds = %for.inc.172
  br i1 %cmp46, label %if.then.182, label %if.end.185

if.then.182:                                      ; preds = %for.end.174
  tail call void @add_force_to_mom(%struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, i32 signext undef, double %mul7)
  unreachable

if.end.185:                                       ; preds = %for.end.174
  br label %for.body.197

for.body.197:                                     ; preds = %for.body.197, %if.end.185
  tail call void @scalar_mult_add_su3_vector(%struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef, double %div193, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)* undef) #3
  br label %for.body.197

for.inc.246:                                      ; preds = %for.body.37
  br label %for.body.37
}

; Function Attrs: nounwind
declare void @u_shift_fermion(%struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)*, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)*, i32 signext) #1

; Function Attrs: nounwind
declare void @add_force_to_mom(%struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)*, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)*, i32 signext, double) #1

declare void @scalar_mult_add_su3_vector(%struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)*, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)*, double, %struct.su3_vector.4.58.88.166.202.226.256.328.346.442.778 addrspace(200)*) #2

attributes #0 = { nounwind argmemonly }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cheri" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cheri" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0 (ssh://dc552@vica.cl.cam.ac.uk:/home/dc552/CHERISDK/llvm/tools/clang 473591c52d2160071616e8574dc80305abfdda52) (ssh://dc552@vica.cl.cam.ac.uk:/home/dc552/CHERISDK/llvm 388f6926b8f9bb0557c65b74badb8a34734f13dc)"}
