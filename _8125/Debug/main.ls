   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
2592                     ; 59 static void init_clock(void) {
2594                     	switch	.text
2595  0000               L7161_init_clock:
2597  0000 5205          	subw	sp,#5
2598       00000005      OFST:	set	5
2601                     ; 63   delayms(80);
2603  0002 ae0050        	ldw	x,#80
2604  0005 cd022f        	call	_delayms
2606                     ; 66   CLK_HSICmd(ENABLE);
2608  0008 a601          	ld	a,#1
2609  000a cd0000        	call	_CLK_HSICmd
2611                     ; 77   clk_source = CLK_GetSYSCLKSource();
2613  000d cd0000        	call	_CLK_GetSYSCLKSource
2615                     ; 78   clk_freq = CLK_GetClockFreq();
2617  0010 cd0000        	call	_CLK_GetClockFreq
2619                     ; 80   nop();
2622  0013 9d            nop
2624                     ; 81 }
2628  0014 5b05          	addw	sp,#5
2629  0016 81            	ret
2676                     ; 83 void print_clock(void)
2676                     ; 84 {
2677                     	switch	.text
2678  0017               _print_clock:
2680  0017 5205          	subw	sp,#5
2681       00000005      OFST:	set	5
2684                     ; 87   clk_source = CLK_GetSYSCLKSource();
2686  0019 cd0000        	call	_CLK_GetSYSCLKSource
2688  001c 6b01          	ld	(OFST-4,sp),a
2689                     ; 88   clk_freq = CLK_GetClockFreq();
2691  001e cd0000        	call	_CLK_GetClockFreq
2693  0021 96            	ldw	x,sp
2694  0022 1c0002        	addw	x,#OFST-3
2695  0025 cd0000        	call	c_rtol
2697                     ; 89   printf("clk_source = %02X\r\n", clk_source);
2699  0028 7b01          	ld	a,(OFST-4,sp)
2700  002a 88            	push	a
2701  002b ae0061        	ldw	x,#L5071
2702  002e cd0000        	call	_printf
2704  0031 84            	pop	a
2705                     ; 90   printf("clk_freq   = %02X\r\n", clk_freq);
2707  0032 1e04          	ldw	x,(OFST-1,sp)
2708  0034 89            	pushw	x
2709  0035 1e04          	ldw	x,(OFST-1,sp)
2710  0037 89            	pushw	x
2711  0038 ae004d        	ldw	x,#L7071
2712  003b cd0000        	call	_printf
2714  003e 5b04          	addw	sp,#4
2715                     ; 91   printf("clk_freq   = %X\r\n", clk_freq);	//clk_freq = 1E, 2000000 = 0x001E8480
2717  0040 1e04          	ldw	x,(OFST-1,sp)
2718  0042 89            	pushw	x
2719  0043 1e04          	ldw	x,(OFST-1,sp)
2720  0045 89            	pushw	x
2721  0046 ae003b        	ldw	x,#L1171
2722  0049 cd0000        	call	_printf
2724  004c 5b04          	addw	sp,#4
2725                     ; 92   printf("clk_freq   = %d\r\n", clk_freq);	//clk_freq = 30
2727  004e 1e04          	ldw	x,(OFST-1,sp)
2728  0050 89            	pushw	x
2729  0051 1e04          	ldw	x,(OFST-1,sp)
2730  0053 89            	pushw	x
2731  0054 ae0029        	ldw	x,#L3171
2732  0057 cd0000        	call	_printf
2734  005a 5b04          	addw	sp,#4
2735                     ; 93   printf("clk_freq   = %i\r\n", clk_freq);	//clk_freq = 30
2737  005c 1e04          	ldw	x,(OFST-1,sp)
2738  005e 89            	pushw	x
2739  005f 1e04          	ldw	x,(OFST-1,sp)
2740  0061 89            	pushw	x
2741  0062 ae0017        	ldw	x,#L5171
2742  0065 cd0000        	call	_printf
2744  0068 5b04          	addw	sp,#4
2745                     ; 94   printf("clk_freq   = %l\r\n", clk_freq);	//clk_freq = ""
2747  006a 1e04          	ldw	x,(OFST-1,sp)
2748  006c 89            	pushw	x
2749  006d 1e04          	ldw	x,(OFST-1,sp)
2750  006f 89            	pushw	x
2751  0070 ae0005        	ldw	x,#L7171
2752  0073 cd0000        	call	_printf
2754  0076 5b04          	addw	sp,#4
2755                     ; 95 }
2758  0078 5b05          	addw	sp,#5
2759  007a 81            	ret
2795                     ; 97 char putchar(char c) {
2796                     	switch	.text
2797  007b               _putchar:
2799  007b 88            	push	a
2800       00000000      OFST:	set	0
2803                     ; 98 	UART3_SendData8(c);
2805  007c cd0000        	call	_UART3_SendData8
2808  007f               L1471:
2809                     ; 99 	while(UART3_GetFlagStatus(UART3_FLAG_TXE) == RESET);
2811  007f ae0080        	ldw	x,#128
2812  0082 cd0000        	call	_UART3_GetFlagStatus
2814  0085 4d            	tnz	a
2815  0086 27f7          	jreq	L1471
2816                     ; 104 	return c;
2818  0088 7b01          	ld	a,(OFST+1,sp)
2821  008a 5b01          	addw	sp,#1
2822  008c 81            	ret
2858                     ; 107 void uart1_send_byte(u8 Data)
2858                     ; 108 {
2859                     	switch	.text
2860  008d               _uart1_send_byte:
2862  008d 88            	push	a
2863       00000000      OFST:	set	0
2866  008e               L5671:
2867                     ; 109     while((UART1_SR & CHSBIT7)==0x00);
2869  008e c65230        	ld	a,_UART1_SR
2870  0091 a580          	bcp	a,#128
2871  0093 27f9          	jreq	L5671
2872                     ; 110     UART1_DR = Data;
2874  0095 7b01          	ld	a,(OFST+1,sp)
2875  0097 c75231        	ld	_UART1_DR,a
2876                     ; 112 }
2879  009a 84            	pop	a
2880  009b 81            	ret
2904                     ; 117 void init_UART3_lib(void) {
2905                     	switch	.text
2906  009c               _init_UART3_lib:
2910                     ; 118 	UART3_Init(
2910                     ; 119 					UART3_BAUDRATE,
2910                     ; 120 					UART3_WORDLENGTH_8D,
2910                     ; 121 					UART3_STOPBITS_1,
2910                     ; 122 					UART3_PARITY_NO,
2910                     ; 123 					UART3_MODE_TXRX_ENABLE);
2912  009c 4b0c          	push	#12
2913  009e 4b00          	push	#0
2914  00a0 4b00          	push	#0
2915  00a2 4b00          	push	#0
2916  00a4 aec200        	ldw	x,#49664
2917  00a7 89            	pushw	x
2918  00a8 ae0001        	ldw	x,#1
2919  00ab 89            	pushw	x
2920  00ac cd0000        	call	_UART3_Init
2922  00af 5b08          	addw	sp,#8
2923                     ; 126 }
2926  00b1 81            	ret
2953                     ; 131 void init_UART1_lib(void) {
2954                     	switch	.text
2955  00b2               _init_UART1_lib:
2959                     ; 132     UART1_Init(
2959                     ; 133         UART1_BAUDRATE,
2959                     ; 134         UART1_WORDLENGTH_8D,
2959                     ; 135         UART1_STOPBITS_1,
2959                     ; 136         UART1_PARITY_NO,
2959                     ; 137         UART1_SYNCMODE_CLOCK_DISABLE,
2959                     ; 138         UART1_MODE_TXRX_ENABLE);
2961  00b2 4b0c          	push	#12
2962  00b4 4b80          	push	#128
2963  00b6 4b00          	push	#0
2964  00b8 4b00          	push	#0
2965  00ba 4b00          	push	#0
2966  00bc aec200        	ldw	x,#49664
2967  00bf 89            	pushw	x
2968  00c0 ae0001        	ldw	x,#1
2969  00c3 89            	pushw	x
2970  00c4 cd0000        	call	_UART1_Init
2972  00c7 5b09          	addw	sp,#9
2973                     ; 140     UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);
2975  00c9 4b01          	push	#1
2976  00cb ae0205        	ldw	x,#517
2977  00ce cd0000        	call	_UART1_ITConfig
2979  00d1 84            	pop	a
2980                     ; 141     UART1_Cmd(ENABLE);
2982  00d2 a601          	ld	a,#1
2983  00d4 cd0000        	call	_UART1_Cmd
2985                     ; 144     rim();
2988  00d7 9a            rim
2990                     ; 145 }
2994  00d8 81            	ret
3025                     ; 150 void init_UART1(void) {
3026                     	switch	.text
3027  00d9               _init_UART1:
3031                     ; 151 	_asm("rim");
3034  00d9 9a            rim
3036                     ; 154 	CLK_PCKENR1 |= SETBIT2;
3038  00da 721450c7      	bset	_CLK_PCKENR1,#2
3039                     ; 156 	UART1_CR2 &= CLRBIT2;
3041  00de 72155235      	bres	_UART1_CR2,#2
3042                     ; 157 	UART1_CR2 &= CLRBIT3;
3044  00e2 72175235      	bres	_UART1_CR2,#3
3045                     ; 159 	UART1_BRR2 = BAUDRATE_HSI1_BRR2;
3047  00e6 35015233      	mov	_UART1_BRR2,#1
3048                     ; 160 	UART1_BRR1 = BAUDRATE_HSI1_BRR1;
3050  00ea 35015232      	mov	_UART1_BRR1,#1
3051                     ; 162 	UART1_CR1 &= CLRBIT4;
3053  00ee 72195234      	bres	_UART1_CR1,#4
3054                     ; 163 	UART1_CR3 &= CLRBIT4;
3056  00f2 72195236      	bres	_UART1_CR3,#4
3057                     ; 164 	UART1_CR3 &= CLRBIT5;
3059  00f6 721b5236      	bres	_UART1_CR3,#5
3060                     ; 165 	UART1_CR1 &= CLRBIT2;
3062  00fa 72155234      	bres	_UART1_CR1,#2
3063                     ; 167 	UART1_CR2 &= CLRBIT6;
3065  00fe 721d5235      	bres	_UART1_CR2,#6
3066                     ; 169 	UART1_CR2 |= SETBIT5;
3068  0102 721a5235      	bset	_UART1_CR2,#5
3069                     ; 171 	UART1_CR1 &= CLRBIT5;
3071  0106 721b5234      	bres	_UART1_CR1,#5
3072                     ; 173 	UART1_CR2 |= SETBIT2;
3074  010a 72145235      	bset	_UART1_CR2,#2
3075                     ; 174 	UART1_CR2 |= SETBIT3;
3077  010e 72165235      	bset	_UART1_CR2,#3
3078                     ; 176 	uart1_send_byte('A');
3080  0112 a641          	ld	a,#65
3081  0114 cd008d        	call	_uart1_send_byte
3083                     ; 177 }
3086  0117 81            	ret
3089                     .const:	section	.text
3090  0000               L1202_SendBuff:
3091  0000 aa            	dc.b	170
3092  0001 45            	dc.b	69
3093  0002 67            	dc.b	103
3094  0003 bc            	dc.b	188
3095  0004 c9            	dc.b	201
3149                     ; 186 void main(void)
3149                     ; 187 {
3150                     	switch	.text
3151  0118               _main:
3153  0118 5206          	subw	sp,#6
3154       00000006      OFST:	set	6
3157                     ; 188     unsigned char SendBuff[5]={0xaa,0x45,0x67,0xbc,0xc9};
3159  011a 96            	ldw	x,sp
3160  011b 1c0001        	addw	x,#OFST-5
3161  011e 90ae0000      	ldw	y,#L1202_SendBuff
3162  0122 a605          	ld	a,#5
3163  0124 cd0000        	call	c_xymvx
3165                     ; 194 	init_clock();
3167  0127 cd0000        	call	L7161_init_clock
3169                     ; 195 	init_UART3_lib();
3171  012a cd009c        	call	_init_UART3_lib
3173                     ; 196 	print_clock();
3175  012d cd0017        	call	_print_clock
3177                     ; 200 	init_UART1_lib();
3179  0130 ad80          	call	_init_UART1_lib
3181                     ; 207 	GPIO_Init(GPIOG, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_SLOW);
3183  0132 4bc0          	push	#192
3184  0134 4b01          	push	#1
3185  0136 ae501e        	ldw	x,#20510
3186  0139 cd0000        	call	_GPIO_Init
3188  013c 85            	popw	x
3189                     ; 208 	GPIO_Init(GPIOG, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_SLOW);
3191  013d 4bc0          	push	#192
3192  013f 4b02          	push	#2
3193  0141 ae501e        	ldw	x,#20510
3194  0144 cd0000        	call	_GPIO_Init
3196  0147 85            	popw	x
3197                     ; 209 	GPIO_Init(GPIOG, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_SLOW);
3199  0148 4bc0          	push	#192
3200  014a 4b04          	push	#4
3201  014c ae501e        	ldw	x,#20510
3202  014f cd0000        	call	_GPIO_Init
3204  0152 85            	popw	x
3205                     ; 212 	GPIO_Init(GPIOG, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
3207  0153 4bc0          	push	#192
3208  0155 4b08          	push	#8
3209  0157 ae501e        	ldw	x,#20510
3210  015a cd0000        	call	_GPIO_Init
3212  015d 85            	popw	x
3213                     ; 214 	GPIO_Init(GPIOG, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_SLOW);
3215  015e 4bc0          	push	#192
3216  0160 4b10          	push	#16
3217  0162 ae501e        	ldw	x,#20510
3218  0165 cd0000        	call	_GPIO_Init
3220  0168 85            	popw	x
3221                     ; 219     GPIO_Init(GPIOB, GPIO_PIN_0, GPIO_MODE_IN_PU_NO_IT);
3223  0169 4b40          	push	#64
3224  016b 4b01          	push	#1
3225  016d ae5005        	ldw	x,#20485
3226  0170 cd0000        	call	_GPIO_Init
3228  0173 85            	popw	x
3229                     ; 220     GPIO_Init(GPIOB, GPIO_PIN_1, GPIO_MODE_IN_PU_NO_IT);
3231  0174 4b40          	push	#64
3232  0176 4b02          	push	#2
3233  0178 ae5005        	ldw	x,#20485
3234  017b cd0000        	call	_GPIO_Init
3236  017e 85            	popw	x
3237                     ; 221     GPIO_Init(GPIOB, GPIO_PIN_2, GPIO_MODE_IN_PU_NO_IT);
3239  017f 4b40          	push	#64
3240  0181 4b04          	push	#4
3241  0183 ae5005        	ldw	x,#20485
3242  0186 cd0000        	call	_GPIO_Init
3244  0189 85            	popw	x
3245                     ; 225 	GPIO_WriteLow(GPIOG, GPIO_PIN_3);
3247  018a 4b08          	push	#8
3248  018c ae501e        	ldw	x,#20510
3249  018f cd0000        	call	_GPIO_WriteLow
3251  0192 84            	pop	a
3252                     ; 226 	delay(1);
3254  0193 ae0001        	ldw	x,#1
3255  0196 cd0259        	call	_delay
3257                     ; 228 	GPIO_WriteHigh(GPIOG, GPIO_PIN_3);
3259  0199 4b08          	push	#8
3260  019b ae501e        	ldw	x,#20510
3261  019e cd0000        	call	_GPIO_WriteHigh
3263  01a1 84            	pop	a
3264                     ; 229 	delay(1000);
3266  01a2 ae03e8        	ldw	x,#1000
3267  01a5 cd0259        	call	_delay
3269                     ; 231     Contr_data = 0xfc;   //command word initial value
3271  01a8 a6fc          	ld	a,#252
3272  01aa 6b06          	ld	(OFST+0,sp),a
3273                     ; 234     GPIO_WriteLow(GPIOG, GPIO_PIN_4);
3275  01ac 4b10          	push	#16
3276  01ae ae501e        	ldw	x,#20510
3277  01b1 cd0000        	call	_GPIO_WriteLow
3279  01b4 84            	pop	a
3280                     ; 237     GPIO_WriteLow(GPIOG, GPIO_PIN_0);
3282  01b5 4b01          	push	#1
3283  01b7 ae501e        	ldw	x,#20510
3284  01ba cd0000        	call	_GPIO_WriteLow
3286  01bd 84            	pop	a
3287                     ; 238     GPIO_WriteLow(GPIOG, GPIO_PIN_1);
3289  01be 4b02          	push	#2
3290  01c0 ae501e        	ldw	x,#20510
3291  01c3 cd0000        	call	_GPIO_WriteLow
3293  01c6 84            	pop	a
3294                     ; 239     GPIO_WriteLow(GPIOG, GPIO_PIN_2);
3296  01c7 4b04          	push	#4
3297  01c9 ae501e        	ldw	x,#20510
3298  01cc cd0000        	call	_GPIO_WriteLow
3300  01cf 84            	pop	a
3301                     ; 243     UART1_SendData8(Contr_data);
3303  01d0 7b06          	ld	a,(OFST+0,sp)
3304  01d2 cd0000        	call	_UART1_SendData8
3307  01d5               L7402:
3308                     ; 244     while(UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
3310  01d5 ae0080        	ldw	x,#128
3311  01d8 cd0000        	call	_UART1_GetFlagStatus
3313  01db 4d            	tnz	a
3314  01dc 27f7          	jreq	L7402
3315                     ; 245     delay(1000);
3317  01de ae03e8        	ldw	x,#1000
3318  01e1 ad76          	call	_delay
3320                     ; 248     GPIO_WriteHigh(GPIOG, GPIO_PIN_4);
3322  01e3 4b10          	push	#16
3323  01e5 ae501e        	ldw	x,#20510
3324  01e8 cd0000        	call	_GPIO_WriteHigh
3326  01eb 84            	pop	a
3327                     ; 249     delay(1000);
3329  01ec ae03e8        	ldw	x,#1000
3330  01ef ad68          	call	_delay
3333  01f1 202a          	jra	L5502
3334  01f3               L3502:
3335                     ; 254       GPIO_WriteLow(GPIOG, GPIO_PIN_4);
3337  01f3 4b10          	push	#16
3338  01f5 ae501e        	ldw	x,#20510
3339  01f8 cd0000        	call	_GPIO_WriteLow
3341  01fb 84            	pop	a
3342                     ; 257       UART1_SendData8(Contr_data);
3344  01fc 7b06          	ld	a,(OFST+0,sp)
3345  01fe cd0000        	call	_UART1_SendData8
3348  0201               L3602:
3349                     ; 258       while(UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
3351  0201 ae0080        	ldw	x,#128
3352  0204 cd0000        	call	_UART1_GetFlagStatus
3354  0207 4d            	tnz	a
3355  0208 27f7          	jreq	L3602
3356                     ; 259       delay(1000);
3358  020a ae03e8        	ldw	x,#1000
3359  020d ad4a          	call	_delay
3361                     ; 262       GPIO_WriteHigh(GPIOG, GPIO_PIN_4);
3363  020f 4b10          	push	#16
3364  0211 ae501e        	ldw	x,#20510
3365  0214 cd0000        	call	_GPIO_WriteHigh
3367  0217 84            	pop	a
3368                     ; 263       delay(1000);
3370  0218 ae03e8        	ldw	x,#1000
3371  021b ad3c          	call	_delay
3373  021d               L5502:
3374                     ; 251     while  (ReceiveBuff0 != Contr_data)          //验证写入的命令字是否正确，不正确则重新写
3376  021d b605          	ld	a,_ReceiveBuff0
3377  021f 1106          	cp	a,(OFST+0,sp)
3378  0221 26d0          	jrne	L3502
3379  0223               L7602:
3380                     ; 268 		delay(2000000);	//less than 1s
3382  0223 ae8480        	ldw	x,#33920
3383  0226 ad31          	call	_delay
3385                     ; 269 		putchar('.');
3387  0228 a62e          	ld	a,#46
3388  022a cd007b        	call	_putchar
3391  022d 20f4          	jra	L7602
3444                     ; 273 void  delayms(u16 Time)
3444                     ; 274 {
3445                     	switch	.text
3446  022f               _delayms:
3448  022f 89            	pushw	x
3449  0230 5204          	subw	sp,#4
3450       00000004      OFST:	set	4
3453                     ; 276   for(i = 0; i < Time; i++)
3455  0232 5f            	clrw	x
3456  0233 1f01          	ldw	(OFST-3,sp),x
3458  0235 2019          	jra	L5212
3459  0237               L1212:
3460                     ; 277     for(j = 0; j < 340; j++)
3462  0237 5f            	clrw	x
3463  0238 1f03          	ldw	(OFST-1,sp),x
3464  023a               L1312:
3465                     ; 279       nop();
3468  023a 9d            nop
3470                     ; 277     for(j = 0; j < 340; j++)
3473  023b 1e03          	ldw	x,(OFST-1,sp)
3474  023d 1c0001        	addw	x,#1
3475  0240 1f03          	ldw	(OFST-1,sp),x
3478  0242 1e03          	ldw	x,(OFST-1,sp)
3479  0244 a30154        	cpw	x,#340
3480  0247 25f1          	jrult	L1312
3481                     ; 276   for(i = 0; i < Time; i++)
3483  0249 1e01          	ldw	x,(OFST-3,sp)
3484  024b 1c0001        	addw	x,#1
3485  024e 1f01          	ldw	(OFST-3,sp),x
3486  0250               L5212:
3489  0250 1e01          	ldw	x,(OFST-3,sp)
3490  0252 1305          	cpw	x,(OFST+1,sp)
3491  0254 25e1          	jrult	L1212
3492                     ; 281 }
3495  0256 5b06          	addw	sp,#6
3496  0258 81            	ret
3539                     ; 283 void delay(u16 Time)
3539                     ; 284 {
3540                     	switch	.text
3541  0259               _delay:
3543  0259 89            	pushw	x
3544  025a 89            	pushw	x
3545       00000002      OFST:	set	2
3548                     ; 286   for(i = 0; i < Time; i++);
3550  025b 5f            	clrw	x
3551  025c 1f01          	ldw	(OFST-1,sp),x
3553  025e 2007          	jra	L5612
3554  0260               L1612:
3558  0260 1e01          	ldw	x,(OFST-1,sp)
3559  0262 1c0001        	addw	x,#1
3560  0265 1f01          	ldw	(OFST-1,sp),x
3561  0267               L5612:
3564  0267 1e01          	ldw	x,(OFST-1,sp)
3565  0269 1303          	cpw	x,(OFST+1,sp)
3566  026b 25f3          	jrult	L1612
3567                     ; 287 }
3570  026d 5b04          	addw	sp,#4
3571  026f 81            	ret
3659                     ; 289 void UART1_RX_IRQHandler_Impl(void){
3660                     	switch	.text
3661  0270               _UART1_RX_IRQHandler_Impl:
3663  0270 5206          	subw	sp,#6
3664       00000006      OFST:	set	6
3667                     ; 291     unsigned char j1=0 ,j2=0 ,j3=0 ,j4=0 ,j5=0;
3669  0272 0f01          	clr	(OFST-5,sp)
3672  0274 0f02          	clr	(OFST-4,sp)
3675  0276 0f03          	clr	(OFST-3,sp)
3678  0278 0f04          	clr	(OFST-2,sp)
3681  027a 0f05          	clr	(OFST-1,sp)
3682                     ; 293     char c = 0;
3685  027c               L3522:
3686                     ; 294     while(UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
3688  027c ae0020        	ldw	x,#32
3689  027f cd0000        	call	_UART1_GetFlagStatus
3691  0282 4d            	tnz	a
3692  0283 27f7          	jreq	L3522
3693                     ; 295     c = UART1_ReceiveData8();
3695  0285 cd0000        	call	_UART1_ReceiveData8
3697  0288 6b06          	ld	(OFST+0,sp),a
3698                     ; 297 		if (c==0) {
3700  028a 0d06          	tnz	(OFST+0,sp)
3701  028c 2745          	jreq	L23
3702                     ; 298 			return;
3704                     ; 305     switch(GPIOG->DDR & 0x07)
3706  028e c65020        	ld	a,20512
3707  0291 a407          	and	a,#7
3709                     ; 336       default:
3709                     ; 337           break;
3710  0293 4d            	tnz	a
3711  0294 2711          	jreq	L1712
3712  0296 4a            	dec	a
3713  0297 2714          	jreq	L3712
3714  0299 4a            	dec	a
3715  029a 2719          	jreq	L5712
3716  029c 4a            	dec	a
3717  029d 271e          	jreq	L7712
3718  029f 4a            	dec	a
3719  02a0 2723          	jreq	L1022
3720  02a2 4a            	dec	a
3721  02a3 2728          	jreq	L3022
3722  02a5 202c          	jra	L3622
3723  02a7               L1712:
3724                     ; 308           {ReceiveBuff0=c;      //读命令字存入 ReceiveBuff0
3726  02a7 7b06          	ld	a,(OFST+0,sp)
3727  02a9 b705          	ld	_ReceiveBuff0,a
3728                     ; 309             break;
3730  02ab 2026          	jra	L3622
3731  02ad               L3712:
3732                     ; 312           {ReceiveBuff1=c;      //子通道 1 接收的数据存入 ReceiveBuff1
3734  02ad 7b06          	ld	a,(OFST+0,sp)
3735  02af b704          	ld	_ReceiveBuff1,a
3736                     ; 313             j1++;
3738  02b1 0c01          	inc	(OFST-5,sp)
3739                     ; 314             break;
3741  02b3 201e          	jra	L3622
3742  02b5               L5712:
3743                     ; 317           {ReceiveBuff2=c;    //子通道 2 接收的数据存入 ReceiveBuff2
3745  02b5 7b06          	ld	a,(OFST+0,sp)
3746  02b7 b703          	ld	_ReceiveBuff2,a
3747                     ; 318             j2++;
3749  02b9 0c02          	inc	(OFST-4,sp)
3750                     ; 319             break;
3752  02bb 2016          	jra	L3622
3753  02bd               L7712:
3754                     ; 322         {ReceiveBuff3=c;    //子通道 3 接收的数据存入 ReceiveBuff3
3756  02bd 7b06          	ld	a,(OFST+0,sp)
3757  02bf b702          	ld	_ReceiveBuff3,a
3758                     ; 323           j3++;
3760  02c1 0c03          	inc	(OFST-3,sp)
3761                     ; 324           break;
3763  02c3 200e          	jra	L3622
3764  02c5               L1022:
3765                     ; 327         {ReceiveBuff4=c;    //子通道 4 接收的数据存入 ReceiveBuff4
3767  02c5 7b06          	ld	a,(OFST+0,sp)
3768  02c7 b701          	ld	_ReceiveBuff4,a
3769                     ; 328           j4++;
3771  02c9 0c04          	inc	(OFST-2,sp)
3772                     ; 329           break;
3774  02cb 2006          	jra	L3622
3775  02cd               L3022:
3776                     ; 332         {ReceiveBuff5=c;      //子通道 5 接收的数据存入 ReceiveBuff5
3778  02cd 7b06          	ld	a,(OFST+0,sp)
3779  02cf b700          	ld	_ReceiveBuff5,a
3780                     ; 333           j5++;
3782  02d1 0c05          	inc	(OFST-1,sp)
3783                     ; 334           break;
3785  02d3               L5022:
3786                     ; 336       default:
3786                     ; 337           break;
3788  02d3               L3622:
3789                     ; 341   }
3790  02d3               L23:
3793  02d3 5b06          	addw	sp,#6
3794  02d5 81            	ret
3829                     ; 352 void assert_failed(u8* file, u32 line)
3829                     ; 353 { 
3830                     	switch	.text
3831  02d6               _assert_failed:
3835  02d6               L3032:
3836  02d6 20fe          	jra	L3032
3952                     	xdef	_main
3953                     	switch	.ubsct
3954  0000               _ReceiveBuff5:
3955  0000 00            	ds.b	1
3956                     	xdef	_ReceiveBuff5
3957  0001               _ReceiveBuff4:
3958  0001 00            	ds.b	1
3959                     	xdef	_ReceiveBuff4
3960  0002               _ReceiveBuff3:
3961  0002 00            	ds.b	1
3962                     	xdef	_ReceiveBuff3
3963  0003               _ReceiveBuff2:
3964  0003 00            	ds.b	1
3965                     	xdef	_ReceiveBuff2
3966  0004               _ReceiveBuff1:
3967  0004 00            	ds.b	1
3968                     	xdef	_ReceiveBuff1
3969  0005               _ReceiveBuff0:
3970  0005 00            	ds.b	1
3971                     	xdef	_ReceiveBuff0
3972                     	xdef	_init_UART1
3973                     	xdef	_init_UART1_lib
3974                     	xdef	_init_UART3_lib
3975                     	xdef	_uart1_send_byte
3976                     	xdef	_print_clock
3977                     	xdef	_UART1_RX_IRQHandler_Impl
3978                     	xdef	_delay
3979                     	xdef	_delayms
3980  0006               _buf:
3981  0006 000000000000  	ds.b	128
3982                     	xdef	_buf
3983  0086               _pUniqueId:
3984  0086 0000          	ds.b	2
3985                     	xdef	_pUniqueId
3986  0088               _t:
3987  0088 00            	ds.b	1
3988                     	xdef	_t
3989  0089               _temp:
3990  0089 0000          	ds.b	2
3991                     	xdef	_temp
3992  008b               _i:
3993  008b 00            	ds.b	1
3994                     	xdef	_i
3995                     	xdef	_putchar
3996                     	xref	_printf
3997                     	xdef	_assert_failed
3998                     	xref	_UART3_GetFlagStatus
3999                     	xref	_UART3_SendData8
4000                     	xref	_UART3_Init
4001                     	xref	_UART1_GetFlagStatus
4002                     	xref	_UART1_SendData8
4003                     	xref	_UART1_ReceiveData8
4004                     	xref	_UART1_ITConfig
4005                     	xref	_UART1_Cmd
4006                     	xref	_UART1_Init
4007                     	xref	_GPIO_WriteLow
4008                     	xref	_GPIO_WriteHigh
4009                     	xref	_GPIO_Init
4010                     	xref	_CLK_GetSYSCLKSource
4011                     	xref	_CLK_GetClockFreq
4012                     	xref	_CLK_HSICmd
4013                     	switch	.const
4014  0005               L7171:
4015  0005 636c6b5f6672  	dc.b	"clk_freq   = %l",13
4016  0015 0a00          	dc.b	10,0
4017  0017               L5171:
4018  0017 636c6b5f6672  	dc.b	"clk_freq   = %i",13
4019  0027 0a00          	dc.b	10,0
4020  0029               L3171:
4021  0029 636c6b5f6672  	dc.b	"clk_freq   = %d",13
4022  0039 0a00          	dc.b	10,0
4023  003b               L1171:
4024  003b 636c6b5f6672  	dc.b	"clk_freq   = %X",13
4025  004b 0a00          	dc.b	10,0
4026  004d               L7071:
4027  004d 636c6b5f6672  	dc.b	"clk_freq   = %02X",13
4028  005f 0a00          	dc.b	10,0
4029  0061               L5071:
4030  0061 636c6b5f736f  	dc.b	"clk_source = %02X",13
4031  0073 0a00          	dc.b	10,0
4032                     	xref.b	c_x
4052                     	xref	c_xymvx
4053                     	xref	c_rtol
4054                     	end
