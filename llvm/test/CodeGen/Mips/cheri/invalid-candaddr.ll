; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: %cheri_purecap_llc %s -o - | FileCheck %s -check-prefix OPTNONE
; RUN: %cheri_purecap_llc %s -o - -O2 | FileCheck %s -check-prefix OPT

; Derived from this cheribsd source code which was miscompiled into
; a candaddr with 4095 instead of ~4095!

;#define PAGE_MASK 4095
;typedef __SIZE_TYPE__ size_t;
;typedef __SIZE_TYPE__ vm_size_t;
;typedef __SIZE_TYPE__ vaddr_t;
;#define	round_page(x)		(((x) + PAGE_MASK) & ~PAGE_MASK)
;
;#define __CAP_CHECK(cap, len) ({					\
;	int ret = 1;							\
;	size_t caplen = __builtin_mips_cheri_get_cap_length(cap);	\
;	size_t capoff = __builtin_mips_cheri_cap_offset_get(cap);	\
;	if (capoff < 0 || capoff > caplen || caplen - capoff < (len))	\
;		ret = 0;						\
;	ret;								\
;})
;#define	__DECONST_CAP(type, var)	((type)(__uintcap_t)(const void * __capability)(var))
;
;int
;cap_covers_pages(const void * __capability cap, size_t size)
;{
;	const char * __capability addr;
;	size_t pageoff;
;
;	addr = cap;
;	pageoff = ((__cheri_addr vaddr_t)addr & PAGE_MASK);
;	addr -= pageoff;
;	size += pageoff;
;	size = (vm_size_t)round_page(size);
;
;	return (__CAP_CHECK(__DECONST_CAP(void * __capability, addr), size));
;}

; Function Attrs: nounwind readnone
define signext i32 @cap_covers_pages(i8 addrspace(200)* %cap, i64 zeroext %size) local_unnamed_addr #0 {
; OPTNONE-LABEL: cap_covers_pages:
; OPTNONE:       # %bb.0: # %entry
; OPTNONE-NEXT:    daddiu $1, $zero, 4095
; OPTNONE-NEXT:    cgetandaddr $1, $c3, $1
; OPTNONE-NEXT:    dnegu $2, $1
; OPTNONE-NEXT:    cincoffset $c1, $c3, $2
; OPTNONE-NEXT:    daddu $1, $4, $1
; OPTNONE-NEXT:    daddiu $1, $1, 4095
; OPTNONE-NEXT:    daddiu $2, $zero, -4096
; OPTNONE-NEXT:    and $1, $1, $2
; OPTNONE-NEXT:    cgetlen $2, $c1
; OPTNONE-NEXT:    cgetoffset $3, $c1
; OPTNONE-NEXT:    sltu $4, $2, $3
; OPTNONE-NEXT:    xori $4, $4, 1
; OPTNONE-NEXT:    dsubu $2, $2, $3
; OPTNONE-NEXT:    sltu $1, $2, $1
; OPTNONE-NEXT:    xori $1, $1, 1
; OPTNONE-NEXT:    and $1, $4, $1
; OPTNONE-NEXT:    dsll $1, $1, 32
; OPTNONE-NEXT:    cjr $c17
; OPTNONE-NEXT:    dsrl $2, $1, 32
;
; OPT-LABEL: cap_covers_pages:
; OPT:       # %bb.0: # %entry
; OPT-NEXT:    daddiu $1, $zero, 4095
; OPT-NEXT:    cgetandaddr $1, $c3, $1
; OPT-NEXT:    dnegu $2, $1
; OPT-NEXT:    cincoffset $c1, $c3, $2
; OPT-NEXT:    daddu $1, $4, $1
; OPT-NEXT:    daddiu $1, $1, 4095
; OPT-NEXT:    daddiu $2, $zero, -4096
; OPT-NEXT:    and $1, $1, $2
; OPT-NEXT:    cgetlen $2, $c1
; OPT-NEXT:    cgetoffset $3, $c1
; OPT-NEXT:    sltu $4, $2, $3
; OPT-NEXT:    xori $4, $4, 1
; OPT-NEXT:    dsubu $2, $2, $3
; OPT-NEXT:    sltu $1, $2, $1
; OPT-NEXT:    xori $1, $1, 1
; OPT-NEXT:    and $1, $4, $1
; OPT-NEXT:    dsll $1, $1, 32
; OPT-NEXT:    cjr $c17
; OPT-NEXT:    dsrl $2, $1, 32
entry:
  %0 = tail call i64 @llvm.cheri.cap.address.get.i64(i8 addrspace(200)* %cap)
  %and = and i64 %0, 4095
  %idx.neg = sub nsw i64 0, %and
  %add.ptr = getelementptr inbounds i8, i8 addrspace(200)* %cap, i64 %idx.neg
  %add = add i64 %size, 4095
  %add1 = add i64 %add, %and
  %and2 = and i64 %add1, -4096
  %1 = tail call i64 @llvm.cheri.cap.length.get.i64(i8 addrspace(200)* %add.ptr)
  %2 = tail call i64 @llvm.cheri.cap.offset.get.i64(i8 addrspace(200)* %add.ptr)
  %cmp3 = icmp uge i64 %1, %2
  %sub = sub i64 %1, %2
  %cmp5 = icmp uge i64 %sub, %and2
  %not.or.cond = and i1 %cmp3, %cmp5
  %ret.0 = zext i1 %not.or.cond to i32
  ret i32 %ret.0
}

; Function Attrs: nounwind readnone
declare i64 @llvm.cheri.cap.address.get.i64(i8 addrspace(200)*) #1

; Function Attrs: nounwind readnone
declare i64 @llvm.cheri.cap.length.get.i64(i8 addrspace(200)*) #1

; Function Attrs: nounwind readnone
declare i64 @llvm.cheri.cap.offset.get.i64(i8 addrspace(200)*) #1

; Function Attrs: nounwind readnone
declare i8 addrspace(200)* @llvm.cheri.cap.offset.increment.i64(i8 addrspace(200)*, i64) #1

; Function Attrs: nounwind readnone
declare i8 addrspace(200)* @llvm.cheri.cap.offset.set.i64(i8 addrspace(200)*, i64) #1

; Function Attrs: nounwind readnone
declare i8 addrspace(200)* @llvm.cheri.cap.address.set.i64(i8 addrspace(200)*, i64) #1

attributes #0 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="cheri128" "target-features"="+cheri128,+chericap" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
