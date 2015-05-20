   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  46                     ; 10 INTERRUPT_HANDLER_TRAP(MAIN_TRAP_IRQHandler)
  46                     ; 11 {
  48                     	switch	.text
  49  0000               _MAIN_TRAP_IRQHandler:
  51  0000 3b0002        	push	c_x+2
  52  0003 be00          	ldw	x,c_x
  53  0005 89            	pushw	x
  54  0006 3b0002        	push	c_y+2
  55  0009 be00          	ldw	x,c_y
  56  000b 89            	pushw	x
  59                     ; 16   TRAP_IRQHandler();
  61  000c cd0000        	call	_TRAP_IRQHandler
  63                     ; 18    return;
  66  000f 85            	popw	x
  67  0010 bf00          	ldw	c_y,x
  68  0012 320002        	pop	c_y+2
  69  0015 85            	popw	x
  70  0016 bf00          	ldw	c_x,x
  71  0018 320002        	pop	c_x+2
  72  001b 80            	iret
  95                     ; 22 void jjww(void) {
  96                     	switch	.text
  97  001c               _jjww:
 101                     ; 24 }
 104  001c 81            	ret
 117                     	xdef	_MAIN_TRAP_IRQHandler
 118                     	xdef	_jjww
 119                     	xref	_TRAP_IRQHandler
 120                     	xref.b	c_x
 121                     	xref.b	c_y
 140                     	end
