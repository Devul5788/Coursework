
coremark.gdb:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start-0x4>:
       0:	0000                	.2byte	0x0
	...

00000004 <_start>:
       4:	02c000ef          	jal	ra,30 <.Lload_gp>
       8:	00050793          	mv	a5,a0
       c:	0000b517          	auipc	a0,0xb
      10:	62050513          	addi	a0,a0,1568 # b62c <main>
      14:	00012583          	lw	a1,0(sp)
      18:	00410613          	addi	a2,sp,4
      1c:	ff017113          	andi	sp,sp,-16
      20:	00000693          	li	a3,0
      24:	00000713          	li	a4,0
      28:	00010813          	mv	a6,sp
      2c:	73c0406f          	j	4768 <__uClibc_main>

00000030 <.Lload_gp>:
      30:	0000c197          	auipc	gp,0xc
      34:	6f018193          	addi	gp,gp,1776 # c720 <__global_pointer$>
      38:	00008067          	ret

0000003c <deregister_tm_clones>:
      3c:	0000e517          	auipc	a0,0xe
      40:	d4850513          	addi	a0,a0,-696 # dd84 <__TMC_END__>
      44:	0000e797          	auipc	a5,0xe
      48:	d4078793          	addi	a5,a5,-704 # dd84 <__TMC_END__>
      4c:	00a78a63          	beq	a5,a0,60 <.L1>
      50:	0000c797          	auipc	a5,0xc
      54:	e687a783          	lw	a5,-408(a5) # beb8 <.LLST21+0x6>
      58:	00078463          	beqz	a5,60 <.L1>
      5c:	00078067          	jr	a5

00000060 <.L1>:
      60:	00008067          	ret

00000064 <register_tm_clones>:
      64:	0000e517          	auipc	a0,0xe
      68:	d2050513          	addi	a0,a0,-736 # dd84 <__TMC_END__>
      6c:	0000e597          	auipc	a1,0xe
      70:	d1858593          	addi	a1,a1,-744 # dd84 <__TMC_END__>
      74:	40a585b3          	sub	a1,a1,a0
      78:	4025d593          	srai	a1,a1,0x2
      7c:	00200793          	li	a5,2
      80:	02f5c5b3          	div	a1,a1,a5
      84:	00058a63          	beqz	a1,98 <.L6>
      88:	0000c797          	auipc	a5,0xc
      8c:	e247a783          	lw	a5,-476(a5) # beac <_GLOBAL_OFFSET_TABLE_+0x24>
      90:	00078463          	beqz	a5,98 <.L6>
      94:	00078067          	jr	a5

00000098 <.L6>:
      98:	00008067          	ret

0000009c <__do_global_dtors_aux>:
      9c:	ff010113          	addi	sp,sp,-16
      a0:	00812423          	sw	s0,8(sp)
      a4:	0000e417          	auipc	s0,0xe
      a8:	ce440413          	addi	s0,s0,-796 # dd88 <completed.1>
      ac:	00044783          	lbu	a5,0(s0)
      b0:	00112623          	sw	ra,12(sp)
      b4:	02079463          	bnez	a5,dc <.L14>
      b8:	f85ff0ef          	jal	ra,3c <deregister_tm_clones>
      bc:	0000c797          	auipc	a5,0xc
      c0:	dec7a783          	lw	a5,-532(a5) # bea8 <_GLOBAL_OFFSET_TABLE_+0x20>
      c4:	00078863          	beqz	a5,d4 <.L16>
      c8:	0000e517          	auipc	a0,0xe
      cc:	cbc50513          	addi	a0,a0,-836 # dd84 <__TMC_END__>
      d0:	000780e7          	jalr	a5

000000d4 <.L16>:
      d4:	00100793          	li	a5,1
      d8:	00f40023          	sb	a5,0(s0)

000000dc <.L14>:
      dc:	00c12083          	lw	ra,12(sp)
      e0:	00812403          	lw	s0,8(sp)
      e4:	01010113          	addi	sp,sp,16
      e8:	00008067          	ret

000000ec <frame_dummy>:
      ec:	0000c797          	auipc	a5,0xc
      f0:	dec7a783          	lw	a5,-532(a5) # bed8 <.LLST21+0x26>
      f4:	02078463          	beqz	a5,11c <.L27>
      f8:	ff010113          	addi	sp,sp,-16
      fc:	00112623          	sw	ra,12(sp)
     100:	0000e597          	auipc	a1,0xe
     104:	c8c58593          	addi	a1,a1,-884 # dd8c <object.0>
     108:	0000e517          	auipc	a0,0xe
     10c:	c7c50513          	addi	a0,a0,-900 # dd84 <__TMC_END__>
     110:	000780e7          	jalr	a5
     114:	00c12083          	lw	ra,12(sp)
     118:	01010113          	addi	sp,sp,16

0000011c <.L27>:
     11c:	f49ff06f          	j	64 <register_tm_clones>

00000120 <portable_malloc>:
     120:	4610306f          	j	3d80 <malloc>

00000124 <portable_free>:
     124:	6750306f          	j	3f98 <free>

00000128 <start_time>:
     128:	0000e597          	auipc	a1,0xe
     12c:	c7c58593          	addi	a1,a1,-900 # dda4 <start_time_val>
     130:	00000513          	li	a0,0
     134:	0510406f          	j	4984 <clock_gettime>

00000138 <stop_time>:
     138:	0000e597          	auipc	a1,0xe
     13c:	c7458593          	addi	a1,a1,-908 # ddac <stop_time_val>
     140:	00000513          	li	a0,0
     144:	0410406f          	j	4984 <clock_gettime>

00000148 <get_time>:
     148:	0000e717          	auipc	a4,0xe
     14c:	c5c70713          	addi	a4,a4,-932 # dda4 <start_time_val>
     150:	00072783          	lw	a5,0(a4)
     154:	00872503          	lw	a0,8(a4)
     158:	40f50533          	sub	a0,a0,a5
     15c:	3e800793          	li	a5,1000
     160:	02f50533          	mul	a0,a0,a5
     164:	00c72783          	lw	a5,12(a4)
     168:	00472703          	lw	a4,4(a4)
     16c:	40e787b3          	sub	a5,a5,a4
     170:	000f4737          	lui	a4,0xf4
     174:	24070713          	addi	a4,a4,576 # f4240 <_ebss+0xe43f0>
     178:	02e7c7b3          	div	a5,a5,a4
     17c:	00f50533          	add	a0,a0,a5
     180:	00008067          	ret

00000184 <time_in_secs>:
     184:	ff010113          	addi	sp,sp,-16
     188:	00112623          	sw	ra,12(sp)
     18c:	5fd010ef          	jal	ra,1f88 <__floatsidf>
     190:	0000d797          	auipc	a5,0xd
     194:	35078793          	addi	a5,a5,848 # d4e0 <.LC0>
     198:	0007a603          	lw	a2,0(a5)
     19c:	0047a683          	lw	a3,4(a5)
     1a0:	488010ef          	jal	ra,1628 <__divdf3>
     1a4:	00c12083          	lw	ra,12(sp)
     1a8:	01010113          	addi	sp,sp,16
     1ac:	00008067          	ret

000001b0 <portable_init>:
     1b0:	00100793          	li	a5,1
     1b4:	00f50023          	sb	a5,0(a0)
     1b8:	00008067          	ret

000001bc <portable_fini>:
     1bc:	00050023          	sb	zero,0(a0)
     1c0:	00008067          	ret

000001c4 <cmp_idx>:
     1c4:	02061e63          	bnez	a2,200 <.L2>
     1c8:	00051783          	lh	a5,0(a0)
     1cc:	f007f713          	andi	a4,a5,-256
     1d0:	01079793          	slli	a5,a5,0x10
     1d4:	0107d793          	srli	a5,a5,0x10
     1d8:	0087d793          	srli	a5,a5,0x8
     1dc:	00f767b3          	or	a5,a4,a5
     1e0:	00f51023          	sh	a5,0(a0)
     1e4:	00059783          	lh	a5,0(a1)
     1e8:	f007f713          	andi	a4,a5,-256
     1ec:	01079793          	slli	a5,a5,0x10
     1f0:	0107d793          	srli	a5,a5,0x10
     1f4:	0087d793          	srli	a5,a5,0x8
     1f8:	00f767b3          	or	a5,a4,a5
     1fc:	00f59023          	sh	a5,0(a1)

00000200 <.L2>:
     200:	00251503          	lh	a0,2(a0)
     204:	00259783          	lh	a5,2(a1)
     208:	40f50533          	sub	a0,a0,a5
     20c:	00008067          	ret

00000210 <calc_func>:
     210:	fe010113          	addi	sp,sp,-32
     214:	01212823          	sw	s2,16(sp)
     218:	00051903          	lh	s2,0(a0)
     21c:	00112e23          	sw	ra,28(sp)
     220:	00812c23          	sw	s0,24(sp)
     224:	40795793          	srai	a5,s2,0x7
     228:	00912a23          	sw	s1,20(sp)
     22c:	01312623          	sw	s3,12(sp)
     230:	0017f793          	andi	a5,a5,1
     234:	02078263          	beqz	a5,258 <.L4>
     238:	07f97513          	andi	a0,s2,127

0000023c <.L5>:
     23c:	01c12083          	lw	ra,28(sp)
     240:	01812403          	lw	s0,24(sp)
     244:	01412483          	lw	s1,20(sp)
     248:	01012903          	lw	s2,16(sp)
     24c:	00c12983          	lw	s3,12(sp)
     250:	02010113          	addi	sp,sp,32
     254:	00008067          	ret

00000258 <.L4>:
     258:	40395793          	srai	a5,s2,0x3
     25c:	00f7f793          	andi	a5,a5,15
     260:	00058493          	mv	s1,a1
     264:	00797713          	andi	a4,s2,7
     268:	00479593          	slli	a1,a5,0x4
     26c:	00f5e5b3          	or	a1,a1,a5
     270:	00050993          	mv	s3,a0
     274:	0384d783          	lhu	a5,56(s1)
     278:	02070663          	beqz	a4,2a4 <.L6>
     27c:	00100693          	li	a3,1
     280:	00090413          	mv	s0,s2
     284:	04d71c63          	bne	a4,a3,2dc <.L8>
     288:	00078613          	mv	a2,a5
     28c:	02848513          	addi	a0,s1,40
     290:	4b1000ef          	jal	ra,f40 <core_bench_matrix>
     294:	03c4d783          	lhu	a5,60(s1)
     298:	02079e63          	bnez	a5,2d4 <.L13>
     29c:	02a49e23          	sh	a0,60(s1)
     2a0:	0340006f          	j	2d4 <.L13>

000002a4 <.L6>:
     2a4:	02200693          	li	a3,34
     2a8:	00058713          	mv	a4,a1
     2ac:	00d5d463          	bge	a1,a3,2b4 <.L9>
     2b0:	02200713          	li	a4,34

000002b4 <.L9>:
     2b4:	00249683          	lh	a3,2(s1)
     2b8:	00049603          	lh	a2,0(s1)
     2bc:	0144a583          	lw	a1,20(s1)
     2c0:	0184a503          	lw	a0,24(s1)
     2c4:	0ff77713          	zext.b	a4,a4
     2c8:	030010ef          	jal	ra,12f8 <core_bench_state>
     2cc:	03e4d783          	lhu	a5,62(s1)
     2d0:	02078c63          	beqz	a5,308 <.L10>

000002d4 <.L13>:
     2d4:	01051413          	slli	s0,a0,0x10
     2d8:	41045413          	srai	s0,s0,0x10

000002dc <.L8>:
     2dc:	0384d583          	lhu	a1,56(s1)
     2e0:	01041513          	slli	a0,s0,0x10
     2e4:	01055513          	srli	a0,a0,0x10
     2e8:	2c8010ef          	jal	ra,15b0 <crcu16>
     2ec:	02a49c23          	sh	a0,56(s1)
     2f0:	f0097913          	andi	s2,s2,-256
     2f4:	07f47513          	andi	a0,s0,127
     2f8:	01256933          	or	s2,a0,s2
     2fc:	08096913          	ori	s2,s2,128
     300:	01299023          	sh	s2,0(s3)
     304:	f39ff06f          	j	23c <.L5>

00000308 <.L10>:
     308:	02a49f23          	sh	a0,62(s1)
     30c:	fc9ff06f          	j	2d4 <.L13>

00000310 <cmp_complex>:
     310:	fe010113          	addi	sp,sp,-32
     314:	00912a23          	sw	s1,20(sp)
     318:	00058493          	mv	s1,a1
     31c:	00060593          	mv	a1,a2
     320:	00112e23          	sw	ra,28(sp)
     324:	00812c23          	sw	s0,24(sp)
     328:	00c12623          	sw	a2,12(sp)
     32c:	ee5ff0ef          	jal	ra,210 <calc_func>
     330:	00c12583          	lw	a1,12(sp)
     334:	00050413          	mv	s0,a0
     338:	00048513          	mv	a0,s1
     33c:	ed5ff0ef          	jal	ra,210 <calc_func>
     340:	01c12083          	lw	ra,28(sp)
     344:	40a40533          	sub	a0,s0,a0
     348:	01812403          	lw	s0,24(sp)
     34c:	01412483          	lw	s1,20(sp)
     350:	02010113          	addi	sp,sp,32
     354:	00008067          	ret

00000358 <copy_info>:
     358:	00059783          	lh	a5,0(a1)
     35c:	00f51023          	sh	a5,0(a0)
     360:	00259783          	lh	a5,2(a1)
     364:	00f51123          	sh	a5,2(a0)
     368:	00008067          	ret

0000036c <core_list_insert_new>:
     36c:	00050813          	mv	a6,a0
     370:	00062503          	lw	a0,0(a2)
     374:	00850893          	addi	a7,a0,8
     378:	04e8f463          	bgeu	a7,a4,3c0 <.L21>
     37c:	0006a703          	lw	a4,0(a3)
     380:	00470313          	addi	t1,a4,4
     384:	02f37e63          	bgeu	t1,a5,3c0 <.L21>
     388:	01162023          	sw	a7,0(a2)
     38c:	00082783          	lw	a5,0(a6)
     390:	00f52023          	sw	a5,0(a0)
     394:	00a82023          	sw	a0,0(a6)
     398:	00e52223          	sw	a4,4(a0)
     39c:	0006a783          	lw	a5,0(a3)
     3a0:	00059703          	lh	a4,0(a1)
     3a4:	00478793          	addi	a5,a5,4
     3a8:	00f6a023          	sw	a5,0(a3)
     3ac:	00452783          	lw	a5,4(a0)
     3b0:	00e79023          	sh	a4,0(a5)
     3b4:	00259703          	lh	a4,2(a1)
     3b8:	00e79123          	sh	a4,2(a5)
     3bc:	00008067          	ret

000003c0 <.L21>:
     3c0:	00000513          	li	a0,0
     3c4:	00008067          	ret

000003c8 <core_list_remove>:
     3c8:	00050793          	mv	a5,a0
     3cc:	00052503          	lw	a0,0(a0)
     3d0:	0047a703          	lw	a4,4(a5)
     3d4:	00452683          	lw	a3,4(a0)
     3d8:	00d7a223          	sw	a3,4(a5)
     3dc:	00e52223          	sw	a4,4(a0)
     3e0:	00052703          	lw	a4,0(a0)
     3e4:	00e7a023          	sw	a4,0(a5)
     3e8:	00052023          	sw	zero,0(a0)
     3ec:	00008067          	ret

000003f0 <core_list_undo_remove>:
     3f0:	0045a683          	lw	a3,4(a1)
     3f4:	00452703          	lw	a4,4(a0)
     3f8:	00d52223          	sw	a3,4(a0)
     3fc:	00e5a223          	sw	a4,4(a1)
     400:	0005a703          	lw	a4,0(a1)
     404:	00e52023          	sw	a4,0(a0)
     408:	00a5a023          	sw	a0,0(a1)
     40c:	00008067          	ret

00000410 <core_list_find>:
     410:	00259783          	lh	a5,2(a1)
     414:	0207d063          	bgez	a5,434 <.L25>

00000418 <.L26>:
     418:	00050a63          	beqz	a0,42c <.L27>
     41c:	00452783          	lw	a5,4(a0)
     420:	00059703          	lh	a4,0(a1)
     424:	0007c783          	lbu	a5,0(a5)
     428:	02f71063          	bne	a4,a5,448 <.L29>

0000042c <.L27>:
     42c:	00008067          	ret

00000430 <.L28>:
     430:	00052503          	lw	a0,0(a0)

00000434 <.L25>:
     434:	fe050ce3          	beqz	a0,42c <.L27>
     438:	00452703          	lw	a4,4(a0)
     43c:	00271703          	lh	a4,2(a4)
     440:	fef718e3          	bne	a4,a5,430 <.L28>
     444:	00008067          	ret

00000448 <.L29>:
     448:	00052503          	lw	a0,0(a0)
     44c:	fcdff06f          	j	418 <.L26>

00000450 <core_list_reverse>:
     450:	00050793          	mv	a5,a0
     454:	00000513          	li	a0,0

00000458 <.L38>:
     458:	00079463          	bnez	a5,460 <.L39>
     45c:	00008067          	ret

00000460 <.L39>:
     460:	0007a703          	lw	a4,0(a5)
     464:	00a7a023          	sw	a0,0(a5)
     468:	00078513          	mv	a0,a5
     46c:	00070793          	mv	a5,a4
     470:	fe9ff06f          	j	458 <.L38>

00000474 <core_list_mergesort>:
     474:	fd010113          	addi	sp,sp,-48
     478:	01312e23          	sw	s3,28(sp)
     47c:	01512a23          	sw	s5,20(sp)
     480:	01712623          	sw	s7,12(sp)
     484:	01812423          	sw	s8,8(sp)
     488:	01a12023          	sw	s10,0(sp)
     48c:	02112623          	sw	ra,44(sp)
     490:	02812423          	sw	s0,40(sp)
     494:	02912223          	sw	s1,36(sp)
     498:	03212023          	sw	s2,32(sp)
     49c:	01412c23          	sw	s4,24(sp)
     4a0:	01612823          	sw	s6,16(sp)
     4a4:	01912223          	sw	s9,4(sp)
     4a8:	00058b93          	mv	s7,a1
     4ac:	00060c13          	mv	s8,a2
     4b0:	00050993          	mv	s3,a0
     4b4:	00100a93          	li	s5,1
     4b8:	00100d13          	li	s10,1

000004bc <.L56>:
     4bc:	00098493          	mv	s1,s3
     4c0:	00000c93          	li	s9,0
     4c4:	00000b13          	li	s6,0
     4c8:	00000993          	li	s3,0

000004cc <.L41>:
     4cc:	00049a63          	bnez	s1,4e0 <.L54>
     4d0:	000b2023          	sw	zero,0(s6)
     4d4:	099d5e63          	bge	s10,s9,570 <.L62>
     4d8:	001a9a93          	slli	s5,s5,0x1
     4dc:	fe1ff06f          	j	4bc <.L56>

000004e0 <.L54>:
     4e0:	001c8c93          	addi	s9,s9,1
     4e4:	00048413          	mv	s0,s1
     4e8:	00000913          	li	s2,0

000004ec <.L44>:
     4ec:	00042403          	lw	s0,0(s0)
     4f0:	00190913          	addi	s2,s2,1
     4f4:	00041e63          	bnez	s0,510 <.L42>

000004f8 <.L45>:
     4f8:	000a8a13          	mv	s4,s5

000004fc <.L43>:
     4fc:	03204863          	bgtz	s2,52c <.L51>
     500:	01405463          	blez	s4,508 <.L52>
     504:	00041a63          	bnez	s0,518 <.L53>

00000508 <.L52>:
     508:	00040493          	mv	s1,s0
     50c:	fc1ff06f          	j	4cc <.L41>

00000510 <.L42>:
     510:	fd2a9ee3          	bne	s5,s2,4ec <.L44>
     514:	fe5ff06f          	j	4f8 <.L45>

00000518 <.L53>:
     518:	02091c63          	bnez	s2,550 <.L46>

0000051c <.L49>:
     51c:	00040793          	mv	a5,s0
     520:	fffa0a13          	addi	s4,s4,-1
     524:	00042403          	lw	s0,0(s0)
     528:	0180006f          	j	540 <.L47>

0000052c <.L51>:
     52c:	000a0463          	beqz	s4,534 <.L64>
     530:	02041063          	bnez	s0,550 <.L46>

00000534 <.L64>:
     534:	00048793          	mv	a5,s1
     538:	0004a483          	lw	s1,0(s1)
     53c:	fff90913          	addi	s2,s2,-1

00000540 <.L47>:
     540:	020b0463          	beqz	s6,568 <.L57>
     544:	00fb2023          	sw	a5,0(s6)

00000548 <.L50>:
     548:	00078b13          	mv	s6,a5
     54c:	fb1ff06f          	j	4fc <.L43>

00000550 <.L46>:
     550:	00442583          	lw	a1,4(s0)
     554:	0044a503          	lw	a0,4(s1)
     558:	000c0613          	mv	a2,s8
     55c:	000b80e7          	jalr	s7
     560:	faa04ee3          	bgtz	a0,51c <.L49>
     564:	fd1ff06f          	j	534 <.L64>

00000568 <.L57>:
     568:	00078993          	mv	s3,a5
     56c:	fddff06f          	j	548 <.L50>

00000570 <.L62>:
     570:	02c12083          	lw	ra,44(sp)
     574:	02812403          	lw	s0,40(sp)
     578:	02412483          	lw	s1,36(sp)
     57c:	02012903          	lw	s2,32(sp)
     580:	01812a03          	lw	s4,24(sp)
     584:	01412a83          	lw	s5,20(sp)
     588:	01012b03          	lw	s6,16(sp)
     58c:	00c12b83          	lw	s7,12(sp)
     590:	00812c03          	lw	s8,8(sp)
     594:	00412c83          	lw	s9,4(sp)
     598:	00012d03          	lw	s10,0(sp)
     59c:	00098513          	mv	a0,s3
     5a0:	01c12983          	lw	s3,28(sp)
     5a4:	03010113          	addi	sp,sp,48
     5a8:	00008067          	ret

000005ac <core_bench_list>:
     5ac:	fb010113          	addi	sp,sp,-80
     5b0:	04812423          	sw	s0,72(sp)
     5b4:	03812423          	sw	s8,40(sp)
     5b8:	02452403          	lw	s0,36(a0)
     5bc:	00451c03          	lh	s8,4(a0)
     5c0:	04912223          	sw	s1,68(sp)
     5c4:	05212023          	sw	s2,64(sp)
     5c8:	03412c23          	sw	s4,56(sp)
     5cc:	03512a23          	sw	s5,52(sp)
     5d0:	03612823          	sw	s6,48(sp)
     5d4:	03712623          	sw	s7,44(sp)
     5d8:	04112623          	sw	ra,76(sp)
     5dc:	03312e23          	sw	s3,60(sp)
     5e0:	00050613          	mv	a2,a0
     5e4:	00058b13          	mv	s6,a1
     5e8:	00b11f23          	sh	a1,30(sp)
     5ec:	00000a93          	li	s5,0
     5f0:	00000b93          	li	s7,0
     5f4:	00000913          	li	s2,0
     5f8:	00000493          	li	s1,0
     5fc:	01c10a13          	addi	s4,sp,28

00000600 <.L66>:
     600:	0d8ac663          	blt	s5,s8,6cc <.L72>
     604:	00291913          	slli	s2,s2,0x2
     608:	41790933          	sub	s2,s2,s7
     60c:	012484b3          	add	s1,s1,s2
     610:	01049493          	slli	s1,s1,0x10
     614:	0104d493          	srli	s1,s1,0x10
     618:	01605c63          	blez	s6,630 <.L73>
     61c:	00040513          	mv	a0,s0
     620:	00000597          	auipc	a1,0x0
     624:	cf058593          	addi	a1,a1,-784 # 310 <cmp_complex>
     628:	e4dff0ef          	jal	ra,474 <core_list_mergesort>
     62c:	00050413          	mv	s0,a0

00000630 <.L73>:
     630:	00042503          	lw	a0,0(s0)
     634:	d95ff0ef          	jal	ra,3c8 <core_list_remove>
     638:	00050993          	mv	s3,a0
     63c:	000a0593          	mv	a1,s4
     640:	00040513          	mv	a0,s0
     644:	dcdff0ef          	jal	ra,410 <core_list_find>
     648:	00050913          	mv	s2,a0
     64c:	14051463          	bnez	a0,794 <.L76>
     650:	00042903          	lw	s2,0(s0)

00000654 <.L75>:
     654:	14091063          	bnez	s2,794 <.L76>
     658:	00042783          	lw	a5,0(s0)
     65c:	0049a703          	lw	a4,4(s3)
     660:	00040513          	mv	a0,s0
     664:	0047a683          	lw	a3,4(a5)
     668:	00000613          	li	a2,0
     66c:	00000597          	auipc	a1,0x0
     670:	b5858593          	addi	a1,a1,-1192 # 1c4 <cmp_idx>
     674:	00d9a223          	sw	a3,4(s3)
     678:	00e7a223          	sw	a4,4(a5)
     67c:	0007a703          	lw	a4,0(a5)
     680:	00e9a023          	sw	a4,0(s3)
     684:	0137a023          	sw	s3,0(a5)
     688:	dedff0ef          	jal	ra,474 <core_list_mergesort>
     68c:	00052903          	lw	s2,0(a0)
     690:	00050413          	mv	s0,a0

00000694 <.L77>:
     694:	10091e63          	bnez	s2,7b0 <.L78>
     698:	04c12083          	lw	ra,76(sp)
     69c:	04812403          	lw	s0,72(sp)
     6a0:	04012903          	lw	s2,64(sp)
     6a4:	03c12983          	lw	s3,60(sp)
     6a8:	03812a03          	lw	s4,56(sp)
     6ac:	03412a83          	lw	s5,52(sp)
     6b0:	03012b03          	lw	s6,48(sp)
     6b4:	02c12b83          	lw	s7,44(sp)
     6b8:	02812c03          	lw	s8,40(sp)
     6bc:	00048513          	mv	a0,s1
     6c0:	04412483          	lw	s1,68(sp)
     6c4:	05010113          	addi	sp,sp,80
     6c8:	00008067          	ret

000006cc <.L72>:
     6cc:	0ffaf793          	zext.b	a5,s5
     6d0:	000a0593          	mv	a1,s4
     6d4:	00040513          	mv	a0,s0
     6d8:	00c12623          	sw	a2,12(sp)
     6dc:	00f11e23          	sh	a5,28(sp)
     6e0:	d31ff0ef          	jal	ra,410 <core_list_find>
     6e4:	00050993          	mv	s3,a0
     6e8:	00040513          	mv	a0,s0
     6ec:	d65ff0ef          	jal	ra,450 <core_list_reverse>
     6f0:	00c12603          	lw	a2,12(sp)
     6f4:	00050413          	mv	s0,a0
     6f8:	04099663          	bnez	s3,744 <.L67>
     6fc:	00052783          	lw	a5,0(a0)
     700:	001b8b93          	addi	s7,s7,1
     704:	010b9b93          	slli	s7,s7,0x10
     708:	0047a783          	lw	a5,4(a5)
     70c:	010bdb93          	srli	s7,s7,0x10
     710:	00178783          	lb	a5,1(a5)
     714:	0017f793          	andi	a5,a5,1
     718:	00f484b3          	add	s1,s1,a5
     71c:	01049493          	slli	s1,s1,0x10
     720:	0104d493          	srli	s1,s1,0x10

00000724 <.L68>:
     724:	01e11783          	lh	a5,30(sp)
     728:	0007c663          	bltz	a5,734 <.L71>
     72c:	00178793          	addi	a5,a5,1
     730:	00f11f23          	sh	a5,30(sp)

00000734 <.L71>:
     734:	001a8793          	addi	a5,s5,1
     738:	01079a93          	slli	s5,a5,0x10
     73c:	410ada93          	srai	s5,s5,0x10
     740:	ec1ff06f          	j	600 <.L66>

00000744 <.L67>:
     744:	0049a783          	lw	a5,4(s3)
     748:	00079783          	lh	a5,0(a5)
     74c:	0017f713          	andi	a4,a5,1
     750:	00070c63          	beqz	a4,768 <.L69>
     754:	4097d793          	srai	a5,a5,0x9
     758:	0017f793          	andi	a5,a5,1
     75c:	00f487b3          	add	a5,s1,a5
     760:	01079493          	slli	s1,a5,0x10
     764:	0104d493          	srli	s1,s1,0x10

00000768 <.L69>:
     768:	0009a783          	lw	a5,0(s3)
     76c:	00078c63          	beqz	a5,784 <.L70>
     770:	0007a703          	lw	a4,0(a5)
     774:	00e9a023          	sw	a4,0(s3)
     778:	00042703          	lw	a4,0(s0)
     77c:	00e7a023          	sw	a4,0(a5)
     780:	00f42023          	sw	a5,0(s0)

00000784 <.L70>:
     784:	00190913          	addi	s2,s2,1
     788:	01091913          	slli	s2,s2,0x10
     78c:	01095913          	srli	s2,s2,0x10
     790:	f95ff06f          	j	724 <.L68>

00000794 <.L76>:
     794:	00442783          	lw	a5,4(s0)
     798:	00048593          	mv	a1,s1
     79c:	00079503          	lh	a0,0(a5)
     7a0:	675000ef          	jal	ra,1614 <crc16>
     7a4:	00050493          	mv	s1,a0
     7a8:	00092903          	lw	s2,0(s2)
     7ac:	ea9ff06f          	j	654 <.L75>

000007b0 <.L78>:
     7b0:	00442783          	lw	a5,4(s0)
     7b4:	00048593          	mv	a1,s1
     7b8:	00079503          	lh	a0,0(a5)
     7bc:	659000ef          	jal	ra,1614 <crc16>
     7c0:	00050493          	mv	s1,a0
     7c4:	00092903          	lw	s2,0(s2)
     7c8:	ecdff06f          	j	694 <.L77>

000007cc <core_list_init>:
     7cc:	01400793          	li	a5,20
     7d0:	02f55533          	divu	a0,a0,a5
     7d4:	fb010113          	addi	sp,sp,-80
     7d8:	04912223          	sw	s1,68(sp)
     7dc:	05212023          	sw	s2,64(sp)
     7e0:	04812423          	sw	s0,72(sp)
     7e4:	03312e23          	sw	s3,60(sp)
     7e8:	03412c23          	sw	s4,56(sp)
     7ec:	03512a23          	sw	s5,52(sp)
     7f0:	03612823          	sw	s6,48(sp)
     7f4:	03712623          	sw	s7,44(sp)
     7f8:	03812423          	sw	s8,40(sp)
     7fc:	04112623          	sw	ra,76(sp)
     800:	ffff87b7          	lui	a5,0xffff8
     804:	0005a023          	sw	zero,0(a1)
     808:	08078793          	addi	a5,a5,128 # ffff8080 <_ebss+0xfffe8230>
     80c:	00058413          	mv	s0,a1
     810:	01810a93          	addi	s5,sp,24
     814:	00c10b13          	addi	s6,sp,12
     818:	01c10b93          	addi	s7,sp,28
     81c:	00060993          	mv	s3,a2
     820:	000a8693          	mv	a3,s5
     824:	000b0613          	mv	a2,s6
     828:	00000c13          	li	s8,0
     82c:	ffe50493          	addi	s1,a0,-2
     830:	00349913          	slli	s2,s1,0x3
     834:	01258933          	add	s2,a1,s2
     838:	0125a223          	sw	s2,4(a1)
     83c:	00f91023          	sh	a5,0(s2)
     840:	00858793          	addi	a5,a1,8
     844:	00f12623          	sw	a5,12(sp)
     848:	00490793          	addi	a5,s2,4
     84c:	00f12c23          	sw	a5,24(sp)
     850:	00249a13          	slli	s4,s1,0x2
     854:	800007b7          	lui	a5,0x80000
     858:	fff7c793          	not	a5,a5
     85c:	01490a33          	add	s4,s2,s4
     860:	00f12e23          	sw	a5,28(sp)
     864:	00091123          	sh	zero,2(s2)
     868:	000a0793          	mv	a5,s4
     86c:	00090713          	mv	a4,s2
     870:	000b8593          	mv	a1,s7
     874:	00040513          	mv	a0,s0
     878:	af5ff0ef          	jal	ra,36c <core_list_insert_new>

0000087c <.L87>:
     87c:	069c6463          	bltu	s8,s1,8e4 <.L88>
     880:	00042783          	lw	a5,0(s0)
     884:	00500713          	li	a4,5
     888:	00004637          	lui	a2,0x4
     88c:	02e4d4b3          	divu	s1,s1,a4
     890:	fff60613          	addi	a2,a2,-1 # 3fff <.L6+0xb>
     894:	00100713          	li	a4,1

00000898 <.L89>:
     898:	0007a583          	lw	a1,0(a5) # 80000000 <_ebss+0x7fff01b0>
     89c:	08059a63          	bnez	a1,930 <.L92>
     8a0:	00040513          	mv	a0,s0
     8a4:	00000613          	li	a2,0
     8a8:	00000597          	auipc	a1,0x0
     8ac:	91c58593          	addi	a1,a1,-1764 # 1c4 <cmp_idx>
     8b0:	bc5ff0ef          	jal	ra,474 <core_list_mergesort>
     8b4:	04c12083          	lw	ra,76(sp)
     8b8:	04812403          	lw	s0,72(sp)
     8bc:	04412483          	lw	s1,68(sp)
     8c0:	04012903          	lw	s2,64(sp)
     8c4:	03c12983          	lw	s3,60(sp)
     8c8:	03812a03          	lw	s4,56(sp)
     8cc:	03412a83          	lw	s5,52(sp)
     8d0:	03012b03          	lw	s6,48(sp)
     8d4:	02c12b83          	lw	s7,44(sp)
     8d8:	02812c03          	lw	s8,40(sp)
     8dc:	05010113          	addi	sp,sp,80
     8e0:	00008067          	ret

000008e4 <.L88>:
     8e4:	010c1793          	slli	a5,s8,0x10
     8e8:	0107d793          	srli	a5,a5,0x10
     8ec:	0137c733          	xor	a4,a5,s3
     8f0:	00371713          	slli	a4,a4,0x3
     8f4:	0077f793          	andi	a5,a5,7
     8f8:	07877713          	andi	a4,a4,120
     8fc:	00f76733          	or	a4,a4,a5
     900:	00871793          	slli	a5,a4,0x8
     904:	00e7e7b3          	or	a5,a5,a4
     908:	00f11e23          	sh	a5,28(sp)
     90c:	00090713          	mv	a4,s2
     910:	000a0793          	mv	a5,s4
     914:	000a8693          	mv	a3,s5
     918:	000b0613          	mv	a2,s6
     91c:	000b8593          	mv	a1,s7
     920:	00040513          	mv	a0,s0
     924:	a49ff0ef          	jal	ra,36c <core_list_insert_new>
     928:	001c0c13          	addi	s8,s8,1
     92c:	f51ff06f          	j	87c <.L87>

00000930 <.L92>:
     930:	0047a503          	lw	a0,4(a5)
     934:	01071793          	slli	a5,a4,0x10
     938:	02976463          	bltu	a4,s1,960 <.L94>
     93c:	01071693          	slli	a3,a4,0x10
     940:	0106d693          	srli	a3,a3,0x10
     944:	00168793          	addi	a5,a3,1
     948:	00879793          	slli	a5,a5,0x8
     94c:	7007f793          	andi	a5,a5,1792
     950:	0136c6b3          	xor	a3,a3,s3
     954:	00d7e7b3          	or	a5,a5,a3
     958:	00c7f7b3          	and	a5,a5,a2
     95c:	01079793          	slli	a5,a5,0x10

00000960 <.L94>:
     960:	4107d793          	srai	a5,a5,0x10
     964:	00f51123          	sh	a5,2(a0)
     968:	00170713          	addi	a4,a4,1
     96c:	00058793          	mv	a5,a1
     970:	f29ff06f          	j	898 <.L89>

00000974 <iterate>:
     974:	ff010113          	addi	sp,sp,-16
     978:	01212023          	sw	s2,0(sp)
     97c:	01c52903          	lw	s2,28(a0)
     980:	00812423          	sw	s0,8(sp)
     984:	00912223          	sw	s1,4(sp)
     988:	00112623          	sw	ra,12(sp)
     98c:	00050413          	mv	s0,a0
     990:	02052c23          	sw	zero,56(a0)
     994:	02052e23          	sw	zero,60(a0)
     998:	00000493          	li	s1,0

0000099c <.L2>:
     99c:	03249063          	bne	s1,s2,9bc <.L4>
     9a0:	00c12083          	lw	ra,12(sp)
     9a4:	00812403          	lw	s0,8(sp)
     9a8:	00412483          	lw	s1,4(sp)
     9ac:	00012903          	lw	s2,0(sp)
     9b0:	00000513          	li	a0,0
     9b4:	01010113          	addi	sp,sp,16
     9b8:	00008067          	ret

000009bc <.L4>:
     9bc:	00100593          	li	a1,1
     9c0:	00040513          	mv	a0,s0
     9c4:	be9ff0ef          	jal	ra,5ac <core_bench_list>
     9c8:	03845583          	lhu	a1,56(s0)
     9cc:	3e5000ef          	jal	ra,15b0 <crcu16>
     9d0:	02a41c23          	sh	a0,56(s0)
     9d4:	fff00593          	li	a1,-1
     9d8:	00040513          	mv	a0,s0
     9dc:	bd1ff0ef          	jal	ra,5ac <core_bench_list>
     9e0:	03845583          	lhu	a1,56(s0)
     9e4:	3cd000ef          	jal	ra,15b0 <crcu16>
     9e8:	02a41c23          	sh	a0,56(s0)
     9ec:	00049463          	bnez	s1,9f4 <.L3>
     9f0:	02a41d23          	sh	a0,58(s0)

000009f4 <.L3>:
     9f4:	00148493          	addi	s1,s1,1
     9f8:	fa5ff06f          	j	99c <.L2>

000009fc <core_init_matrix>:
     9fc:	00061463          	bnez	a2,a04 <.L2>
     a00:	00100613          	li	a2,1

00000a04 <.L2>:
     a04:	00000713          	li	a4,0
     a08:	00000793          	li	a5,0
     a0c:	0100006f          	j	a1c <.L3>

00000a10 <.L4>:
     a10:	00178793          	addi	a5,a5,1
     a14:	02f78733          	mul	a4,a5,a5
     a18:	00371713          	slli	a4,a4,0x3

00000a1c <.L3>:
     a1c:	fea76ae3          	bltu	a4,a0,a10 <.L4>
     a20:	fff78513          	addi	a0,a5,-1
     a24:	02a50333          	mul	t1,a0,a0
     a28:	fff58713          	addi	a4,a1,-1
     a2c:	ffc77713          	andi	a4,a4,-4
     a30:	00470713          	addi	a4,a4,4
     a34:	00000e93          	li	t4,0
     a38:	00000e13          	li	t3,0
     a3c:	00100593          	li	a1,1
     a40:	000102b7          	lui	t0,0x10
     a44:	00131313          	slli	t1,t1,0x1
     a48:	006707b3          	add	a5,a4,t1
     a4c:	406003b3          	neg	t2,t1
     a50:	0aaee863          	bltu	t4,a0,b00 <.L13>
     a54:	00f6a423          	sw	a5,8(a3)
     a58:	006787b3          	add	a5,a5,t1
     a5c:	fff78793          	addi	a5,a5,-1
     a60:	ffc7f793          	andi	a5,a5,-4
     a64:	00478793          	addi	a5,a5,4
     a68:	00e6a223          	sw	a4,4(a3)
     a6c:	00f6a623          	sw	a5,12(a3)
     a70:	00a6a023          	sw	a0,0(a3)
     a74:	00008067          	ret

00000a78 <.L6>:
     a78:	02c58633          	mul	a2,a1,a2
     a7c:	01059f93          	slli	t6,a1,0x10
     a80:	010fdf93          	srli	t6,t6,0x10
     a84:	01138433          	add	s0,t2,a7
     a88:	00158593          	addi	a1,a1,1
     a8c:	00288893          	addi	a7,a7,2
     a90:	02566633          	rem	a2,a2,t0
     a94:	00cf8833          	add	a6,t6,a2
     a98:	01081813          	slli	a6,a6,0x10
     a9c:	01085813          	srli	a6,a6,0x10
     aa0:	ff089f23          	sh	a6,-2(a7)
     aa4:	01f80833          	add	a6,a6,t6
     aa8:	0ff87813          	zext.b	a6,a6
     aac:	01041023          	sh	a6,0(s0)
     ab0:	fcbf14e3          	bne	t5,a1,a78 <.L6>
     ab4:	001e8e93          	addi	t4,t4,1
     ab8:	00ae0e33          	add	t3,t3,a0
     abc:	000f0593          	mv	a1,t5
     ac0:	00aefa63          	bgeu	t4,a0,ad4 <.L7>

00000ac4 <.L11>:
     ac4:	001e1893          	slli	a7,t3,0x1
     ac8:	00f888b3          	add	a7,a7,a5
     acc:	00a58f33          	add	t5,a1,a0
     ad0:	fa9ff06f          	j	a78 <.L6>

00000ad4 <.L7>:
     ad4:	00f6a423          	sw	a5,8(a3)
     ad8:	006787b3          	add	a5,a5,t1
     adc:	fff78793          	addi	a5,a5,-1
     ae0:	00c12403          	lw	s0,12(sp)
     ae4:	ffc7f793          	andi	a5,a5,-4
     ae8:	00478793          	addi	a5,a5,4
     aec:	00e6a223          	sw	a4,4(a3)
     af0:	00f6a623          	sw	a5,12(a3)
     af4:	00a6a023          	sw	a0,0(a3)
     af8:	01010113          	addi	sp,sp,16
     afc:	00008067          	ret

00000b00 <.L13>:
     b00:	ff010113          	addi	sp,sp,-16
     b04:	00812623          	sw	s0,12(sp)
     b08:	fbdff06f          	j	ac4 <.L11>

00000b0c <matrix_sum>:
     b0c:	00050693          	mv	a3,a0
     b10:	00000e13          	li	t3,0
     b14:	00000e93          	li	t4,0
     b18:	00000513          	li	a0,0
     b1c:	00000893          	li	a7,0
     b20:	00000813          	li	a6,0

00000b24 <.L16>:
     b24:	06de8263          	beq	t4,a3,b88 <.L20>
     b28:	002e1713          	slli	a4,t3,0x2
     b2c:	00e58733          	add	a4,a1,a4
     b30:	00000313          	li	t1,0

00000b34 <.L19>:
     b34:	00088f13          	mv	t5,a7
     b38:	00072883          	lw	a7,0(a4)
     b3c:	01051793          	slli	a5,a0,0x10
     b40:	0107d793          	srli	a5,a5,0x10
     b44:	01180833          	add	a6,a6,a7
     b48:	03065663          	bge	a2,a6,b74 <.L17>
     b4c:	00a78793          	addi	a5,a5,10
     b50:	01079513          	slli	a0,a5,0x10
     b54:	41055513          	srai	a0,a0,0x10
     b58:	00000813          	li	a6,0

00000b5c <.L18>:
     b5c:	00130313          	addi	t1,t1,1
     b60:	00470713          	addi	a4,a4,4
     b64:	fc6698e3          	bne	a3,t1,b34 <.L19>
     b68:	001e8e93          	addi	t4,t4,1
     b6c:	00de0e33          	add	t3,t3,a3
     b70:	fb5ff06f          	j	b24 <.L16>

00000b74 <.L17>:
     b74:	011f2f33          	slt	t5,t5,a7
     b78:	01e787b3          	add	a5,a5,t5
     b7c:	01079513          	slli	a0,a5,0x10
     b80:	41055513          	srai	a0,a0,0x10
     b84:	fd9ff06f          	j	b5c <.L18>

00000b88 <.L20>:
     b88:	00008067          	ret

00000b8c <matrix_mul_const>:
     b8c:	00000813          	li	a6,0
     b90:	00000893          	li	a7,0

00000b94 <.L23>:
     b94:	00a89463          	bne	a7,a0,b9c <.L25>
     b98:	00008067          	ret

00000b9c <.L25>:
     b9c:	00181713          	slli	a4,a6,0x1
     ba0:	00281793          	slli	a5,a6,0x2
     ba4:	00e60733          	add	a4,a2,a4
     ba8:	00f587b3          	add	a5,a1,a5
     bac:	00000313          	li	t1,0

00000bb0 <.L24>:
     bb0:	00071e03          	lh	t3,0(a4)
     bb4:	00130313          	addi	t1,t1,1
     bb8:	00270713          	addi	a4,a4,2
     bbc:	02de0e33          	mul	t3,t3,a3
     bc0:	00478793          	addi	a5,a5,4
     bc4:	ffc7ae23          	sw	t3,-4(a5)
     bc8:	fe6514e3          	bne	a0,t1,bb0 <.L24>
     bcc:	00188893          	addi	a7,a7,1
     bd0:	00a80833          	add	a6,a6,a0
     bd4:	fc1ff06f          	j	b94 <.L23>

00000bd8 <matrix_add_const>:
     bd8:	00000693          	li	a3,0
     bdc:	00000713          	li	a4,0

00000be0 <.L28>:
     be0:	00a71463          	bne	a4,a0,be8 <.L30>
     be4:	00008067          	ret

00000be8 <.L30>:
     be8:	00169793          	slli	a5,a3,0x1
     bec:	00f587b3          	add	a5,a1,a5
     bf0:	00000813          	li	a6,0

00000bf4 <.L29>:
     bf4:	0007d883          	lhu	a7,0(a5)
     bf8:	00180813          	addi	a6,a6,1
     bfc:	00278793          	addi	a5,a5,2
     c00:	00c888b3          	add	a7,a7,a2
     c04:	ff179f23          	sh	a7,-2(a5)
     c08:	ff0516e3          	bne	a0,a6,bf4 <.L29>
     c0c:	00170713          	addi	a4,a4,1
     c10:	00a686b3          	add	a3,a3,a0
     c14:	fcdff06f          	j	be0 <.L28>

00000c18 <matrix_mul_vect>:
     c18:	00151e93          	slli	t4,a0,0x1
     c1c:	00000813          	li	a6,0
     c20:	00000713          	li	a4,0

00000c24 <.L33>:
     c24:	00a71463          	bne	a4,a0,c2c <.L35>
     c28:	00008067          	ret

00000c2c <.L35>:
     c2c:	00181e13          	slli	t3,a6,0x1
     c30:	01c60e33          	add	t3,a2,t3
     c34:	00000793          	li	a5,0
     c38:	00000893          	li	a7,0

00000c3c <.L34>:
     c3c:	00fe0333          	add	t1,t3,a5
     c40:	00f68f33          	add	t5,a3,a5
     c44:	00031303          	lh	t1,0(t1)
     c48:	000f1f03          	lh	t5,0(t5)
     c4c:	00278793          	addi	a5,a5,2
     c50:	03e30333          	mul	t1,t1,t5
     c54:	006888b3          	add	a7,a7,t1
     c58:	fefe92e3          	bne	t4,a5,c3c <.L34>
     c5c:	00271793          	slli	a5,a4,0x2
     c60:	00f587b3          	add	a5,a1,a5
     c64:	0117a023          	sw	a7,0(a5)
     c68:	00170713          	addi	a4,a4,1
     c6c:	00a80833          	add	a6,a6,a0
     c70:	fb5ff06f          	j	c24 <.L33>

00000c74 <matrix_mul_matrix>:
     c74:	00151393          	slli	t2,a0,0x1
     c78:	00000813          	li	a6,0
     c7c:	00000e13          	li	t3,0

00000c80 <.L48>:
     c80:	08ae1863          	bne	t3,a0,d10 <.L51>
     c84:	00008067          	ret

00000c88 <.L42>:
     c88:	00281793          	slli	a5,a6,0x2
     c8c:	00f587b3          	add	a5,a1,a5
     c90:	0007a023          	sw	zero,0(a5)
     c94:	06050263          	beqz	a0,cf8 <.L39>

00000c98 <.L49>:
     c98:	00181e93          	slli	t4,a6,0x1
     c9c:	01d60eb3          	add	t4,a2,t4
     ca0:	00000893          	li	a7,0

00000ca4 <.L40>:
     ca4:	00189713          	slli	a4,a7,0x1
     ca8:	00e68733          	add	a4,a3,a4
     cac:	000e8f93          	mv	t6,t4
     cb0:	00000f13          	li	t5,0
     cb4:	00000313          	li	t1,0

00000cb8 <.L41>:
     cb8:	000f9283          	lh	t0,0(t6)
     cbc:	00071403          	lh	s0,0(a4)
     cc0:	002f8f93          	addi	t6,t6,2
     cc4:	00770733          	add	a4,a4,t2
     cc8:	028282b3          	mul	t0,t0,s0
     ccc:	005f0f33          	add	t5,t5,t0
     cd0:	00030293          	mv	t0,t1
     cd4:	00130313          	addi	t1,t1,1
     cd8:	fe6510e3          	bne	a0,t1,cb8 <.L41>
     cdc:	01e7a023          	sw	t5,0(a5)
     ce0:	00188713          	addi	a4,a7,1
     ce4:	00478793          	addi	a5,a5,4
     ce8:	01128863          	beq	t0,a7,cf8 <.L39>
     cec:	0007a023          	sw	zero,0(a5)
     cf0:	00070893          	mv	a7,a4
     cf4:	fb1ff06f          	j	ca4 <.L40>

00000cf8 <.L39>:
     cf8:	001e0e13          	addi	t3,t3,1
     cfc:	00a80833          	add	a6,a6,a0
     d00:	f8ae14e3          	bne	t3,a0,c88 <.L42>
     d04:	00c12403          	lw	s0,12(sp)
     d08:	01010113          	addi	sp,sp,16
     d0c:	00008067          	ret

00000d10 <.L51>:
     d10:	00281793          	slli	a5,a6,0x2
     d14:	00f587b3          	add	a5,a1,a5
     d18:	0007a023          	sw	zero,0(a5)
     d1c:	00051863          	bnez	a0,d2c <.L52>
     d20:	001e0e13          	addi	t3,t3,1
     d24:	00a80833          	add	a6,a6,a0
     d28:	f59ff06f          	j	c80 <.L48>

00000d2c <.L52>:
     d2c:	ff010113          	addi	sp,sp,-16
     d30:	00812623          	sw	s0,12(sp)
     d34:	f65ff06f          	j	c98 <.L49>

00000d38 <matrix_mul_matrix_bitextract>:
     d38:	ff010113          	addi	sp,sp,-16
     d3c:	00812623          	sw	s0,12(sp)
     d40:	00000313          	li	t1,0
     d44:	00151413          	slli	s0,a0,0x1
     d48:	00000f13          	li	t5,0

00000d4c <.L54>:
     d4c:	00af1863          	bne	t5,a0,d5c <.L58>
     d50:	00c12403          	lw	s0,12(sp)
     d54:	01010113          	addi	sp,sp,16
     d58:	00008067          	ret

00000d5c <.L58>:
     d5c:	00231713          	slli	a4,t1,0x2
     d60:	00e58733          	add	a4,a1,a4
     d64:	00072023          	sw	zero,0(a4)
     d68:	06050c63          	beqz	a0,de0 <.L55>
     d6c:	00131f93          	slli	t6,t1,0x1
     d70:	01f60fb3          	add	t6,a2,t6
     d74:	00000e13          	li	t3,0

00000d78 <.L56>:
     d78:	001e1813          	slli	a6,t3,0x1
     d7c:	01068833          	add	a6,a3,a6
     d80:	000f8393          	mv	t2,t6
     d84:	00000293          	li	t0,0
     d88:	00000e93          	li	t4,0

00000d8c <.L57>:
     d8c:	00081883          	lh	a7,0(a6)
     d90:	00039783          	lh	a5,0(t2)
     d94:	00880833          	add	a6,a6,s0
     d98:	00238393          	addi	t2,t2,2
     d9c:	031787b3          	mul	a5,a5,a7
     da0:	4027d893          	srai	a7,a5,0x2
     da4:	4057d793          	srai	a5,a5,0x5
     da8:	00f8f893          	andi	a7,a7,15
     dac:	07f7f793          	andi	a5,a5,127
     db0:	02f887b3          	mul	a5,a7,a5
     db4:	000e8893          	mv	a7,t4
     db8:	001e8e93          	addi	t4,t4,1
     dbc:	00f282b3          	add	t0,t0,a5
     dc0:	fdd516e3          	bne	a0,t4,d8c <.L57>
     dc4:	00572023          	sw	t0,0(a4)
     dc8:	001e0793          	addi	a5,t3,1
     dcc:	00470713          	addi	a4,a4,4
     dd0:	01c88863          	beq	a7,t3,de0 <.L55>
     dd4:	00072023          	sw	zero,0(a4)
     dd8:	00078e13          	mv	t3,a5
     ddc:	f9dff06f          	j	d78 <.L56>

00000de0 <.L55>:
     de0:	001f0f13          	addi	t5,t5,1
     de4:	00a30333          	add	t1,t1,a0
     de8:	f65ff06f          	j	d4c <.L54>

00000dec <matrix_test>:
     dec:	fe010113          	addi	sp,sp,-32
     df0:	01212823          	sw	s2,16(sp)
     df4:	00060913          	mv	s2,a2
     df8:	00912a23          	sw	s1,20(sp)
     dfc:	00070613          	mv	a2,a4
     e00:	01412423          	sw	s4,8(sp)
     e04:	00058493          	mv	s1,a1
     e08:	fffffa37          	lui	s4,0xfffff
     e0c:	00090593          	mv	a1,s2
     e10:	00112e23          	sw	ra,28(sp)
     e14:	01476a33          	or	s4,a4,s4
     e18:	00812c23          	sw	s0,24(sp)
     e1c:	01312623          	sw	s3,12(sp)
     e20:	01512223          	sw	s5,4(sp)
     e24:	00070993          	mv	s3,a4
     e28:	01612023          	sw	s6,0(sp)
     e2c:	00050413          	mv	s0,a0
     e30:	00068a93          	mv	s5,a3
     e34:	da5ff0ef          	jal	ra,bd8 <matrix_add_const>
     e38:	00098693          	mv	a3,s3
     e3c:	00090613          	mv	a2,s2
     e40:	00048593          	mv	a1,s1
     e44:	00040513          	mv	a0,s0
     e48:	d45ff0ef          	jal	ra,b8c <matrix_mul_const>
     e4c:	000a0613          	mv	a2,s4
     e50:	00048593          	mv	a1,s1
     e54:	00040513          	mv	a0,s0
     e58:	cb5ff0ef          	jal	ra,b0c <matrix_sum>
     e5c:	00000593          	li	a1,0
     e60:	7b4000ef          	jal	ra,1614 <crc16>
     e64:	000a8693          	mv	a3,s5
     e68:	00050b13          	mv	s6,a0
     e6c:	00090613          	mv	a2,s2
     e70:	00048593          	mv	a1,s1
     e74:	00040513          	mv	a0,s0
     e78:	da1ff0ef          	jal	ra,c18 <matrix_mul_vect>
     e7c:	000a0613          	mv	a2,s4
     e80:	00048593          	mv	a1,s1
     e84:	00040513          	mv	a0,s0
     e88:	c85ff0ef          	jal	ra,b0c <matrix_sum>
     e8c:	000b0593          	mv	a1,s6
     e90:	784000ef          	jal	ra,1614 <crc16>
     e94:	000a8693          	mv	a3,s5
     e98:	00050b13          	mv	s6,a0
     e9c:	00090613          	mv	a2,s2
     ea0:	00048593          	mv	a1,s1
     ea4:	00040513          	mv	a0,s0
     ea8:	dcdff0ef          	jal	ra,c74 <matrix_mul_matrix>
     eac:	000a0613          	mv	a2,s4
     eb0:	00048593          	mv	a1,s1
     eb4:	00040513          	mv	a0,s0
     eb8:	c55ff0ef          	jal	ra,b0c <matrix_sum>
     ebc:	000b0593          	mv	a1,s6
     ec0:	754000ef          	jal	ra,1614 <crc16>
     ec4:	000a8693          	mv	a3,s5
     ec8:	00050b13          	mv	s6,a0
     ecc:	00090613          	mv	a2,s2
     ed0:	00048593          	mv	a1,s1
     ed4:	00040513          	mv	a0,s0
     ed8:	e61ff0ef          	jal	ra,d38 <matrix_mul_matrix_bitextract>
     edc:	000a0613          	mv	a2,s4
     ee0:	00048593          	mv	a1,s1
     ee4:	00040513          	mv	a0,s0
     ee8:	c25ff0ef          	jal	ra,b0c <matrix_sum>
     eec:	000b0593          	mv	a1,s6
     ef0:	724000ef          	jal	ra,1614 <crc16>
     ef4:	41300633          	neg	a2,s3
     ef8:	01061613          	slli	a2,a2,0x10
     efc:	00050493          	mv	s1,a0
     f00:	00090593          	mv	a1,s2
     f04:	00040513          	mv	a0,s0
     f08:	41065613          	srai	a2,a2,0x10
     f0c:	ccdff0ef          	jal	ra,bd8 <matrix_add_const>
     f10:	01c12083          	lw	ra,28(sp)
     f14:	01812403          	lw	s0,24(sp)
     f18:	01049513          	slli	a0,s1,0x10
     f1c:	01012903          	lw	s2,16(sp)
     f20:	01412483          	lw	s1,20(sp)
     f24:	00c12983          	lw	s3,12(sp)
     f28:	00812a03          	lw	s4,8(sp)
     f2c:	00412a83          	lw	s5,4(sp)
     f30:	00012b03          	lw	s6,0(sp)
     f34:	41055513          	srai	a0,a0,0x10
     f38:	02010113          	addi	sp,sp,32
     f3c:	00008067          	ret

00000f40 <core_bench_matrix>:
     f40:	ff010113          	addi	sp,sp,-16
     f44:	00812423          	sw	s0,8(sp)
     f48:	00852683          	lw	a3,8(a0)
     f4c:	00060413          	mv	s0,a2
     f50:	00058713          	mv	a4,a1
     f54:	00452603          	lw	a2,4(a0)
     f58:	00c52583          	lw	a1,12(a0)
     f5c:	00052503          	lw	a0,0(a0)
     f60:	00112623          	sw	ra,12(sp)
     f64:	e89ff0ef          	jal	ra,dec <matrix_test>
     f68:	00040593          	mv	a1,s0
     f6c:	00812403          	lw	s0,8(sp)
     f70:	00c12083          	lw	ra,12(sp)
     f74:	01010113          	addi	sp,sp,16
     f78:	69c0006f          	j	1614 <crc16>

00000f7c <core_init_state>:
     f7c:	00158713          	addi	a4,a1,1
     f80:	ff010113          	addi	sp,sp,-16
     f84:	01071713          	slli	a4,a4,0x10
     f88:	00812623          	sw	s0,12(sp)
     f8c:	00060e13          	mv	t3,a2
     f90:	00912423          	sw	s1,8(sp)
     f94:	fff50f13          	addi	t5,a0,-1
     f98:	01075713          	srli	a4,a4,0x10
     f9c:	00000693          	li	a3,0
     fa0:	00000793          	li	a5,0
     fa4:	00000313          	li	t1,0
     fa8:	02c00f93          	li	t6,44
     fac:	00700293          	li	t0,7
     fb0:	0000d617          	auipc	a2,0xd
     fb4:	ce460613          	addi	a2,a2,-796 # dc94 <intpat>
     fb8:	00400393          	li	t2,4
     fbc:	00100413          	li	s0,1

00000fc0 <.L2>:
     fc0:	00f30833          	add	a6,t1,a5
     fc4:	00180e93          	addi	t4,a6,1
     fc8:	03eee463          	bltu	t4,t5,ff0 <.L9>
     fcc:	00000613          	li	a2,0
     fd0:	00656463          	bltu	a0,t1,fd8 <.L11>
     fd4:	40650633          	sub	a2,a0,t1

00000fd8 <.L11>:
     fd8:	00c12403          	lw	s0,12(sp)
     fdc:	00812483          	lw	s1,8(sp)
     fe0:	00000593          	li	a1,0
     fe4:	006e0533          	add	a0,t3,t1
     fe8:	01010113          	addi	sp,sp,16
     fec:	0450206f          	j	3830 <__GI_memset>

00000ff0 <.L9>:
     ff0:	02078863          	beqz	a5,1020 <.L3>
     ff4:	00000593          	li	a1,0

00000ff8 <.L4>:
     ff8:	00b688b3          	add	a7,a3,a1
     ffc:	0008c483          	lbu	s1,0(a7)
    1000:	00b308b3          	add	a7,t1,a1
    1004:	011e08b3          	add	a7,t3,a7
    1008:	00988023          	sb	s1,0(a7)
    100c:	00158593          	addi	a1,a1,1
    1010:	feb794e3          	bne	a5,a1,ff8 <.L4>
    1014:	010e0833          	add	a6,t3,a6
    1018:	01f80023          	sb	t6,0(a6)
    101c:	000e8313          	mv	t1,t4

00001020 <.L3>:
    1020:	00175793          	srli	a5,a4,0x1
    1024:	00777693          	andi	a3,a4,7
    1028:	00c7f793          	andi	a5,a5,12
    102c:	04568663          	beq	a3,t0,1078 <.L5>
    1030:	02d3ee63          	bltu	t2,a3,106c <.L6>
    1034:	ffd68693          	addi	a3,a3,-3
    1038:	01069693          	slli	a3,a3,0x10
    103c:	0106d693          	srli	a3,a3,0x10
    1040:	00f607b3          	add	a5,a2,a5
    1044:	00d47e63          	bgeu	s0,a3,1060 <.L7>
    1048:	0007a683          	lw	a3,0(a5)
    104c:	00400793          	li	a5,4

00001050 <.L8>:
    1050:	00170713          	addi	a4,a4,1
    1054:	01071713          	slli	a4,a4,0x10
    1058:	01075713          	srli	a4,a4,0x10
    105c:	f65ff06f          	j	fc0 <.L2>

00001060 <.L7>:
    1060:	0107a683          	lw	a3,16(a5)

00001064 <.L17>:
    1064:	00800793          	li	a5,8
    1068:	fe9ff06f          	j	1050 <.L8>

0000106c <.L6>:
    106c:	00f607b3          	add	a5,a2,a5
    1070:	0207a683          	lw	a3,32(a5)
    1074:	ff1ff06f          	j	1064 <.L17>

00001078 <.L5>:
    1078:	00f607b3          	add	a5,a2,a5
    107c:	0307a683          	lw	a3,48(a5)
    1080:	fe5ff06f          	j	1064 <.L17>

00001084 <core_state_transition>:
    1084:	00052783          	lw	a5,0(a0)
    1088:	00050613          	mv	a2,a0
    108c:	00000513          	li	a0,0
    1090:	0007c683          	lbu	a3,0(a5)
    1094:	20068663          	beqz	a3,12a0 <.L20>
    1098:	02c00813          	li	a6,44
    109c:	00000513          	li	a0,0
    10a0:	1f068e63          	beq	a3,a6,129c <.L21>
    10a4:	fd068513          	addi	a0,a3,-48
    10a8:	0ff57513          	zext.b	a0,a0
    10ac:	00900893          	li	a7,9
    10b0:	00178713          	addi	a4,a5,1
    10b4:	0005a783          	lw	a5,0(a1)
    10b8:	02a8ec63          	bltu	a7,a0,10f0 <.L26>
    10bc:	00178793          	addi	a5,a5,1
    10c0:	00f5a023          	sw	a5,0(a1)
    10c4:	00070793          	mv	a5,a4
    10c8:	00074703          	lbu	a4,0(a4)
    10cc:	00400513          	li	a0,4
    10d0:	1c070863          	beqz	a4,12a0 <.L20>
    10d4:	13071863          	bne	a4,a6,1204 <.L27>

000010d8 <.L63>:
    10d8:	00400513          	li	a0,4
    10dc:	1c00006f          	j	129c <.L21>

000010e0 <.L49>:
    10e0:	02c00513          	li	a0,44
    10e4:	1ea71c63          	bne	a4,a0,12dc <.L65>
    10e8:	00700513          	li	a0,7
    10ec:	1b00006f          	j	129c <.L21>

000010f0 <.L26>:
    10f0:	02d00513          	li	a0,45
    10f4:	02a69463          	bne	a3,a0,111c <.L28>

000010f8 <.L73>:
    10f8:	00178793          	addi	a5,a5,1
    10fc:	00f5a023          	sw	a5,0(a1)
    1100:	00074683          	lbu	a3,0(a4)
    1104:	00070793          	mv	a5,a4
    1108:	00200513          	li	a0,2
    110c:	18068a63          	beqz	a3,12a0 <.L20>
    1110:	07069063          	bne	a3,a6,1170 <.L29>
    1114:	00200513          	li	a0,2
    1118:	1840006f          	j	129c <.L21>

0000111c <.L28>:
    111c:	02e00513          	li	a0,46
    1120:	02a69463          	bne	a3,a0,1148 <.L30>
    1124:	00178793          	addi	a5,a5,1
    1128:	00f5a023          	sw	a5,0(a1)
    112c:	00074683          	lbu	a3,0(a4)
    1130:	00070793          	mv	a5,a4
    1134:	00500513          	li	a0,5
    1138:	16068463          	beqz	a3,12a0 <.L20>
    113c:	07069863          	bne	a3,a6,11ac <.L68>

00001140 <.L59>:
    1140:	00500513          	li	a0,5
    1144:	1580006f          	j	129c <.L21>

00001148 <.L30>:
    1148:	02b00513          	li	a0,43
    114c:	faa686e3          	beq	a3,a0,10f8 <.L73>
    1150:	0045a683          	lw	a3,4(a1)
    1154:	00178793          	addi	a5,a5,1
    1158:	00f5a023          	sw	a5,0(a1)
    115c:	00168693          	addi	a3,a3,1
    1160:	00d5a223          	sw	a3,4(a1)
    1164:	00070793          	mv	a5,a4

00001168 <.L69>:
    1168:	00100513          	li	a0,1
    116c:	1340006f          	j	12a0 <.L20>

00001170 <.L29>:
    1170:	0085a503          	lw	a0,8(a1)
    1174:	fd068813          	addi	a6,a3,-48
    1178:	0ff87813          	zext.b	a6,a6
    117c:	00900893          	li	a7,9
    1180:	00150513          	addi	a0,a0,1
    1184:	0708f263          	bgeu	a7,a6,11e8 <.L32>
    1188:	02e00813          	li	a6,46
    118c:	09069a63          	bne	a3,a6,1220 <.L66>
    1190:	00a5a423          	sw	a0,8(a1)

00001194 <.L36>:
    1194:	00174683          	lbu	a3,1(a4)
    1198:	00178793          	addi	a5,a5,1
    119c:	00500513          	li	a0,5
    11a0:	10068063          	beqz	a3,12a0 <.L20>
    11a4:	02c00713          	li	a4,44
    11a8:	f8e68ce3          	beq	a3,a4,1140 <.L59>

000011ac <.L68>:
    11ac:	0df6f513          	andi	a0,a3,223
    11b0:	04500813          	li	a6,69
    11b4:	00078713          	mv	a4,a5
    11b8:	09051a63          	bne	a0,a6,124c <.L40>
    11bc:	0145a683          	lw	a3,20(a1)
    11c0:	00178793          	addi	a5,a5,1
    11c4:	00300513          	li	a0,3
    11c8:	00168693          	addi	a3,a3,1
    11cc:	00d5aa23          	sw	a3,20(a1)
    11d0:	00174683          	lbu	a3,1(a4)
    11d4:	0c068663          	beqz	a3,12a0 <.L20>
    11d8:	02c00813          	li	a6,44
    11dc:	09069863          	bne	a3,a6,126c <.L67>
    11e0:	00300513          	li	a0,3
    11e4:	0b80006f          	j	129c <.L21>

000011e8 <.L32>:
    11e8:	00a5a423          	sw	a0,8(a1)

000011ec <.L39>:
    11ec:	0017c703          	lbu	a4,1(a5)
    11f0:	00178793          	addi	a5,a5,1
    11f4:	00400513          	li	a0,4
    11f8:	0a070463          	beqz	a4,12a0 <.L20>
    11fc:	02c00693          	li	a3,44
    1200:	ecd70ce3          	beq	a4,a3,10d8 <.L63>

00001204 <.L27>:
    1204:	02e00693          	li	a3,46
    1208:	02d71263          	bne	a4,a3,122c <.L38>
    120c:	0105a703          	lw	a4,16(a1)
    1210:	00170713          	addi	a4,a4,1
    1214:	00e5a823          	sw	a4,16(a1)
    1218:	00078713          	mv	a4,a5
    121c:	f79ff06f          	j	1194 <.L36>

00001220 <.L66>:
    1220:	00a5a423          	sw	a0,8(a1)

00001224 <.L37>:
    1224:	00178793          	addi	a5,a5,1
    1228:	f41ff06f          	j	1168 <.L69>

0000122c <.L38>:
    122c:	fd070713          	addi	a4,a4,-48
    1230:	0ff77713          	zext.b	a4,a4
    1234:	00900693          	li	a3,9
    1238:	fae6fae3          	bgeu	a3,a4,11ec <.L39>
    123c:	0105a703          	lw	a4,16(a1)
    1240:	00170713          	addi	a4,a4,1
    1244:	00e5a823          	sw	a4,16(a1)
    1248:	fddff06f          	j	1224 <.L37>

0000124c <.L40>:
    124c:	fd068693          	addi	a3,a3,-48
    1250:	0ff6f693          	zext.b	a3,a3
    1254:	00900513          	li	a0,9
    1258:	f2d57ee3          	bgeu	a0,a3,1194 <.L36>
    125c:	0145a703          	lw	a4,20(a1)
    1260:	00170713          	addi	a4,a4,1
    1264:	00e5aa23          	sw	a4,20(a1)
    1268:	fbdff06f          	j	1224 <.L37>

0000126c <.L67>:
    126c:	00c5a503          	lw	a0,12(a1)
    1270:	fd568693          	addi	a3,a3,-43
    1274:	0fd6f693          	andi	a3,a3,253
    1278:	00150513          	addi	a0,a0,1
    127c:	00a5a623          	sw	a0,12(a1)
    1280:	fa0692e3          	bnez	a3,1224 <.L37>
    1284:	00270793          	addi	a5,a4,2
    1288:	00274703          	lbu	a4,2(a4)
    128c:	00600513          	li	a0,6
    1290:	00070863          	beqz	a4,12a0 <.L20>
    1294:	01071a63          	bne	a4,a6,12a8 <.L64>
    1298:	00600513          	li	a0,6

0000129c <.L21>:
    129c:	00178793          	addi	a5,a5,1

000012a0 <.L20>:
    12a0:	00f62023          	sw	a5,0(a2)
    12a4:	00008067          	ret

000012a8 <.L64>:
    12a8:	0185a683          	lw	a3,24(a1)
    12ac:	fd070713          	addi	a4,a4,-48
    12b0:	0ff77713          	zext.b	a4,a4
    12b4:	00168693          	addi	a3,a3,1
    12b8:	00900513          	li	a0,9
    12bc:	00d5ac23          	sw	a3,24(a1)
    12c0:	f6e562e3          	bltu	a0,a4,1224 <.L37>
    12c4:	00900693          	li	a3,9

000012c8 <.L47>:
    12c8:	0017c703          	lbu	a4,1(a5)
    12cc:	00178793          	addi	a5,a5,1
    12d0:	e00718e3          	bnez	a4,10e0 <.L49>
    12d4:	00700513          	li	a0,7
    12d8:	fc9ff06f          	j	12a0 <.L20>

000012dc <.L65>:
    12dc:	fd070713          	addi	a4,a4,-48
    12e0:	0ff77713          	zext.b	a4,a4
    12e4:	fee6f2e3          	bgeu	a3,a4,12c8 <.L47>
    12e8:	0045a703          	lw	a4,4(a1)
    12ec:	00170713          	addi	a4,a4,1
    12f0:	00e5a223          	sw	a4,4(a1)
    12f4:	f31ff06f          	j	1224 <.L37>

000012f8 <core_bench_state>:
    12f8:	f8010113          	addi	sp,sp,-128
    12fc:	07312623          	sw	s3,108(sp)
    1300:	03010993          	addi	s3,sp,48
    1304:	06812c23          	sw	s0,120(sp)
    1308:	07212823          	sw	s2,112(sp)
    130c:	05812c23          	sw	s8,88(sp)
    1310:	00b12623          	sw	a1,12(sp)
    1314:	00050913          	mv	s2,a0
    1318:	00058413          	mv	s0,a1
    131c:	00060c13          	mv	s8,a2
    1320:	00000593          	li	a1,0
    1324:	02000613          	li	a2,32
    1328:	00098513          	mv	a0,s3
    132c:	06112e23          	sw	ra,124(sp)
    1330:	06912a23          	sw	s1,116(sp)
    1334:	07412423          	sw	s4,104(sp)
    1338:	07512223          	sw	s5,100(sp)
    133c:	07612023          	sw	s6,96(sp)
    1340:	05712e23          	sw	s7,92(sp)
    1344:	00068a93          	mv	s5,a3
    1348:	00070a13          	mv	s4,a4
    134c:	00078493          	mv	s1,a5
    1350:	01010b13          	addi	s6,sp,16
    1354:	4dc020ef          	jal	ra,3830 <__GI_memset>
    1358:	02000613          	li	a2,32
    135c:	00000593          	li	a1,0
    1360:	000b0513          	mv	a0,s6
    1364:	4cc020ef          	jal	ra,3830 <__GI_memset>
    1368:	00c10b93          	addi	s7,sp,12

0000136c <.L75>:
    136c:	00c12783          	lw	a5,12(sp)
    1370:	0007c783          	lbu	a5,0(a5)
    1374:	08079c63          	bnez	a5,140c <.L76>
    1378:	00040b93          	mv	s7,s0
    137c:	00040793          	mv	a5,s0
    1380:	01240933          	add	s2,s0,s2
    1384:	02c00693          	li	a3,44

00001388 <.L77>:
    1388:	0b27e663          	bltu	a5,s2,1434 <.L79>
    138c:	00812623          	sw	s0,12(sp)
    1390:	00c10413          	addi	s0,sp,12

00001394 <.L80>:
    1394:	00c12783          	lw	a5,12(sp)
    1398:	0007c783          	lbu	a5,0(a5)
    139c:	0a079863          	bnez	a5,144c <.L81>
    13a0:	02c00713          	li	a4,44

000013a4 <.L82>:
    13a4:	0d2be863          	bltu	s7,s2,1474 <.L84>
    13a8:	00000413          	li	s0,0
    13ac:	02000913          	li	s2,32

000013b0 <.L85>:
    13b0:	008b07b3          	add	a5,s6,s0
    13b4:	0007a503          	lw	a0,0(a5)
    13b8:	00048593          	mv	a1,s1
    13bc:	224000ef          	jal	ra,15e0 <crcu32>
    13c0:	008987b3          	add	a5,s3,s0
    13c4:	00050593          	mv	a1,a0
    13c8:	0007a503          	lw	a0,0(a5)
    13cc:	00440413          	addi	s0,s0,4
    13d0:	210000ef          	jal	ra,15e0 <crcu32>
    13d4:	00050493          	mv	s1,a0
    13d8:	fd241ce3          	bne	s0,s2,13b0 <.L85>
    13dc:	07c12083          	lw	ra,124(sp)
    13e0:	07812403          	lw	s0,120(sp)
    13e4:	07412483          	lw	s1,116(sp)
    13e8:	07012903          	lw	s2,112(sp)
    13ec:	06c12983          	lw	s3,108(sp)
    13f0:	06812a03          	lw	s4,104(sp)
    13f4:	06412a83          	lw	s5,100(sp)
    13f8:	06012b03          	lw	s6,96(sp)
    13fc:	05c12b83          	lw	s7,92(sp)
    1400:	05812c03          	lw	s8,88(sp)
    1404:	08010113          	addi	sp,sp,128
    1408:	00008067          	ret

0000140c <.L76>:
    140c:	00098593          	mv	a1,s3
    1410:	000b8513          	mv	a0,s7
    1414:	c71ff0ef          	jal	ra,1084 <core_state_transition>
    1418:	00251513          	slli	a0,a0,0x2
    141c:	05050793          	addi	a5,a0,80
    1420:	00278533          	add	a0,a5,sp
    1424:	fc052783          	lw	a5,-64(a0)
    1428:	00178793          	addi	a5,a5,1
    142c:	fcf52023          	sw	a5,-64(a0)
    1430:	f3dff06f          	j	136c <.L75>

00001434 <.L79>:
    1434:	0007c703          	lbu	a4,0(a5)
    1438:	00d70663          	beq	a4,a3,1444 <.L78>
    143c:	01874733          	xor	a4,a4,s8
    1440:	00e78023          	sb	a4,0(a5)

00001444 <.L78>:
    1444:	014787b3          	add	a5,a5,s4
    1448:	f41ff06f          	j	1388 <.L77>

0000144c <.L81>:
    144c:	00098593          	mv	a1,s3
    1450:	00040513          	mv	a0,s0
    1454:	c31ff0ef          	jal	ra,1084 <core_state_transition>
    1458:	00251513          	slli	a0,a0,0x2
    145c:	05050793          	addi	a5,a0,80
    1460:	00278533          	add	a0,a5,sp
    1464:	fc052783          	lw	a5,-64(a0)
    1468:	00178793          	addi	a5,a5,1
    146c:	fcf52023          	sw	a5,-64(a0)
    1470:	f25ff06f          	j	1394 <.L80>

00001474 <.L84>:
    1474:	000bc783          	lbu	a5,0(s7)
    1478:	00e78663          	beq	a5,a4,1484 <.L83>
    147c:	0157c7b3          	xor	a5,a5,s5
    1480:	00fb8023          	sb	a5,0(s7)

00001484 <.L83>:
    1484:	014b8bb3          	add	s7,s7,s4
    1488:	f1dff06f          	j	13a4 <.L82>

0000148c <parseval>:
    148c:	00054703          	lbu	a4,0(a0)
    1490:	02d00793          	li	a5,45
    1494:	00100613          	li	a2,1
    1498:	00f71663          	bne	a4,a5,14a4 <.L2>
    149c:	00150513          	addi	a0,a0,1
    14a0:	fff00613          	li	a2,-1

000014a4 <.L2>:
    14a4:	00054703          	lbu	a4,0(a0)
    14a8:	03000793          	li	a5,48
    14ac:	02f70863          	beq	a4,a5,14dc <.L3>
    14b0:	00000793          	li	a5,0

000014b4 <.L5>:
    14b4:	00900693          	li	a3,9
    14b8:	00a00813          	li	a6,10

000014bc <.L4>:
    14bc:	00054703          	lbu	a4,0(a0)
    14c0:	fd070713          	addi	a4,a4,-48
    14c4:	0ff77593          	zext.b	a1,a4
    14c8:	04b6e663          	bltu	a3,a1,1514 <.L10>
    14cc:	030787b3          	mul	a5,a5,a6
    14d0:	00150513          	addi	a0,a0,1
    14d4:	00f707b3          	add	a5,a4,a5
    14d8:	fe5ff06f          	j	14bc <.L4>

000014dc <.L3>:
    14dc:	00154683          	lbu	a3,1(a0)
    14e0:	07800713          	li	a4,120
    14e4:	00000793          	li	a5,0
    14e8:	fce696e3          	bne	a3,a4,14b4 <.L5>
    14ec:	00250513          	addi	a0,a0,2
    14f0:	00900813          	li	a6,9
    14f4:	00500593          	li	a1,5

000014f8 <.L6>:
    14f8:	00054683          	lbu	a3,0(a0)
    14fc:	fd068713          	addi	a4,a3,-48
    1500:	0ff77893          	zext.b	a7,a4
    1504:	03187663          	bgeu	a6,a7,1530 <.L7>
    1508:	f9f68713          	addi	a4,a3,-97
    150c:	0ff77713          	zext.b	a4,a4
    1510:	00e5fe63          	bgeu	a1,a4,152c <.L9>

00001514 <.L10>:
    1514:	00054703          	lbu	a4,0(a0)
    1518:	04b00693          	li	a3,75
    151c:	02d71263          	bne	a4,a3,1540 <.L12>
    1520:	00a79793          	slli	a5,a5,0xa

00001524 <.L13>:
    1524:	02c78533          	mul	a0,a5,a2
    1528:	00008067          	ret

0000152c <.L9>:
    152c:	fa968713          	addi	a4,a3,-87

00001530 <.L7>:
    1530:	00479793          	slli	a5,a5,0x4
    1534:	00f707b3          	add	a5,a4,a5
    1538:	00150513          	addi	a0,a0,1
    153c:	fbdff06f          	j	14f8 <.L6>

00001540 <.L12>:
    1540:	04d00693          	li	a3,77
    1544:	fed710e3          	bne	a4,a3,1524 <.L13>
    1548:	01479793          	slli	a5,a5,0x14
    154c:	fd9ff06f          	j	1524 <.L13>

00001550 <get_seed_args>:
    1550:	00b55a63          	bge	a0,a1,1564 <.L17>
    1554:	00251513          	slli	a0,a0,0x2
    1558:	00a60633          	add	a2,a2,a0
    155c:	00062503          	lw	a0,0(a2)
    1560:	f2dff06f          	j	148c <parseval>

00001564 <.L17>:
    1564:	00000513          	li	a0,0
    1568:	00008067          	ret

0000156c <crcu8>:
    156c:	ffffa6b7          	lui	a3,0xffffa
    1570:	00050713          	mv	a4,a0
    1574:	00800793          	li	a5,8
    1578:	00058513          	mv	a0,a1
    157c:	00168693          	addi	a3,a3,1 # ffffa001 <_ebss+0xfffea1b1>

00001580 <.L20>:
    1580:	00a74633          	xor	a2,a4,a0
    1584:	00167613          	andi	a2,a2,1
    1588:	00175713          	srli	a4,a4,0x1
    158c:	00155513          	srli	a0,a0,0x1
    1590:	00060863          	beqz	a2,15a0 <.L19>
    1594:	00d545b3          	xor	a1,a0,a3
    1598:	01059513          	slli	a0,a1,0x10
    159c:	01055513          	srli	a0,a0,0x10

000015a0 <.L19>:
    15a0:	fff78793          	addi	a5,a5,-1
    15a4:	0ff7f793          	zext.b	a5,a5
    15a8:	fc079ce3          	bnez	a5,1580 <.L20>
    15ac:	00008067          	ret

000015b0 <crcu16>:
    15b0:	ff010113          	addi	sp,sp,-16
    15b4:	00812423          	sw	s0,8(sp)
    15b8:	00050413          	mv	s0,a0
    15bc:	0ff57513          	zext.b	a0,a0
    15c0:	00112623          	sw	ra,12(sp)
    15c4:	fa9ff0ef          	jal	ra,156c <crcu8>
    15c8:	00050593          	mv	a1,a0
    15cc:	00845513          	srli	a0,s0,0x8
    15d0:	00812403          	lw	s0,8(sp)
    15d4:	00c12083          	lw	ra,12(sp)
    15d8:	01010113          	addi	sp,sp,16
    15dc:	f91ff06f          	j	156c <crcu8>

000015e0 <crcu32>:
    15e0:	ff010113          	addi	sp,sp,-16
    15e4:	00812423          	sw	s0,8(sp)
    15e8:	00050413          	mv	s0,a0
    15ec:	01051513          	slli	a0,a0,0x10
    15f0:	01055513          	srli	a0,a0,0x10
    15f4:	00112623          	sw	ra,12(sp)
    15f8:	fb9ff0ef          	jal	ra,15b0 <crcu16>
    15fc:	00050593          	mv	a1,a0
    1600:	01045513          	srli	a0,s0,0x10
    1604:	00812403          	lw	s0,8(sp)
    1608:	00c12083          	lw	ra,12(sp)
    160c:	01010113          	addi	sp,sp,16
    1610:	fa1ff06f          	j	15b0 <crcu16>

00001614 <crc16>:
    1614:	01051513          	slli	a0,a0,0x10
    1618:	01055513          	srli	a0,a0,0x10
    161c:	f95ff06f          	j	15b0 <crcu16>

00001620 <check_data_types>:
    1620:	00000513          	li	a0,0
    1624:	00008067          	ret

00001628 <__divdf3>:
#include "soft-fp.h"
#include "double.h"

DFtype
__divdf3 (DFtype a, DFtype b)
{
    1628:	fd010113          	addi	sp,sp,-48
    162c:	01712623          	sw	s7,12(sp)
    1630:	00060b93          	mv	s7,a2

00001634 <.LBB3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_D (A, a);
    1634:	0145d613          	srli	a2,a1,0x14

00001638 <.LBE3>:
{
    1638:	02812423          	sw	s0,40(sp)
    163c:	03212023          	sw	s2,32(sp)
    1640:	01312e23          	sw	s3,28(sp)
    1644:	01612823          	sw	s6,16(sp)

00001648 <.LBB4>:
  FP_UNPACK_D (A, a);
    1648:	00c59413          	slli	s0,a1,0xc

0000164c <.LBE4>:
{
    164c:	02112623          	sw	ra,44(sp)
    1650:	02912223          	sw	s1,36(sp)
    1654:	01412c23          	sw	s4,24(sp)
    1658:	01512a23          	sw	s5,20(sp)

0000165c <.LBB5>:
  FP_UNPACK_D (A, a);
    165c:	7ff67613          	andi	a2,a2,2047

00001660 <.LBE5>:
{
    1660:	00050b13          	mv	s6,a0
    1664:	00068913          	mv	s2,a3

00001668 <.LBB6>:
  FP_UNPACK_D (A, a);
    1668:	00c45413          	srli	s0,s0,0xc

0000166c <.LVL2>:
    166c:	01f5d993          	srli	s3,a1,0x1f

00001670 <.LBE6>:
    1670:	0a060063          	beqz	a2,1710 <.L2>
    1674:	7ff00793          	li	a5,2047
    1678:	10f60063          	beq	a2,a5,1778 <.L3>

0000167c <.LVL4>:
    167c:	01d55693          	srli	a3,a0,0x1d
    1680:	00341413          	slli	s0,s0,0x3

00001684 <.LVL5>:
    1684:	0086e6b3          	or	a3,a3,s0
    1688:	008007b7          	lui	a5,0x800
    168c:	00f6ea33          	or	s4,a3,a5

00001690 <.LVL6>:
    1690:	00351493          	slli	s1,a0,0x3

00001694 <.LVL7>:
    1694:	c0160a93          	addi	s5,a2,-1023

00001698 <.L103>:
    1698:	00000b13          	li	s6,0

0000169c <.L4>:
  FP_UNPACK_D (B, b);
    169c:	01495793          	srli	a5,s2,0x14
    16a0:	00c91413          	slli	s0,s2,0xc
    16a4:	7ff7f793          	andi	a5,a5,2047
    16a8:	00c45413          	srli	s0,s0,0xc

000016ac <.LVL10>:
    16ac:	01f95913          	srli	s2,s2,0x1f

000016b0 <.LBE11>:
    16b0:	10078263          	beqz	a5,17b4 <.L9>
    16b4:	7ff00713          	li	a4,2047
    16b8:	16e78663          	beq	a5,a4,1824 <.L10>

000016bc <.LVL12>:
    16bc:	00341413          	slli	s0,s0,0x3

000016c0 <.LVL13>:
    16c0:	01dbd713          	srli	a4,s7,0x1d
    16c4:	00876733          	or	a4,a4,s0
    16c8:	00800437          	lui	s0,0x800
    16cc:	00876433          	or	s0,a4,s0

000016d0 <.LVL14>:
    16d0:	003b9f13          	slli	t5,s7,0x3

000016d4 <.LVL15>:
    16d4:	c0178693          	addi	a3,a5,-1023 # 7ffc01 <_ebss+0x7efdb1>

000016d8 <.L104>:
    16d8:	00000593          	li	a1,0

000016dc <.L11>:
  FP_DIV_D (R, A, B);
    16dc:	002b1793          	slli	a5,s6,0x2
    16e0:	00b7e7b3          	or	a5,a5,a1
    16e4:	40da8633          	sub	a2,s5,a3
    16e8:	fff78793          	addi	a5,a5,-1
    16ec:	00e00693          	li	a3,14

000016f0 <.LVL18>:
    16f0:	0129c733          	xor	a4,s3,s2

000016f4 <.LVL19>:
    16f4:	18f6ec63          	bltu	a3,a5,188c <.L16>
    16f8:	82418693          	addi	a3,gp,-2012 # bf44 <.L18>
    16fc:	00279793          	slli	a5,a5,0x2
    1700:	00d787b3          	add	a5,a5,a3
    1704:	0007a783          	lw	a5,0(a5)
    1708:	00d787b3          	add	a5,a5,a3
    170c:	00078067          	jr	a5

00001710 <.L2>:
  FP_UNPACK_D (A, a);
    1710:	00a46a33          	or	s4,s0,a0
    1714:	080a0063          	beqz	s4,1794 <.L71>

00001718 <.LBB16>:
    1718:	02040e63          	beqz	s0,1754 <.L5>
    171c:	00040513          	mv	a0,s0

00001720 <.LVL21>:
    1720:	191000ef          	jal	ra,20b0 <__clzsi2>

00001724 <.LVL22>:
    1724:	ff550793          	addi	a5,a0,-11

00001728 <.L6>:
    1728:	01d00693          	li	a3,29
    172c:	ff850713          	addi	a4,a0,-8
    1730:	40f686b3          	sub	a3,a3,a5
    1734:	00e41433          	sll	s0,s0,a4

00001738 <.LVL24>:
    1738:	00db56b3          	srl	a3,s6,a3
    173c:	0086ea33          	or	s4,a3,s0

00001740 <.LVL25>:
    1740:	00eb1433          	sll	s0,s6,a4

00001744 <.L8>:
    1744:	c0d00613          	li	a2,-1011
    1748:	40a60ab3          	sub	s5,a2,a0

0000174c <.LVL27>:
    174c:	00040493          	mv	s1,s0
    1750:	f49ff06f          	j	1698 <.L103>

00001754 <.L5>:
    1754:	15d000ef          	jal	ra,20b0 <__clzsi2>

00001758 <.LVL29>:
    1758:	00050a13          	mv	s4,a0

0000175c <.LVL30>:
    175c:	015a0793          	addi	a5,s4,21 # fffff015 <_ebss+0xfffef1c5>
    1760:	01c00713          	li	a4,28
    1764:	02050513          	addi	a0,a0,32

00001768 <.LVL31>:
    1768:	fcf750e3          	bge	a4,a5,1728 <.L6>
    176c:	ff8a0a13          	addi	s4,s4,-8
    1770:	014b1a33          	sll	s4,s6,s4

00001774 <.LVL32>:
    1774:	fd1ff06f          	j	1744 <.L8>

00001778 <.L3>:
    1778:	00a46a33          	or	s4,s0,a0
    177c:	020a0463          	beqz	s4,17a4 <.L72>
    1780:	00050493          	mv	s1,a0

00001784 <.LBB17>:
    1784:	00040a13          	mv	s4,s0
    1788:	7ff00a93          	li	s5,2047

0000178c <.LBE17>:
    178c:	00300b13          	li	s6,3
    1790:	f0dff06f          	j	169c <.L4>

00001794 <.L71>:
    1794:	00000493          	li	s1,0
    1798:	00000a93          	li	s5,0

0000179c <.LBE18>:
    179c:	00100b13          	li	s6,1
    17a0:	efdff06f          	j	169c <.L4>

000017a4 <.L72>:
    17a4:	00000493          	li	s1,0
    17a8:	7ff00a93          	li	s5,2047

000017ac <.LBE19>:
    17ac:	00200b13          	li	s6,2
    17b0:	eedff06f          	j	169c <.L4>

000017b4 <.L9>:
  FP_UNPACK_D (B, b);
    17b4:	01746f33          	or	t5,s0,s7
    17b8:	080f0263          	beqz	t5,183c <.L73>

000017bc <.LBB20>:
    17bc:	04040063          	beqz	s0,17fc <.L12>
    17c0:	00040513          	mv	a0,s0
    17c4:	0ed000ef          	jal	ra,20b0 <__clzsi2>

000017c8 <.LVL35>:
    17c8:	ff550713          	addi	a4,a0,-11

000017cc <.L13>:
    17cc:	01d00793          	li	a5,29
    17d0:	ff850693          	addi	a3,a0,-8
    17d4:	40e787b3          	sub	a5,a5,a4
    17d8:	00d41433          	sll	s0,s0,a3

000017dc <.LVL37>:
    17dc:	00fbd7b3          	srl	a5,s7,a5
    17e0:	0087e7b3          	or	a5,a5,s0

000017e4 <.LVL38>:
    17e4:	00db9433          	sll	s0,s7,a3

000017e8 <.L15>:
    17e8:	c0d00693          	li	a3,-1011
    17ec:	00040f13          	mv	t5,s0
    17f0:	40a686b3          	sub	a3,a3,a0

000017f4 <.LVL40>:
    17f4:	00078413          	mv	s0,a5

000017f8 <.LVL41>:
    17f8:	ee1ff06f          	j	16d8 <.L104>

000017fc <.L12>:
    17fc:	000b8513          	mv	a0,s7
    1800:	0b1000ef          	jal	ra,20b0 <__clzsi2>

00001804 <.LVL43>:
    1804:	00050793          	mv	a5,a0

00001808 <.LVL44>:
    1808:	01578713          	addi	a4,a5,21
    180c:	01c00693          	li	a3,28
    1810:	02050513          	addi	a0,a0,32

00001814 <.LVL45>:
    1814:	fae6dce3          	bge	a3,a4,17cc <.L13>
    1818:	ff878793          	addi	a5,a5,-8
    181c:	00fb97b3          	sll	a5,s7,a5

00001820 <.LVL46>:
    1820:	fc9ff06f          	j	17e8 <.L15>

00001824 <.L10>:
    1824:	01746f33          	or	t5,s0,s7
    1828:	020f0263          	beqz	t5,184c <.L74>
    182c:	000b8f13          	mv	t5,s7

00001830 <.LBB21>:
    1830:	7ff00693          	li	a3,2047

00001834 <.LBE21>:
    1834:	00300593          	li	a1,3
    1838:	ea5ff06f          	j	16dc <.L11>

0000183c <.L73>:
    183c:	00000413          	li	s0,0

00001840 <.LVL48>:
    1840:	00000693          	li	a3,0

00001844 <.LBE22>:
    1844:	00100593          	li	a1,1
    1848:	e95ff06f          	j	16dc <.L11>

0000184c <.L74>:
    184c:	00000413          	li	s0,0

00001850 <.LVL50>:
    1850:	7ff00693          	li	a3,2047

00001854 <.LBE23>:
    1854:	00200593          	li	a1,2
    1858:	e85ff06f          	j	16dc <.L11>

0000185c <.L19>:
  FP_UNPACK_D (A, a);
    185c:	00098713          	mv	a4,s3

00001860 <.LVL52>:
    1860:	000a0413          	mv	s0,s4

00001864 <.LVL53>:
    1864:	00048f13          	mv	t5,s1

00001868 <.L23>:
  FP_PACK_D (r, R);
    1868:	00200793          	li	a5,2
    186c:	46fb0263          	beq	s6,a5,1cd0 <.L88>
    1870:	00300793          	li	a5,3
    1874:	44fb0463          	beq	s6,a5,1cbc <.L86>
    1878:	00100793          	li	a5,1
    187c:	2cfb1263          	bne	s6,a5,1b40 <.L44>

00001880 <.L90>:
    1880:	00000413          	li	s0,0
    1884:	00000693          	li	a3,0
    1888:	3f80006f          	j	1c80 <.L105>

0000188c <.L16>:
  FP_DIV_D (R, A, B);
    188c:	01446663          	bltu	s0,s4,1898 <.L24>
    1890:	348a1e63          	bne	s4,s0,1bec <.L25>
    1894:	35e4ec63          	bltu	s1,t5,1bec <.L25>

00001898 <.L24>:
    1898:	01fa1693          	slli	a3,s4,0x1f
    189c:	0014d793          	srli	a5,s1,0x1

000018a0 <.LVL58>:
    18a0:	01f49313          	slli	t1,s1,0x1f

000018a4 <.LVL59>:
    18a4:	001a5a13          	srli	s4,s4,0x1

000018a8 <.LVL60>:
    18a8:	00f6e4b3          	or	s1,a3,a5

000018ac <.L26>:
    18ac:	00841413          	slli	s0,s0,0x8

000018b0 <.LBB32>:
    18b0:	01045893          	srli	a7,s0,0x10
    18b4:	031a5eb3          	divu	t4,s4,a7

000018b8 <.LBE32>:
    18b8:	018f5593          	srli	a1,t5,0x18

000018bc <.LVL63>:
    18bc:	0085e5b3          	or	a1,a1,s0

000018c0 <.LBB34>:
    18c0:	01059813          	slli	a6,a1,0x10
    18c4:	01085813          	srli	a6,a6,0x10
    18c8:	0104d793          	srli	a5,s1,0x10

000018cc <.LBE34>:
    18cc:	008f1513          	slli	a0,t5,0x8

000018d0 <.LBB36>:
    18d0:	031a76b3          	remu	a3,s4,a7

000018d4 <.LVL66>:
    18d4:	03d80e33          	mul	t3,a6,t4

000018d8 <.LVL67>:
    18d8:	01069693          	slli	a3,a3,0x10

000018dc <.LVL68>:
    18dc:	00d7e7b3          	or	a5,a5,a3

000018e0 <.LVL69>:
    18e0:	000e8693          	mv	a3,t4
    18e4:	01c7fe63          	bgeu	a5,t3,1900 <.L27>
    18e8:	00f587b3          	add	a5,a1,a5

000018ec <.LVL70>:
    18ec:	fffe8693          	addi	a3,t4,-1

000018f0 <.LVL71>:
    18f0:	00b7e863          	bltu	a5,a1,1900 <.L27>
    18f4:	01c7f663          	bgeu	a5,t3,1900 <.L27>
    18f8:	ffee8693          	addi	a3,t4,-2
    18fc:	00b787b3          	add	a5,a5,a1

00001900 <.L27>:
    1900:	41c787b3          	sub	a5,a5,t3

00001904 <.LVL74>:
    1904:	0317deb3          	divu	t4,a5,a7

00001908 <.LVL75>:
    1908:	01049493          	slli	s1,s1,0x10

0000190c <.LVL76>:
    190c:	0104d493          	srli	s1,s1,0x10
    1910:	0317f7b3          	remu	a5,a5,a7

00001914 <.LVL77>:
    1914:	03d80e33          	mul	t3,a6,t4
    1918:	01079793          	slli	a5,a5,0x10

0000191c <.LVL79>:
    191c:	00f4e4b3          	or	s1,s1,a5

00001920 <.LVL80>:
    1920:	000e8793          	mv	a5,t4
    1924:	01c4fe63          	bgeu	s1,t3,1940 <.L30>
    1928:	009584b3          	add	s1,a1,s1

0000192c <.LVL81>:
    192c:	fffe8793          	addi	a5,t4,-1

00001930 <.LVL82>:
    1930:	00b4e863          	bltu	s1,a1,1940 <.L30>
    1934:	01c4f663          	bgeu	s1,t3,1940 <.L30>
    1938:	ffee8793          	addi	a5,t4,-2
    193c:	00b484b3          	add	s1,s1,a1

00001940 <.L30>:
    1940:	01069693          	slli	a3,a3,0x10

00001944 <.LVL85>:
    1944:	000103b7          	lui	t2,0x10
    1948:	00f6efb3          	or	t6,a3,a5
    194c:	41c484b3          	sub	s1,s1,t3

00001950 <.LBB37>:
    1950:	fff38e13          	addi	t3,t2,-1 # ffff <_ebss+0x1af>

00001954 <.LVL87>:
    1954:	01cff7b3          	and	a5,t6,t3

00001958 <.LVL88>:
    1958:	010fdf13          	srli	t5,t6,0x10

0000195c <.LVL89>:
    195c:	01055e93          	srli	t4,a0,0x10

00001960 <.LVL90>:
    1960:	01c57e33          	and	t3,a0,t3
    1964:	02fe02b3          	mul	t0,t3,a5

00001968 <.LVL91>:
    1968:	03cf0433          	mul	s0,t5,t3

0000196c <.LVL92>:
    196c:	0102d693          	srli	a3,t0,0x10
    1970:	02fe87b3          	mul	a5,t4,a5

00001974 <.LVL93>:
    1974:	008787b3          	add	a5,a5,s0

00001978 <.LVL94>:
    1978:	00f686b3          	add	a3,a3,a5
    197c:	03df0f33          	mul	t5,t5,t4

00001980 <.LVL95>:
    1980:	0086f463          	bgeu	a3,s0,1988 <.L33>
    1984:	007f0f33          	add	t5,t5,t2

00001988 <.L33>:
    1988:	0106d793          	srli	a5,a3,0x10
    198c:	01e787b3          	add	a5,a5,t5

00001990 <.LVL97>:
    1990:	00010f37          	lui	t5,0x10

00001994 <.LVL98>:
    1994:	ffff0f13          	addi	t5,t5,-1 # ffff <_ebss+0x1af>
    1998:	01e6f6b3          	and	a3,a3,t5

0000199c <.LVL99>:
    199c:	01069693          	slli	a3,a3,0x10
    19a0:	01e2f2b3          	and	t0,t0,t5

000019a4 <.LVL100>:
    19a4:	005686b3          	add	a3,a3,t0

000019a8 <.LBE37>:
    19a8:	00f4e863          	bltu	s1,a5,19b8 <.L34>

000019ac <.LBB38>:
    19ac:	000f8413          	mv	s0,t6

000019b0 <.LBE38>:
    19b0:	04f49863          	bne	s1,a5,1a00 <.L35>

000019b4 <.LVL103>:
    19b4:	04d37663          	bgeu	t1,a3,1a00 <.L35>

000019b8 <.L34>:
    19b8:	00a30f33          	add	t5,t1,a0

000019bc <.LVL105>:
    19bc:	006f32b3          	sltu	t0,t5,t1

000019c0 <.LBB39>:
    19c0:	00b283b3          	add	t2,t0,a1

000019c4 <.LVL106>:
    19c4:	007484b3          	add	s1,s1,t2

000019c8 <.LBE39>:
    19c8:	ffff8413          	addi	s0,t6,-1

000019cc <.LBB40>:
    19cc:	000f0313          	mv	t1,t5

000019d0 <.LBE40>:
    19d0:	0095e663          	bltu	a1,s1,19dc <.L38>
    19d4:	02959663          	bne	a1,s1,1a00 <.L35>
    19d8:	02029463          	bnez	t0,1a00 <.L35>

000019dc <.L38>:
    19dc:	00f4e663          	bltu	s1,a5,19e8 <.L39>
    19e0:	02979063          	bne	a5,s1,1a00 <.L35>
    19e4:	00df7e63          	bgeu	t5,a3,1a00 <.L35>

000019e8 <.L39>:
    19e8:	01e50f33          	add	t5,a0,t5

000019ec <.LBB41>:
    19ec:	000f0313          	mv	t1,t5

000019f0 <.LVL110>:
    19f0:	00af3f33          	sltu	t5,t5,a0
    19f4:	00bf0f33          	add	t5,t5,a1

000019f8 <.LBE41>:
    19f8:	ffef8413          	addi	s0,t6,-2

000019fc <.LBB42>:
    19fc:	01e484b3          	add	s1,s1,t5

00001a00 <.L35>:
    1a00:	40d306b3          	sub	a3,t1,a3

00001a04 <.LVL113>:
    1a04:	40f484b3          	sub	s1,s1,a5

00001a08 <.LVL114>:
    1a08:	00d33333          	sltu	t1,t1,a3

00001a0c <.LVL115>:
    1a0c:	406484b3          	sub	s1,s1,t1

00001a10 <.LBE43>:
    1a10:	fff00f13          	li	t5,-1
    1a14:	12958663          	beq	a1,s1,1b40 <.L44>

00001a18 <.LBB44>:
    1a18:	0314dfb3          	divu	t6,s1,a7

00001a1c <.LVL118>:
    1a1c:	0106d793          	srli	a5,a3,0x10

00001a20 <.LVL119>:
    1a20:	0314f4b3          	remu	s1,s1,a7

00001a24 <.LVL120>:
    1a24:	000f8313          	mv	t1,t6
    1a28:	03f80f33          	mul	t5,a6,t6

00001a2c <.LVL121>:
    1a2c:	01049493          	slli	s1,s1,0x10

00001a30 <.LVL122>:
    1a30:	0097e7b3          	or	a5,a5,s1

00001a34 <.LVL123>:
    1a34:	01e7fe63          	bgeu	a5,t5,1a50 <.L45>
    1a38:	00f587b3          	add	a5,a1,a5

00001a3c <.LVL124>:
    1a3c:	ffff8313          	addi	t1,t6,-1

00001a40 <.LVL125>:
    1a40:	00b7e863          	bltu	a5,a1,1a50 <.L45>
    1a44:	01e7f663          	bgeu	a5,t5,1a50 <.L45>
    1a48:	ffef8313          	addi	t1,t6,-2
    1a4c:	00b787b3          	add	a5,a5,a1

00001a50 <.L45>:
    1a50:	41e787b3          	sub	a5,a5,t5

00001a54 <.LVL128>:
    1a54:	0317df33          	divu	t5,a5,a7

00001a58 <.LVL129>:
    1a58:	01069693          	slli	a3,a3,0x10

00001a5c <.LVL130>:
    1a5c:	0106d693          	srli	a3,a3,0x10
    1a60:	0317f7b3          	remu	a5,a5,a7

00001a64 <.LVL131>:
    1a64:	03e80833          	mul	a6,a6,t5

00001a68 <.LVL132>:
    1a68:	01079793          	slli	a5,a5,0x10

00001a6c <.LVL133>:
    1a6c:	00f6e7b3          	or	a5,a3,a5

00001a70 <.LVL134>:
    1a70:	000f0693          	mv	a3,t5
    1a74:	0107fe63          	bgeu	a5,a6,1a90 <.L48>
    1a78:	00f587b3          	add	a5,a1,a5

00001a7c <.LVL135>:
    1a7c:	ffff0693          	addi	a3,t5,-1

00001a80 <.LVL136>:
    1a80:	00b7e863          	bltu	a5,a1,1a90 <.L48>
    1a84:	0107f663          	bgeu	a5,a6,1a90 <.L48>
    1a88:	ffef0693          	addi	a3,t5,-2
    1a8c:	00b787b3          	add	a5,a5,a1

00001a90 <.L48>:
    1a90:	01031313          	slli	t1,t1,0x10

00001a94 <.LVL139>:
    1a94:	00d36333          	or	t1,t1,a3
    1a98:	01031693          	slli	a3,t1,0x10

00001a9c <.LVL140>:
    1a9c:	0106d693          	srli	a3,a3,0x10

00001aa0 <.LBB45>:
    1aa0:	01035893          	srli	a7,t1,0x10

00001aa4 <.LVL141>:
    1aa4:	03c68f33          	mul	t5,a3,t3

00001aa8 <.LBB46>:
    1aa8:	410787b3          	sub	a5,a5,a6

00001aac <.LBB47>:
    1aac:	03c88e33          	mul	t3,a7,t3

00001ab0 <.LVL143>:
    1ab0:	031e88b3          	mul	a7,t4,a7

00001ab4 <.LVL144>:
    1ab4:	02de8eb3          	mul	t4,t4,a3

00001ab8 <.LVL145>:
    1ab8:	010f5693          	srli	a3,t5,0x10
    1abc:	01ce8eb3          	add	t4,t4,t3

00001ac0 <.LVL146>:
    1ac0:	01d686b3          	add	a3,a3,t4

00001ac4 <.LVL147>:
    1ac4:	01c6f663          	bgeu	a3,t3,1ad0 <.L51>
    1ac8:	00010837          	lui	a6,0x10

00001acc <.LVL148>:
    1acc:	010888b3          	add	a7,a7,a6

00001ad0 <.L51>:
    1ad0:	0106d813          	srli	a6,a3,0x10
    1ad4:	01180833          	add	a6,a6,a7

00001ad8 <.LVL150>:
    1ad8:	000108b7          	lui	a7,0x10

00001adc <.LVL151>:
    1adc:	fff88893          	addi	a7,a7,-1 # ffff <_ebss+0x1af>
    1ae0:	0116f6b3          	and	a3,a3,a7

00001ae4 <.LVL152>:
    1ae4:	01069693          	slli	a3,a3,0x10
    1ae8:	011f7f33          	and	t5,t5,a7

00001aec <.LVL153>:
    1aec:	01e686b3          	add	a3,a3,t5

00001af0 <.LBE47>:
    1af0:	0107e863          	bltu	a5,a6,1b00 <.L52>

00001af4 <.LBB48>:
    1af4:	00030f13          	mv	t5,t1

00001af8 <.LBE48>:
    1af8:	05079263          	bne	a5,a6,1b3c <.L53>
    1afc:	04068263          	beqz	a3,1b40 <.L44>

00001b00 <.L52>:
    1b00:	00f587b3          	add	a5,a1,a5

00001b04 <.LVL155>:
    1b04:	fff30f13          	addi	t5,t1,-1

00001b08 <.LBB49>:
    1b08:	00078893          	mv	a7,a5

00001b0c <.LBE49>:
    1b0c:	02b7e463          	bltu	a5,a1,1b34 <.L56>
    1b10:	0107e663          	bltu	a5,a6,1b1c <.L57>
    1b14:	03079463          	bne	a5,a6,1b3c <.L53>
    1b18:	02d57063          	bgeu	a0,a3,1b38 <.L58>

00001b1c <.L57>:
    1b1c:	ffe30f13          	addi	t5,t1,-2

00001b20 <.LBB50>:
    1b20:	00151313          	slli	t1,a0,0x1

00001b24 <.LVL159>:
    1b24:	00a338b3          	sltu	a7,t1,a0
    1b28:	00b888b3          	add	a7,a7,a1
    1b2c:	011788b3          	add	a7,a5,a7

00001b30 <.LVL160>:
    1b30:	00030513          	mv	a0,t1

00001b34 <.L56>:
    1b34:	01089463          	bne	a7,a6,1b3c <.L53>

00001b38 <.L58>:
    1b38:	00a68463          	beq	a3,a0,1b40 <.L44>

00001b3c <.L53>:
    1b3c:	001f6f13          	ori	t5,t5,1

00001b40 <.L44>:
  FP_PACK_D (r, R);
    1b40:	3ff60793          	addi	a5,a2,1023

00001b44 <.LVL165>:
    1b44:	0cf05063          	blez	a5,1c04 <.L59>
    1b48:	007f7693          	andi	a3,t5,7
    1b4c:	02068063          	beqz	a3,1b6c <.L60>
    1b50:	00ff7693          	andi	a3,t5,15
    1b54:	00400593          	li	a1,4
    1b58:	00b68a63          	beq	a3,a1,1b6c <.L60>

00001b5c <.LBB51>:
    1b5c:	004f0693          	addi	a3,t5,4
    1b60:	01e6b5b3          	sltu	a1,a3,t5
    1b64:	00b40433          	add	s0,s0,a1
    1b68:	00068f13          	mv	t5,a3

00001b6c <.L60>:
    1b6c:	010006b7          	lui	a3,0x1000
    1b70:	00d476b3          	and	a3,s0,a3
    1b74:	00068a63          	beqz	a3,1b88 <.L63>
    1b78:	ff0007b7          	lui	a5,0xff000

00001b7c <.LVL167>:
    1b7c:	fff78793          	addi	a5,a5,-1 # feffffff <_ebss+0xfeff01af>
    1b80:	00f47433          	and	s0,s0,a5
    1b84:	40060793          	addi	a5,a2,1024

00001b88 <.L63>:
    1b88:	7fe00693          	li	a3,2046
    1b8c:	14f6c263          	blt	a3,a5,1cd0 <.L88>
    1b90:	01d41693          	slli	a3,s0,0x1d

00001b94 <.LVL170>:
    1b94:	003f5f13          	srli	t5,t5,0x3

00001b98 <.LVL171>:
    1b98:	01e6e6b3          	or	a3,a3,t5

00001b9c <.LVL172>:
    1b9c:	00345413          	srli	s0,s0,0x3

00001ba0 <.L17>:
    1ba0:	00c41413          	slli	s0,s0,0xc

00001ba4 <.LVL174>:
    1ba4:	00c45413          	srli	s0,s0,0xc
    1ba8:	01479793          	slli	a5,a5,0x14

00001bac <.LBE54>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    1bac:	02c12083          	lw	ra,44(sp)

00001bb0 <.LBB55>:
  FP_PACK_D (r, R);
    1bb0:	0087e7b3          	or	a5,a5,s0

00001bb4 <.LBE55>:
}
    1bb4:	02812403          	lw	s0,40(sp)

00001bb8 <.LBB56>:
  FP_PACK_D (r, R);
    1bb8:	01f71713          	slli	a4,a4,0x1f

00001bbc <.LVL176>:
    1bbc:	00e7e633          	or	a2,a5,a4

00001bc0 <.LBE56>:
}
    1bc0:	02412483          	lw	s1,36(sp)
    1bc4:	02012903          	lw	s2,32(sp)

00001bc8 <.LVL178>:
    1bc8:	01c12983          	lw	s3,28(sp)

00001bcc <.LVL179>:
    1bcc:	01812a03          	lw	s4,24(sp)
    1bd0:	01412a83          	lw	s5,20(sp)

00001bd4 <.LVL180>:
    1bd4:	01012b03          	lw	s6,16(sp)
    1bd8:	00c12b83          	lw	s7,12(sp)
    1bdc:	00068513          	mv	a0,a3
    1be0:	00060593          	mv	a1,a2
    1be4:	03010113          	addi	sp,sp,48
    1be8:	00008067          	ret

00001bec <.L25>:
  FP_DIV_D (R, A, B);
    1bec:	fff60613          	addi	a2,a2,-1

00001bf0 <.LVL182>:
    1bf0:	00000313          	li	t1,0
    1bf4:	cb9ff06f          	j	18ac <.L26>

00001bf8 <.L20>:
  FP_UNPACK_D (B, b);
    1bf8:	00090713          	mv	a4,s2

00001bfc <.LBE58>:
  FP_DIV_D (R, A, B);
    1bfc:	00058b13          	mv	s6,a1

00001c00 <.LVL185>:
    1c00:	c69ff06f          	j	1868 <.L23>

00001c04 <.L59>:
  FP_PACK_D (r, R);
    1c04:	00100593          	li	a1,1
    1c08:	00078c63          	beqz	a5,1c20 <.L64>
    1c0c:	40f585b3          	sub	a1,a1,a5

00001c10 <.LVL187>:
    1c10:	03800693          	li	a3,56
    1c14:	c6b6c6e3          	blt	a3,a1,1880 <.L90>
    1c18:	01f00693          	li	a3,31
    1c1c:	06b6c663          	blt	a3,a1,1c88 <.L65>

00001c20 <.L64>:
    1c20:	41e60613          	addi	a2,a2,1054
    1c24:	00bf57b3          	srl	a5,t5,a1
    1c28:	00cf1f33          	sll	t5,t5,a2
    1c2c:	01e03f33          	snez	t5,t5
    1c30:	00c41633          	sll	a2,s0,a2
    1c34:	00cf6f33          	or	t5,t5,a2
    1c38:	01e7e7b3          	or	a5,a5,t5

00001c3c <.LVL189>:
    1c3c:	00b45433          	srl	s0,s0,a1

00001c40 <.L66>:
    1c40:	0077f693          	andi	a3,a5,7
    1c44:	02068063          	beqz	a3,1c64 <.L68>
    1c48:	00f7f693          	andi	a3,a5,15
    1c4c:	00400613          	li	a2,4
    1c50:	00c68a63          	beq	a3,a2,1c64 <.L68>

00001c54 <.LBB27>:
    1c54:	00478693          	addi	a3,a5,4
    1c58:	00f6b633          	sltu	a2,a3,a5
    1c5c:	00c40433          	add	s0,s0,a2

00001c60 <.LVL191>:
    1c60:	00068793          	mv	a5,a3

00001c64 <.L68>:
    1c64:	008006b7          	lui	a3,0x800
    1c68:	00d476b3          	and	a3,s0,a3
    1c6c:	06069a63          	bnez	a3,1ce0 <.L92>

00001c70 <.LVL193>:
    1c70:	01d41693          	slli	a3,s0,0x1d
    1c74:	0037d793          	srli	a5,a5,0x3

00001c78 <.LVL194>:
    1c78:	00f6e6b3          	or	a3,a3,a5

00001c7c <.LVL195>:
    1c7c:	00345413          	srli	s0,s0,0x3

00001c80 <.L105>:
    1c80:	00000793          	li	a5,0
    1c84:	f1dff06f          	j	1ba0 <.L17>

00001c88 <.L65>:
    1c88:	fe100693          	li	a3,-31
    1c8c:	40f687b3          	sub	a5,a3,a5
    1c90:	02000513          	li	a0,32
    1c94:	00f457b3          	srl	a5,s0,a5
    1c98:	00000693          	li	a3,0
    1c9c:	00a58663          	beq	a1,a0,1ca8 <.L67>
    1ca0:	43e60613          	addi	a2,a2,1086
    1ca4:	00c416b3          	sll	a3,s0,a2

00001ca8 <.L67>:
    1ca8:	01e6e6b3          	or	a3,a3,t5
    1cac:	00d036b3          	snez	a3,a3
    1cb0:	00d7e7b3          	or	a5,a5,a3

00001cb4 <.LVL198>:
    1cb4:	00000413          	li	s0,0
    1cb8:	f89ff06f          	j	1c40 <.L66>

00001cbc <.L86>:
    1cbc:	00080437          	lui	s0,0x80
    1cc0:	00000693          	li	a3,0
    1cc4:	7ff00793          	li	a5,2047
    1cc8:	00000713          	li	a4,0

00001ccc <.LVL200>:
    1ccc:	ed5ff06f          	j	1ba0 <.L17>

00001cd0 <.L88>:
    1cd0:	00000413          	li	s0,0
    1cd4:	00000693          	li	a3,0
    1cd8:	7ff00793          	li	a5,2047
    1cdc:	ec5ff06f          	j	1ba0 <.L17>

00001ce0 <.L92>:
    1ce0:	00000413          	li	s0,0

00001ce4 <.LVL203>:
    1ce4:	00000693          	li	a3,0
    1ce8:	00100793          	li	a5,1

00001cec <.LVL204>:
    1cec:	eb5ff06f          	j	1ba0 <.L17>

00001cf0 <__gedf2>:
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
  FP_UNPACK_RAW_D (B, b);
    1cf0:	0146d793          	srli	a5,a3,0x14

00001cf4 <.LBB4>:
  FP_UNPACK_RAW_D (A, a);
    1cf4:	0145d313          	srli	t1,a1,0x14
    1cf8:	00100737          	lui	a4,0x100
    1cfc:	fff70713          	addi	a4,a4,-1 # fffff <_ebss+0xf01af>

00001d00 <.LBE4>:
{
    1d00:	00050813          	mv	a6,a0
    1d04:	00050e13          	mv	t3,a0

00001d08 <.LBB5>:
  FP_UNPACK_RAW_D (A, a);
    1d08:	7ff37313          	andi	t1,t1,2047

00001d0c <.LBB6>:
  FP_UNPACK_RAW_D (B, b);
    1d0c:	7ff7f513          	andi	a0,a5,2047

00001d10 <.LBE6>:
  FP_CMP_D (r, A, B, -2, 2);
    1d10:	7ff00793          	li	a5,2047

00001d14 <.LBB7>:
  FP_UNPACK_RAW_D (A, a);
    1d14:	00b778b3          	and	a7,a4,a1

00001d18 <.LVL3>:
    1d18:	00060e93          	mv	t4,a2

00001d1c <.LBB8>:
  FP_UNPACK_RAW_D (B, b);
    1d1c:	00d77733          	and	a4,a4,a3

00001d20 <.LBB9>:
  FP_UNPACK_RAW_D (A, a);
    1d20:	01f5d593          	srli	a1,a1,0x1f

00001d24 <.LBB10>:
  FP_UNPACK_RAW_D (B, b);
    1d24:	01f6d693          	srli	a3,a3,0x1f

00001d28 <.LBE10>:
  FP_CMP_D (r, A, B, -2, 2);
    1d28:	02f31c63          	bne	t1,a5,1d60 <.L2>
    1d2c:	0108e8b3          	or	a7,a7,a6

00001d30 <.LVL6>:
    1d30:	0c089463          	bnez	a7,1df8 <.L24>
    1d34:	00650a63          	beq	a0,t1,1d48 <.L4>

00001d38 <.L20>:
    1d38:	00100513          	li	a0,1
    1d3c:	0a058c63          	beqz	a1,1df4 <.L1>
    1d40:	fff00513          	li	a0,-1
    1d44:	00008067          	ret

00001d48 <.L4>:
    1d48:	00c76733          	or	a4,a4,a2

00001d4c <.LVL9>:
    1d4c:	ffe00513          	li	a0,-2

00001d50 <.LVL10>:
    1d50:	0a071263          	bnez	a4,1df4 <.L1>

00001d54 <.LBB12>:
    1d54:	fed592e3          	bne	a1,a3,1d38 <.L20>
    1d58:	00000513          	li	a0,0
    1d5c:	00008067          	ret

00001d60 <.L2>:
    1d60:	04f51063          	bne	a0,a5,1da0 <.L8>
    1d64:	00c76733          	or	a4,a4,a2

00001d68 <.LVL12>:
    1d68:	ffe00513          	li	a0,-2

00001d6c <.LVL13>:
    1d6c:	08071463          	bnez	a4,1df4 <.L1>

00001d70 <.LBB13>:
    1d70:	00030c63          	beqz	t1,1d88 <.L9>

00001d74 <.L60>:
    1d74:	fcd592e3          	bne	a1,a3,1d38 <.L20>

00001d78 <.L21>:
    1d78:	fff00513          	li	a0,-1
    1d7c:	06058c63          	beqz	a1,1df4 <.L1>
    1d80:	00058513          	mv	a0,a1
    1d84:	00008067          	ret

00001d88 <.L9>:
    1d88:	0108e8b3          	or	a7,a7,a6

00001d8c <.LVL17>:
    1d8c:	fe0894e3          	bnez	a7,1d74 <.L60>

00001d90 <.L11>:
    1d90:	fff00513          	li	a0,-1
    1d94:	06068063          	beqz	a3,1df4 <.L1>
    1d98:	00068513          	mv	a0,a3
    1d9c:	00008067          	ret

00001da0 <.L8>:
    1da0:	02030663          	beqz	t1,1dcc <.L12>

00001da4 <.LVL20>:
    1da4:	f8050ae3          	beqz	a0,1d38 <.L20>

00001da8 <.LVL21>:
    1da8:	f8d598e3          	bne	a1,a3,1d38 <.L20>
    1dac:	f86546e3          	blt	a0,t1,1d38 <.L20>
    1db0:	fca344e3          	blt	t1,a0,1d78 <.L21>

00001db4 <.L19>:
    1db4:	f91762e3          	bltu	a4,a7,1d38 <.L20>
    1db8:	fce890e3          	bne	a7,a4,1d78 <.L21>
    1dbc:	f7ceeee3          	bltu	t4,t3,1d38 <.L20>
    1dc0:	00000513          	li	a0,0

00001dc4 <.LVL23>:
    1dc4:	03de7863          	bgeu	t3,t4,1df4 <.L1>
    1dc8:	fb1ff06f          	j	1d78 <.L21>

00001dcc <.L12>:
    1dcc:	0108e833          	or	a6,a7,a6

00001dd0 <.LVL25>:
    1dd0:	00050663          	beqz	a0,1ddc <.L14>

00001dd4 <.LVL26>:
    1dd4:	fa080ee3          	beqz	a6,1d90 <.L11>
    1dd8:	f9dff06f          	j	1d74 <.L60>

00001ddc <.L14>:
    1ddc:	00c76633          	or	a2,a4,a2

00001de0 <.LVL28>:
    1de0:	00060863          	beqz	a2,1df0 <.L15>

00001de4 <.LVL29>:
    1de4:	fa0806e3          	beqz	a6,1d90 <.L11>

00001de8 <.LVL30>:
    1de8:	fcd586e3          	beq	a1,a3,1db4 <.L19>
    1dec:	f4dff06f          	j	1d38 <.L20>

00001df0 <.L15>:
    1df0:	f40814e3          	bnez	a6,1d38 <.L20>

00001df4 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    1df4:	00008067          	ret

00001df8 <.L24>:
  FP_CMP_D (r, A, B, -2, 2);
    1df8:	ffe00513          	li	a0,-2

00001dfc <.LVL34>:
    1dfc:	00008067          	ret

00001e00 <__ledf2>:
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
  FP_UNPACK_RAW_D (B, b);
    1e00:	0146d793          	srli	a5,a3,0x14

00001e04 <.LBB4>:
  FP_UNPACK_RAW_D (A, a);
    1e04:	0145d313          	srli	t1,a1,0x14
    1e08:	00100737          	lui	a4,0x100
    1e0c:	fff70713          	addi	a4,a4,-1 # fffff <_ebss+0xf01af>

00001e10 <.LBE4>:
{
    1e10:	00050813          	mv	a6,a0
    1e14:	00050e13          	mv	t3,a0

00001e18 <.LBB5>:
  FP_UNPACK_RAW_D (A, a);
    1e18:	7ff37313          	andi	t1,t1,2047

00001e1c <.LBB6>:
  FP_UNPACK_RAW_D (B, b);
    1e1c:	7ff7f513          	andi	a0,a5,2047

00001e20 <.LBE6>:
  FP_CMP_D (r, A, B, 2, 2);
    1e20:	7ff00793          	li	a5,2047

00001e24 <.LBB7>:
  FP_UNPACK_RAW_D (A, a);
    1e24:	00b778b3          	and	a7,a4,a1

00001e28 <.LVL3>:
    1e28:	00060e93          	mv	t4,a2

00001e2c <.LBB8>:
  FP_UNPACK_RAW_D (B, b);
    1e2c:	00d77733          	and	a4,a4,a3

00001e30 <.LBB9>:
  FP_UNPACK_RAW_D (A, a);
    1e30:	01f5d593          	srli	a1,a1,0x1f

00001e34 <.LBB10>:
  FP_UNPACK_RAW_D (B, b);
    1e34:	01f6d693          	srli	a3,a3,0x1f

00001e38 <.LBE10>:
  FP_CMP_D (r, A, B, 2, 2);
    1e38:	02f31c63          	bne	t1,a5,1e70 <.L2>
    1e3c:	0108e8b3          	or	a7,a7,a6

00001e40 <.LVL6>:
    1e40:	0c089463          	bnez	a7,1f08 <.L24>
    1e44:	00650a63          	beq	a0,t1,1e58 <.L4>

00001e48 <.L20>:
    1e48:	00100513          	li	a0,1
    1e4c:	0a058c63          	beqz	a1,1f04 <.L1>
    1e50:	fff00513          	li	a0,-1
    1e54:	00008067          	ret

00001e58 <.L4>:
    1e58:	00c76733          	or	a4,a4,a2

00001e5c <.LVL9>:
    1e5c:	00200513          	li	a0,2

00001e60 <.LVL10>:
    1e60:	0a071263          	bnez	a4,1f04 <.L1>

00001e64 <.LBB12>:
    1e64:	fed592e3          	bne	a1,a3,1e48 <.L20>
    1e68:	00000513          	li	a0,0
    1e6c:	00008067          	ret

00001e70 <.L2>:
    1e70:	04f51063          	bne	a0,a5,1eb0 <.L8>
    1e74:	00c76733          	or	a4,a4,a2

00001e78 <.LVL12>:
    1e78:	00200513          	li	a0,2

00001e7c <.LVL13>:
    1e7c:	08071463          	bnez	a4,1f04 <.L1>

00001e80 <.LBB13>:
    1e80:	00030c63          	beqz	t1,1e98 <.L9>

00001e84 <.L60>:
    1e84:	fcd592e3          	bne	a1,a3,1e48 <.L20>

00001e88 <.L21>:
    1e88:	fff00513          	li	a0,-1
    1e8c:	06058c63          	beqz	a1,1f04 <.L1>
    1e90:	00058513          	mv	a0,a1
    1e94:	00008067          	ret

00001e98 <.L9>:
    1e98:	0108e8b3          	or	a7,a7,a6

00001e9c <.LVL17>:
    1e9c:	fe0894e3          	bnez	a7,1e84 <.L60>

00001ea0 <.L11>:
    1ea0:	fff00513          	li	a0,-1
    1ea4:	06068063          	beqz	a3,1f04 <.L1>
    1ea8:	00068513          	mv	a0,a3
    1eac:	00008067          	ret

00001eb0 <.L8>:
    1eb0:	02030663          	beqz	t1,1edc <.L12>

00001eb4 <.LVL20>:
    1eb4:	f8050ae3          	beqz	a0,1e48 <.L20>

00001eb8 <.LVL21>:
    1eb8:	f8d598e3          	bne	a1,a3,1e48 <.L20>
    1ebc:	f86546e3          	blt	a0,t1,1e48 <.L20>
    1ec0:	fca344e3          	blt	t1,a0,1e88 <.L21>

00001ec4 <.L19>:
    1ec4:	f91762e3          	bltu	a4,a7,1e48 <.L20>
    1ec8:	fce890e3          	bne	a7,a4,1e88 <.L21>
    1ecc:	f7ceeee3          	bltu	t4,t3,1e48 <.L20>
    1ed0:	00000513          	li	a0,0

00001ed4 <.LVL23>:
    1ed4:	03de7863          	bgeu	t3,t4,1f04 <.L1>
    1ed8:	fb1ff06f          	j	1e88 <.L21>

00001edc <.L12>:
    1edc:	0108e833          	or	a6,a7,a6

00001ee0 <.LVL25>:
    1ee0:	00050663          	beqz	a0,1eec <.L14>

00001ee4 <.LVL26>:
    1ee4:	fa080ee3          	beqz	a6,1ea0 <.L11>
    1ee8:	f9dff06f          	j	1e84 <.L60>

00001eec <.L14>:
    1eec:	00c76633          	or	a2,a4,a2

00001ef0 <.LVL28>:
    1ef0:	00060863          	beqz	a2,1f00 <.L15>

00001ef4 <.LVL29>:
    1ef4:	fa0806e3          	beqz	a6,1ea0 <.L11>

00001ef8 <.LVL30>:
    1ef8:	fcd586e3          	beq	a1,a3,1ec4 <.L19>
    1efc:	f4dff06f          	j	1e48 <.L20>

00001f00 <.L15>:
    1f00:	f40814e3          	bnez	a6,1e48 <.L20>

00001f04 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    1f04:	00008067          	ret

00001f08 <.L24>:
  FP_CMP_D (r, A, B, 2, 2);
    1f08:	00200513          	li	a0,2

00001f0c <.LVL34>:
    1f0c:	00008067          	ret

00001f10 <__fixunsdfsi>:
  FP_DECL_EX;
  FP_DECL_D (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    1f10:	0145d713          	srli	a4,a1,0x14
    1f14:	00100637          	lui	a2,0x100

00001f18 <.LBE2>:
{
    1f18:	00050693          	mv	a3,a0

00001f1c <.LBB3>:
  FP_UNPACK_RAW_D (A, a);
    1f1c:	fff60793          	addi	a5,a2,-1 # fffff <_ebss+0xf01af>
    1f20:	7ff77713          	andi	a4,a4,2047

00001f24 <.LBE3>:
  FP_TO_INT_D (r, A, SI_BITS, 0);
    1f24:	3fe00513          	li	a0,1022

00001f28 <.LBB4>:
  FP_UNPACK_RAW_D (A, a);
    1f28:	00b7f7b3          	and	a5,a5,a1

00001f2c <.LVL3>:
    1f2c:	01f5d593          	srli	a1,a1,0x1f

00001f30 <.LBE4>:
  FP_TO_INT_D (r, A, SI_BITS, 0);
    1f30:	04e55863          	bge	a0,a4,1f80 <.L4>
    1f34:	00000513          	li	a0,0
    1f38:	04059663          	bnez	a1,1f84 <.L1>
    1f3c:	41e00593          	li	a1,1054

00001f40 <.LVL5>:
    1f40:	fff00513          	li	a0,-1
    1f44:	04e5c063          	blt	a1,a4,1f84 <.L1>

00001f48 <.LBB5>:
    1f48:	00c7e7b3          	or	a5,a5,a2
    1f4c:	43300613          	li	a2,1075
    1f50:	40e60633          	sub	a2,a2,a4
    1f54:	01f00593          	li	a1,31
    1f58:	00c5cc63          	blt	a1,a2,1f70 <.L3>

00001f5c <.LVL8>:
    1f5c:	bed70713          	addi	a4,a4,-1043

00001f60 <.LVL9>:
    1f60:	00e797b3          	sll	a5,a5,a4

00001f64 <.LVL10>:
    1f64:	00c6d533          	srl	a0,a3,a2
    1f68:	00a7e533          	or	a0,a5,a0

00001f6c <.LVL11>:
    1f6c:	00008067          	ret

00001f70 <.L3>:
    1f70:	41300693          	li	a3,1043
    1f74:	40e68733          	sub	a4,a3,a4

00001f78 <.LVL13>:
    1f78:	00e7d533          	srl	a0,a5,a4

00001f7c <.LVL14>:
    1f7c:	00008067          	ret

00001f80 <.L4>:
    1f80:	00000513          	li	a0,0

00001f84 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    1f84:	00008067          	ret

00001f88 <__floatsidf>:
#include "soft-fp.h"
#include "double.h"

DFtype
__floatsidf (SItype i)
{
    1f88:	ff010113          	addi	sp,sp,-16
    1f8c:	00112623          	sw	ra,12(sp)
    1f90:	00812423          	sw	s0,8(sp)
    1f94:	00912223          	sw	s1,4(sp)

00001f98 <.LBB10>:
  FP_DECL_D (A);
  DFtype a;

  FP_FROM_INT_D (A, i, SI_BITS, USItype);
    1f98:	08050663          	beqz	a0,2024 <.L5>

00001f9c <.LBB3>:
    1f9c:	41f55793          	srai	a5,a0,0x1f
    1fa0:	00a7c433          	xor	s0,a5,a0
    1fa4:	40f40433          	sub	s0,s0,a5
    1fa8:	01f55493          	srli	s1,a0,0x1f

00001fac <.LBB4>:
    1fac:	00040513          	mv	a0,s0

00001fb0 <.LVL3>:
    1fb0:	100000ef          	jal	ra,20b0 <__clzsi2>

00001fb4 <.LVL4>:
    1fb4:	41e00713          	li	a4,1054

00001fb8 <.LBE4>:
    1fb8:	00a00793          	li	a5,10

00001fbc <.LBB5>:
    1fbc:	40a70733          	sub	a4,a4,a0

00001fc0 <.LBE5>:
    1fc0:	04a7c863          	blt	a5,a0,2010 <.L4>
    1fc4:	00b00793          	li	a5,11
    1fc8:	40a787b3          	sub	a5,a5,a0
    1fcc:	01550513          	addi	a0,a0,21

00001fd0 <.LVL6>:
    1fd0:	00f457b3          	srl	a5,s0,a5

00001fd4 <.LVL7>:
    1fd4:	00a41433          	sll	s0,s0,a0

00001fd8 <.LVL8>:
    1fd8:	00048513          	mv	a0,s1

00001fdc <.L2>:
  FP_PACK_RAW_D (a, A);
    1fdc:	00c79793          	slli	a5,a5,0xc

00001fe0 <.LVL10>:
    1fe0:	00c7d793          	srli	a5,a5,0xc
    1fe4:	01471713          	slli	a4,a4,0x14

00001fe8 <.LVL11>:
    1fe8:	01f51513          	slli	a0,a0,0x1f

00001fec <.LVL12>:
    1fec:	00f76733          	or	a4,a4,a5

00001ff0 <.LBE11>:

  return a;
}
    1ff0:	00c12083          	lw	ra,12(sp)

00001ff4 <.LBB12>:
  FP_PACK_RAW_D (a, A);
    1ff4:	00a767b3          	or	a5,a4,a0

00001ff8 <.LBE12>:
}
    1ff8:	00040513          	mv	a0,s0
    1ffc:	00812403          	lw	s0,8(sp)

00002000 <.LVL14>:
    2000:	00412483          	lw	s1,4(sp)
    2004:	00078593          	mv	a1,a5
    2008:	01010113          	addi	sp,sp,16
    200c:	00008067          	ret

00002010 <.L4>:
  FP_FROM_INT_D (A, i, SI_BITS, USItype);
    2010:	ff550513          	addi	a0,a0,-11

00002014 <.LVL16>:
    2014:	00a417b3          	sll	a5,s0,a0

00002018 <.LVL17>:
    2018:	00048513          	mv	a0,s1

0000201c <.L7>:
    201c:	00000413          	li	s0,0
    2020:	fbdff06f          	j	1fdc <.L2>

00002024 <.L5>:
    2024:	00000713          	li	a4,0
    2028:	00000793          	li	a5,0
    202c:	ff1ff06f          	j	201c <.L7>

00002030 <__floatunsidf>:
#include "soft-fp.h"
#include "double.h"

DFtype
__floatunsidf (USItype i)
{
    2030:	ff010113          	addi	sp,sp,-16
    2034:	00812423          	sw	s0,8(sp)
    2038:	00112623          	sw	ra,12(sp)
    203c:	00050413          	mv	s0,a0

00002040 <.LBB10>:
  FP_DECL_D (A);
  DFtype a;

  FP_FROM_INT_D (A, i, SI_BITS, USItype);
    2040:	06050263          	beqz	a0,20a4 <.L4>

00002044 <.LBB3>:
    2044:	06c000ef          	jal	ra,20b0 <__clzsi2>

00002048 <.LVL2>:
    2048:	41e00713          	li	a4,1054

0000204c <.LBE4>:
    204c:	00a00793          	li	a5,10

00002050 <.LBB5>:
    2050:	40a70733          	sub	a4,a4,a0

00002054 <.LBE5>:
    2054:	04a7c063          	blt	a5,a0,2094 <.L3>
    2058:	00b00793          	li	a5,11
    205c:	40a787b3          	sub	a5,a5,a0
    2060:	01550513          	addi	a0,a0,21

00002064 <.LVL4>:
    2064:	00f457b3          	srl	a5,s0,a5

00002068 <.LVL5>:
    2068:	00a41433          	sll	s0,s0,a0

0000206c <.L2>:
  FP_PACK_RAW_D (a, A);

  return a;
}
    206c:	00c12083          	lw	ra,12(sp)
    2070:	00040513          	mv	a0,s0

00002074 <.LBB12>:
  FP_PACK_RAW_D (a, A);
    2074:	00c79793          	slli	a5,a5,0xc

00002078 <.LBE12>:
}
    2078:	00812403          	lw	s0,8(sp)

0000207c <.LBB13>:
  FP_PACK_RAW_D (a, A);
    207c:	01471713          	slli	a4,a4,0x14

00002080 <.LVL9>:
    2080:	00c7d793          	srli	a5,a5,0xc
    2084:	00f766b3          	or	a3,a4,a5

00002088 <.LBE13>:
}
    2088:	00068593          	mv	a1,a3
    208c:	01010113          	addi	sp,sp,16
    2090:	00008067          	ret

00002094 <.L3>:
  FP_FROM_INT_D (A, i, SI_BITS, USItype);
    2094:	ff550513          	addi	a0,a0,-11

00002098 <.LVL11>:
    2098:	00a417b3          	sll	a5,s0,a0

0000209c <.LVL12>:
    209c:	00000413          	li	s0,0

000020a0 <.LVL13>:
    20a0:	fcdff06f          	j	206c <.L2>

000020a4 <.L4>:
    20a4:	00000793          	li	a5,0
    20a8:	00000713          	li	a4,0
    20ac:	fc1ff06f          	j	206c <.L2>

000020b0 <__clzsi2>:
int
__clzSI2 (UWtype x)
{
  Wtype ret;

  count_leading_zeros (ret, x);
    20b0:	000107b7          	lui	a5,0x10
    20b4:	02f57a63          	bgeu	a0,a5,20e8 <.L2>
    20b8:	10053793          	sltiu	a5,a0,256
    20bc:	0017c793          	xori	a5,a5,1
    20c0:	00379793          	slli	a5,a5,0x3

000020c4 <.L3>:
    20c4:	02000713          	li	a4,32
    20c8:	40f70733          	sub	a4,a4,a5
    20cc:	00f55533          	srl	a0,a0,a5

000020d0 <.LVL2>:
    20d0:	0000a797          	auipc	a5,0xa
    20d4:	df07a783          	lw	a5,-528(a5) # bec0 <.LLST21+0xe>

000020d8 <.LVL3>:
    20d8:	00a787b3          	add	a5,a5,a0
    20dc:	0007c503          	lbu	a0,0(a5)

000020e0 <.LBE3>:

  return ret;
}
    20e0:	40a70533          	sub	a0,a4,a0
    20e4:	00008067          	ret

000020e8 <.L2>:
  count_leading_zeros (ret, x);
    20e8:	01000737          	lui	a4,0x1000
    20ec:	01000793          	li	a5,16
    20f0:	fce56ae3          	bltu	a0,a4,20c4 <.L3>
    20f4:	01800793          	li	a5,24
    20f8:	fcdff06f          	j	20c4 <.L3>

000020fc <puts>:
    20fc:	0000a797          	auipc	a5,0xa
    2100:	d907a783          	lw	a5,-624(a5) # be8c <_GLOBAL_OFFSET_TABLE_+0x4>
    2104:	0007a583          	lw	a1,0(a5)
    2108:	fe010113          	addi	sp,sp,-32
    210c:	00912a23          	sw	s1,20(sp)
    2110:	00b12623          	sw	a1,12(sp)
    2114:	00112e23          	sw	ra,28(sp)
    2118:	00812c23          	sw	s0,24(sp)
    211c:	fff00493          	li	s1,-1
    2120:	33c010ef          	jal	ra,345c <__GI_fputs>
    2124:	00c12583          	lw	a1,12(sp)
    2128:	02951063          	bne	a0,s1,2148 <.L2>

0000212c <.L4>:
    212c:	fff00413          	li	s0,-1

00002130 <.L1>:
    2130:	01c12083          	lw	ra,28(sp)
    2134:	00040513          	mv	a0,s0
    2138:	01812403          	lw	s0,24(sp)
    213c:	01412483          	lw	s1,20(sp)
    2140:	02010113          	addi	sp,sp,32
    2144:	00008067          	ret

00002148 <.L2>:
    2148:	00150413          	addi	s0,a0,1
    214c:	00a00513          	li	a0,10
    2150:	214010ef          	jal	ra,3364 <__GI___fputc_unlocked>
    2154:	fc951ee3          	bne	a0,s1,2130 <.L1>
    2158:	fd5ff06f          	j	212c <.L4>

0000215c <__GI_printf>:
    215c:	fc010113          	addi	sp,sp,-64
    2160:	02b12223          	sw	a1,36(sp)
    2164:	02c12423          	sw	a2,40(sp)
    2168:	02f12a23          	sw	a5,52(sp)
    216c:	02d12623          	sw	a3,44(sp)
    2170:	02e12823          	sw	a4,48(sp)
    2174:	03012c23          	sw	a6,56(sp)
    2178:	03112e23          	sw	a7,60(sp)
    217c:	0000a797          	auipc	a5,0xa
    2180:	d107a783          	lw	a5,-752(a5) # be8c <_GLOBAL_OFFSET_TABLE_+0x4>
    2184:	00050593          	mv	a1,a0
    2188:	0007a503          	lw	a0,0(a5)
    218c:	02410613          	addi	a2,sp,36
    2190:	00112e23          	sw	ra,28(sp)
    2194:	00c12623          	sw	a2,12(sp)
    2198:	134000ef          	jal	ra,22cc <__GI_vfprintf>
    219c:	01c12083          	lw	ra,28(sp)
    21a0:	04010113          	addi	sp,sp,64
    21a4:	00008067          	ret

000021a8 <_stdio_term>:
    21a8:	ff010113          	addi	sp,sp,-16
    21ac:	0000a797          	auipc	a5,0xa
    21b0:	cf87a783          	lw	a5,-776(a5) # bea4 <_GLOBAL_OFFSET_TABLE_+0x1c>
    21b4:	00812423          	sw	s0,8(sp)
    21b8:	0007a403          	lw	s0,0(a5)
    21bc:	00912223          	sw	s1,4(sp)
    21c0:	00112623          	sw	ra,12(sp)
    21c4:	ffe00493          	li	s1,-2

000021c8 <.L2>:
    21c8:	00041c63          	bnez	s0,21e0 <.L5>
    21cc:	00c12083          	lw	ra,12(sp)
    21d0:	00812403          	lw	s0,8(sp)
    21d4:	00412483          	lw	s1,4(sp)
    21d8:	01010113          	addi	sp,sp,16
    21dc:	00008067          	ret

000021e0 <.L5>:
    21e0:	00045783          	lhu	a5,0(s0) # 80000 <_ebss+0x701b0>
    21e4:	0407f793          	andi	a5,a5,64
    21e8:	00078663          	beqz	a5,21f4 <.L3>
    21ec:	00040513          	mv	a0,s0
    21f0:	098000ef          	jal	ra,2288 <__stdio_wcommit>

000021f4 <.L3>:
    21f4:	00442783          	lw	a5,4(s0)
    21f8:	00979a63          	bne	a5,s1,220c <.L4>
    21fc:	03442783          	lw	a5,52(s0)
    2200:	00078663          	beqz	a5,220c <.L4>
    2204:	02442503          	lw	a0,36(s0)
    2208:	000780e7          	jalr	a5

0000220c <.L4>:
    220c:	02042403          	lw	s0,32(s0)
    2210:	fb9ff06f          	j	21c8 <.L2>

00002214 <_stdio_init>:
    2214:	ff010113          	addi	sp,sp,-16
    2218:	00812423          	sw	s0,8(sp)
    221c:	00000513          	li	a0,0
    2220:	0000a417          	auipc	s0,0xa
    2224:	c7442403          	lw	s0,-908(s0) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    2228:	00912223          	sw	s1,4(sp)
    222c:	00112623          	sw	ra,12(sp)
    2230:	00042483          	lw	s1,0(s0)
    2234:	13d010ef          	jal	ra,3b70 <__GI_isatty>
    2238:	00051c63          	bnez	a0,2250 <.L14>
    223c:	0000c717          	auipc	a4,0xc
    2240:	a9870713          	addi	a4,a4,-1384 # dcd4 <_stdio_streams>
    2244:	00075783          	lhu	a5,0(a4)
    2248:	1007c793          	xori	a5,a5,256
    224c:	00f71023          	sh	a5,0(a4)

00002250 <.L14>:
    2250:	00100513          	li	a0,1
    2254:	11d010ef          	jal	ra,3b70 <__GI_isatty>
    2258:	00051c63          	bnez	a0,2270 <.L15>
    225c:	0000c717          	auipc	a4,0xc
    2260:	a7870713          	addi	a4,a4,-1416 # dcd4 <_stdio_streams>
    2264:	02475783          	lhu	a5,36(a4)
    2268:	1007c793          	xori	a5,a5,256
    226c:	02f71223          	sh	a5,36(a4)

00002270 <.L15>:
    2270:	00942023          	sw	s1,0(s0)
    2274:	00c12083          	lw	ra,12(sp)
    2278:	00812403          	lw	s0,8(sp)
    227c:	00412483          	lw	s1,4(sp)
    2280:	01010113          	addi	sp,sp,16
    2284:	00008067          	ret

00002288 <__stdio_wcommit>:
    2288:	00852583          	lw	a1,8(a0)
    228c:	01052783          	lw	a5,16(a0)
    2290:	ff010113          	addi	sp,sp,-16
    2294:	00812423          	sw	s0,8(sp)
    2298:	00112623          	sw	ra,12(sp)
    229c:	00050413          	mv	s0,a0
    22a0:	40b78633          	sub	a2,a5,a1
    22a4:	00b78663          	beq	a5,a1,22b0 <.L2>
    22a8:	00b52823          	sw	a1,16(a0)
    22ac:	7fd020ef          	jal	ra,52a8 <__stdio_WRITE>

000022b0 <.L2>:
    22b0:	01042503          	lw	a0,16(s0)
    22b4:	00842783          	lw	a5,8(s0)
    22b8:	00c12083          	lw	ra,12(sp)
    22bc:	00812403          	lw	s0,8(sp)
    22c0:	40f50533          	sub	a0,a0,a5
    22c4:	01010113          	addi	sp,sp,16
    22c8:	00008067          	ret

000022cc <__GI_vfprintf>:
    22cc:	00055783          	lhu	a5,0(a0)
    22d0:	fe010113          	addi	sp,sp,-32
    22d4:	00812c23          	sw	s0,24(sp)
    22d8:	00112e23          	sw	ra,28(sp)
    22dc:	0407f793          	andi	a5,a5,64
    22e0:	00050413          	mv	s0,a0
    22e4:	00078c63          	beqz	a5,22fc <.L2>

000022e8 <.L3>:
    22e8:	00040513          	mv	a0,s0
    22ec:	01812403          	lw	s0,24(sp)
    22f0:	01c12083          	lw	ra,28(sp)
    22f4:	02010113          	addi	sp,sp,32
    22f8:	1580006f          	j	2450 <_vfprintf_internal>

000022fc <.L2>:
    22fc:	00c12623          	sw	a2,12(sp)
    2300:	00b12423          	sw	a1,8(sp)
    2304:	4b8030ef          	jal	ra,57bc <__stdio_trans2w>
    2308:	00812583          	lw	a1,8(sp)
    230c:	00c12603          	lw	a2,12(sp)
    2310:	fc050ce3          	beqz	a0,22e8 <.L3>
    2314:	01c12083          	lw	ra,28(sp)
    2318:	01812403          	lw	s0,24(sp)
    231c:	fff00513          	li	a0,-1
    2320:	02010113          	addi	sp,sp,32
    2324:	00008067          	ret

00002328 <_charpad>:
    2328:	fd010113          	addi	sp,sp,-48
    232c:	02812423          	sw	s0,40(sp)
    2330:	02912223          	sw	s1,36(sp)
    2334:	03212023          	sw	s2,32(sp)
    2338:	01312e23          	sw	s3,28(sp)
    233c:	02112623          	sw	ra,44(sp)
    2340:	00050913          	mv	s2,a0
    2344:	00060493          	mv	s1,a2
    2348:	00b10623          	sb	a1,12(sp)
    234c:	00060413          	mv	s0,a2
    2350:	00c10993          	addi	s3,sp,12

00002354 <.L2>:
    2354:	00040e63          	beqz	s0,2370 <.L3>
    2358:	00090613          	mv	a2,s2
    235c:	00100593          	li	a1,1
    2360:	00098513          	mv	a0,s3
    2364:	308030ef          	jal	ra,566c <__stdio_fwrite>
    2368:	00100793          	li	a5,1
    236c:	02f50263          	beq	a0,a5,2390 <.L4>

00002370 <.L3>:
    2370:	40848533          	sub	a0,s1,s0
    2374:	02c12083          	lw	ra,44(sp)
    2378:	02812403          	lw	s0,40(sp)
    237c:	02412483          	lw	s1,36(sp)
    2380:	02012903          	lw	s2,32(sp)
    2384:	01c12983          	lw	s3,28(sp)
    2388:	03010113          	addi	sp,sp,48
    238c:	00008067          	ret

00002390 <.L4>:
    2390:	fff40413          	addi	s0,s0,-1
    2394:	fc1ff06f          	j	2354 <.L2>

00002398 <_fp_out_narrow>:
    2398:	fe010113          	addi	sp,sp,-32
    239c:	00912a23          	sw	s1,20(sp)
    23a0:	01312623          	sw	s3,12(sp)
    23a4:	01412423          	sw	s4,8(sp)
    23a8:	00112e23          	sw	ra,28(sp)
    23ac:	00812c23          	sw	s0,24(sp)
    23b0:	01212823          	sw	s2,16(sp)
    23b4:	01512223          	sw	s5,4(sp)
    23b8:	0805f793          	andi	a5,a1,128
    23bc:	00050a13          	mv	s4,a0
    23c0:	00060493          	mv	s1,a2
    23c4:	00068993          	mv	s3,a3
    23c8:	06078e63          	beqz	a5,2444 <.L13>
    23cc:	00068513          	mv	a0,a3
    23d0:	00058a93          	mv	s5,a1
    23d4:	504010ef          	jal	ra,38d8 <__GI_strlen>
    23d8:	40a484b3          	sub	s1,s1,a0
    23dc:	00050913          	mv	s2,a0
    23e0:	00000413          	li	s0,0
    23e4:	00905e63          	blez	s1,2400 <.L10>
    23e8:	00048613          	mv	a2,s1
    23ec:	07faf593          	andi	a1,s5,127
    23f0:	000a0513          	mv	a0,s4
    23f4:	f35ff0ef          	jal	ra,2328 <_charpad>
    23f8:	00050413          	mv	s0,a0
    23fc:	02a49063          	bne	s1,a0,241c <.L9>

00002400 <.L10>:
    2400:	00000513          	li	a0,0
    2404:	01205a63          	blez	s2,2418 <.L12>
    2408:	000a0613          	mv	a2,s4
    240c:	00090593          	mv	a1,s2
    2410:	00098513          	mv	a0,s3
    2414:	258030ef          	jal	ra,566c <__stdio_fwrite>

00002418 <.L12>:
    2418:	00a40433          	add	s0,s0,a0

0000241c <.L9>:
    241c:	01c12083          	lw	ra,28(sp)
    2420:	00040513          	mv	a0,s0
    2424:	01812403          	lw	s0,24(sp)
    2428:	01412483          	lw	s1,20(sp)
    242c:	01012903          	lw	s2,16(sp)
    2430:	00c12983          	lw	s3,12(sp)
    2434:	00812a03          	lw	s4,8(sp)
    2438:	00412a83          	lw	s5,4(sp)
    243c:	02010113          	addi	sp,sp,32
    2440:	00008067          	ret

00002444 <.L13>:
    2444:	00060913          	mv	s2,a2
    2448:	00000413          	li	s0,0
    244c:	fb5ff06f          	j	2400 <.L10>

00002450 <_vfprintf_internal>:
    2450:	e2010113          	addi	sp,sp,-480
    2454:	0c010793          	addi	a5,sp,192
    2458:	00a12023          	sw	a0,0(sp)
    245c:	00078513          	mv	a0,a5
    2460:	1c812c23          	sw	s0,472(sp)
    2464:	1c912a23          	sw	s1,468(sp)
    2468:	1c112e23          	sw	ra,476(sp)
    246c:	1d212823          	sw	s2,464(sp)
    2470:	1d312623          	sw	s3,460(sp)
    2474:	1d412423          	sw	s4,456(sp)
    2478:	1d512223          	sw	s5,452(sp)
    247c:	1d612023          	sw	s6,448(sp)
    2480:	1b712e23          	sw	s7,444(sp)
    2484:	1b812c23          	sw	s8,440(sp)
    2488:	1b912a23          	sw	s9,436(sp)
    248c:	1ba12823          	sw	s10,432(sp)
    2490:	1bb12623          	sw	s11,428(sp)
    2494:	00058413          	mv	s0,a1
    2498:	00060493          	mv	s1,a2
    249c:	00f12223          	sw	a5,4(sp)
    24a0:	6d0000ef          	jal	ra,2b70 <_ppfs_init>
    24a4:	06055663          	bgez	a0,2510 <.L18>
    24a8:	0c012403          	lw	s0,192(sp)
    24ac:	00040513          	mv	a0,s0
    24b0:	428010ef          	jal	ra,38d8 <__GI_strlen>
    24b4:	00050593          	mv	a1,a0
    24b8:	04051463          	bnez	a0,2500 <.L19>

000024bc <.L84>:
    24bc:	fff00c93          	li	s9,-1

000024c0 <.L17>:
    24c0:	1dc12083          	lw	ra,476(sp)
    24c4:	1d812403          	lw	s0,472(sp)
    24c8:	1d412483          	lw	s1,468(sp)
    24cc:	1d012903          	lw	s2,464(sp)
    24d0:	1cc12983          	lw	s3,460(sp)
    24d4:	1c812a03          	lw	s4,456(sp)
    24d8:	1c412a83          	lw	s5,452(sp)
    24dc:	1c012b03          	lw	s6,448(sp)
    24e0:	1bc12b83          	lw	s7,444(sp)
    24e4:	1b812c03          	lw	s8,440(sp)
    24e8:	1b012d03          	lw	s10,432(sp)
    24ec:	1ac12d83          	lw	s11,428(sp)
    24f0:	000c8513          	mv	a0,s9
    24f4:	1b412c83          	lw	s9,436(sp)
    24f8:	1e010113          	addi	sp,sp,480
    24fc:	00008067          	ret

00002500 <.L19>:
    2500:	00012603          	lw	a2,0(sp)
    2504:	00040513          	mv	a0,s0
    2508:	164030ef          	jal	ra,566c <__stdio_fwrite>
    250c:	fb1ff06f          	j	24bc <.L84>

00002510 <.L18>:
    2510:	00412503          	lw	a0,4(sp)
    2514:	00048593          	mv	a1,s1
    2518:	00001a37          	lui	s4,0x1
    251c:	738000ef          	jal	ra,2c54 <_ppfs_prepargs>
    2520:	40000ab7          	lui	s5,0x40000
    2524:	10000b37          	lui	s6,0x10000
    2528:	00040513          	mv	a0,s0
    252c:	00000c93          	li	s9,0
    2530:	11010b93          	addi	s7,sp,272
    2534:	800a0c13          	addi	s8,s4,-2048 # 800 <core_list_init+0x34>
    2538:	fffa8a93          	addi	s5,s5,-1 # 3fffffff <_ebss+0x3fff01af>
    253c:	fffb0b13          	addi	s6,s6,-1 # fffffff <_ebss+0xfff01af>

00002540 <.L22>:
    2540:	00044783          	lbu	a5,0(s0)
    2544:	60078863          	beqz	a5,2b54 <.L23>
    2548:	02500713          	li	a4,37
    254c:	0ce79063          	bne	a5,a4,260c <.L24>
    2550:	02a40463          	beq	s0,a0,2578 <.L86>

00002554 <.L85>:
    2554:	40a404b3          	sub	s1,s0,a0
    2558:	f69052e3          	blez	s1,24bc <.L84>
    255c:	00012603          	lw	a2,0(sp)
    2560:	00048593          	mv	a1,s1
    2564:	108030ef          	jal	ra,566c <__stdio_fwrite>
    2568:	f4951ae3          	bne	a0,s1,24bc <.L84>
    256c:	00044783          	lbu	a5,0(s0)
    2570:	00ac8cb3          	add	s9,s9,a0
    2574:	f40786e3          	beqz	a5,24c0 <.L17>

00002578 <.L86>:
    2578:	00144703          	lbu	a4,1(s0)
    257c:	02500793          	li	a5,37
    2580:	00140513          	addi	a0,s0,1
    2584:	00240413          	addi	s0,s0,2
    2588:	faf70ce3          	beq	a4,a5,2540 <.L22>
    258c:	0ca12023          	sw	a0,192(sp)
    2590:	00412503          	lw	a0,4(sp)
    2594:	0fd000ef          	jal	ra,2e90 <_ppfs_parsespec>
    2598:	00412503          	lw	a0,4(sp)
    259c:	704000ef          	jal	ra,2ca0 <_ppfs_setargs>
    25a0:	0d812703          	lw	a4,216(sp)
    25a4:	0e614583          	lbu	a1,230(sp)
    25a8:	000b8793          	mv	a5,s7
    25ac:	00e05863          	blez	a4,25bc <.L29>
    25b0:	016587b3          	add	a5,a1,s6
    25b4:	00479793          	slli	a5,a5,0x4
    25b8:	00fb87b3          	add	a5,s7,a5

000025bc <.L29>:
    25bc:	0dc12803          	lw	a6,220(sp)
    25c0:	02c10693          	addi	a3,sp,44
    25c4:	00000713          	li	a4,0
    25c8:	00068613          	mv	a2,a3

000025cc <.L30>:
    25cc:	00471513          	slli	a0,a4,0x4
    25d0:	00a78533          	add	a0,a5,a0
    25d4:	05074063          	blt	a4,a6,2614 <.L31>
    25d8:	0e012783          	lw	a5,224(sp)
    25dc:	04079463          	bnez	a5,2624 <.L32>
    25e0:	0d012583          	lw	a1,208(sp)
    25e4:	f00a0793          	addi	a5,s4,-256
    25e8:	000c8613          	mv	a2,s9
    25ec:	00f5f5b3          	and	a1,a1,a5
    25f0:	02c12783          	lw	a5,44(sp)
    25f4:	41fcd693          	srai	a3,s9,0x1f
    25f8:	0007a503          	lw	a0,0(a5)
    25fc:	310030ef          	jal	ra,590c <_store_inttype>

00002600 <.L33>:
    2600:	0c012403          	lw	s0,192(sp)
    2604:	00040513          	mv	a0,s0
    2608:	f39ff06f          	j	2540 <.L22>

0000260c <.L24>:
    260c:	00140413          	addi	s0,s0,1
    2610:	f31ff06f          	j	2540 <.L22>

00002614 <.L31>:
    2614:	00a6a023          	sw	a0,0(a3) # 800000 <_ebss+0x7f01b0>
    2618:	00170713          	addi	a4,a4,1
    261c:	00468693          	addi	a3,a3,4
    2620:	fadff06f          	j	25cc <.L30>

00002624 <.L32>:
    2624:	00700713          	li	a4,7
    2628:	34f76263          	bltu	a4,a5,296c <.L34>
    262c:	0000b717          	auipc	a4,0xb
    2630:	45470713          	addi	a4,a4,1108 # da80 <spec_base.1>
    2634:	00f70733          	add	a4,a4,a5
    2638:	fff74683          	lbu	a3,-1(a4)
    263c:	00a00613          	li	a2,10
    2640:	05700713          	li	a4,87
    2644:	02c69063          	bne	a3,a2,2664 <.L35>
    2648:	0d012603          	lw	a2,208(sp)
    264c:	02067513          	andi	a0,a2,32
    2650:	00050463          	beqz	a0,2658 <.L36>
    2654:	02c00713          	li	a4,44

00002658 <.L36>:
    2658:	04067613          	andi	a2,a2,64
    265c:	00060463          	beqz	a2,2664 <.L35>
    2660:	08076713          	ori	a4,a4,128

00002664 <.L35>:
    2664:	00500513          	li	a0,5
    2668:	0c412603          	lw	a2,196(sp)
    266c:	0ef56463          	bltu	a0,a5,2754 <.L37>
    2670:	00300513          	li	a0,3
    2674:	10a78063          	beq	a5,a0,2774 <.L38>
    2678:	00100513          	li	a0,1
    267c:	0ea78063          	beq	a5,a0,275c <.L39>

00002680 <.L130>:
    2680:	02000913          	li	s2,32
    2684:	00065463          	bgez	a2,268c <.L41>
    2688:	0d414903          	lbu	s2,212(sp)

0000268c <.L41>:
    268c:	015585b3          	add	a1,a1,s5
    2690:	00259593          	slli	a1,a1,0x2
    2694:	19058793          	addi	a5,a1,400
    2698:	01010613          	addi	a2,sp,16
    269c:	00c785b3          	add	a1,a5,a2
    26a0:	f485a503          	lw	a0,-184(a1)
    26a4:	f00a0793          	addi	a5,s4,-256
    26a8:	00b00d13          	li	s10,11
    26ac:	00f57533          	and	a0,a0,a5

000026b0 <.L42>:
    26b0:	02c12583          	lw	a1,44(sp)
    26b4:	00068613          	mv	a2,a3
    26b8:	00e12623          	sw	a4,12(sp)
    26bc:	00d12423          	sw	a3,8(sp)
    26c0:	1d0030ef          	jal	ra,5890 <_load_inttype>
    26c4:	00c12703          	lw	a4,12(sp)
    26c8:	00812683          	lw	a3,8(sp)
    26cc:	0bf10493          	addi	s1,sp,191
    26d0:	00058613          	mv	a2,a1
    26d4:	00050593          	mv	a1,a0
    26d8:	00048513          	mv	a0,s1
    26dc:	26c030ef          	jal	ra,5948 <_uintmaxtostr>
    26e0:	0e012703          	lw	a4,224(sp)
    26e4:	00500793          	li	a5,5
    26e8:	00050d93          	mv	s11,a0
    26ec:	02e7f263          	bgeu	a5,a4,2710 <.L43>
    26f0:	00054603          	lbu	a2,0(a0)
    26f4:	02d00693          	li	a3,45
    26f8:	0d012783          	lw	a5,208(sp)
    26fc:	08d61663          	bne	a2,a3,2788 <.L44>
    2700:	0027e793          	ori	a5,a5,2
    2704:	0cf12823          	sw	a5,208(sp)
    2708:	00150d93          	addi	s11,a0,1
    270c:	00200d13          	li	s10,2

00002710 <.L43>:
    2710:	0c412403          	lw	s0,196(sp)
    2714:	41b484b3          	sub	s1,s1,s11
    2718:	00045463          	bgez	s0,2720 <.L45>
    271c:	00100413          	li	s0,1

00002720 <.L45>:
    2720:	0d012683          	lw	a3,208(sp)
    2724:	000dc783          	lbu	a5,0(s11)
    2728:	0106f693          	andi	a3,a3,16
    272c:	1c068a63          	beqz	a3,2900 <.L46>
    2730:	00200693          	li	a3,2
    2734:	06e6ea63          	bltu	a3,a4,27a8 <.L47>
    2738:	03000693          	li	a3,48
    273c:	1cd78a63          	beq	a5,a3,2910 <.L48>
    2740:	00040793          	mv	a5,s0
    2744:	4084fc63          	bgeu	s1,s0,2b5c <.L97>
    2748:	40940433          	sub	s0,s0,s1

0000274c <.L49>:
    274c:	00600d13          	li	s10,6
    2750:	1640006f          	j	28b4 <.L136>

00002754 <.L37>:
    2754:	40d006b3          	neg	a3,a3
    2758:	f29ff06f          	j	2680 <.L130>

0000275c <.L39>:
    275c:	02000913          	li	s2,32
    2760:	00065463          	bgez	a2,2768 <.L134>
    2764:	0d414903          	lbu	s2,212(sp)

00002768 <.L134>:
    2768:	00600d13          	li	s10,6
    276c:	40000513          	li	a0,1024
    2770:	f41ff06f          	j	26b0 <.L42>

00002774 <.L38>:
    2774:	02000913          	li	s2,32
    2778:	00065463          	bgez	a2,2780 <.L133>
    277c:	0d414903          	lbu	s2,212(sp)

00002780 <.L133>:
    2780:	03700713          	li	a4,55
    2784:	f09ff06f          	j	268c <.L41>

00002788 <.L44>:
    2788:	0027f693          	andi	a3,a5,2
    278c:	00069a63          	bnez	a3,27a0 <.L95>
    2790:	0017f793          	andi	a5,a5,1
    2794:	f6078ee3          	beqz	a5,2710 <.L43>
    2798:	00400d13          	li	s10,4
    279c:	f75ff06f          	j	2710 <.L43>

000027a0 <.L95>:
    27a0:	00000d13          	li	s10,0
    27a4:	f6dff06f          	j	2710 <.L43>

000027a8 <.L47>:
    27a8:	00300693          	li	a3,3
    27ac:	0cd71c63          	bne	a4,a3,2884 <.L50>
    27b0:	03000713          	li	a4,48
    27b4:	0ae79e63          	bne	a5,a4,2870 <.L51>

000027b8 <.L61>:
    27b8:	00b00d13          	li	s10,11
    27bc:	34040a63          	beqz	s0,2b10 <.L111>

000027c0 <.L87>:
    27c0:	00040793          	mv	a5,s0
    27c4:	3884f463          	bgeu	s1,s0,2b4c <.L106>
    27c8:	40940433          	sub	s0,s0,s1
    27cc:	00b00d13          	li	s10,11

000027d0 <.L52>:
    27d0:	0c812683          	lw	a3,200(sp)
    27d4:	00000993          	li	s3,0
    27d8:	00d7f463          	bgeu	a5,a3,27e0 <.L79>
    27dc:	40f689b3          	sub	s3,a3,a5

000027e0 <.L79>:
    27e0:	00fc87b3          	add	a5,s9,a5
    27e4:	01378cb3          	add	s9,a5,s3
    27e8:	03000793          	li	a5,48
    27ec:	00f91663          	bne	s2,a5,27f8 <.L80>
    27f0:	01340433          	add	s0,s0,s3
    27f4:	00000993          	li	s3,0

000027f8 <.L80>:
    27f8:	0d012783          	lw	a5,208(sp)
    27fc:	0087f793          	andi	a5,a5,8
    2800:	00079e63          	bnez	a5,281c <.L81>
    2804:	00012503          	lw	a0,0(sp)
    2808:	00098613          	mv	a2,s3
    280c:	02000593          	li	a1,32
    2810:	b19ff0ef          	jal	ra,2328 <_charpad>
    2814:	caa994e3          	bne	s3,a0,24bc <.L84>
    2818:	00000993          	li	s3,0

0000281c <.L81>:
    281c:	00012583          	lw	a1,0(sp)
    2820:	96018513          	addi	a0,gp,-1696 # c080 <prefix.0>
    2824:	01a50533          	add	a0,a0,s10
    2828:	435000ef          	jal	ra,345c <__GI_fputs>
    282c:	00012503          	lw	a0,0(sp)
    2830:	00040613          	mv	a2,s0
    2834:	03000593          	li	a1,48
    2838:	af1ff0ef          	jal	ra,2328 <_charpad>
    283c:	c8a410e3          	bne	s0,a0,24bc <.L84>
    2840:	00048c63          	beqz	s1,2858 <.L82>
    2844:	00012603          	lw	a2,0(sp)
    2848:	00048593          	mv	a1,s1
    284c:	000d8513          	mv	a0,s11
    2850:	61d020ef          	jal	ra,566c <__stdio_fwrite>
    2854:	c69514e3          	bne	a0,s1,24bc <.L84>

00002858 <.L82>:
    2858:	00012503          	lw	a0,0(sp)
    285c:	00098613          	mv	a2,s3
    2860:	02000593          	li	a1,32
    2864:	ac5ff0ef          	jal	ra,2328 <_charpad>
    2868:	d8a98ce3          	beq	s3,a0,2600 <.L33>
    286c:	c51ff06f          	j	24bc <.L84>

00002870 <.L51>:
    2870:	00040793          	mv	a5,s0
    2874:	2a84fe63          	bgeu	s1,s0,2b30 <.L100>
    2878:	40940433          	sub	s0,s0,s1

0000287c <.L143>:
    287c:	00900d13          	li	s10,9
    2880:	0340006f          	j	28b4 <.L136>

00002884 <.L50>:
    2884:	00400693          	li	a3,4
    2888:	04d71c63          	bne	a4,a3,28e0 <.L55>
    288c:	03000713          	li	a4,48
    2890:	0284f863          	bgeu	s1,s0,28c0 <.L56>
    2894:	0ce79063          	bne	a5,a4,2954 <.L57>
    2898:	00500793          	li	a5,5
    289c:	f3a7c2e3          	blt	a5,s10,27c0 <.L87>
    28a0:	00040793          	mv	a5,s0

000028a4 <.L135>:
    28a4:	40940433          	sub	s0,s0,s1

000028a8 <.L59>:
    28a8:	00500693          	li	a3,5
    28ac:	00100713          	li	a4,1
    28b0:	01a6d463          	bge	a3,s10,28b8 <.L53>

000028b4 <.L136>:
    28b4:	00200713          	li	a4,2

000028b8 <.L53>:
    28b8:	00e787b3          	add	a5,a5,a4
    28bc:	f15ff06f          	j	27d0 <.L52>

000028c0 <.L56>:
    28c0:	00148413          	addi	s0,s1,1
    28c4:	08e79863          	bne	a5,a4,2954 <.L57>
    28c8:	00500793          	li	a5,5
    28cc:	29a7ce63          	blt	a5,s10,2b68 <.L102>
    28d0:	24048a63          	beqz	s1,2b24 <.L103>

000028d4 <.L108>:
    28d4:	00048793          	mv	a5,s1
    28d8:	00000413          	li	s0,0
    28dc:	fcdff06f          	j	28a8 <.L59>

000028e0 <.L55>:
    28e0:	03000713          	li	a4,48
    28e4:	06e79863          	bne	a5,a4,2954 <.L57>
    28e8:	00500793          	li	a5,5
    28ec:	eda7c6e3          	blt	a5,s10,27b8 <.L61>

000028f0 <.L62>:
    28f0:	20040c63          	beqz	s0,2b08 <.L64>
    28f4:	00040793          	mv	a5,s0
    28f8:	fa84e6e3          	bltu	s1,s0,28a4 <.L135>
    28fc:	fd9ff06f          	j	28d4 <.L108>

00002900 <.L46>:
    2900:	03000693          	li	a3,48
    2904:	04d79863          	bne	a5,a3,2954 <.L57>
    2908:	00500793          	li	a5,5
    290c:	03a7d463          	bge	a5,s10,2934 <.L63>

00002910 <.L48>:
    2910:	00100793          	li	a5,1
    2914:	eaf712e3          	bne	a4,a5,27b8 <.L61>
    2918:	0000bd97          	auipc	s11,0xb
    291c:	158d8d93          	addi	s11,s11,344 # da70 <.LC0>
    2920:	00b00d13          	li	s10,11
    2924:	00500493          	li	s1,5
    2928:	00000413          	li	s0,0
    292c:	00500793          	li	a5,5
    2930:	ea1ff06f          	j	27d0 <.L52>

00002934 <.L63>:
    2934:	00100793          	li	a5,1
    2938:	faf71ce3          	bne	a4,a5,28f0 <.L62>
    293c:	00500793          	li	a5,5
    2940:	00000413          	li	s0,0
    2944:	00500493          	li	s1,5
    2948:	0000bd97          	auipc	s11,0xb
    294c:	128d8d93          	addi	s11,s11,296 # da70 <.LC0>
    2950:	f69ff06f          	j	28b8 <.L53>

00002954 <.L57>:
    2954:	1c84f463          	bgeu	s1,s0,2b1c <.L109>
    2958:	40940433          	sub	s0,s0,s1

0000295c <.L65>:
    295c:	00b00713          	li	a4,11
    2960:	009407b3          	add	a5,s0,s1
    2964:	f4ed12e3          	bne	s10,a4,28a8 <.L59>
    2968:	e69ff06f          	j	27d0 <.L52>

0000296c <.L34>:
    296c:	00f00713          	li	a4,15
    2970:	08f76063          	bltu	a4,a5,29f0 <.L66>
    2974:	0d012703          	lw	a4,208(sp)
    2978:	02c12783          	lw	a5,44(sp)
    297c:	01010413          	addi	s0,sp,16
    2980:	01877733          	and	a4,a4,s8
    2984:	04070463          	beqz	a4,29cc <.L67>
    2988:	0007a603          	lw	a2,0(a5)
    298c:	0047a683          	lw	a3,4(a5)
    2990:	0087a703          	lw	a4,8(a5)
    2994:	00c7a783          	lw	a5,12(a5)

00002998 <.L68>:
    2998:	00012503          	lw	a0,0(sp)
    299c:	00c12823          	sw	a2,16(sp)
    29a0:	00d12a23          	sw	a3,20(sp)
    29a4:	0c410613          	addi	a2,sp,196
    29a8:	00000697          	auipc	a3,0x0
    29ac:	9f068693          	addi	a3,a3,-1552 # 2398 <_fp_out_narrow>
    29b0:	00040593          	mv	a1,s0
    29b4:	00e12c23          	sw	a4,24(sp)
    29b8:	00f12e23          	sw	a5,28(sp)
    29bc:	04c030ef          	jal	ra,5a08 <_fpmaxtostr>

000029c0 <.L142>:
    29c0:	ae054ee3          	bltz	a0,24bc <.L84>
    29c4:	00ac8cb3          	add	s9,s9,a0
    29c8:	c39ff06f          	j	2600 <.L33>

000029cc <.L67>:
    29cc:	0047a603          	lw	a2,4(a5)
    29d0:	0007a583          	lw	a1,0(a5)
    29d4:	00040513          	mv	a0,s0
    29d8:	6f0080ef          	jal	ra,b0c8 <__extenddftf2>
    29dc:	01012603          	lw	a2,16(sp)
    29e0:	01412683          	lw	a3,20(sp)
    29e4:	01812703          	lw	a4,24(sp)
    29e8:	01c12783          	lw	a5,28(sp)
    29ec:	fadff06f          	j	2998 <.L68>

000029f0 <.L66>:
    29f0:	01100713          	li	a4,17
    29f4:	acf774e3          	bgeu	a4,a5,24bc <.L84>
    29f8:	01300713          	li	a4,19
    29fc:	08f76a63          	bltu	a4,a5,2a90 <.L70>
    2a00:	02c12683          	lw	a3,44(sp)
    2a04:	0006a403          	lw	s0,0(a3)
    2a08:	06e79263          	bne	a5,a4,2a6c <.L71>
    2a0c:	0c412703          	lw	a4,196(sp)
    2a10:	02040c63          	beqz	s0,2a48 <.L72>
    2a14:	00040d93          	mv	s11,s0

00002a18 <.L73>:
    2a18:	0c412783          	lw	a5,196(sp)
    2a1c:	fff00593          	li	a1,-1
    2a20:	0007c463          	bltz	a5,2a28 <.L74>
    2a24:	00078593          	mv	a1,a5

00002a28 <.L74>:
    2a28:	000d8513          	mv	a0,s11
    2a2c:	741000ef          	jal	ra,396c <__GI_strnlen>
    2a30:	00050793          	mv	a5,a0
    2a34:	00050493          	mv	s1,a0
    2a38:	02000913          	li	s2,32

00002a3c <.L137>:
    2a3c:	00b00d13          	li	s10,11
    2a40:	00000413          	li	s0,0
    2a44:	d8dff06f          	j	27d0 <.L52>

00002a48 <.L72>:
    2a48:	00500793          	li	a5,5
    2a4c:	0000bd97          	auipc	s11,0xb
    2a50:	02cd8d93          	addi	s11,s11,44 # da78 <.LC1>
    2a54:	02000913          	li	s2,32
    2a58:	00b00d13          	li	s10,11
    2a5c:	0ae7fa63          	bgeu	a5,a4,2b10 <.L111>
    2a60:	00600493          	li	s1,6
    2a64:	00600793          	li	a5,6
    2a68:	d69ff06f          	j	27d0 <.L52>

00002a6c <.L71>:
    2a6c:	04810023          	sb	s0,64(sp)
    2a70:	040100a3          	sb	zero,65(sp)
    2a74:	04010d93          	addi	s11,sp,64
    2a78:	02000913          	li	s2,32
    2a7c:	00b00d13          	li	s10,11
    2a80:	00100493          	li	s1,1
    2a84:	00000413          	li	s0,0
    2a88:	00100793          	li	a5,1
    2a8c:	d45ff06f          	j	27d0 <.L52>

00002a90 <.L70>:
    2a90:	01400713          	li	a4,20
    2a94:	02e79263          	bne	a5,a4,2ab8 <.L75>
    2a98:	00009797          	auipc	a5,0x9
    2a9c:	3fc7a783          	lw	a5,1020(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    2aa0:	0007a503          	lw	a0,0(a5)
    2aa4:	08000613          	li	a2,128
    2aa8:	04010593          	addi	a1,sp,64
    2aac:	77d000ef          	jal	ra,3a28 <__GI___glibc_strerror_r>
    2ab0:	00050d93          	mv	s11,a0
    2ab4:	f65ff06f          	j	2a18 <.L73>

00002ab8 <.L75>:
    2ab8:	0cc12583          	lw	a1,204(sp)
    2abc:	0000b717          	auipc	a4,0xb
    2ac0:	29c72703          	lw	a4,668(a4) # dd58 <_custom_printf_spec>
    2ac4:	00a70693          	addi	a3,a4,10
    2ac8:	00070793          	mv	a5,a4

00002acc <.L78>:
    2acc:	0007c503          	lbu	a0,0(a5)
    2ad0:	02b51663          	bne	a0,a1,2afc <.L76>
    2ad4:	40e787b3          	sub	a5,a5,a4
    2ad8:	00279793          	slli	a5,a5,0x2
    2adc:	0000d717          	auipc	a4,0xd
    2ae0:	33870713          	addi	a4,a4,824 # fe14 <_custom_printf_handler>
    2ae4:	00f707b3          	add	a5,a4,a5
    2ae8:	0007a783          	lw	a5,0(a5)
    2aec:	00012503          	lw	a0,0(sp)
    2af0:	0c410593          	addi	a1,sp,196
    2af4:	000780e7          	jalr	a5
    2af8:	ec9ff06f          	j	29c0 <.L142>

00002afc <.L76>:
    2afc:	00178793          	addi	a5,a5,1
    2b00:	fcd796e3          	bne	a5,a3,2acc <.L78>
    2b04:	9b9ff06f          	j	24bc <.L84>

00002b08 <.L64>:
    2b08:	00b00793          	li	a5,11
    2b0c:	02fd1863          	bne	s10,a5,2b3c <.L112>

00002b10 <.L111>:
    2b10:	00000493          	li	s1,0
    2b14:	00000793          	li	a5,0
    2b18:	cb9ff06f          	j	27d0 <.L52>

00002b1c <.L109>:
    2b1c:	00000413          	li	s0,0
    2b20:	e3dff06f          	j	295c <.L65>

00002b24 <.L103>:
    2b24:	00100793          	li	a5,1
    2b28:	00100413          	li	s0,1
    2b2c:	d7dff06f          	j	28a8 <.L59>

00002b30 <.L100>:
    2b30:	00048793          	mv	a5,s1
    2b34:	00000413          	li	s0,0
    2b38:	d45ff06f          	j	287c <.L143>

00002b3c <.L112>:
    2b3c:	00000793          	li	a5,0
    2b40:	00000493          	li	s1,0
    2b44:	00100713          	li	a4,1
    2b48:	d71ff06f          	j	28b8 <.L53>

00002b4c <.L106>:
    2b4c:	00048793          	mv	a5,s1
    2b50:	eedff06f          	j	2a3c <.L137>

00002b54 <.L23>:
    2b54:	a0a410e3          	bne	s0,a0,2554 <.L85>
    2b58:	969ff06f          	j	24c0 <.L17>

00002b5c <.L97>:
    2b5c:	00048793          	mv	a5,s1
    2b60:	00000413          	li	s0,0
    2b64:	be9ff06f          	j	274c <.L49>

00002b68 <.L102>:
    2b68:	00100413          	li	s0,1
    2b6c:	c55ff06f          	j	27c0 <.L87>

00002b70 <_ppfs_init>:
    2b70:	fe010113          	addi	sp,sp,-32
    2b74:	00912a23          	sw	s1,20(sp)
    2b78:	0e000613          	li	a2,224
    2b7c:	00058493          	mv	s1,a1
    2b80:	00000593          	li	a1,0
    2b84:	00812c23          	sw	s0,24(sp)
    2b88:	01212823          	sw	s2,16(sp)
    2b8c:	00050413          	mv	s0,a0
    2b90:	00112e23          	sw	ra,28(sp)
    2b94:	01312623          	sw	s3,12(sp)
    2b98:	499000ef          	jal	ra,3830 <__GI_memset>
    2b9c:	01842783          	lw	a5,24(s0)
    2ba0:	02840913          	addi	s2,s0,40
    2ba4:	00942023          	sw	s1,0(s0)
    2ba8:	fff78793          	addi	a5,a5,-1
    2bac:	00f42c23          	sw	a5,24(s0)
    2bb0:	04c40713          	addi	a4,s0,76
    2bb4:	00090793          	mv	a5,s2
    2bb8:	00800693          	li	a3,8

00002bbc <.L2>:
    2bbc:	00478793          	addi	a5,a5,4
    2bc0:	fed7ae23          	sw	a3,-4(a5)
    2bc4:	fee79ce3          	bne	a5,a4,2bbc <.L2>
    2bc8:	00048793          	mv	a5,s1
    2bcc:	02500993          	li	s3,37

00002bd0 <.L3>:
    2bd0:	0007c703          	lbu	a4,0(a5)
    2bd4:	02071063          	bnez	a4,2bf4 <.L8>
    2bd8:	01842783          	lw	a5,24(s0)
    2bdc:	00942023          	sw	s1,0(s0)
    2be0:	00800713          	li	a4,8

00002be4 <.L9>:
    2be4:	fff78793          	addi	a5,a5,-1
    2be8:	0407de63          	bgez	a5,2c44 <.L11>
    2bec:	00000513          	li	a0,0
    2bf0:	0280006f          	j	2c18 <.L1>

00002bf4 <.L8>:
    2bf4:	0017c683          	lbu	a3,1(a5)
    2bf8:	05371263          	bne	a4,s3,2c3c <.L4>
    2bfc:	00178793          	addi	a5,a5,1
    2c00:	03368e63          	beq	a3,s3,2c3c <.L4>
    2c04:	00f42023          	sw	a5,0(s0)
    2c08:	00040513          	mv	a0,s0
    2c0c:	284000ef          	jal	ra,2e90 <_ppfs_parsespec>
    2c10:	02055263          	bgez	a0,2c34 <.L5>

00002c14 <.L10>:
    2c14:	fff00513          	li	a0,-1

00002c18 <.L1>:
    2c18:	01c12083          	lw	ra,28(sp)
    2c1c:	01812403          	lw	s0,24(sp)
    2c20:	01412483          	lw	s1,20(sp)
    2c24:	01012903          	lw	s2,16(sp)
    2c28:	00c12983          	lw	s3,12(sp)
    2c2c:	02010113          	addi	sp,sp,32
    2c30:	00008067          	ret

00002c34 <.L5>:
    2c34:	00042783          	lw	a5,0(s0)
    2c38:	f99ff06f          	j	2bd0 <.L3>

00002c3c <.L4>:
    2c3c:	00178793          	addi	a5,a5,1
    2c40:	f91ff06f          	j	2bd0 <.L3>

00002c44 <.L11>:
    2c44:	00092683          	lw	a3,0(s2)
    2c48:	fce686e3          	beq	a3,a4,2c14 <.L10>
    2c4c:	00490913          	addi	s2,s2,4
    2c50:	f95ff06f          	j	2be4 <.L9>

00002c54 <_ppfs_prepargs>:
    2c54:	ff010113          	addi	sp,sp,-16
    2c58:	00912223          	sw	s1,4(sp)
    2c5c:	01852483          	lw	s1,24(a0)
    2c60:	00112623          	sw	ra,12(sp)
    2c64:	00812423          	sw	s0,8(sp)
    2c68:	04b52623          	sw	a1,76(a0)
    2c6c:	02905063          	blez	s1,2c8c <.L1>
    2c70:	00050413          	mv	s0,a0
    2c74:	00952e23          	sw	s1,28(a0)
    2c78:	00052c23          	sw	zero,24(a0)
    2c7c:	00052223          	sw	zero,4(a0)
    2c80:	00052423          	sw	zero,8(a0)
    2c84:	01c000ef          	jal	ra,2ca0 <_ppfs_setargs>
    2c88:	00942c23          	sw	s1,24(s0)

00002c8c <.L1>:
    2c8c:	00c12083          	lw	ra,12(sp)
    2c90:	00812403          	lw	s0,8(sp)
    2c94:	00412483          	lw	s1,4(sp)
    2c98:	01010113          	addi	sp,sp,16
    2c9c:	00008067          	ret

00002ca0 <_ppfs_setargs>:
    2ca0:	01852603          	lw	a2,24(a0)
    2ca4:	00852783          	lw	a5,8(a0)
    2ca8:	00452683          	lw	a3,4(a0)
    2cac:	05050713          	addi	a4,a0,80
    2cb0:	14061663          	bnez	a2,2dfc <.L2>
    2cb4:	ff010113          	addi	sp,sp,-16
    2cb8:	00812623          	sw	s0,12(sp)
    2cbc:	00912423          	sw	s1,8(sp)
    2cc0:	800005b7          	lui	a1,0x80000
    2cc4:	00b79e63          	bne	a5,a1,2ce0 <.L3>
    2cc8:	04c52783          	lw	a5,76(a0)
    2ccc:	00478593          	addi	a1,a5,4
    2cd0:	0007a783          	lw	a5,0(a5)
    2cd4:	04b52623          	sw	a1,76(a0)
    2cd8:	04f52823          	sw	a5,80(a0)
    2cdc:	00f52423          	sw	a5,8(a0)

00002ce0 <.L3>:
    2ce0:	800007b7          	lui	a5,0x80000
    2ce4:	00f69e63          	bne	a3,a5,2d00 <.L4>
    2ce8:	04c52783          	lw	a5,76(a0)
    2cec:	00478693          	addi	a3,a5,4 # 80000004 <_ebss+0x7fff01b4>
    2cf0:	0007a783          	lw	a5,0(a5)
    2cf4:	04d52623          	sw	a3,76(a0)
    2cf8:	04f52823          	sw	a5,80(a0)
    2cfc:	00f52223          	sw	a5,4(a0)

00002d00 <.L4>:
    2d00:	01c52f03          	lw	t5,28(a0)
    2d04:	000017b7          	lui	a5,0x1
    2d08:	02850893          	addi	a7,a0,40
    2d0c:	00800e13          	li	t3,8
    2d10:	80078f93          	addi	t6,a5,-2048 # 800 <core_list_init+0x34>
    2d14:	80778813          	addi	a6,a5,-2041
    2d18:	00200e93          	li	t4,2
    2d1c:	00700413          	li	s0,7

00002d20 <.L5>:
    2d20:	03e64e63          	blt	a2,t5,2d5c <.L17>
    2d24:	00852783          	lw	a5,8(a0)
    2d28:	0207d263          	bgez	a5,2d4c <.L1>
    2d2c:	40f007b3          	neg	a5,a5
    2d30:	00f52423          	sw	a5,8(a0)
    2d34:	01052783          	lw	a5,16(a0)
    2d38:	ffe7f793          	andi	a5,a5,-2
    2d3c:	0087e793          	ori	a5,a5,8
    2d40:	00f52823          	sw	a5,16(a0)
    2d44:	02000793          	li	a5,32
    2d48:	00f52a23          	sw	a5,20(a0)

00002d4c <.L1>:
    2d4c:	00c12403          	lw	s0,12(sp)
    2d50:	00812483          	lw	s1,8(sp)
    2d54:	01010113          	addi	sp,sp,16
    2d58:	00008067          	ret

00002d5c <.L17>:
    2d5c:	0008a683          	lw	a3,0(a7)
    2d60:	00160613          	addi	a2,a2,1
    2d64:	05c68863          	beq	a3,t3,2db4 <.L6>
    2d68:	04c52783          	lw	a5,76(a0)
    2d6c:	04de4863          	blt	t3,a3,2dbc <.L7>
    2d70:	01d68463          	beq	a3,t4,2d78 <.L10>
    2d74:	00decc63          	blt	t4,a3,2d8c <.L9>

00002d78 <.L10>:
    2d78:	00478693          	addi	a3,a5,4
    2d7c:	04d52623          	sw	a3,76(a0)
    2d80:	0007a783          	lw	a5,0(a5)
    2d84:	00f72023          	sw	a5,0(a4)
    2d88:	0280006f          	j	2db0 <.L16>

00002d8c <.L9>:
    2d8c:	fe8696e3          	bne	a3,s0,2d78 <.L10>

00002d90 <.L12>:
    2d90:	00778793          	addi	a5,a5,7
    2d94:	ff87f793          	andi	a5,a5,-8
    2d98:	00878693          	addi	a3,a5,8
    2d9c:	04d52623          	sw	a3,76(a0)
    2da0:	0007a303          	lw	t1,0(a5)
    2da4:	0047a383          	lw	t2,4(a5)
    2da8:	00672023          	sw	t1,0(a4)
    2dac:	00772223          	sw	t2,4(a4)

00002db0 <.L16>:
    2db0:	01070713          	addi	a4,a4,16

00002db4 <.L6>:
    2db4:	00488893          	addi	a7,a7,4
    2db8:	f69ff06f          	j	2d20 <.L5>

00002dbc <.L7>:
    2dbc:	80068593          	addi	a1,a3,-2048
    2dc0:	fc0588e3          	beqz	a1,2d90 <.L12>
    2dc4:	fadfdae3          	bge	t6,a3,2d78 <.L10>
    2dc8:	fb0698e3          	bne	a3,a6,2d78 <.L10>
    2dcc:	00478693          	addi	a3,a5,4
    2dd0:	04d52623          	sw	a3,76(a0)
    2dd4:	0007a783          	lw	a5,0(a5)
    2dd8:	0007a303          	lw	t1,0(a5)
    2ddc:	0047a583          	lw	a1,4(a5)
    2de0:	0087a683          	lw	a3,8(a5)
    2de4:	00c7a783          	lw	a5,12(a5)
    2de8:	00672023          	sw	t1,0(a4)
    2dec:	00b72223          	sw	a1,4(a4)
    2df0:	00d72423          	sw	a3,8(a4)
    2df4:	00f72623          	sw	a5,12(a4)
    2df8:	fb9ff06f          	j	2db0 <.L16>

00002dfc <.L2>:
    2dfc:	80000637          	lui	a2,0x80000
    2e00:	00c79c63          	bne	a5,a2,2e18 <.L19>
    2e04:	02454783          	lbu	a5,36(a0)
    2e08:	00479793          	slli	a5,a5,0x4
    2e0c:	00f707b3          	add	a5,a4,a5
    2e10:	ff07a783          	lw	a5,-16(a5)
    2e14:	00f52423          	sw	a5,8(a0)

00002e18 <.L19>:
    2e18:	800007b7          	lui	a5,0x80000
    2e1c:	00f69c63          	bne	a3,a5,2e34 <.L26>
    2e20:	02554783          	lbu	a5,37(a0)
    2e24:	00479793          	slli	a5,a5,0x4
    2e28:	00f70733          	add	a4,a4,a5
    2e2c:	ff072783          	lw	a5,-16(a4)
    2e30:	00f52223          	sw	a5,4(a0)

00002e34 <.L26>:
    2e34:	00852783          	lw	a5,8(a0)
    2e38:	0207d463          	bgez	a5,2e60 <.L28>
    2e3c:	40f007b3          	neg	a5,a5
    2e40:	00f52423          	sw	a5,8(a0)
    2e44:	01052783          	lw	a5,16(a0)
    2e48:	ffe7f793          	andi	a5,a5,-2
    2e4c:	0087e793          	ori	a5,a5,8
    2e50:	00f52823          	sw	a5,16(a0)
    2e54:	02000793          	li	a5,32
    2e58:	00f52a23          	sw	a5,20(a0)
    2e5c:	00008067          	ret

00002e60 <.L28>:
    2e60:	00008067          	ret

00002e64 <_promoted_size>:
    2e64:	98418793          	addi	a5,gp,-1660 # c0a4 <type_sizes>
    2e68:	96c18713          	addi	a4,gp,-1684 # c08c <type_codes>

00002e6c <.L3>:
    2e6c:	ffe79683          	lh	a3,-2(a5) # 7ffffffe <_ebss+0x7fff01ae>
    2e70:	ffe78793          	addi	a5,a5,-2
    2e74:	00a68463          	beq	a3,a0,2e7c <.L2>
    2e78:	fee79ae3          	bne	a5,a4,2e6c <.L3>

00002e7c <.L2>:
    2e7c:	40e787b3          	sub	a5,a5,a4
    2e80:	4017d793          	srai	a5,a5,0x1
    2e84:	00f70733          	add	a4,a4,a5
    2e88:	01874503          	lbu	a0,24(a4)
    2e8c:	00008067          	ret

00002e90 <_ppfs_parsespec>:
    2e90:	f9010113          	addi	sp,sp,-112
    2e94:	00800793          	li	a5,8
    2e98:	0cccd8b7          	lui	a7,0xcccd
    2e9c:	80000337          	lui	t1,0x80000
    2ea0:	00052703          	lw	a4,0(a0)
    2ea4:	06912223          	sw	s1,100(sp)
    2ea8:	07212023          	sw	s2,96(sp)
    2eac:	05312e23          	sw	s3,92(sp)
    2eb0:	05412c23          	sw	s4,88(sp)
    2eb4:	01852983          	lw	s3,24(a0)
    2eb8:	05512a23          	sw	s5,84(sp)
    2ebc:	00050493          	mv	s1,a0
    2ec0:	ccb88f93          	addi	t6,a7,-821 # ccccccb <_ebss+0xccbce7b>
    2ec4:	06112623          	sw	ra,108(sp)
    2ec8:	06812423          	sw	s0,104(sp)
    2ecc:	05612823          	sw	s6,80(sp)
    2ed0:	05712623          	sw	s7,76(sp)
    2ed4:	05812423          	sw	s8,72(sp)
    2ed8:	05912223          	sw	s9,68(sp)
    2edc:	05a12023          	sw	s10,64(sp)
    2ee0:	03b12e23          	sw	s11,60(sp)
    2ee4:	00012423          	sw	zero,8(sp)
    2ee8:	00012623          	sw	zero,12(sp)
    2eec:	00f12a23          	sw	a5,20(sp)
    2ef0:	00f12c23          	sw	a5,24(sp)
    2ef4:	0000bf17          	auipc	t5,0xb
    2ef8:	e7cf2f03          	lw	t5,-388(t5) # dd70 <__GI___ctype_b>
    2efc:	00000593          	li	a1,0
    2f00:	00000693          	li	a3,0
    2f04:	00000813          	li	a6,0
    2f08:	02a00513          	li	a0,42
    2f0c:	00a00293          	li	t0,10
    2f10:	ccc88893          	addi	a7,a7,-820
    2f14:	fff34313          	not	t1,t1
    2f18:	03700393          	li	t2,55
    2f1c:	02500e13          	li	t3,37
    2f20:	02e00913          	li	s2,46
    2f24:	02400e93          	li	t4,36
    2f28:	03000a13          	li	s4,48
    2f2c:	06d00a93          	li	s5,109

00002f30 <.L6>:
    2f30:	00074783          	lbu	a5,0(a4)
    2f34:	00070413          	mv	s0,a4
    2f38:	00a79c63          	bne	a5,a0,2f50 <.L7>
    2f3c:	00259793          	slli	a5,a1,0x2
    2f40:	03010613          	addi	a2,sp,48
    2f44:	40f607b3          	sub	a5,a2,a5
    2f48:	fe07a223          	sw	zero,-28(a5)
    2f4c:	00170413          	addi	s0,a4,1

00002f50 <.L7>:
    2f50:	00000793          	li	a5,0

00002f54 <.L8>:
    2f54:	00044603          	lbu	a2,0(s0)
    2f58:	00161b13          	slli	s6,a2,0x1
    2f5c:	016f0b33          	add	s6,t5,s6
    2f60:	000b5b03          	lhu	s6,0(s6)
    2f64:	008b7b13          	andi	s6,s6,8
    2f68:	040b1e63          	bnez	s6,2fc4 <.L11>
    2f6c:	fff74b03          	lbu	s6,-1(a4)
    2f70:	17cb1263          	bne	s6,t3,30d4 <.L12>
    2f74:	0dd61c63          	bne	a2,t4,304c <.L13>
    2f78:	0af05663          	blez	a5,3024 <.L14>
    2f7c:	00140713          	addi	a4,s0,1
    2f80:	06099663          	bnez	s3,2fec <.L15>

00002f84 <.L19>:
    2f84:	fff00513          	li	a0,-1

00002f88 <.L5>:
    2f88:	06c12083          	lw	ra,108(sp)
    2f8c:	06812403          	lw	s0,104(sp)
    2f90:	06412483          	lw	s1,100(sp)
    2f94:	06012903          	lw	s2,96(sp)
    2f98:	05c12983          	lw	s3,92(sp)
    2f9c:	05812a03          	lw	s4,88(sp)
    2fa0:	05412a83          	lw	s5,84(sp)
    2fa4:	05012b03          	lw	s6,80(sp)
    2fa8:	04c12b83          	lw	s7,76(sp)
    2fac:	04812c03          	lw	s8,72(sp)
    2fb0:	04412c83          	lw	s9,68(sp)
    2fb4:	04012d03          	lw	s10,64(sp)
    2fb8:	03c12d83          	lw	s11,60(sp)
    2fbc:	07010113          	addi	sp,sp,112
    2fc0:	00008067          	ret

00002fc4 <.L11>:
    2fc4:	00ffd663          	bge	t6,a5,2fd0 <.L9>
    2fc8:	01179e63          	bne	a5,a7,2fe4 <.L54>
    2fcc:	00c3ec63          	bltu	t2,a2,2fe4 <.L54>

00002fd0 <.L9>:
    2fd0:	025787b3          	mul	a5,a5,t0
    2fd4:	fd060613          	addi	a2,a2,-48 # 7fffffd0 <_ebss+0x7fff0180>
    2fd8:	00f607b3          	add	a5,a2,a5

00002fdc <.L10>:
    2fdc:	00140413          	addi	s0,s0,1
    2fe0:	f75ff06f          	j	2f54 <.L8>

00002fe4 <.L54>:
    2fe4:	00030793          	mv	a5,t1
    2fe8:	ff5ff06f          	j	2fdc <.L10>

00002fec <.L15>:
    2fec:	00f12823          	sw	a5,16(sp)
    2ff0:	00f9d463          	bge	s3,a5,2ff8 <.L18>
    2ff4:	00078993          	mv	s3,a5

00002ff8 <.L18>:
    2ff8:	00070413          	mv	s0,a4

00002ffc <.L25>:
    2ffc:	00044b03          	lbu	s6,0(s0)
    3000:	00100793          	li	a5,1
    3004:	0000b717          	auipc	a4,0xb
    3008:	a9c70713          	addi	a4,a4,-1380 # daa0 <spec_flags.5>

0000300c <.L26>:
    300c:	00074603          	lbu	a2,0(a4)
    3010:	00170713          	addi	a4,a4,1
    3014:	09661c63          	bne	a2,s6,30ac <.L24>
    3018:	00140413          	addi	s0,s0,1
    301c:	00f6e6b3          	or	a3,a3,a5
    3020:	fddff06f          	j	2ffc <.L25>

00003024 <.L14>:
    3024:	f73040e3          	bgtz	s3,2f84 <.L19>

00003028 <.L20>:
    3028:	00074603          	lbu	a2,0(a4)
    302c:	06877c63          	bgeu	a4,s0,30a4 <.L56>
    3030:	07460a63          	beq	a2,s4,30a4 <.L56>
    3034:	00000993          	li	s3,0
    3038:	04a61663          	bne	a2,a0,3084 <.L22>

0000303c <.L23>:
    303c:	00170713          	addi	a4,a4,1
    3040:	f4e412e3          	bne	s0,a4,2f84 <.L19>
    3044:	00000993          	li	s3,0
    3048:	0380006f          	j	3080 <.L74>

0000304c <.L13>:
    304c:	fd305ee3          	blez	s3,3028 <.L20>
    3050:	f3561ae3          	bne	a2,s5,2f84 <.L19>
    3054:	00074703          	lbu	a4,0(a4)
    3058:	02a71663          	bne	a4,a0,3084 <.L22>

0000305c <.L21>:
    305c:	00044703          	lbu	a4,0(s0)
    3060:	00140613          	addi	a2,s0,1
    3064:	f3d710e3          	bne	a4,t4,2f84 <.L19>
    3068:	f0f05ee3          	blez	a5,2f84 <.L19>
    306c:	03010413          	addi	s0,sp,48
    3070:	00259713          	slli	a4,a1,0x2
    3074:	40e40733          	sub	a4,s0,a4
    3078:	fcf72c23          	sw	a5,-40(a4)
    307c:	00060413          	mv	s0,a2

00003080 <.L74>:
    3080:	800007b7          	lui	a5,0x80000

00003084 <.L22>:
    3084:	00044b03          	lbu	s6,0(s0)
    3088:	06059263          	bnez	a1,30ec <.L28>
    308c:	052b1c63          	bne	s6,s2,30e4 <.L57>
    3090:	00140413          	addi	s0,s0,1
    3094:	00078813          	mv	a6,a5
    3098:	fff00593          	li	a1,-1

0000309c <.L27>:
    309c:	00040713          	mv	a4,s0
    30a0:	e91ff06f          	j	2f30 <.L6>

000030a4 <.L56>:
    30a4:	00000993          	li	s3,0
    30a8:	f51ff06f          	j	2ff8 <.L18>

000030ac <.L24>:
    30ac:	00074603          	lbu	a2,0(a4)
    30b0:	00179793          	slli	a5,a5,0x1
    30b4:	f4061ce3          	bnez	a2,300c <.L26>
    30b8:	4016d793          	srai	a5,a3,0x1
    30bc:	0057f793          	andi	a5,a5,5
    30c0:	fff7c793          	not	a5,a5
    30c4:	00f6f6b3          	and	a3,a3,a5
    30c8:	fff44783          	lbu	a5,-1(s0)
    30cc:	fdc798e3          	bne	a5,t3,309c <.L27>
    30d0:	00000793          	li	a5,0

000030d4 <.L12>:
    30d4:	00074603          	lbu	a2,0(a4)
    30d8:	faa616e3          	bne	a2,a0,3084 <.L22>
    30dc:	f60980e3          	beqz	s3,303c <.L23>
    30e0:	f7dff06f          	j	305c <.L21>

000030e4 <.L57>:
    30e4:	00078813          	mv	a6,a5
    30e8:	fff00793          	li	a5,-1

000030ec <.L28>:
    30ec:	99018713          	addi	a4,gp,-1648 # c0b0 <qual_chars.4>
    30f0:	00070613          	mv	a2,a4

000030f4 <.L31>:
    30f4:	00074583          	lbu	a1,0(a4)
    30f8:	1b659663          	bne	a1,s6,32a4 <.L29>
    30fc:	00140413          	addi	s0,s0,1

00003100 <.L30>:
    3100:	40c70633          	sub	a2,a4,a2
    3104:	00100513          	li	a0,1
    3108:	00044583          	lbu	a1,0(s0)
    310c:	00c54a63          	blt	a0,a2,3120 <.L32>
    3110:	00074603          	lbu	a2,0(a4)
    3114:	00b61663          	bne	a2,a1,3120 <.L32>
    3118:	00970713          	addi	a4,a4,9
    311c:	00140413          	addi	s0,s0,1

00003120 <.L32>:
    3120:	00974603          	lbu	a2,9(a4)
    3124:	00044583          	lbu	a1,0(s0)
    3128:	00861613          	slli	a2,a2,0x8
    312c:	e4058ce3          	beqz	a1,2f84 <.L19>
    3130:	0000b717          	auipc	a4,0xb
    3134:	95870713          	addi	a4,a4,-1704 # da88 <spec_chars.3>
    3138:	00070893          	mv	a7,a4

0000313c <.L37>:
    313c:	00074503          	lbu	a0,0(a4)
    3140:	16b51a63          	bne	a0,a1,32b4 <.L33>
    3144:	41170733          	sub	a4,a4,a7
    3148:	01100593          	li	a1,17
    314c:	00e5d863          	bge	a1,a4,315c <.L34>
    3150:	40067593          	andi	a1,a2,1024
    3154:	00058463          	beqz	a1,315c <.L34>
    3158:	ffe70713          	addi	a4,a4,-2

0000315c <.L34>:
    315c:	9a418513          	addi	a0,gp,-1628 # c0c4 <spec_ranges.2>
    3160:	02e4a023          	sw	a4,32(s1)
    3164:	00050893          	mv	a7,a0

00003168 <.L35>:
    3168:	00050593          	mv	a1,a0
    316c:	0005c303          	lbu	t1,0(a1) # 80000000 <_ebss+0x7fff01b0>
    3170:	00150513          	addi	a0,a0,1
    3174:	fee34ae3          	blt	t1,a4,3168 <.L35>
    3178:	411585b3          	sub	a1,a1,a7
    317c:	96c18713          	addi	a4,gp,-1684 # c08c <type_codes>
    3180:	00159593          	slli	a1,a1,0x1
    3184:	00b705b3          	add	a1,a4,a1
    3188:	04459703          	lh	a4,68(a1)
    318c:	05459583          	lh	a1,84(a1)
    3190:	00c76733          	or	a4,a4,a2
    3194:	00b77733          	and	a4,a4,a1
    3198:	00e12e23          	sw	a4,28(sp)
    319c:	0000b717          	auipc	a4,0xb
    31a0:	8ec70713          	addi	a4,a4,-1812 # da88 <spec_chars.3>

000031a4 <.L36>:
    31a4:	00044583          	lbu	a1,0(s0)
    31a8:	00f4a223          	sw	a5,4(s1)
    31ac:	0104a423          	sw	a6,8(s1)
    31b0:	00b4a623          	sw	a1,12(s1)
    31b4:	0046f793          	andi	a5,a3,4
    31b8:	03000593          	li	a1,48
    31bc:	00079463          	bnez	a5,31c4 <.L38>
    31c0:	02000593          	li	a1,32

000031c4 <.L38>:
    31c4:	000017b7          	lui	a5,0x1
    31c8:	f0078793          	addi	a5,a5,-256 # f00 <matrix_test+0x114>
    31cc:	00f67633          	and	a2,a2,a5
    31d0:	ffb6f693          	andi	a3,a3,-5
    31d4:	00100793          	li	a5,1
    31d8:	00c6e6b3          	or	a3,a3,a2
    31dc:	00b4aa23          	sw	a1,20(s1)
    31e0:	00d4a823          	sw	a3,16(s1)
    31e4:	00f4ae23          	sw	a5,28(s1)
    31e8:	00074783          	lbu	a5,0(a4)
    31ec:	00079e63          	bnez	a5,3208 <.L41>
    31f0:	00044703          	lbu	a4,0(s0)
    31f4:	06d00793          	li	a5,109
    31f8:	0cf71663          	bne	a4,a5,32c4 <.L40>
    31fc:	01400793          	li	a5,20
    3200:	02f4a023          	sw	a5,32(s1)
    3204:	0004ae23          	sw	zero,28(s1)

00003208 <.L41>:
    3208:	13305e63          	blez	s3,3344 <.L44>
    320c:	01410b93          	addi	s7,sp,20
    3210:	00810b13          	addi	s6,sp,8
    3214:	00000a13          	li	s4,0
    3218:	00200d13          	li	s10,2
    321c:	00900d93          	li	s11,9
    3220:	00800c93          	li	s9,8

00003224 <.L50>:
    3224:	114d4863          	blt	s10,s4,3334 <.L45>
    3228:	000b2783          	lw	a5,0(s6)
    322c:	01448733          	add	a4,s1,s4
    3230:	02f70223          	sb	a5,36(a4)
    3234:	0ff7f793          	zext.b	a5,a5

00003238 <.L46>:
    3238:	00f9d663          	bge	s3,a5,3244 <.L47>
    323c:	d4fdc4e3          	blt	s11,a5,2f84 <.L19>
    3240:	00078993          	mv	s3,a5

00003244 <.L47>:
    3244:	000baa83          	lw	s5,0(s7)
    3248:	039a8863          	beq	s5,s9,3278 <.L48>
    324c:	00279793          	slli	a5,a5,0x2
    3250:	00f48933          	add	s2,s1,a5
    3254:	02492503          	lw	a0,36(s2)
    3258:	01950e63          	beq	a0,s9,3274 <.L49>
    325c:	01550c63          	beq	a0,s5,3274 <.L49>
    3260:	c05ff0ef          	jal	ra,2e64 <_promoted_size>
    3264:	00050c13          	mv	s8,a0
    3268:	000a8513          	mv	a0,s5
    326c:	bf9ff0ef          	jal	ra,2e64 <_promoted_size>
    3270:	01854463          	blt	a0,s8,3278 <.L48>

00003274 <.L49>:
    3274:	03592223          	sw	s5,36(s2)

00003278 <.L48>:
    3278:	01c4a783          	lw	a5,28(s1)
    327c:	001a0713          	addi	a4,s4,1
    3280:	004b8b93          	addi	s7,s7,4
    3284:	004b0b13          	addi	s6,s6,4
    3288:	0b47d263          	bge	a5,s4,332c <.L59>

0000328c <.L51>:
    328c:	01c4a503          	lw	a0,28(s1)
    3290:	00140413          	addi	s0,s0,1
    3294:	0134ac23          	sw	s3,24(s1)
    3298:	0084a023          	sw	s0,0(s1)
    329c:	00250513          	addi	a0,a0,2
    32a0:	ce9ff06f          	j	2f88 <.L5>

000032a4 <.L29>:
    32a4:	00174583          	lbu	a1,1(a4)
    32a8:	00170713          	addi	a4,a4,1
    32ac:	e40594e3          	bnez	a1,30f4 <.L31>
    32b0:	e51ff06f          	j	3100 <.L30>

000032b4 <.L33>:
    32b4:	00174503          	lbu	a0,1(a4)
    32b8:	00170713          	addi	a4,a4,1
    32bc:	e80510e3          	bnez	a0,313c <.L37>
    32c0:	ee5ff06f          	j	31a4 <.L36>

000032c4 <.L40>:
    32c4:	01500793          	li	a5,21
    32c8:	02f4a023          	sw	a5,32(s1)
    32cc:	00044603          	lbu	a2,0(s0)
    32d0:	0000b717          	auipc	a4,0xb
    32d4:	a8872703          	lw	a4,-1400(a4) # dd58 <_custom_printf_spec>
    32d8:	00a70693          	addi	a3,a4,10
    32dc:	00070793          	mv	a5,a4

000032e0 <.L43>:
    32e0:	0007c583          	lbu	a1,0(a5)
    32e4:	02c59e63          	bne	a1,a2,3320 <.L42>
    32e8:	40e787b3          	sub	a5,a5,a4
    32ec:	00279793          	slli	a5,a5,0x2
    32f0:	0000d717          	auipc	a4,0xd
    32f4:	afc70713          	addi	a4,a4,-1284 # fdec <_custom_printf_arginfo>
    32f8:	00f707b3          	add	a5,a4,a5
    32fc:	0007a783          	lw	a5,0(a5)
    3300:	01c10613          	addi	a2,sp,28
    3304:	00500593          	li	a1,5
    3308:	00448513          	addi	a0,s1,4
    330c:	000780e7          	jalr	a5
    3310:	00a4ae23          	sw	a0,28(s1)
    3314:	00500793          	li	a5,5
    3318:	eea7d8e3          	bge	a5,a0,3208 <.L41>
    331c:	c69ff06f          	j	2f84 <.L19>

00003320 <.L42>:
    3320:	00178793          	addi	a5,a5,1
    3324:	faf69ee3          	bne	a3,a5,32e0 <.L43>
    3328:	c5dff06f          	j	2f84 <.L19>

0000332c <.L59>:
    332c:	00070a13          	mv	s4,a4
    3330:	ef5ff06f          	j	3224 <.L50>

00003334 <.L45>:
    3334:	01012703          	lw	a4,16(sp)
    3338:	ffea0793          	addi	a5,s4,-2
    333c:	00e787b3          	add	a5,a5,a4
    3340:	ef9ff06f          	j	3238 <.L46>

00003344 <.L44>:
    3344:	01c4a603          	lw	a2,28(s1)
    3348:	00100793          	li	a5,1
    334c:	02f48323          	sb	a5,38(s1)
    3350:	00261613          	slli	a2,a2,0x2
    3354:	01c10593          	addi	a1,sp,28
    3358:	02848513          	addi	a0,s1,40
    335c:	22c000ef          	jal	ra,3588 <__GI_memcpy>
    3360:	f2dff06f          	j	328c <.L51>

00003364 <__GI___fputc_unlocked>:
    3364:	0105a783          	lw	a5,16(a1)
    3368:	01c5a703          	lw	a4,28(a1)
    336c:	fe010113          	addi	sp,sp,-32
    3370:	00812c23          	sw	s0,24(sp)
    3374:	00912a23          	sw	s1,20(sp)
    3378:	00112e23          	sw	ra,28(sp)
    337c:	00050493          	mv	s1,a0
    3380:	00058413          	mv	s0,a1
    3384:	02e7f463          	bgeu	a5,a4,33ac <.L2>
    3388:	00178713          	addi	a4,a5,1
    338c:	00e5a823          	sw	a4,16(a1)
    3390:	00a78023          	sb	a0,0(a5)

00003394 <.L5>:
    3394:	0ff4f513          	zext.b	a0,s1

00003398 <.L1>:
    3398:	01c12083          	lw	ra,28(sp)
    339c:	01812403          	lw	s0,24(sp)
    33a0:	01412483          	lw	s1,20(sp)
    33a4:	02010113          	addi	sp,sp,32
    33a8:	00008067          	ret

000033ac <.L2>:
    33ac:	0005d783          	lhu	a5,0(a1)
    33b0:	0407f793          	andi	a5,a5,64
    33b4:	06078463          	beqz	a5,341c <.L4>

000033b8 <.L7>:
    33b8:	00442703          	lw	a4,4(s0)
    33bc:	ffd00793          	li	a5,-3
    33c0:	fcf70ae3          	beq	a4,a5,3394 <.L5>
    33c4:	00c42783          	lw	a5,12(s0)
    33c8:	00842703          	lw	a4,8(s0)
    33cc:	06e78a63          	beq	a5,a4,3440 <.L9>
    33d0:	01042703          	lw	a4,16(s0)
    33d4:	04e78e63          	beq	a5,a4,3430 <.L10>

000033d8 <.L14>:
    33d8:	01042783          	lw	a5,16(s0)
    33dc:	00178713          	addi	a4,a5,1
    33e0:	00e42823          	sw	a4,16(s0)
    33e4:	0ff4f713          	zext.b	a4,s1
    33e8:	00e78023          	sb	a4,0(a5)
    33ec:	00045783          	lhu	a5,0(s0)
    33f0:	1007f793          	andi	a5,a5,256
    33f4:	fa0780e3          	beqz	a5,3394 <.L5>
    33f8:	00a00793          	li	a5,10
    33fc:	f8f71ce3          	bne	a4,a5,3394 <.L5>
    3400:	00040513          	mv	a0,s0
    3404:	e85fe0ef          	jal	ra,2288 <__stdio_wcommit>
    3408:	f80506e3          	beqz	a0,3394 <.L5>
    340c:	01042783          	lw	a5,16(s0)
    3410:	fff78793          	addi	a5,a5,-1
    3414:	00f42823          	sw	a5,16(s0)
    3418:	0100006f          	j	3428 <.L8>

0000341c <.L4>:
    341c:	00058513          	mv	a0,a1
    3420:	39c020ef          	jal	ra,57bc <__stdio_trans2w>
    3424:	f8050ae3          	beqz	a0,33b8 <.L7>

00003428 <.L8>:
    3428:	fff00513          	li	a0,-1
    342c:	f6dff06f          	j	3398 <.L1>

00003430 <.L10>:
    3430:	00040513          	mv	a0,s0
    3434:	e55fe0ef          	jal	ra,2288 <__stdio_wcommit>
    3438:	fa0500e3          	beqz	a0,33d8 <.L14>
    343c:	fedff06f          	j	3428 <.L8>

00003440 <.L9>:
    3440:	00100613          	li	a2,1
    3444:	00f10593          	addi	a1,sp,15
    3448:	00040513          	mv	a0,s0
    344c:	009107a3          	sb	s1,15(sp)
    3450:	659010ef          	jal	ra,52a8 <__stdio_WRITE>
    3454:	f40510e3          	bnez	a0,3394 <.L5>
    3458:	fd1ff06f          	j	3428 <.L8>

0000345c <__GI_fputs>:
    345c:	fe010113          	addi	sp,sp,-32
    3460:	00812c23          	sw	s0,24(sp)
    3464:	00912a23          	sw	s1,20(sp)
    3468:	00112e23          	sw	ra,28(sp)
    346c:	00050493          	mv	s1,a0
    3470:	00b12623          	sw	a1,12(sp)
    3474:	464000ef          	jal	ra,38d8 <__GI_strlen>
    3478:	00c12683          	lw	a3,12(sp)
    347c:	00050413          	mv	s0,a0
    3480:	00050613          	mv	a2,a0
    3484:	00100593          	li	a1,1
    3488:	00048513          	mv	a0,s1
    348c:	020000ef          	jal	ra,34ac <__GI_fwrite>
    3490:	00850463          	beq	a0,s0,3498 <.L1>
    3494:	fff00513          	li	a0,-1

00003498 <.L1>:
    3498:	01c12083          	lw	ra,28(sp)
    349c:	01812403          	lw	s0,24(sp)
    34a0:	01412483          	lw	s1,20(sp)
    34a4:	02010113          	addi	sp,sp,32
    34a8:	00008067          	ret

000034ac <__GI_fwrite>:
    34ac:	0006d783          	lhu	a5,0(a3)
    34b0:	fe010113          	addi	sp,sp,-32
    34b4:	00812c23          	sw	s0,24(sp)
    34b8:	00912a23          	sw	s1,20(sp)
    34bc:	01212823          	sw	s2,16(sp)
    34c0:	01312623          	sw	s3,12(sp)
    34c4:	00112e23          	sw	ra,28(sp)
    34c8:	0407f793          	andi	a5,a5,64
    34cc:	00050993          	mv	s3,a0
    34d0:	00058493          	mv	s1,a1
    34d4:	00060913          	mv	s2,a2
    34d8:	00068413          	mv	s0,a3
    34dc:	02078463          	beqz	a5,3504 <.L2>

000034e0 <.L5>:
    34e0:	02049a63          	bnez	s1,3514 <.L3>

000034e4 <.L10>:
    34e4:	00000513          	li	a0,0

000034e8 <.L1>:
    34e8:	01c12083          	lw	ra,28(sp)
    34ec:	01812403          	lw	s0,24(sp)
    34f0:	01412483          	lw	s1,20(sp)
    34f4:	01012903          	lw	s2,16(sp)
    34f8:	00c12983          	lw	s3,12(sp)
    34fc:	02010113          	addi	sp,sp,32
    3500:	00008067          	ret

00003504 <.L2>:
    3504:	00068513          	mv	a0,a3
    3508:	2b4020ef          	jal	ra,57bc <__stdio_trans2w>
    350c:	fc050ae3          	beqz	a0,34e0 <.L5>
    3510:	fd5ff06f          	j	34e4 <.L10>

00003514 <.L3>:
    3514:	fc0908e3          	beqz	s2,34e4 <.L10>
    3518:	0324b7b3          	mulhu	a5,s1,s2
    351c:	00079e63          	bnez	a5,3538 <.L9>
    3520:	032485b3          	mul	a1,s1,s2
    3524:	00040613          	mv	a2,s0
    3528:	00098513          	mv	a0,s3
    352c:	140020ef          	jal	ra,566c <__stdio_fwrite>
    3530:	02955533          	divu	a0,a0,s1
    3534:	fb5ff06f          	j	34e8 <.L1>

00003538 <.L9>:
    3538:	00045783          	lhu	a5,0(s0)
    353c:	01600713          	li	a4,22
    3540:	0087e793          	ori	a5,a5,8
    3544:	00f41023          	sh	a5,0(s0)
    3548:	00009797          	auipc	a5,0x9
    354c:	94c7a783          	lw	a5,-1716(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    3550:	00e7a023          	sw	a4,0(a5)
    3554:	f91ff06f          	j	34e4 <.L10>

00003558 <putchar>:
    3558:	00009717          	auipc	a4,0x9
    355c:	93472703          	lw	a4,-1740(a4) # be8c <_GLOBAL_OFFSET_TABLE_+0x4>
    3560:	00072583          	lw	a1,0(a4)
    3564:	0105a703          	lw	a4,16(a1)
    3568:	01c5a683          	lw	a3,28(a1)
    356c:	00d76463          	bltu	a4,a3,3574 <.L5>
    3570:	df5ff06f          	j	3364 <__GI___fputc_unlocked>

00003574 <.L5>:
    3574:	00170693          	addi	a3,a4,1
    3578:	00d5a823          	sw	a3,16(a1)
    357c:	00a70023          	sb	a0,0(a4)
    3580:	0ff57513          	zext.b	a0,a0
    3584:	00008067          	ret

00003588 <__GI_memcpy>:
    3588:	00f00713          	li	a4,15
    358c:	00050693          	mv	a3,a0
    3590:	00058793          	mv	a5,a1
    3594:	16c77a63          	bgeu	a4,a2,3708 <.L2>
    3598:	40a007b3          	neg	a5,a0
    359c:	0037f793          	andi	a5,a5,3
    35a0:	40f60633          	sub	a2,a2,a5
    35a4:	00000713          	li	a4,0

000035a8 <.L3>:
    35a8:	04e79463          	bne	a5,a4,35f0 <.L4>
    35ac:	00f585b3          	add	a1,a1,a5
    35b0:	00f508b3          	add	a7,a0,a5
    35b4:	0035fe13          	andi	t3,a1,3
    35b8:	00088793          	mv	a5,a7
    35bc:	00265713          	srli	a4,a2,0x2
    35c0:	140e1a63          	bnez	t3,3714 <.L5>
    35c4:	00777693          	andi	a3,a4,7
    35c8:	fff68693          	addi	a3,a3,-1
    35cc:	00600313          	li	t1,6
    35d0:	0005a803          	lw	a6,0(a1)
    35d4:	0ed36863          	bltu	t1,a3,36c4 <.L6>
    35d8:	9d018313          	addi	t1,gp,-1584 # c0f0 <.L8>
    35dc:	00269693          	slli	a3,a3,0x2
    35e0:	006686b3          	add	a3,a3,t1
    35e4:	0006a683          	lw	a3,0(a3)
    35e8:	006686b3          	add	a3,a3,t1
    35ec:	00068067          	jr	a3

000035f0 <.L4>:
    35f0:	00e586b3          	add	a3,a1,a4
    35f4:	0006c803          	lbu	a6,0(a3)
    35f8:	00e506b3          	add	a3,a0,a4
    35fc:	00170713          	addi	a4,a4,1
    3600:	01068023          	sb	a6,0(a3)
    3604:	fa5ff06f          	j	35a8 <.L3>

00003608 <.L13>:
    3608:	fe858693          	addi	a3,a1,-24
    360c:	fe488793          	addi	a5,a7,-28
    3610:	00670713          	addi	a4,a4,6

00003614 <.L15>:
    3614:	01c6a303          	lw	t1,28(a3)
    3618:	ff870713          	addi	a4,a4,-8
    361c:	0107ae23          	sw	a6,28(a5)
    3620:	02078813          	addi	a6,a5,32
    3624:	0c070863          	beqz	a4,36f4 <.L23>
    3628:	00080793          	mv	a5,a6
    362c:	02068693          	addi	a3,a3,32
    3630:	00030813          	mv	a6,t1
    3634:	0b00006f          	j	36e4 <.L22>

00003638 <.L12>:
    3638:	fec58693          	addi	a3,a1,-20
    363c:	fe888793          	addi	a5,a7,-24
    3640:	00570713          	addi	a4,a4,5

00003644 <.L16>:
    3644:	0186a303          	lw	t1,24(a3)
    3648:	0107ac23          	sw	a6,24(a5)
    364c:	00030813          	mv	a6,t1
    3650:	fc5ff06f          	j	3614 <.L15>

00003654 <.L11>:
    3654:	ff058693          	addi	a3,a1,-16
    3658:	fec88793          	addi	a5,a7,-20
    365c:	00470713          	addi	a4,a4,4

00003660 <.L17>:
    3660:	0146a303          	lw	t1,20(a3)
    3664:	0107aa23          	sw	a6,20(a5)
    3668:	00030813          	mv	a6,t1
    366c:	fd9ff06f          	j	3644 <.L16>

00003670 <.L10>:
    3670:	ff458693          	addi	a3,a1,-12
    3674:	ff088793          	addi	a5,a7,-16
    3678:	00370713          	addi	a4,a4,3

0000367c <.L18>:
    367c:	0106a303          	lw	t1,16(a3)
    3680:	0107a823          	sw	a6,16(a5)
    3684:	00030813          	mv	a6,t1
    3688:	fd9ff06f          	j	3660 <.L17>

0000368c <.L9>:
    368c:	ff858693          	addi	a3,a1,-8
    3690:	ff488793          	addi	a5,a7,-12
    3694:	00270713          	addi	a4,a4,2

00003698 <.L19>:
    3698:	00c6a303          	lw	t1,12(a3)
    369c:	0107a623          	sw	a6,12(a5)
    36a0:	00030813          	mv	a6,t1
    36a4:	fd9ff06f          	j	367c <.L18>

000036a8 <.L7>:
    36a8:	ffc58693          	addi	a3,a1,-4
    36ac:	ff888793          	addi	a5,a7,-8
    36b0:	00170713          	addi	a4,a4,1

000036b4 <.L20>:
    36b4:	0086a303          	lw	t1,8(a3)
    36b8:	0107a423          	sw	a6,8(a5)
    36bc:	00030813          	mv	a6,t1
    36c0:	fd9ff06f          	j	3698 <.L19>

000036c4 <.L6>:
    36c4:	00058693          	mv	a3,a1
    36c8:	ffc88793          	addi	a5,a7,-4

000036cc <.L21>:
    36cc:	0046a303          	lw	t1,4(a3)
    36d0:	0107a223          	sw	a6,4(a5)
    36d4:	00030813          	mv	a6,t1
    36d8:	fddff06f          	j	36b4 <.L20>

000036dc <.L14>:
    36dc:	00458693          	addi	a3,a1,4
    36e0:	fff70713          	addi	a4,a4,-1

000036e4 <.L22>:
    36e4:	0006a303          	lw	t1,0(a3)
    36e8:	0107a023          	sw	a6,0(a5)
    36ec:	00030813          	mv	a6,t1
    36f0:	fddff06f          	j	36cc <.L21>

000036f4 <.L23>:
    36f4:	0267a023          	sw	t1,32(a5)

000036f8 <.L24>:
    36f8:	ffc67693          	andi	a3,a2,-4
    36fc:	00b687b3          	add	a5,a3,a1
    3700:	00367613          	andi	a2,a2,3
    3704:	011686b3          	add	a3,a3,a7

00003708 <.L2>:
    3708:	00000713          	li	a4,0

0000370c <.L34>:
    370c:	10e61663          	bne	a2,a4,3818 <.L35>
    3710:	00008067          	ret

00003714 <.L5>:
    3714:	ffc5fe93          	andi	t4,a1,-4
    3718:	003e1e13          	slli	t3,t3,0x3
    371c:	02000f93          	li	t6,32
    3720:	00377f13          	andi	t5,a4,3
    3724:	00200293          	li	t0,2
    3728:	000ea683          	lw	a3,0(t4)
    372c:	004ea803          	lw	a6,4(t4)
    3730:	41cf8fb3          	sub	t6,t6,t3
    3734:	004e8313          	addi	t1,t4,4
    3738:	025f0e63          	beq	t5,t0,3774 <.L25>
    373c:	00300293          	li	t0,3
    3740:	065f0a63          	beq	t5,t0,37b4 <.L26>
    3744:	00100293          	li	t0,1
    3748:	085f1c63          	bne	t5,t0,37e0 <.L36>
    374c:	008e8313          	addi	t1,t4,8
    3750:	fff70713          	addi	a4,a4,-1

00003754 <.L32>:
    3754:	00032e83          	lw	t4,0(t1) # 80000000 <_ebss+0x7fff01b0>
    3758:	01f81f33          	sll	t5,a6,t6
    375c:	01c6d6b3          	srl	a3,a3,t3
    3760:	01e6e6b3          	or	a3,a3,t5
    3764:	00d7a023          	sw	a3,0(a5)
    3768:	00080693          	mv	a3,a6
    376c:	000e8813          	mv	a6,t4
    3770:	0740006f          	j	37e4 <.L31>

00003774 <.L25>:
    3774:	ffce8313          	addi	t1,t4,-4
    3778:	ff488793          	addi	a5,a7,-12
    377c:	00270713          	addi	a4,a4,2

00003780 <.L29>:
    3780:	01c6d6b3          	srl	a3,a3,t3
    3784:	01f81f33          	sll	t5,a6,t6
    3788:	01e6e6b3          	or	a3,a3,t5
    378c:	00c32e83          	lw	t4,12(t1)
    3790:	ffc70713          	addi	a4,a4,-4
    3794:	00d7a623          	sw	a3,12(a5)
    3798:	01078693          	addi	a3,a5,16
    379c:	06070463          	beqz	a4,3804 <.L33>
    37a0:	00068793          	mv	a5,a3
    37a4:	01030313          	addi	t1,t1,16
    37a8:	00080693          	mv	a3,a6
    37ac:	000e8813          	mv	a6,t4
    37b0:	fa5ff06f          	j	3754 <.L32>

000037b4 <.L26>:
    37b4:	000e8313          	mv	t1,t4
    37b8:	ff888793          	addi	a5,a7,-8
    37bc:	00170713          	addi	a4,a4,1

000037c0 <.L30>:
    37c0:	00832e83          	lw	t4,8(t1)
    37c4:	01f81f33          	sll	t5,a6,t6
    37c8:	01c6d6b3          	srl	a3,a3,t3
    37cc:	01e6e6b3          	or	a3,a3,t5
    37d0:	00d7a423          	sw	a3,8(a5)
    37d4:	00080693          	mv	a3,a6
    37d8:	000e8813          	mv	a6,t4
    37dc:	fa5ff06f          	j	3780 <.L29>

000037e0 <.L36>:
    37e0:	ffc88793          	addi	a5,a7,-4

000037e4 <.L31>:
    37e4:	00432e83          	lw	t4,4(t1)
    37e8:	01f81f33          	sll	t5,a6,t6
    37ec:	01c6d6b3          	srl	a3,a3,t3
    37f0:	01e6e6b3          	or	a3,a3,t5
    37f4:	00d7a223          	sw	a3,4(a5)
    37f8:	00080693          	mv	a3,a6
    37fc:	000e8813          	mv	a6,t4
    3800:	fc1ff06f          	j	37c0 <.L30>

00003804 <.L33>:
    3804:	01c85833          	srl	a6,a6,t3
    3808:	01fe9eb3          	sll	t4,t4,t6
    380c:	01d86833          	or	a6,a6,t4
    3810:	0107a823          	sw	a6,16(a5)
    3814:	ee5ff06f          	j	36f8 <.L24>

00003818 <.L35>:
    3818:	00e785b3          	add	a1,a5,a4
    381c:	0005c803          	lbu	a6,0(a1)
    3820:	00e685b3          	add	a1,a3,a4
    3824:	00170713          	addi	a4,a4,1
    3828:	01058023          	sb	a6,0(a1)
    382c:	ee1ff06f          	j	370c <.L34>

00003830 <__GI_memset>:
    3830:	00700713          	li	a4,7
    3834:	00050793          	mv	a5,a0
    3838:	04c77463          	bgeu	a4,a2,3880 <.L2>
    383c:	010106b7          	lui	a3,0x1010
    3840:	0ff5f713          	zext.b	a4,a1
    3844:	10168693          	addi	a3,a3,257 # 1010101 <_ebss+0x10002b1>
    3848:	02d70733          	mul	a4,a4,a3
    384c:	0ff5f813          	zext.b	a6,a1

00003850 <.L3>:
    3850:	0037f693          	andi	a3,a5,3
    3854:	02069c63          	bnez	a3,388c <.L4>
    3858:	00c50633          	add	a2,a0,a2
    385c:	40f60633          	sub	a2,a2,a5
    3860:	fe067813          	andi	a6,a2,-32
    3864:	00f80833          	add	a6,a6,a5
    3868:	00080693          	mv	a3,a6

0000386c <.L5>:
    386c:	03079663          	bne	a5,a6,3898 <.L6>
    3870:	01c67813          	andi	a6,a2,28
    3874:	00f807b3          	add	a5,a6,a5

00003878 <.L7>:
    3878:	04f69463          	bne	a3,a5,38c0 <.L8>
    387c:	00367613          	andi	a2,a2,3

00003880 <.L2>:
    3880:	00c78633          	add	a2,a5,a2

00003884 <.L9>:
    3884:	04c79463          	bne	a5,a2,38cc <.L10>
    3888:	00008067          	ret

0000388c <.L4>:
    388c:	01078023          	sb	a6,0(a5)
    3890:	00178793          	addi	a5,a5,1
    3894:	fbdff06f          	j	3850 <.L3>

00003898 <.L6>:
    3898:	00e7a023          	sw	a4,0(a5)
    389c:	00e7a223          	sw	a4,4(a5)
    38a0:	00e7a423          	sw	a4,8(a5)
    38a4:	00e7a623          	sw	a4,12(a5)
    38a8:	00e7a823          	sw	a4,16(a5)
    38ac:	00e7aa23          	sw	a4,20(a5)
    38b0:	00e7ac23          	sw	a4,24(a5)
    38b4:	00e7ae23          	sw	a4,28(a5)
    38b8:	02078793          	addi	a5,a5,32
    38bc:	fb1ff06f          	j	386c <.L5>

000038c0 <.L8>:
    38c0:	00e6a023          	sw	a4,0(a3)
    38c4:	00468693          	addi	a3,a3,4
    38c8:	fb1ff06f          	j	3878 <.L7>

000038cc <.L10>:
    38cc:	00b78023          	sb	a1,0(a5)
    38d0:	00178793          	addi	a5,a5,1
    38d4:	fb1ff06f          	j	3884 <.L9>

000038d8 <__GI_strlen>:
    38d8:	00050793          	mv	a5,a0

000038dc <.L2>:
    38dc:	0037f713          	andi	a4,a5,3
    38e0:	04071263          	bnez	a4,3924 <.L5>
    38e4:	feff0637          	lui	a2,0xfeff0
    38e8:	808085b7          	lui	a1,0x80808
    38ec:	eff60613          	addi	a2,a2,-257 # fefefeff <_ebss+0xfefe00af>
    38f0:	08058593          	addi	a1,a1,128 # 80808080 <_ebss+0x807f8230>

000038f4 <.L6>:
    38f4:	0007a683          	lw	a3,0(a5)
    38f8:	00478713          	addi	a4,a5,4
    38fc:	00c686b3          	add	a3,a3,a2
    3900:	00b6f6b3          	and	a3,a3,a1
    3904:	02068c63          	beqz	a3,393c <.L7>
    3908:	ffc74683          	lbu	a3,-4(a4)
    390c:	02068063          	beqz	a3,392c <.L14>
    3910:	ffd74683          	lbu	a3,-3(a4)
    3914:	02069863          	bnez	a3,3944 <.L9>
    3918:	40a787b3          	sub	a5,a5,a0
    391c:	00178513          	addi	a0,a5,1
    3920:	00008067          	ret

00003924 <.L5>:
    3924:	0007c703          	lbu	a4,0(a5)
    3928:	00071663          	bnez	a4,3934 <.L3>

0000392c <.L14>:
    392c:	40a78533          	sub	a0,a5,a0
    3930:	00008067          	ret

00003934 <.L3>:
    3934:	00178793          	addi	a5,a5,1
    3938:	fa5ff06f          	j	38dc <.L2>

0000393c <.L7>:
    393c:	00070793          	mv	a5,a4
    3940:	fb5ff06f          	j	38f4 <.L6>

00003944 <.L9>:
    3944:	ffe74683          	lbu	a3,-2(a4)
    3948:	00069863          	bnez	a3,3958 <.L10>
    394c:	40a787b3          	sub	a5,a5,a0
    3950:	00278513          	addi	a0,a5,2
    3954:	00008067          	ret

00003958 <.L10>:
    3958:	fff74683          	lbu	a3,-1(a4)
    395c:	fe0690e3          	bnez	a3,393c <.L7>
    3960:	40a787b3          	sub	a5,a5,a0
    3964:	00378513          	addi	a0,a5,3
    3968:	00008067          	ret

0000396c <__GI_strnlen>:
    396c:	00050713          	mv	a4,a0
    3970:	00058513          	mv	a0,a1
    3974:	06058a63          	beqz	a1,39e8 <.L2>
    3978:	00b705b3          	add	a1,a4,a1
    397c:	00e5f463          	bgeu	a1,a4,3984 <.L3>
    3980:	fff00593          	li	a1,-1

00003984 <.L3>:
    3984:	00070793          	mv	a5,a4

00003988 <.L4>:
    3988:	0037f693          	andi	a3,a5,3
    398c:	04069463          	bnez	a3,39d4 <.L7>
    3990:	feff0537          	lui	a0,0xfeff0
    3994:	80808837          	lui	a6,0x80808
    3998:	00078693          	mv	a3,a5
    399c:	eff50513          	addi	a0,a0,-257 # fefefeff <_ebss+0xfefe00af>
    39a0:	08080813          	addi	a6,a6,128 # 80808080 <_ebss+0x807f8230>

000039a4 <.L8>:
    39a4:	02b6fc63          	bgeu	a3,a1,39dc <.L10>
    39a8:	0006a783          	lw	a5,0(a3)
    39ac:	00468613          	addi	a2,a3,4
    39b0:	00a787b3          	add	a5,a5,a0
    39b4:	0107f7b3          	and	a5,a5,a6
    39b8:	04078e63          	beqz	a5,3a14 <.L17>
    39bc:	ffc64783          	lbu	a5,-4(a2)
    39c0:	06078063          	beqz	a5,3a20 <.L16>
    39c4:	ffd64783          	lbu	a5,-3(a2)
    39c8:	02079663          	bnez	a5,39f4 <.L11>
    39cc:	00168793          	addi	a5,a3,1
    39d0:	00c0006f          	j	39dc <.L10>

000039d4 <.L7>:
    39d4:	0007c683          	lbu	a3,0(a5)
    39d8:	00069a63          	bnez	a3,39ec <.L5>

000039dc <.L10>:
    39dc:	00b7f463          	bgeu	a5,a1,39e4 <.L14>
    39e0:	00078593          	mv	a1,a5

000039e4 <.L14>:
    39e4:	40e58533          	sub	a0,a1,a4

000039e8 <.L2>:
    39e8:	00008067          	ret

000039ec <.L5>:
    39ec:	00178793          	addi	a5,a5,1
    39f0:	f99ff06f          	j	3988 <.L4>

000039f4 <.L11>:
    39f4:	ffe64783          	lbu	a5,-2(a2)
    39f8:	00079663          	bnez	a5,3a04 <.L12>
    39fc:	00268793          	addi	a5,a3,2
    3a00:	fddff06f          	j	39dc <.L10>

00003a04 <.L12>:
    3a04:	fff64783          	lbu	a5,-1(a2)
    3a08:	00079663          	bnez	a5,3a14 <.L17>
    3a0c:	00368793          	addi	a5,a3,3
    3a10:	fcdff06f          	j	39dc <.L10>

00003a14 <.L17>:
    3a14:	00058793          	mv	a5,a1
    3a18:	00060693          	mv	a3,a2
    3a1c:	f89ff06f          	j	39a4 <.L8>

00003a20 <.L16>:
    3a20:	00068793          	mv	a5,a3
    3a24:	fb9ff06f          	j	39dc <.L10>

00003a28 <__GI___glibc_strerror_r>:
    3a28:	ff010113          	addi	sp,sp,-16
    3a2c:	00812423          	sw	s0,8(sp)
    3a30:	00112623          	sw	ra,12(sp)
    3a34:	00058413          	mv	s0,a1
    3a38:	018000ef          	jal	ra,3a50 <__GI___xpg_strerror_r>
    3a3c:	00c12083          	lw	ra,12(sp)
    3a40:	00040513          	mv	a0,s0
    3a44:	00812403          	lw	s0,8(sp)
    3a48:	01010113          	addi	sp,sp,16
    3a4c:	00008067          	ret

00003a50 <__GI___xpg_strerror_r>:
    3a50:	fa010113          	addi	sp,sp,-96
    3a54:	04812c23          	sw	s0,88(sp)
    3a58:	05312623          	sw	s3,76(sp)
    3a5c:	04112e23          	sw	ra,92(sp)
    3a60:	04912a23          	sw	s1,84(sp)
    3a64:	05212823          	sw	s2,80(sp)
    3a68:	05412423          	sw	s4,72(sp)
    3a6c:	07c00793          	li	a5,124
    3a70:	00058413          	mv	s0,a1
    3a74:	00060993          	mv	s3,a2
    3a78:	0aa7f063          	bgeu	a5,a0,3b18 <.L13>

00003a7c <.L3>:
    3a7c:	00050593          	mv	a1,a0
    3a80:	41f55613          	srai	a2,a0,0x1f
    3a84:	00000713          	li	a4,0
    3a88:	ff600693          	li	a3,-10
    3a8c:	03d10513          	addi	a0,sp,61
    3a90:	6b9010ef          	jal	ra,5948 <_uintmaxtostr>
    3a94:	ff250493          	addi	s1,a0,-14
    3a98:	00e00613          	li	a2,14
    3a9c:	0000a597          	auipc	a1,0xa
    3aa0:	00c58593          	addi	a1,a1,12 # daa8 <unknown.0>
    3aa4:	00048513          	mv	a0,s1
    3aa8:	ae1ff0ef          	jal	ra,3588 <__GI_memcpy>
    3aac:	01600913          	li	s2,22
    3ab0:	01c0006f          	j	3acc <.L6>

00003ab4 <.L5>:
    3ab4:	00079463          	bnez	a5,3abc <.L4>
    3ab8:	fff90913          	addi	s2,s2,-1

00003abc <.L4>:
    3abc:	00148493          	addi	s1,s1,1

00003ac0 <.L2>:
    3ac0:	0004c783          	lbu	a5,0(s1)
    3ac4:	fe0918e3          	bnez	s2,3ab4 <.L5>
    3ac8:	fa078ae3          	beqz	a5,3a7c <.L3>

00003acc <.L6>:
    3acc:	00048513          	mv	a0,s1
    3ad0:	e09ff0ef          	jal	ra,38d8 <__GI_strlen>
    3ad4:	00050a13          	mv	s4,a0
    3ad8:	00150613          	addi	a2,a0,1
    3adc:	04041663          	bnez	s0,3b28 <.L7>
    3ae0:	08060263          	beqz	a2,3b64 <.L9>

00003ae4 <.L8>:
    3ae4:	02200913          	li	s2,34

00003ae8 <.L11>:
    3ae8:	00008797          	auipc	a5,0x8
    3aec:	3ac7a783          	lw	a5,940(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    3af0:	0127a023          	sw	s2,0(a5)

00003af4 <.L1>:
    3af4:	05c12083          	lw	ra,92(sp)
    3af8:	05812403          	lw	s0,88(sp)
    3afc:	05412483          	lw	s1,84(sp)
    3b00:	04c12983          	lw	s3,76(sp)
    3b04:	04812a03          	lw	s4,72(sp)
    3b08:	00090513          	mv	a0,s2
    3b0c:	05012903          	lw	s2,80(sp)
    3b10:	06010113          	addi	sp,sp,96
    3b14:	00008067          	ret

00003b18 <.L13>:
    3b18:	00050913          	mv	s2,a0
    3b1c:	00008497          	auipc	s1,0x8
    3b20:	5f048493          	addi	s1,s1,1520 # c10c <_string_syserrmsgs>
    3b24:	f9dff06f          	j	3ac0 <.L2>

00003b28 <.L7>:
    3b28:	02c9f263          	bgeu	s3,a2,3b4c <.L10>
    3b2c:	fa098ce3          	beqz	s3,3ae4 <.L8>
    3b30:	00040513          	mv	a0,s0
    3b34:	00098613          	mv	a2,s3
    3b38:	00048593          	mv	a1,s1
    3b3c:	01340433          	add	s0,s0,s3
    3b40:	a49ff0ef          	jal	ra,3588 <__GI_memcpy>
    3b44:	fe040fa3          	sb	zero,-1(s0)
    3b48:	f9dff06f          	j	3ae4 <.L8>

00003b4c <.L10>:
    3b4c:	00060c63          	beqz	a2,3b64 <.L9>
    3b50:	00040513          	mv	a0,s0
    3b54:	00048593          	mv	a1,s1
    3b58:	01440433          	add	s0,s0,s4
    3b5c:	a2dff0ef          	jal	ra,3588 <__GI_memcpy>
    3b60:	00040023          	sb	zero,0(s0)

00003b64 <.L9>:
    3b64:	f80908e3          	beqz	s2,3af4 <.L1>
    3b68:	01600913          	li	s2,22
    3b6c:	f7dff06f          	j	3ae8 <.L11>

00003b70 <__GI_isatty>:
    3b70:	fb010113          	addi	sp,sp,-80
    3b74:	00410593          	addi	a1,sp,4
    3b78:	04112623          	sw	ra,76(sp)
    3b7c:	014000ef          	jal	ra,3b90 <__GI_tcgetattr>
    3b80:	04c12083          	lw	ra,76(sp)
    3b84:	00153513          	seqz	a0,a0
    3b88:	05010113          	addi	sp,sp,80
    3b8c:	00008067          	ret

00003b90 <__GI_tcgetattr>:
    3b90:	fc010113          	addi	sp,sp,-64
    3b94:	02812c23          	sw	s0,56(sp)
    3b98:	00058413          	mv	s0,a1
    3b9c:	000055b7          	lui	a1,0x5
    3ba0:	00c10613          	addi	a2,sp,12
    3ba4:	40158593          	addi	a1,a1,1025 # 5401 <.L14+0x11>
    3ba8:	02912a23          	sw	s1,52(sp)
    3bac:	02112e23          	sw	ra,60(sp)
    3bb0:	6c1000ef          	jal	ra,4a70 <__GI_ioctl>
    3bb4:	00050493          	mv	s1,a0
    3bb8:	04051463          	bnez	a0,3c00 <.L1>
    3bbc:	00c12783          	lw	a5,12(sp)
    3bc0:	01300613          	li	a2,19
    3bc4:	01d10593          	addi	a1,sp,29
    3bc8:	00f42023          	sw	a5,0(s0)
    3bcc:	01012783          	lw	a5,16(sp)
    3bd0:	01140513          	addi	a0,s0,17
    3bd4:	00f42223          	sw	a5,4(s0)
    3bd8:	01412783          	lw	a5,20(sp)
    3bdc:	00f42423          	sw	a5,8(s0)
    3be0:	01812783          	lw	a5,24(sp)
    3be4:	00f42623          	sw	a5,12(s0)
    3be8:	01c14783          	lbu	a5,28(sp)
    3bec:	00f40823          	sb	a5,16(s0)
    3bf0:	611020ef          	jal	ra,6a00 <__GI_mempcpy>
    3bf4:	00d00613          	li	a2,13
    3bf8:	00000593          	li	a1,0
    3bfc:	c35ff0ef          	jal	ra,3830 <__GI_memset>

00003c00 <.L1>:
    3c00:	03c12083          	lw	ra,60(sp)
    3c04:	03812403          	lw	s0,56(sp)
    3c08:	00048513          	mv	a0,s1
    3c0c:	03412483          	lw	s1,52(sp)
    3c10:	04010113          	addi	sp,sp,64
    3c14:	00008067          	ret

00003c18 <__malloc_from_heap>:
    3c18:	fd010113          	addi	sp,sp,-48
    3c1c:	01412c23          	sw	s4,24(sp)
    3c20:	01512a23          	sw	s5,20(sp)
    3c24:	00058a13          	mv	s4,a1
    3c28:	00850513          	addi	a0,a0,8
    3c2c:	00c10a93          	addi	s5,sp,12
    3c30:	00a12623          	sw	a0,12(sp)
    3c34:	000a8593          	mv	a1,s5
    3c38:	000a0513          	mv	a0,s4
    3c3c:	03212023          	sw	s2,32(sp)
    3c40:	02112623          	sw	ra,44(sp)
    3c44:	02812423          	sw	s0,40(sp)
    3c48:	02912223          	sw	s1,36(sp)
    3c4c:	01312e23          	sw	s3,28(sp)
    3c50:	354000ef          	jal	ra,3fa4 <__heap_alloc>
    3c54:	00050913          	mv	s2,a0
    3c58:	0a051863          	bnez	a0,3d08 <.L2>
    3c5c:	00050493          	mv	s1,a0
    3c60:	01e00513          	li	a0,30
    3c64:	6e0000ef          	jal	ra,4344 <__GI_sysconf>
    3c68:	00c12783          	lw	a5,12(sp)
    3c6c:	0ca7f863          	bgeu	a5,a0,3d3c <.L3>
    3c70:	01e00513          	li	a0,30
    3c74:	6d0000ef          	jal	ra,4344 <__GI_sysconf>
    3c78:	00050413          	mv	s0,a0

00003c7c <.L4>:
    3c7c:	040006b7          	lui	a3,0x4000
    3c80:	00000793          	li	a5,0
    3c84:	00000713          	li	a4,0
    3c88:	02168693          	addi	a3,a3,33 # 4000021 <_ebss+0x3ff01d1>
    3c8c:	00300613          	li	a2,3
    3c90:	00040593          	mv	a1,s0
    3c94:	00000513          	li	a0,0
    3c98:	629000ef          	jal	ra,4ac0 <__GI_mmap>
    3c9c:	fff00793          	li	a5,-1
    3ca0:	00050993          	mv	s3,a0
    3ca4:	06f50863          	beq	a0,a5,3d14 <.L1>
    3ca8:	00040613          	mv	a2,s0
    3cac:	00050593          	mv	a1,a0
    3cb0:	000a0513          	mv	a0,s4
    3cb4:	378000ef          	jal	ra,402c <__heap_free>
    3cb8:	000a8593          	mv	a1,s5
    3cbc:	000a0513          	mv	a0,s4
    3cc0:	2e4000ef          	jal	ra,3fa4 <__heap_alloc>
    3cc4:	00050913          	mv	s2,a0
    3cc8:	00008597          	auipc	a1,0x8
    3ccc:	20c5a583          	lw	a1,524(a1) # bed4 <.LLST21+0x22>
    3cd0:	00c00513          	li	a0,12
    3cd4:	f45ff0ef          	jal	ra,3c18 <__malloc_from_heap>
    3cd8:	00008617          	auipc	a2,0x8
    3cdc:	1c462603          	lw	a2,452(a2) # be9c <_GLOBAL_OFFSET_TABLE_+0x14>
    3ce0:	00062703          	lw	a4,0(a2)
    3ce4:	00050793          	mv	a5,a0
    3ce8:	00000693          	li	a3,0

00003cec <.L7>:
    3cec:	06071c63          	bnez	a4,3d64 <.L9>

00003cf0 <.L8>:
    3cf0:	00e7a423          	sw	a4,8(a5)
    3cf4:	0137a023          	sw	s3,0(a5)
    3cf8:	0087a223          	sw	s0,4(a5)
    3cfc:	06068e63          	beqz	a3,3d78 <.L10>
    3d00:	00f6a423          	sw	a5,8(a3)

00003d04 <.L11>:
    3d04:	00090863          	beqz	s2,3d14 <.L1>

00003d08 <.L2>:
    3d08:	00c12783          	lw	a5,12(sp)
    3d0c:	00890493          	addi	s1,s2,8
    3d10:	00f92023          	sw	a5,0(s2)

00003d14 <.L1>:
    3d14:	02c12083          	lw	ra,44(sp)
    3d18:	02812403          	lw	s0,40(sp)
    3d1c:	02012903          	lw	s2,32(sp)
    3d20:	01c12983          	lw	s3,28(sp)
    3d24:	01812a03          	lw	s4,24(sp)
    3d28:	01412a83          	lw	s5,20(sp)
    3d2c:	00048513          	mv	a0,s1
    3d30:	02412483          	lw	s1,36(sp)
    3d34:	03010113          	addi	sp,sp,48
    3d38:	00008067          	ret

00003d3c <.L3>:
    3d3c:	01e00513          	li	a0,30
    3d40:	604000ef          	jal	ra,4344 <__GI_sysconf>
    3d44:	00c12903          	lw	s2,12(sp)
    3d48:	fff90913          	addi	s2,s2,-1
    3d4c:	00a90933          	add	s2,s2,a0
    3d50:	01e00513          	li	a0,30
    3d54:	5f0000ef          	jal	ra,4344 <__GI_sysconf>
    3d58:	40a00433          	neg	s0,a0
    3d5c:	01247433          	and	s0,s0,s2
    3d60:	f1dff06f          	j	3c7c <.L4>

00003d64 <.L9>:
    3d64:	00072583          	lw	a1,0(a4)
    3d68:	f8b9e4e3          	bltu	s3,a1,3cf0 <.L8>
    3d6c:	00070693          	mv	a3,a4
    3d70:	00872703          	lw	a4,8(a4)
    3d74:	f79ff06f          	j	3cec <.L7>

00003d78 <.L10>:
    3d78:	00f62023          	sw	a5,0(a2)
    3d7c:	f89ff06f          	j	3d04 <.L11>

00003d80 <malloc>:
    3d80:	02050263          	beqz	a0,3da4 <.L23>
    3d84:	ff000793          	li	a5,-16
    3d88:	02a7f063          	bgeu	a5,a0,3da8 <.L20>
    3d8c:	00008797          	auipc	a5,0x8
    3d90:	1087a783          	lw	a5,264(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    3d94:	00c00713          	li	a4,12
    3d98:	00e7a023          	sw	a4,0(a5)
    3d9c:	00000513          	li	a0,0
    3da0:	00008067          	ret

00003da4 <.L23>:
    3da4:	00100513          	li	a0,1

00003da8 <.L20>:
    3da8:	ff010113          	addi	sp,sp,-16
    3dac:	0000a597          	auipc	a1,0xa
    3db0:	fb058593          	addi	a1,a1,-80 # dd5c <__malloc_heap>
    3db4:	00112623          	sw	ra,12(sp)
    3db8:	e61ff0ef          	jal	ra,3c18 <__malloc_from_heap>
    3dbc:	00051c63          	bnez	a0,3dd4 <.L19>
    3dc0:	00008797          	auipc	a5,0x8
    3dc4:	0d47a783          	lw	a5,212(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    3dc8:	00c00713          	li	a4,12
    3dcc:	00e7a023          	sw	a4,0(a5)
    3dd0:	00000513          	li	a0,0

00003dd4 <.L19>:
    3dd4:	00c12083          	lw	ra,12(sp)
    3dd8:	01010113          	addi	sp,sp,16
    3ddc:	00008067          	ret

00003de0 <__free_to_heap>:
    3de0:	1a050a63          	beqz	a0,3f94 <.L24>
    3de4:	fd010113          	addi	sp,sp,-48
    3de8:	ff852603          	lw	a2,-8(a0)
    3dec:	03212023          	sw	s2,32(sp)
    3df0:	00058913          	mv	s2,a1
    3df4:	ff850593          	addi	a1,a0,-8
    3df8:	00090513          	mv	a0,s2
    3dfc:	02112623          	sw	ra,44(sp)
    3e00:	02812423          	sw	s0,40(sp)
    3e04:	02912223          	sw	s1,36(sp)
    3e08:	01312e23          	sw	s3,28(sp)
    3e0c:	01412c23          	sw	s4,24(sp)
    3e10:	01512a23          	sw	s5,20(sp)
    3e14:	01612823          	sw	s6,16(sp)
    3e18:	01712623          	sw	s7,12(sp)
    3e1c:	01812423          	sw	s8,8(sp)
    3e20:	01912223          	sw	s9,4(sp)
    3e24:	01a12023          	sw	s10,0(sp)
    3e28:	204000ef          	jal	ra,402c <__heap_free>
    3e2c:	00052483          	lw	s1,0(a0)
    3e30:	00050413          	mv	s0,a0
    3e34:	01e00513          	li	a0,30
    3e38:	50c000ef          	jal	ra,4344 <__GI_sysconf>
    3e3c:	00351513          	slli	a0,a0,0x3
    3e40:	10a4ee63          	bltu	s1,a0,3f5c <.L1>
    3e44:	00042783          	lw	a5,0(s0)
    3e48:	00c40493          	addi	s1,s0,12
    3e4c:	40f407b3          	sub	a5,s0,a5
    3e50:	00c78593          	addi	a1,a5,12
    3e54:	00442783          	lw	a5,4(s0)
    3e58:	00078663          	beqz	a5,3e64 <.L5>
    3e5c:	00842703          	lw	a4,8(s0)
    3e60:	00e7a423          	sw	a4,8(a5)

00003e64 <.L5>:
    3e64:	00842703          	lw	a4,8(s0)
    3e68:	08070a63          	beqz	a4,3efc <.L6>
    3e6c:	00f72223          	sw	a5,4(a4)

00003e70 <.L7>:
    3e70:	00008c17          	auipc	s8,0x8
    3e74:	02cc2c03          	lw	s8,44(s8) # be9c <_GLOBAL_OFFSET_TABLE_+0x14>
    3e78:	000c2403          	lw	s0,0(s8)
    3e7c:	00000a93          	li	s5,0
    3e80:	00008c97          	auipc	s9,0x8
    3e84:	054cac83          	lw	s9,84(s9) # bed4 <.LLST21+0x22>
    3e88:	03000d13          	li	s10,48

00003e8c <.L8>:
    3e8c:	02040663          	beqz	s0,3eb8 <.L12>
    3e90:	00042a03          	lw	s4,0(s0)
    3e94:	00442b83          	lw	s7,4(s0)
    3e98:	014b89b3          	add	s3,s7,s4
    3e9c:	0134ee63          	bltu	s1,s3,3eb8 <.L12>
    3ea0:	00842b03          	lw	s6,8(s0)
    3ea4:	0aba6263          	bltu	s4,a1,3f48 <.L9>
    3ea8:	05459e63          	bne	a1,s4,3f04 <.L10>
    3eac:	07348a63          	beq	s1,s3,3f20 <.L11>
    3eb0:	03098793          	addi	a5,s3,48
    3eb4:	06f4f663          	bgeu	s1,a5,3f20 <.L11>

00003eb8 <.L12>:
    3eb8:	0a958263          	beq	a1,s1,3f5c <.L1>
    3ebc:	02812403          	lw	s0,40(sp)
    3ec0:	02c12083          	lw	ra,44(sp)
    3ec4:	01c12983          	lw	s3,28(sp)
    3ec8:	01812a03          	lw	s4,24(sp)
    3ecc:	01412a83          	lw	s5,20(sp)
    3ed0:	01012b03          	lw	s6,16(sp)
    3ed4:	00c12b83          	lw	s7,12(sp)
    3ed8:	00812c03          	lw	s8,8(sp)
    3edc:	00412c83          	lw	s9,4(sp)
    3ee0:	00012d03          	lw	s10,0(sp)
    3ee4:	40b48633          	sub	a2,s1,a1
    3ee8:	00090513          	mv	a0,s2
    3eec:	02412483          	lw	s1,36(sp)
    3ef0:	02012903          	lw	s2,32(sp)
    3ef4:	03010113          	addi	sp,sp,48
    3ef8:	1340006f          	j	402c <__heap_free>

00003efc <.L6>:
    3efc:	00f92023          	sw	a5,0(s2)
    3f00:	f71ff06f          	j	3e70 <.L7>

00003f04 <.L10>:
    3f04:	40ba0633          	sub	a2,s4,a1
    3f08:	04cd7063          	bgeu	s10,a2,3f48 <.L9>
    3f0c:	01348663          	beq	s1,s3,3f18 <.L13>
    3f10:	03098793          	addi	a5,s3,48
    3f14:	faf4e2e3          	bltu	s1,a5,3eb8 <.L12>

00003f18 <.L13>:
    3f18:	00090513          	mv	a0,s2
    3f1c:	110000ef          	jal	ra,402c <__heap_free>

00003f20 <.L11>:
    3f20:	020a8a63          	beqz	s5,3f54 <.L14>
    3f24:	016aa423          	sw	s6,8(s5)

00003f28 <.L15>:
    3f28:	00040513          	mv	a0,s0
    3f2c:	000c8593          	mv	a1,s9
    3f30:	eb1ff0ef          	jal	ra,3de0 <__free_to_heap>
    3f34:	000b8593          	mv	a1,s7
    3f38:	000a0513          	mv	a0,s4
    3f3c:	3cd000ef          	jal	ra,4b08 <__GI_munmap>
    3f40:	000a8413          	mv	s0,s5
    3f44:	00098593          	mv	a1,s3

00003f48 <.L9>:
    3f48:	00040a93          	mv	s5,s0
    3f4c:	000b0413          	mv	s0,s6
    3f50:	f3dff06f          	j	3e8c <.L8>

00003f54 <.L14>:
    3f54:	016c2023          	sw	s6,0(s8)
    3f58:	fd1ff06f          	j	3f28 <.L15>

00003f5c <.L1>:
    3f5c:	02c12083          	lw	ra,44(sp)
    3f60:	02812403          	lw	s0,40(sp)
    3f64:	02412483          	lw	s1,36(sp)
    3f68:	02012903          	lw	s2,32(sp)
    3f6c:	01c12983          	lw	s3,28(sp)
    3f70:	01812a03          	lw	s4,24(sp)
    3f74:	01412a83          	lw	s5,20(sp)
    3f78:	01012b03          	lw	s6,16(sp)
    3f7c:	00c12b83          	lw	s7,12(sp)
    3f80:	00812c03          	lw	s8,8(sp)
    3f84:	00412c83          	lw	s9,4(sp)
    3f88:	00012d03          	lw	s10,0(sp)
    3f8c:	03010113          	addi	sp,sp,48
    3f90:	00008067          	ret

00003f94 <.L24>:
    3f94:	00008067          	ret

00003f98 <free>:
    3f98:	0000a597          	auipc	a1,0xa
    3f9c:	dc458593          	addi	a1,a1,-572 # dd5c <__malloc_heap>
    3fa0:	e41ff06f          	j	3de0 <__free_to_heap>

00003fa4 <__heap_alloc>:
    3fa4:	0005a783          	lw	a5,0(a1)
    3fa8:	00b00713          	li	a4,11
    3fac:	00050693          	mv	a3,a0
    3fb0:	00778793          	addi	a5,a5,7
    3fb4:	ff87f793          	andi	a5,a5,-8
    3fb8:	00f76463          	bltu	a4,a5,3fc0 <.L2>
    3fbc:	01000793          	li	a5,16

00003fc0 <.L2>:
    3fc0:	0006a503          	lw	a0,0(a3)

00003fc4 <.L3>:
    3fc4:	00051463          	bnez	a0,3fcc <.L11>
    3fc8:	00008067          	ret

00003fcc <.L11>:
    3fcc:	00052703          	lw	a4,0(a0)
    3fd0:	04f76a63          	bltu	a4,a5,4024 <.L4>
    3fd4:	40e50633          	sub	a2,a0,a4
    3fd8:	03078813          	addi	a6,a5,48
    3fdc:	00c60613          	addi	a2,a2,12
    3fe0:	03077a63          	bgeu	a4,a6,4014 <.L5>
    3fe4:	00452783          	lw	a5,4(a0)
    3fe8:	00078663          	beqz	a5,3ff4 <.L6>
    3fec:	00852803          	lw	a6,8(a0)
    3ff0:	0107a423          	sw	a6,8(a5)

00003ff4 <.L6>:
    3ff4:	00852503          	lw	a0,8(a0)
    3ff8:	00050a63          	beqz	a0,400c <.L7>
    3ffc:	00f52223          	sw	a5,4(a0)

00004000 <.L9>:
    4000:	00e5a023          	sw	a4,0(a1)
    4004:	00060513          	mv	a0,a2
    4008:	00008067          	ret

0000400c <.L7>:
    400c:	00f6a023          	sw	a5,0(a3)
    4010:	ff1ff06f          	j	4000 <.L9>

00004014 <.L5>:
    4014:	40f70733          	sub	a4,a4,a5
    4018:	00e52023          	sw	a4,0(a0)
    401c:	00078713          	mv	a4,a5
    4020:	fe1ff06f          	j	4000 <.L9>

00004024 <.L4>:
    4024:	00452503          	lw	a0,4(a0)
    4028:	f9dff06f          	j	3fc4 <.L3>

0000402c <__heap_free>:
    402c:	00050693          	mv	a3,a0
    4030:	00052503          	lw	a0,0(a0)
    4034:	00c58333          	add	t1,a1,a2
    4038:	00000793          	li	a5,0

0000403c <.L2>:
    403c:	02051863          	bnez	a0,406c <.L4>

00004040 <.L5>:
    4040:	ff460713          	addi	a4,a2,-12
    4044:	00e585b3          	add	a1,a1,a4
    4048:	00c5a023          	sw	a2,0(a1)
    404c:	00a5a223          	sw	a0,4(a1)
    4050:	00f5a423          	sw	a5,8(a1)
    4054:	0a078863          	beqz	a5,4104 <.L19>
    4058:	00b7a223          	sw	a1,4(a5)

0000405c <.L20>:
    405c:	00050463          	beqz	a0,4064 <.L21>
    4060:	00b52423          	sw	a1,8(a0)

00004064 <.L21>:
    4064:	00058513          	mv	a0,a1
    4068:	00008067          	ret

0000406c <.L4>:
    406c:	00c50713          	addi	a4,a0,12
    4070:	08b77e63          	bgeu	a4,a1,410c <.L3>
    4074:	00050793          	mv	a5,a0
    4078:	00452503          	lw	a0,4(a0)
    407c:	fc1ff06f          	j	403c <.L2>

00004080 <.L8>:
    4080:	00a6a023          	sw	a0,0(a3)
    4084:	0c40006f          	j	4148 <.L9>

00004088 <.L6>:
    4088:	00452703          	lw	a4,4(a0)
    408c:	02070a63          	beqz	a4,40c0 <.L10>
    4090:	00072583          	lw	a1,0(a4)
    4094:	40b888b3          	sub	a7,a7,a1
    4098:	011708b3          	add	a7,a4,a7
    409c:	03131e63          	bne	t1,a7,40d8 <.L11>
    40a0:	00b80833          	add	a6,a6,a1
    40a4:	00078a63          	beqz	a5,40b8 <.L12>
    40a8:	00e7a223          	sw	a4,4(a5)

000040ac <.L13>:
    40ac:	00f72423          	sw	a5,8(a4)
    40b0:	00070513          	mv	a0,a4
    40b4:	0980006f          	j	414c <.L7>

000040b8 <.L12>:
    40b8:	00e6a023          	sw	a4,0(a3)
    40bc:	ff1ff06f          	j	40ac <.L13>

000040c0 <.L10>:
    40c0:	00c50533          	add	a0,a0,a2
    40c4:	00052223          	sw	zero,4(a0)
    40c8:	00f52423          	sw	a5,8(a0)
    40cc:	02078863          	beqz	a5,40fc <.L14>
    40d0:	00a7a223          	sw	a0,4(a5)
    40d4:	0780006f          	j	414c <.L7>

000040d8 <.L11>:
    40d8:	00c50533          	add	a0,a0,a2
    40dc:	00e52223          	sw	a4,4(a0)
    40e0:	00f52423          	sw	a5,8(a0)
    40e4:	00078863          	beqz	a5,40f4 <.L16>
    40e8:	00a7a223          	sw	a0,4(a5)

000040ec <.L17>:
    40ec:	00a72423          	sw	a0,8(a4)
    40f0:	05c0006f          	j	414c <.L7>

000040f4 <.L16>:
    40f4:	00a6a023          	sw	a0,0(a3)
    40f8:	ff5ff06f          	j	40ec <.L17>

000040fc <.L14>:
    40fc:	00a6a023          	sw	a0,0(a3)
    4100:	04c0006f          	j	414c <.L7>

00004104 <.L19>:
    4104:	00b6a023          	sw	a1,0(a3)
    4108:	f55ff06f          	j	405c <.L20>

0000410c <.L3>:
    410c:	00052803          	lw	a6,0(a0)
    4110:	00c00893          	li	a7,12
    4114:	41088733          	sub	a4,a7,a6
    4118:	00e50733          	add	a4,a0,a4
    411c:	f2e362e3          	bltu	t1,a4,4040 <.L5>
    4120:	00c80833          	add	a6,a6,a2
    4124:	f66712e3          	bne	a4,t1,4088 <.L6>
    4128:	02078263          	beqz	a5,414c <.L7>
    412c:	00c78713          	addi	a4,a5,12
    4130:	00e59e63          	bne	a1,a4,414c <.L7>
    4134:	0007a703          	lw	a4,0(a5)
    4138:	0087a783          	lw	a5,8(a5)
    413c:	00e80833          	add	a6,a6,a4
    4140:	f40780e3          	beqz	a5,4080 <.L8>
    4144:	00a7a223          	sw	a0,4(a5)

00004148 <.L9>:
    4148:	00f52423          	sw	a5,8(a0)

0000414c <.L7>:
    414c:	01052023          	sw	a6,0(a0)
    4150:	00008067          	ret

00004154 <nprocessors_onln>:
    4154:	fd010113          	addi	sp,sp,-48
    4158:	0000a517          	auipc	a0,0xa
    415c:	96050513          	addi	a0,a0,-1696 # dab8 <.LC0>
    4160:	02912223          	sw	s1,36(sp)
    4164:	02112623          	sw	ra,44(sp)
    4168:	02812423          	sw	s0,40(sp)
    416c:	03212023          	sw	s2,32(sp)
    4170:	01312e23          	sw	s3,28(sp)
    4174:	01412c23          	sw	s4,24(sp)
    4178:	01512a23          	sw	s5,20(sp)
    417c:	00012623          	sw	zero,12(sp)
    4180:	46d000ef          	jal	ra,4dec <__GI_config_open>
    4184:	00000493          	li	s1,0
    4188:	0a050a63          	beqz	a0,423c <.L19>
    418c:	00050413          	mv	s0,a0
    4190:	00c10913          	addi	s2,sp,12
    4194:	0000a997          	auipc	s3,0xa
    4198:	93098993          	addi	s3,s3,-1744 # dac4 <.LC1>
    419c:	06300a13          	li	s4,99
    41a0:	07000a93          	li	s5,112

000041a4 <.L2>:
    41a4:	00098693          	mv	a3,s3
    41a8:	10200613          	li	a2,258
    41ac:	00090593          	mv	a1,s2
    41b0:	00040513          	mv	a0,s0
    41b4:	4c9000ef          	jal	ra,4e7c <__GI_config_read>
    41b8:	02051c63          	bnez	a0,41f0 <.L5>

000041bc <.L6>:
    41bc:	00040513          	mv	a0,s0
    41c0:	479000ef          	jal	ra,4e38 <__GI_config_close>
    41c4:	0e048063          	beqz	s1,42a4 <.L8>

000041c8 <.L1>:
    41c8:	02c12083          	lw	ra,44(sp)
    41cc:	02812403          	lw	s0,40(sp)
    41d0:	02012903          	lw	s2,32(sp)
    41d4:	01c12983          	lw	s3,28(sp)
    41d8:	01812a03          	lw	s4,24(sp)
    41dc:	01412a83          	lw	s5,20(sp)
    41e0:	00048513          	mv	a0,s1
    41e4:	02412483          	lw	s1,36(sp)
    41e8:	03010113          	addi	sp,sp,48
    41ec:	00008067          	ret

000041f0 <.L5>:
    41f0:	00c12783          	lw	a5,12(sp)
    41f4:	0007a783          	lw	a5,0(a5)
    41f8:	0007c703          	lbu	a4,0(a5)
    41fc:	fb4714e3          	bne	a4,s4,41a4 <.L2>
    4200:	0017c703          	lbu	a4,1(a5)
    4204:	fb5710e3          	bne	a4,s5,41a4 <.L2>
    4208:	0027c683          	lbu	a3,2(a5)
    420c:	07500713          	li	a4,117
    4210:	f8e69ae3          	bne	a3,a4,41a4 <.L2>
    4214:	0037c703          	lbu	a4,3(a5)
    4218:	0000a797          	auipc	a5,0xa
    421c:	b587a783          	lw	a5,-1192(a5) # dd70 <__GI___ctype_b>
    4220:	00171713          	slli	a4,a4,0x1
    4224:	00e787b3          	add	a5,a5,a4
    4228:	0007d783          	lhu	a5,0(a5)
    422c:	0087f793          	andi	a5,a5,8
    4230:	f6078ae3          	beqz	a5,41a4 <.L2>
    4234:	00148493          	addi	s1,s1,1
    4238:	f6dff06f          	j	41a4 <.L2>

0000423c <.L19>:
    423c:	0000a517          	auipc	a0,0xa
    4240:	88c50513          	addi	a0,a0,-1908 # dac8 <.LC2>
    4244:	3a9000ef          	jal	ra,4dec <__GI_config_open>
    4248:	00050413          	mv	s0,a0
    424c:	04050a63          	beqz	a0,42a0 <.L20>
    4250:	00070937          	lui	s2,0x70
    4254:	00c10993          	addi	s3,sp,12
    4258:	00009a17          	auipc	s4,0x9
    425c:	d8ca0a13          	addi	s4,s4,-628 # cfe4 <.LANCHOR0>
    4260:	20290913          	addi	s2,s2,514 # 70202 <_ebss+0x603b2>
    4264:	0000aa97          	auipc	s5,0xa
    4268:	874a8a93          	addi	s5,s5,-1932 # dad8 <.LC3>

0000426c <.L7>:
    426c:	000a0693          	mv	a3,s4
    4270:	00090613          	mv	a2,s2
    4274:	00098593          	mv	a1,s3
    4278:	00040513          	mv	a0,s0
    427c:	401000ef          	jal	ra,4e7c <__GI_config_read>
    4280:	f2050ee3          	beqz	a0,41bc <.L6>
    4284:	00c12783          	lw	a5,12(sp)
    4288:	000a8513          	mv	a0,s5
    428c:	0007a583          	lw	a1,0(a5)
    4290:	1dd020ef          	jal	ra,6c6c <__GI_strcmp>
    4294:	fc051ce3          	bnez	a0,426c <.L7>
    4298:	00148493          	addi	s1,s1,1
    429c:	fd1ff06f          	j	426c <.L7>

000042a0 <.L20>:
    42a0:	399000ef          	jal	ra,4e38 <__GI_config_close>

000042a4 <.L8>:
    42a4:	00100493          	li	s1,1
    42a8:	f21ff06f          	j	41c8 <.L1>

000042ac <get_phys_pages>:
    42ac:	fb010113          	addi	sp,sp,-80
    42b0:	04112623          	sw	ra,76(sp)
    42b4:	04812423          	sw	s0,72(sp)
    42b8:	74c000ef          	jal	ra,4a04 <__GI_getpagesize>
    42bc:	00050413          	mv	s0,a0
    42c0:	00010513          	mv	a0,sp
    42c4:	06d000ef          	jal	ra,4b30 <sysinfo>
    42c8:	03412783          	lw	a5,52(sp)
    42cc:	01012503          	lw	a0,16(sp)
    42d0:	00f46e63          	bltu	s0,a5,42ec <.L23>
    42d4:	02f45433          	divu	s0,s0,a5
    42d8:	02855533          	divu	a0,a0,s0

000042dc <.L22>:
    42dc:	04c12083          	lw	ra,76(sp)
    42e0:	04812403          	lw	s0,72(sp)
    42e4:	05010113          	addi	sp,sp,80
    42e8:	00008067          	ret

000042ec <.L23>:
    42ec:	0287d7b3          	divu	a5,a5,s0
    42f0:	02a78533          	mul	a0,a5,a0
    42f4:	fe9ff06f          	j	42dc <.L22>

000042f8 <get_avphys_pages>:
    42f8:	fb010113          	addi	sp,sp,-80
    42fc:	04112623          	sw	ra,76(sp)
    4300:	04812423          	sw	s0,72(sp)
    4304:	700000ef          	jal	ra,4a04 <__GI_getpagesize>
    4308:	00050413          	mv	s0,a0
    430c:	00010513          	mv	a0,sp
    4310:	021000ef          	jal	ra,4b30 <sysinfo>
    4314:	03412783          	lw	a5,52(sp)
    4318:	01412503          	lw	a0,20(sp)
    431c:	00f46e63          	bltu	s0,a5,4338 <.L27>
    4320:	02f45433          	divu	s0,s0,a5
    4324:	02855533          	divu	a0,a0,s0

00004328 <.L26>:
    4328:	04c12083          	lw	ra,76(sp)
    432c:	04812403          	lw	s0,72(sp)
    4330:	05010113          	addi	sp,sp,80
    4334:	00008067          	ret

00004338 <.L27>:
    4338:	0287d7b3          	divu	a5,a5,s0
    433c:	02a78533          	mul	a0,a5,a0
    4340:	fe9ff06f          	j	4328 <.L26>

00004344 <__GI_sysconf>:
    4344:	fd010113          	addi	sp,sp,-48
    4348:	02112623          	sw	ra,44(sp)
    434c:	02812423          	sw	s0,40(sp)
    4350:	02912223          	sw	s1,36(sp)
    4354:	03212023          	sw	s2,32(sp)
    4358:	01312e23          	sw	s3,28(sp)
    435c:	01412c23          	sw	s4,24(sp)
    4360:	01512a23          	sw	s5,20(sp)
    4364:	0f000793          	li	a5,240
    4368:	04a7c663          	blt	a5,a0,43b4 <.L31>
    436c:	01600793          	li	a5,22
    4370:	00050413          	mv	s0,a0
    4374:	04a7cc63          	blt	a5,a0,43cc <.L32>
    4378:	00500793          	li	a5,5
    437c:	02a7da63          	bge	a5,a0,43b0 <.L33>
    4380:	00100793          	li	a5,1
    4384:	0041d737          	lui	a4,0x41d
    4388:	00a797b3          	sll	a5,a5,a0
    438c:	f8070713          	addi	a4,a4,-128 # 41cf80 <_ebss+0x40d130>
    4390:	00e7f733          	and	a4,a5,a4
    4394:	1a071c63          	bnez	a4,454c <.L34>
    4398:	003e3737          	lui	a4,0x3e3
    439c:	00e7f7b3          	and	a5,a5,a4
    43a0:	02079263          	bnez	a5,43c4 <.L37>
    43a4:	00600793          	li	a5,6
    43a8:	04f50663          	beq	a0,a5,43f4 <.L49>
    43ac:	0080006f          	j	43b4 <.L31>

000043b0 <.L33>:
    43b0:	06055663          	bgez	a0,441c <.L36>

000043b4 <.L31>:
    43b4:	00008797          	auipc	a5,0x8
    43b8:	ae07a783          	lw	a5,-1312(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    43bc:	01600713          	li	a4,22
    43c0:	00e7a023          	sw	a4,0(a5)

000043c4 <.L37>:
    43c4:	fff00413          	li	s0,-1
    43c8:	02c0006f          	j	43f4 <.L49>

000043cc <.L32>:
    43cc:	fe950413          	addi	s0,a0,-23
    43d0:	0d900793          	li	a5,217
    43d4:	fe87e0e3          	bltu	a5,s0,43b4 <.L31>
    43d8:	54818713          	addi	a4,gp,1352 # cc68 <.L38>
    43dc:	00241413          	slli	s0,s0,0x2
    43e0:	00e40433          	add	s0,s0,a4
    43e4:	00042783          	lw	a5,0(s0)
    43e8:	00e787b3          	add	a5,a5,a4
    43ec:	00078067          	jr	a5

000043f0 <.L67>:
    43f0:	00008437          	lui	s0,0x8

000043f4 <.L49>:
    43f4:	02c12083          	lw	ra,44(sp)
    43f8:	00040513          	mv	a0,s0
    43fc:	02812403          	lw	s0,40(sp)
    4400:	02412483          	lw	s1,36(sp)
    4404:	02012903          	lw	s2,32(sp)
    4408:	01c12983          	lw	s3,28(sp)
    440c:	01812a03          	lw	s4,24(sp)
    4410:	01412a83          	lw	s5,20(sp)
    4414:	03010113          	addi	sp,sp,48
    4418:	00008067          	ret

0000441c <.L36>:
    441c:	fff50413          	addi	s0,a0,-1
    4420:	00400793          	li	a5,4
    4424:	0287e463          	bltu	a5,s0,444c <.L68>
    4428:	00009717          	auipc	a4,0x9
    442c:	ba870713          	addi	a4,a4,-1112 # cfd0 <.L70>
    4430:	00241413          	slli	s0,s0,0x2
    4434:	00e40433          	add	s0,s0,a4
    4438:	00042783          	lw	a5,0(s0) # 8000 <.LVL164>
    443c:	00e787b3          	add	a5,a5,a4
    4440:	00078067          	jr	a5

00004444 <.L72>:
    4444:	06400413          	li	s0,100
    4448:	fadff06f          	j	43f4 <.L49>

0000444c <.L68>:
    444c:	00810593          	addi	a1,sp,8
    4450:	00300513          	li	a0,3
    4454:	5bc000ef          	jal	ra,4a10 <__GI_getrlimit>
    4458:	00020437          	lui	s0,0x20
    445c:	f8051ce3          	bnez	a0,43f4 <.L49>
    4460:	00812783          	lw	a5,8(sp)
    4464:	00080737          	lui	a4,0x80
    4468:	f8e7e6e3          	bltu	a5,a4,43f4 <.L49>
    446c:	0027d413          	srli	s0,a5,0x2
    4470:	f85ff06f          	j	43f4 <.L49>

00004474 <.L71>:
    4474:	02812403          	lw	s0,40(sp)
    4478:	02c12083          	lw	ra,44(sp)
    447c:	02412483          	lw	s1,36(sp)
    4480:	02012903          	lw	s2,32(sp)
    4484:	01c12983          	lw	s3,28(sp)
    4488:	01812a03          	lw	s4,24(sp)
    448c:	01412a83          	lw	s5,20(sp)
    4490:	03010113          	addi	sp,sp,48
    4494:	5400006f          	j	49d4 <__GI_getdtablesize>

00004498 <.L50>:
    4498:	01000413          	li	s0,16
    449c:	f59ff06f          	j	43f4 <.L49>

000044a0 <.L66>:
    44a0:	02812403          	lw	s0,40(sp)
    44a4:	02c12083          	lw	ra,44(sp)
    44a8:	02412483          	lw	s1,36(sp)
    44ac:	02012903          	lw	s2,32(sp)
    44b0:	01c12983          	lw	s3,28(sp)
    44b4:	01812a03          	lw	s4,24(sp)
    44b8:	01412a83          	lw	s5,20(sp)
    44bc:	03010113          	addi	sp,sp,48
    44c0:	5440006f          	j	4a04 <__GI_getpagesize>

000044c4 <.L51>:
    44c4:	02000413          	li	s0,32
    44c8:	f2dff06f          	j	43f4 <.L49>

000044cc <.L65>:
    44cc:	06300413          	li	s0,99
    44d0:	f25ff06f          	j	43f4 <.L49>

000044d4 <.L41>:
    44d4:	00001437          	lui	s0,0x1
    44d8:	80040413          	addi	s0,s0,-2048 # 800 <core_list_init+0x34>
    44dc:	f19ff06f          	j	43f4 <.L49>

000044e0 <.L64>:
    44e0:	3e800413          	li	s0,1000
    44e4:	f11ff06f          	j	43f4 <.L49>

000044e8 <.L44>:
    44e8:	0ff00413          	li	s0,255
    44ec:	f09ff06f          	j	43f4 <.L49>

000044f0 <.L46>:
    44f0:	00008437          	lui	s0,0x8

000044f4 <.L90>:
    44f4:	fff40413          	addi	s0,s0,-1 # 7fff <.LVL163+0x7>
    44f8:	efdff06f          	j	43f4 <.L49>

000044fc <.L63>:
    44fc:	10000413          	li	s0,256
    4500:	ef5ff06f          	j	43f4 <.L49>

00004504 <.L62>:
    4504:	00009517          	auipc	a0,0x9
    4508:	5e050513          	addi	a0,a0,1504 # dae4 <.LC5>
    450c:	7dc000ef          	jal	ra,4ce8 <__GI_opendir>
    4510:	00050493          	mv	s1,a0
    4514:	00000413          	li	s0,0
    4518:	06050e63          	beqz	a0,4594 <.L88>
    451c:	00010937          	lui	s2,0x10
    4520:	000079b7          	lui	s3,0x7
    4524:	ffff0a37          	lui	s4,0xffff0
    4528:	63040ab7          	lui	s5,0x63040
    452c:	fff90913          	addi	s2,s2,-1 # ffff <_ebss+0x1af>
    4530:	57098993          	addi	s3,s3,1392 # 7570 <__stdio_trans2r+0x20>

00004534 <.L73>:
    4534:	00048513          	mv	a0,s1
    4538:	01d000ef          	jal	ra,4d54 <__GI_readdir64>
    453c:	00051c63          	bnez	a0,4554 <.L76>
    4540:	00048513          	mv	a0,s1
    4544:	614000ef          	jal	ra,4b58 <__GI_closedir>

00004548 <.L77>:
    4548:	ea0416e3          	bnez	s0,43f4 <.L49>

0000454c <.L34>:
    454c:	00100413          	li	s0,1
    4550:	ea5ff06f          	j	43f4 <.L49>

00004554 <.L76>:
    4554:	01052783          	lw	a5,16(a0)
    4558:	00fa77b3          	and	a5,s4,a5
    455c:	fd579ce3          	bne	a5,s5,4534 <.L73>
    4560:	01452783          	lw	a5,20(a0)
    4564:	0127f7b3          	and	a5,a5,s2
    4568:	fd3796e3          	bne	a5,s3,4534 <.L73>
    456c:	01654703          	lbu	a4,22(a0)
    4570:	0000a797          	auipc	a5,0xa
    4574:	8007a783          	lw	a5,-2048(a5) # dd70 <__GI___ctype_b>
    4578:	00171713          	slli	a4,a4,0x1
    457c:	00e787b3          	add	a5,a5,a4
    4580:	0007d783          	lhu	a5,0(a5)
    4584:	0087f793          	andi	a5,a5,8
    4588:	fa0786e3          	beqz	a5,4534 <.L73>
    458c:	00140413          	addi	s0,s0,1
    4590:	fa5ff06f          	j	4534 <.L73>

00004594 <.L88>:
    4594:	bc1ff0ef          	jal	ra,4154 <nprocessors_onln>
    4598:	00050413          	mv	s0,a0
    459c:	fadff06f          	j	4548 <.L77>

000045a0 <.L61>:
    45a0:	02812403          	lw	s0,40(sp)
    45a4:	02c12083          	lw	ra,44(sp)
    45a8:	02412483          	lw	s1,36(sp)
    45ac:	02012903          	lw	s2,32(sp)
    45b0:	01c12983          	lw	s3,28(sp)
    45b4:	01812a03          	lw	s4,24(sp)
    45b8:	01412a83          	lw	s5,20(sp)
    45bc:	03010113          	addi	sp,sp,48
    45c0:	b95ff06f          	j	4154 <nprocessors_onln>

000045c4 <.L60>:
    45c4:	02812403          	lw	s0,40(sp)
    45c8:	02c12083          	lw	ra,44(sp)
    45cc:	02412483          	lw	s1,36(sp)
    45d0:	02012903          	lw	s2,32(sp)
    45d4:	01c12983          	lw	s3,28(sp)
    45d8:	01812a03          	lw	s4,24(sp)
    45dc:	01412a83          	lw	s5,20(sp)
    45e0:	03010113          	addi	sp,sp,48
    45e4:	cc9ff06f          	j	42ac <get_phys_pages>

000045e8 <.L59>:
    45e8:	02812403          	lw	s0,40(sp)
    45ec:	02c12083          	lw	ra,44(sp)
    45f0:	02412483          	lw	s1,36(sp)
    45f4:	02012903          	lw	s2,32(sp)
    45f8:	01c12983          	lw	s3,28(sp)
    45fc:	01812a03          	lw	s4,24(sp)
    4600:	01412a83          	lw	s5,20(sp)
    4604:	03010113          	addi	sp,sp,48
    4608:	cf1ff06f          	j	42f8 <get_avphys_pages>

0000460c <.L40>:
    460c:	80000437          	lui	s0,0x80000
    4610:	fff44413          	not	s0,s0
    4614:	de1ff06f          	j	43f4 <.L49>

00004618 <.L58>:
    4618:	00001437          	lui	s0,0x1
    461c:	dd9ff06f          	j	43f4 <.L49>

00004620 <.L57>:
    4620:	2bc00413          	li	s0,700
    4624:	dd1ff06f          	j	43f4 <.L49>

00004628 <.L56>:
    4628:	00400413          	li	s0,4
    462c:	dc9ff06f          	j	43f4 <.L49>

00004630 <.L54>:
    4630:	00800413          	li	s0,8
    4634:	dc1ff06f          	j	43f4 <.L49>

00004638 <.L53>:
    4638:	00000413          	li	s0,0
    463c:	db9ff06f          	j	43f4 <.L49>

00004640 <.L52>:
    4640:	80000437          	lui	s0,0x80000
    4644:	db1ff06f          	j	43f4 <.L49>

00004648 <.L48>:
    4648:	07f00413          	li	s0,127
    464c:	da9ff06f          	j	43f4 <.L49>

00004650 <.L47>:
    4650:	f8000413          	li	s0,-128
    4654:	da1ff06f          	j	43f4 <.L49>

00004658 <.L45>:
    4658:	ffff8437          	lui	s0,0xffff8
    465c:	d99ff06f          	j	43f4 <.L49>

00004660 <.L43>:
    4660:	00010437          	lui	s0,0x10
    4664:	e91ff06f          	j	44f4 <.L90>

00004668 <.L42>:
    4668:	00900413          	li	s0,9
    466c:	d89ff06f          	j	43f4 <.L49>

00004670 <.L39>:
    4670:	00000593          	li	a1,0
    4674:	00100513          	li	a0,1
    4678:	334000ef          	jal	ra,49ac <__GI_clock_getres>
    467c:	d40544e3          	bltz	a0,43c4 <.L37>

00004680 <.L55>:
    4680:	00031437          	lui	s0,0x31
    4684:	06940413          	addi	s0,s0,105 # 31069 <_ebss+0x21219>
    4688:	d6dff06f          	j	43f4 <.L49>

0000468c <.L78>:
    468c:	01400413          	li	s0,20
    4690:	d65ff06f          	j	43f4 <.L49>

00004694 <.L79>:
    4694:	00010437          	lui	s0,0x10
    4698:	d5dff06f          	j	43f4 <.L49>

0000469c <__uClibc_init>:
    469c:	0000b797          	auipc	a5,0xb
    46a0:	72878793          	addi	a5,a5,1832 # fdc4 <__pagesize>
    46a4:	0007a703          	lw	a4,0(a5)
    46a8:	02071063          	bnez	a4,46c8 <.L1>
    46ac:	00002737          	lui	a4,0x2
    46b0:	00e7a023          	sw	a4,0(a5)
    46b4:	00008717          	auipc	a4,0x8
    46b8:	81c72703          	lw	a4,-2020(a4) # bed0 <.LLST21+0x1e>
    46bc:	00070793          	mv	a5,a4
    46c0:	00078463          	beqz	a5,46c8 <.L1>
    46c4:	00070067          	jr	a4

000046c8 <.L1>:
    46c8:	00008067          	ret

000046cc <__uClibc_fini>:
    46cc:	ff010113          	addi	sp,sp,-16
    46d0:	00812423          	sw	s0,8(sp)
    46d4:	00912223          	sw	s1,4(sp)
    46d8:	00009417          	auipc	s0,0x9
    46dc:	6ac40413          	addi	s0,s0,1708 # dd84 <__TMC_END__>
    46e0:	00009497          	auipc	s1,0x9
    46e4:	6a048493          	addi	s1,s1,1696 # dd80 <__do_global_dtors_aux_fini_array_entry>
    46e8:	40940433          	sub	s0,s0,s1
    46ec:	40245413          	srai	s0,s0,0x2
    46f0:	01212023          	sw	s2,0(sp)
    46f4:	00112623          	sw	ra,12(sp)
    46f8:	fff40413          	addi	s0,s0,-1
    46fc:	fff00913          	li	s2,-1

00004700 <.L9>:
    4700:	03241c63          	bne	s0,s2,4738 <.L10>
    4704:	0000b417          	auipc	s0,0xb
    4708:	6c040413          	addi	s0,s0,1728 # fdc4 <__pagesize>
    470c:	00442783          	lw	a5,4(s0)
    4710:	00078463          	beqz	a5,4718 <.L11>
    4714:	000780e7          	jalr	a5

00004718 <.L11>:
    4718:	00842783          	lw	a5,8(s0)
    471c:	02078a63          	beqz	a5,4750 <.L8>
    4720:	00812403          	lw	s0,8(sp)
    4724:	00c12083          	lw	ra,12(sp)
    4728:	00412483          	lw	s1,4(sp)
    472c:	00012903          	lw	s2,0(sp)
    4730:	01010113          	addi	sp,sp,16
    4734:	00078067          	jr	a5

00004738 <.L10>:
    4738:	00241793          	slli	a5,s0,0x2
    473c:	00f487b3          	add	a5,s1,a5
    4740:	0007a783          	lw	a5,0(a5)
    4744:	fff40413          	addi	s0,s0,-1
    4748:	000780e7          	jalr	a5
    474c:	fb5ff06f          	j	4700 <.L9>

00004750 <.L8>:
    4750:	00c12083          	lw	ra,12(sp)
    4754:	00812403          	lw	s0,8(sp)
    4758:	00412483          	lw	s1,4(sp)
    475c:	00012903          	lw	s2,0(sp)
    4760:	01010113          	addi	sp,sp,16
    4764:	00008067          	ret

00004768 <__uClibc_main>:
    4768:	f5010113          	addi	sp,sp,-176
    476c:	0a812423          	sw	s0,168(sp)
    4770:	0b212023          	sw	s2,160(sp)
    4774:	09312e23          	sw	s3,156(sp)
    4778:	09412c23          	sw	s4,152(sp)
    477c:	09512a23          	sw	s5,148(sp)
    4780:	09612823          	sw	s6,144(sp)
    4784:	09712623          	sw	s7,140(sp)
    4788:	0a112623          	sw	ra,172(sp)
    478c:	0a912223          	sw	s1,164(sp)
    4790:	09812423          	sw	s8,136(sp)
    4794:	09912223          	sw	s9,132(sp)
    4798:	09a12023          	sw	s10,128(sp)
    479c:	00070a93          	mv	s5,a4
    47a0:	0000bb17          	auipc	s6,0xb
    47a4:	624b0b13          	addi	s6,s6,1572 # fdc4 <__pagesize>
    47a8:	00007717          	auipc	a4,0x7
    47ac:	6e872703          	lw	a4,1768(a4) # be90 <_GLOBAL_OFFSET_TABLE_+0x8>
    47b0:	01072023          	sw	a6,0(a4)
    47b4:	00fb2423          	sw	a5,8(s6)
    47b8:	00158793          	addi	a5,a1,1
    47bc:	00068993          	mv	s3,a3
    47c0:	00279793          	slli	a5,a5,0x2
    47c4:	00062683          	lw	a3,0(a2)
    47c8:	00f60733          	add	a4,a2,a5
    47cc:	00007b97          	auipc	s7,0x7
    47d0:	6ccbab83          	lw	s7,1740(s7) # be98 <_GLOBAL_OFFSET_TABLE_+0x10>
    47d4:	00eba023          	sw	a4,0(s7)
    47d8:	00050a13          	mv	s4,a0
    47dc:	00058913          	mv	s2,a1
    47e0:	00060413          	mv	s0,a2
    47e4:	00d71863          	bne	a4,a3,47f4 <.L18>
    47e8:	ffc78793          	addi	a5,a5,-4
    47ec:	00f607b3          	add	a5,a2,a5
    47f0:	00fba023          	sw	a5,0(s7)

000047f4 <.L18>:
    47f4:	00810c93          	addi	s9,sp,8
    47f8:	07800613          	li	a2,120
    47fc:	00000593          	li	a1,0
    4800:	000c8513          	mv	a0,s9
    4804:	82cff0ef          	jal	ra,3830 <__GI_memset>
    4808:	000bac03          	lw	s8,0(s7)

0000480c <.L19>:
    480c:	000c2783          	lw	a5,0(s8)
    4810:	004c0c13          	addi	s8,s8,4
    4814:	fe079ce3          	bnez	a5,480c <.L19>
    4818:	00e00d13          	li	s10,14

0000481c <.L20>:
    481c:	000c2483          	lw	s1,0(s8)
    4820:	0c049a63          	bnez	s1,48f4 <.L22>
    4824:	000c8513          	mv	a0,s9
    4828:	120000ef          	jal	ra,4948 <_dl_aux_init>
    482c:	e71ff0ef          	jal	ra,469c <__uClibc_init>
    4830:	00042783          	lw	a5,0(s0)
    4834:	00009717          	auipc	a4,0x9
    4838:	52f72823          	sw	a5,1328(a4) # dd64 <__uclibc_progname>
    483c:	02078a63          	beqz	a5,4870 <.L23>
    4840:	00007717          	auipc	a4,0x7
    4844:	6a472703          	lw	a4,1700(a4) # bee4 <.LLST21+0x32>
    4848:	00f72023          	sw	a5,0(a4)
    484c:	00042503          	lw	a0,0(s0)
    4850:	02f00593          	li	a1,47
    4854:	49c020ef          	jal	ra,6cf0 <__GI_strrchr>
    4858:	00007797          	auipc	a5,0x7
    485c:	6587a783          	lw	a5,1624(a5) # beb0 <_GLOBAL_OFFSET_TABLE_+0x28>
    4860:	00a7a023          	sw	a0,0(a5)
    4864:	0a050863          	beqz	a0,4914 <.L24>
    4868:	00150513          	addi	a0,a0,1
    486c:	00a7a023          	sw	a0,0(a5)

00004870 <.L23>:
    4870:	015b2223          	sw	s5,4(s6)
    4874:	00009a97          	auipc	s5,0x9
    4878:	504a8a93          	addi	s5,s5,1284 # dd78 <__preinit_array_start>
    487c:	00009b17          	auipc	s6,0x9
    4880:	500b0b13          	addi	s6,s6,1280 # dd7c <__frame_dummy_init_array_entry>
    4884:	415b0b33          	sub	s6,s6,s5
    4888:	402b5b13          	srai	s6,s6,0x2
    488c:	00000c13          	li	s8,0

00004890 <.L25>:
    4890:	096c1863          	bne	s8,s6,4920 <.L26>
    4894:	00098463          	beqz	s3,489c <.L27>
    4898:	000980e7          	jalr	s3

0000489c <.L27>:
    489c:	00009997          	auipc	s3,0x9
    48a0:	4e098993          	addi	s3,s3,1248 # dd7c <__frame_dummy_init_array_entry>
    48a4:	00009a97          	auipc	s5,0x9
    48a8:	4dca8a93          	addi	s5,s5,1244 # dd80 <__do_global_dtors_aux_fini_array_entry>
    48ac:	413a8ab3          	sub	s5,s5,s3
    48b0:	402ada93          	srai	s5,s5,0x2

000048b4 <.L28>:
    48b4:	09549063          	bne	s1,s5,4934 <.L29>
    48b8:	00007797          	auipc	a5,0x7
    48bc:	6147a783          	lw	a5,1556(a5) # becc <.LLST21+0x1a>
    48c0:	00078663          	beqz	a5,48cc <.L30>
    48c4:	510000ef          	jal	ra,4dd4 <__errno_location>
    48c8:	00052023          	sw	zero,0(a0)

000048cc <.L30>:
    48cc:	00007797          	auipc	a5,0x7
    48d0:	5f07a783          	lw	a5,1520(a5) # bebc <.LLST21+0xa>
    48d4:	00078663          	beqz	a5,48e0 <.L31>
    48d8:	508000ef          	jal	ra,4de0 <__h_errno_location>
    48dc:	00052023          	sw	zero,0(a0)

000048e0 <.L31>:
    48e0:	000ba603          	lw	a2,0(s7)
    48e4:	00040593          	mv	a1,s0
    48e8:	00090513          	mv	a0,s2
    48ec:	000a00e7          	jalr	s4 # ffff0000 <_ebss+0xfffe01b0>
    48f0:	668020ef          	jal	ra,6f58 <__GI_exit>

000048f4 <.L22>:
    48f4:	009d6c63          	bltu	s10,s1,490c <.L21>
    48f8:	00349513          	slli	a0,s1,0x3
    48fc:	00800613          	li	a2,8
    4900:	000c0593          	mv	a1,s8
    4904:	00ac8533          	add	a0,s9,a0
    4908:	c81fe0ef          	jal	ra,3588 <__GI_memcpy>

0000490c <.L21>:
    490c:	008c0c13          	addi	s8,s8,8
    4910:	f0dff06f          	j	481c <.L20>

00004914 <.L24>:
    4914:	00042703          	lw	a4,0(s0)
    4918:	00e7a023          	sw	a4,0(a5)
    491c:	f55ff06f          	j	4870 <.L23>

00004920 <.L26>:
    4920:	000aa783          	lw	a5,0(s5)
    4924:	001c0c13          	addi	s8,s8,1
    4928:	004a8a93          	addi	s5,s5,4
    492c:	000780e7          	jalr	a5
    4930:	f61ff06f          	j	4890 <.L25>

00004934 <.L29>:
    4934:	0009a783          	lw	a5,0(s3)
    4938:	00148493          	addi	s1,s1,1
    493c:	00498993          	addi	s3,s3,4
    4940:	000780e7          	jalr	a5
    4944:	f71ff06f          	j	48b4 <.L28>

00004948 <_dl_aux_init>:
    4948:	01c52703          	lw	a4,28(a0)
    494c:	00007797          	auipc	a5,0x7
    4950:	5687a783          	lw	a5,1384(a5) # beb4 <.LLST21+0x2>
    4954:	00e7a023          	sw	a4,0(a5)
    4958:	02c52703          	lw	a4,44(a0)
    495c:	00007797          	auipc	a5,0x7
    4960:	56c7a783          	lw	a5,1388(a5) # bec8 <.LLST21+0x16>
    4964:	00e7a023          	sw	a4,0(a5)
    4968:	03452783          	lw	a5,52(a0)
    496c:	00079463          	bnez	a5,4974 <.L2>
    4970:	000027b7          	lui	a5,0x2

00004974 <.L2>:
    4974:	00007717          	auipc	a4,0x7
    4978:	56c72703          	lw	a4,1388(a4) # bee0 <.LLST21+0x2e>
    497c:	00f72023          	sw	a5,0(a4)
    4980:	00008067          	ret

00004984 <clock_gettime>:
    4984:	07100893          	li	a7,113
    4988:	00000073          	ecall
    498c:	fffff7b7          	lui	a5,0xfffff
    4990:	00a7fc63          	bgeu	a5,a0,49a8 <.L1>
    4994:	40a00533          	neg	a0,a0
    4998:	00007797          	auipc	a5,0x7
    499c:	4fc7a783          	lw	a5,1276(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    49a0:	00a7a023          	sw	a0,0(a5)
    49a4:	fff00513          	li	a0,-1

000049a8 <.L1>:
    49a8:	00008067          	ret

000049ac <__GI_clock_getres>:
    49ac:	07200893          	li	a7,114
    49b0:	00000073          	ecall
    49b4:	fffff7b7          	lui	a5,0xfffff
    49b8:	00a7fc63          	bgeu	a5,a0,49d0 <.L1>
    49bc:	40a00533          	neg	a0,a0
    49c0:	00007797          	auipc	a5,0x7
    49c4:	4d47a783          	lw	a5,1236(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    49c8:	00a7a023          	sw	a0,0(a5)
    49cc:	fff00513          	li	a0,-1

000049d0 <.L1>:
    49d0:	00008067          	ret

000049d4 <__GI_getdtablesize>:
    49d4:	fe010113          	addi	sp,sp,-32
    49d8:	00810593          	addi	a1,sp,8
    49dc:	00700513          	li	a0,7
    49e0:	00112e23          	sw	ra,28(sp)
    49e4:	02c000ef          	jal	ra,4a10 <__GI_getrlimit>
    49e8:	10000793          	li	a5,256
    49ec:	00054463          	bltz	a0,49f4 <.L1>
    49f0:	00812783          	lw	a5,8(sp)

000049f4 <.L1>:
    49f4:	01c12083          	lw	ra,28(sp)
    49f8:	00078513          	mv	a0,a5
    49fc:	02010113          	addi	sp,sp,32
    4a00:	00008067          	ret

00004a04 <__GI_getpagesize>:
    4a04:	0000b517          	auipc	a0,0xb
    4a08:	3c052503          	lw	a0,960(a0) # fdc4 <__pagesize>
    4a0c:	00008067          	ret

00004a10 <__GI_getrlimit>:
    4a10:	00058793          	mv	a5,a1
    4a14:	0a300893          	li	a7,163
    4a18:	00000073          	ecall
    4a1c:	fffff737          	lui	a4,0xfffff
    4a20:	00a77e63          	bgeu	a4,a0,4a3c <.L2>
    4a24:	40a00533          	neg	a0,a0
    4a28:	00007797          	auipc	a5,0x7
    4a2c:	46c7a783          	lw	a5,1132(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    4a30:	00a7a023          	sw	a0,0(a5)
    4a34:	fff00513          	li	a0,-1
    4a38:	00008067          	ret

00004a3c <.L2>:
    4a3c:	0005a683          	lw	a3,0(a1)
    4a40:	80000737          	lui	a4,0x80000
    4a44:	fff74713          	not	a4,a4
    4a48:	00e69663          	bne	a3,a4,4a54 <.L4>
    4a4c:	fff00713          	li	a4,-1
    4a50:	00e5a023          	sw	a4,0(a1)

00004a54 <.L4>:
    4a54:	0047a683          	lw	a3,4(a5)
    4a58:	80000737          	lui	a4,0x80000
    4a5c:	fff74713          	not	a4,a4
    4a60:	00e69663          	bne	a3,a4,4a6c <.L1>
    4a64:	fff00713          	li	a4,-1
    4a68:	00e7a223          	sw	a4,4(a5)

00004a6c <.L1>:
    4a6c:	00008067          	ret

00004a70 <__GI_ioctl>:
    4a70:	fd010113          	addi	sp,sp,-48
    4a74:	02f12223          	sw	a5,36(sp)
    4a78:	01810793          	addi	a5,sp,24
    4a7c:	03112623          	sw	a7,44(sp)
    4a80:	00c12c23          	sw	a2,24(sp)
    4a84:	00d12e23          	sw	a3,28(sp)
    4a88:	02e12023          	sw	a4,32(sp)
    4a8c:	03012423          	sw	a6,40(sp)
    4a90:	00f12623          	sw	a5,12(sp)
    4a94:	01d00893          	li	a7,29
    4a98:	00000073          	ecall
    4a9c:	fffff7b7          	lui	a5,0xfffff
    4aa0:	00a7fc63          	bgeu	a5,a0,4ab8 <.L1>
    4aa4:	40a00533          	neg	a0,a0
    4aa8:	00007797          	auipc	a5,0x7
    4aac:	3ec7a783          	lw	a5,1004(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    4ab0:	00a7a023          	sw	a0,0(a5)
    4ab4:	fff00513          	li	a0,-1

00004ab8 <.L1>:
    4ab8:	03010113          	addi	sp,sp,48
    4abc:	00008067          	ret

00004ac0 <__GI_mmap>:
    4ac0:	01379813          	slli	a6,a5,0x13
    4ac4:	00080e63          	beqz	a6,4ae0 <.L2>
    4ac8:	00007797          	auipc	a5,0x7
    4acc:	3cc7a783          	lw	a5,972(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    4ad0:	01600713          	li	a4,22
    4ad4:	00e7a023          	sw	a4,0(a5)

00004ad8 <.L5>:
    4ad8:	fff00513          	li	a0,-1

00004adc <.L1>:
    4adc:	00008067          	ret

00004ae0 <.L2>:
    4ae0:	00d7d793          	srli	a5,a5,0xd
    4ae4:	0de00893          	li	a7,222
    4ae8:	00000073          	ecall
    4aec:	fffff7b7          	lui	a5,0xfffff
    4af0:	fea7f6e3          	bgeu	a5,a0,4adc <.L1>
    4af4:	40a00533          	neg	a0,a0
    4af8:	00007797          	auipc	a5,0x7
    4afc:	39c7a783          	lw	a5,924(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    4b00:	00a7a023          	sw	a0,0(a5)
    4b04:	fd5ff06f          	j	4ad8 <.L5>

00004b08 <__GI_munmap>:
    4b08:	0d700893          	li	a7,215
    4b0c:	00000073          	ecall
    4b10:	fffff7b7          	lui	a5,0xfffff
    4b14:	00a7fc63          	bgeu	a5,a0,4b2c <.L1>
    4b18:	40a00533          	neg	a0,a0
    4b1c:	00007797          	auipc	a5,0x7
    4b20:	3787a783          	lw	a5,888(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    4b24:	00a7a023          	sw	a0,0(a5)
    4b28:	fff00513          	li	a0,-1

00004b2c <.L1>:
    4b2c:	00008067          	ret

00004b30 <sysinfo>:
    4b30:	0b300893          	li	a7,179
    4b34:	00000073          	ecall
    4b38:	fffff7b7          	lui	a5,0xfffff
    4b3c:	00a7fc63          	bgeu	a5,a0,4b54 <.L1>
    4b40:	40a00533          	neg	a0,a0
    4b44:	00007797          	auipc	a5,0x7
    4b48:	3507a783          	lw	a5,848(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    4b4c:	00a7a023          	sw	a0,0(a5)
    4b50:	fff00513          	li	a0,-1

00004b54 <.L1>:
    4b54:	00008067          	ret

00004b58 <__GI_closedir>:
    4b58:	ff010113          	addi	sp,sp,-16
    4b5c:	00912223          	sw	s1,4(sp)
    4b60:	00052483          	lw	s1,0(a0)
    4b64:	00112623          	sw	ra,12(sp)
    4b68:	00812423          	sw	s0,8(sp)
    4b6c:	fff00793          	li	a5,-1
    4b70:	02f48a63          	beq	s1,a5,4ba4 <.L5>
    4b74:	00050413          	mv	s0,a0
    4b78:	00f52023          	sw	a5,0(a0)
    4b7c:	00c52503          	lw	a0,12(a0)
    4b80:	c18ff0ef          	jal	ra,3f98 <free>
    4b84:	00040513          	mv	a0,s0
    4b88:	c10ff0ef          	jal	ra,3f98 <free>
    4b8c:	00812403          	lw	s0,8(sp)
    4b90:	00c12083          	lw	ra,12(sp)
    4b94:	00048513          	mv	a0,s1
    4b98:	00412483          	lw	s1,4(sp)
    4b9c:	01010113          	addi	sp,sp,16
    4ba0:	4b40206f          	j	7054 <__GI_close>

00004ba4 <.L5>:
    4ba4:	00c12083          	lw	ra,12(sp)
    4ba8:	00812403          	lw	s0,8(sp)
    4bac:	00007797          	auipc	a5,0x7
    4bb0:	2e87a783          	lw	a5,744(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    4bb4:	00900713          	li	a4,9
    4bb8:	00e7a023          	sw	a4,0(a5)
    4bbc:	00412483          	lw	s1,4(sp)
    4bc0:	fff00513          	li	a0,-1
    4bc4:	01010113          	addi	sp,sp,16
    4bc8:	00008067          	ret

00004bcc <fd_to_DIR>:
    4bcc:	ff010113          	addi	sp,sp,-16
    4bd0:	01212023          	sw	s2,0(sp)
    4bd4:	00050913          	mv	s2,a0
    4bd8:	01c00513          	li	a0,28
    4bdc:	00912223          	sw	s1,4(sp)
    4be0:	00112623          	sw	ra,12(sp)
    4be4:	00812423          	sw	s0,8(sp)
    4be8:	00058493          	mv	s1,a1
    4bec:	994ff0ef          	jal	ra,3d80 <malloc>
    4bf0:	04050263          	beqz	a0,4c34 <.L2>
    4bf4:	01252023          	sw	s2,0(a0)
    4bf8:	00052823          	sw	zero,16(a0)
    4bfc:	00052423          	sw	zero,8(a0)
    4c00:	00052223          	sw	zero,4(a0)
    4c04:	20000793          	li	a5,512
    4c08:	00050413          	mv	s0,a0
    4c0c:	00048593          	mv	a1,s1
    4c10:	00f4f463          	bgeu	s1,a5,4c18 <.L3>
    4c14:	20000593          	li	a1,512

00004c18 <.L3>:
    4c18:	00b42a23          	sw	a1,20(s0)
    4c1c:	00100513          	li	a0,1
    4c20:	178020ef          	jal	ra,6d98 <calloc>
    4c24:	00a42623          	sw	a0,12(s0)
    4c28:	00051863          	bnez	a0,4c38 <.L1>
    4c2c:	00040513          	mv	a0,s0
    4c30:	b68ff0ef          	jal	ra,3f98 <free>

00004c34 <.L2>:
    4c34:	00000413          	li	s0,0

00004c38 <.L1>:
    4c38:	00c12083          	lw	ra,12(sp)
    4c3c:	00040513          	mv	a0,s0
    4c40:	00812403          	lw	s0,8(sp)
    4c44:	00412483          	lw	s1,4(sp)
    4c48:	00012903          	lw	s2,0(sp)
    4c4c:	01010113          	addi	sp,sp,16
    4c50:	00008067          	ret

00004c54 <fdopendir>:
    4c54:	f8010113          	addi	sp,sp,-128
    4c58:	00810593          	addi	a1,sp,8
    4c5c:	06812c23          	sw	s0,120(sp)
    4c60:	06112e23          	sw	ra,124(sp)
    4c64:	00050413          	mv	s0,a0
    4c68:	4f8020ef          	jal	ra,7160 <__GI_fstat64>
    4c6c:	02051463          	bnez	a0,4c94 <.L11>
    4c70:	01812703          	lw	a4,24(sp)
    4c74:	0000f7b7          	lui	a5,0xf
    4c78:	00e7f7b3          	and	a5,a5,a4
    4c7c:	00004737          	lui	a4,0x4
    4c80:	02e78463          	beq	a5,a4,4ca8 <.L12>
    4c84:	00007797          	auipc	a5,0x7
    4c88:	2107a783          	lw	a5,528(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    4c8c:	01400713          	li	a4,20

00004c90 <.L17>:
    4c90:	00e7a023          	sw	a4,0(a5)

00004c94 <.L11>:
    4c94:	00000513          	li	a0,0

00004c98 <.L9>:
    4c98:	07c12083          	lw	ra,124(sp)
    4c9c:	07812403          	lw	s0,120(sp)
    4ca0:	08010113          	addi	sp,sp,128
    4ca4:	00008067          	ret

00004ca8 <.L12>:
    4ca8:	00300593          	li	a1,3
    4cac:	00040513          	mv	a0,s0
    4cb0:	328020ef          	jal	ra,6fd8 <__GI_fcntl>
    4cb4:	fff00793          	li	a5,-1
    4cb8:	fcf50ee3          	beq	a0,a5,4c94 <.L11>
    4cbc:	00357793          	andi	a5,a0,3
    4cc0:	00100713          	li	a4,1
    4cc4:	00e79a63          	bne	a5,a4,4cd8 <.L15>
    4cc8:	00007797          	auipc	a5,0x7
    4ccc:	1cc7a783          	lw	a5,460(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    4cd0:	01600713          	li	a4,22
    4cd4:	fbdff06f          	j	4c90 <.L17>

00004cd8 <.L15>:
    4cd8:	04012583          	lw	a1,64(sp)
    4cdc:	00040513          	mv	a0,s0
    4ce0:	eedff0ef          	jal	ra,4bcc <fd_to_DIR>
    4ce4:	fb5ff06f          	j	4c98 <.L9>

00004ce8 <__GI_opendir>:
    4ce8:	000915b7          	lui	a1,0x91
    4cec:	f8010113          	addi	sp,sp,-128
    4cf0:	80058593          	addi	a1,a1,-2048 # 90800 <_ebss+0x809b0>
    4cf4:	06112e23          	sw	ra,124(sp)
    4cf8:	06812c23          	sw	s0,120(sp)
    4cfc:	3e8020ef          	jal	ra,70e4 <__open2_nocancel>
    4d00:	00054e63          	bltz	a0,4d1c <.L19>
    4d04:	00810593          	addi	a1,sp,8
    4d08:	00050413          	mv	s0,a0
    4d0c:	454020ef          	jal	ra,7160 <__GI_fstat64>
    4d10:	02055063          	bgez	a0,4d30 <.L20>

00004d14 <.L23>:
    4d14:	00040513          	mv	a0,s0
    4d18:	364020ef          	jal	ra,707c <__close_nocancel_no_status>

00004d1c <.L19>:
    4d1c:	00000513          	li	a0,0

00004d20 <.L18>:
    4d20:	07c12083          	lw	ra,124(sp)
    4d24:	07812403          	lw	s0,120(sp)
    4d28:	08010113          	addi	sp,sp,128
    4d2c:	00008067          	ret

00004d30 <.L20>:
    4d30:	00200593          	li	a1,2
    4d34:	00100613          	li	a2,1
    4d38:	00040513          	mv	a0,s0
    4d3c:	260020ef          	jal	ra,6f9c <__fcntl_nocancel>
    4d40:	04012583          	lw	a1,64(sp)
    4d44:	00040513          	mv	a0,s0
    4d48:	e85ff0ef          	jal	ra,4bcc <fd_to_DIR>
    4d4c:	fc051ae3          	bnez	a0,4d20 <.L18>
    4d50:	fc5ff06f          	j	4d14 <.L23>

00004d54 <__GI_readdir64>:
    4d54:	ff010113          	addi	sp,sp,-16
    4d58:	00812423          	sw	s0,8(sp)
    4d5c:	00112623          	sw	ra,12(sp)
    4d60:	00050413          	mv	s0,a0

00004d64 <.L4>:
    4d64:	00842703          	lw	a4,8(s0)
    4d68:	00442783          	lw	a5,4(s0)
    4d6c:	00c42583          	lw	a1,12(s0)
    4d70:	00e7ee63          	bltu	a5,a4,4d8c <.L2>
    4d74:	01442603          	lw	a2,20(s0)
    4d78:	00042503          	lw	a0,0(s0)
    4d7c:	40c020ef          	jal	ra,7188 <__getdents>
    4d80:	04a05663          	blez	a0,4dcc <.L6>
    4d84:	00a42423          	sw	a0,8(s0)
    4d88:	00042223          	sw	zero,4(s0)

00004d8c <.L2>:
    4d8c:	00442703          	lw	a4,4(s0)
    4d90:	00c42503          	lw	a0,12(s0)
    4d94:	00e50533          	add	a0,a0,a4
    4d98:	01055783          	lhu	a5,16(a0)
    4d9c:	00e787b3          	add	a5,a5,a4
    4da0:	00f42223          	sw	a5,4(s0)
    4da4:	00852783          	lw	a5,8(a0)
    4da8:	00452703          	lw	a4,4(a0)
    4dac:	00f42823          	sw	a5,16(s0)
    4db0:	00052783          	lw	a5,0(a0)
    4db4:	00e7e7b3          	or	a5,a5,a4
    4db8:	fa0786e3          	beqz	a5,4d64 <.L4>

00004dbc <.L1>:
    4dbc:	00c12083          	lw	ra,12(sp)
    4dc0:	00812403          	lw	s0,8(sp)
    4dc4:	01010113          	addi	sp,sp,16
    4dc8:	00008067          	ret

00004dcc <.L6>:
    4dcc:	00000513          	li	a0,0
    4dd0:	fedff06f          	j	4dbc <.L1>

00004dd4 <__errno_location>:
    4dd4:	00007517          	auipc	a0,0x7
    4dd8:	0c052503          	lw	a0,192(a0) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    4ddc:	00008067          	ret

00004de0 <__h_errno_location>:
    4de0:	00007517          	auipc	a0,0x7
    4de4:	0c052503          	lw	a0,192(a0) # bea0 <_GLOBAL_OFFSET_TABLE_+0x18>
    4de8:	00008067          	ret

00004dec <__GI_config_open>:
    4dec:	ff010113          	addi	sp,sp,-16
    4df0:	00009597          	auipc	a1,0x9
    4df4:	cf058593          	addi	a1,a1,-784 # dae0 <.LC0>
    4df8:	00112623          	sw	ra,12(sp)
    4dfc:	00812423          	sw	s0,8(sp)
    4e00:	49c000ef          	jal	ra,529c <__GI_fopen>
    4e04:	00051c63          	bnez	a0,4e1c <.L2>

00004e08 <.L4>:
    4e08:	00000513          	li	a0,0

00004e0c <.L1>:
    4e0c:	00c12083          	lw	ra,12(sp)
    4e10:	00812403          	lw	s0,8(sp)
    4e14:	01010113          	addi	sp,sp,16
    4e18:	00008067          	ret

00004e1c <.L2>:
    4e1c:	00050413          	mv	s0,a0
    4e20:	01800593          	li	a1,24
    4e24:	00100513          	li	a0,1
    4e28:	771010ef          	jal	ra,6d98 <calloc>
    4e2c:	fc050ee3          	beqz	a0,4e08 <.L4>
    4e30:	00852023          	sw	s0,0(a0)
    4e34:	fd9ff06f          	j	4e0c <.L1>

00004e38 <__GI_config_close>:
    4e38:	04050063          	beqz	a0,4e78 <.L9>
    4e3c:	ff010113          	addi	sp,sp,-16
    4e40:	00812423          	sw	s0,8(sp)
    4e44:	00050413          	mv	s0,a0
    4e48:	00052503          	lw	a0,0(a0)
    4e4c:	00112623          	sw	ra,12(sp)
    4e50:	35c000ef          	jal	ra,51ac <__GI_fclose>
    4e54:	01442783          	lw	a5,20(s0)
    4e58:	00078663          	beqz	a5,4e64 <.L11>
    4e5c:	00442503          	lw	a0,4(s0)
    4e60:	938ff0ef          	jal	ra,3f98 <free>

00004e64 <.L11>:
    4e64:	00040513          	mv	a0,s0
    4e68:	00812403          	lw	s0,8(sp)
    4e6c:	00c12083          	lw	ra,12(sp)
    4e70:	01010113          	addi	sp,sp,16
    4e74:	924ff06f          	j	3f98 <free>

00004e78 <.L9>:
    4e78:	00008067          	ret

00004e7c <__GI_config_read>:
    4e7c:	fa010113          	addi	sp,sp,-96
    4e80:	04112e23          	sw	ra,92(sp)
    4e84:	04812c23          	sw	s0,88(sp)
    4e88:	04912a23          	sw	s1,84(sp)
    4e8c:	05212823          	sw	s2,80(sp)
    4e90:	05312623          	sw	s3,76(sp)
    4e94:	05412423          	sw	s4,72(sp)
    4e98:	05512223          	sw	s5,68(sp)
    4e9c:	05612023          	sw	s6,64(sp)
    4ea0:	03712e23          	sw	s7,60(sp)
    4ea4:	03812c23          	sw	s8,56(sp)
    4ea8:	03912a23          	sw	s9,52(sp)
    4eac:	03a12823          	sw	s10,48(sp)
    4eb0:	03b12623          	sw	s11,44(sp)
    4eb4:	0e050063          	beqz	a0,4f94 <.L20>
    4eb8:	0ff67a13          	zext.b	s4,a2
    4ebc:	002a1793          	slli	a5,s4,0x2
    4ec0:	00865a93          	srli	s5,a2,0x8
    4ec4:	00f12623          	sw	a5,12(sp)
    4ec8:	000209b7          	lui	s3,0x20
    4ecc:	00178793          	addi	a5,a5,1
    4ed0:	00040b37          	lui	s6,0x40
    4ed4:	00010bb7          	lui	s7,0x10
    4ed8:	00050c93          	mv	s9,a0
    4edc:	00058913          	mv	s2,a1
    4ee0:	00060493          	mv	s1,a2
    4ee4:	00068413          	mv	s0,a3
    4ee8:	0ffafa93          	zext.b	s5,s5
    4eec:	00f12823          	sw	a5,16(sp)
    4ef0:	013679b3          	and	s3,a2,s3
    4ef4:	01667b33          	and	s6,a2,s6
    4ef8:	01767bb3          	and	s7,a2,s7

00004efc <.L21>:
    4efc:	004ca683          	lw	a3,4(s9)
    4f00:	010ca703          	lw	a4,16(s9)
    4f04:	04069263          	bnez	a3,4f48 <.L22>
    4f08:	00071663          	bnez	a4,4f14 <.L23>
    4f0c:	05100713          	li	a4,81
    4f10:	00eca823          	sw	a4,16(s9)

00004f14 <.L23>:
    4f14:	008ca703          	lw	a4,8(s9)
    4f18:	00071663          	bnez	a4,4f24 <.L24>
    4f1c:	01012783          	lw	a5,16(sp)
    4f20:	00fca423          	sw	a5,8(s9)

00004f24 <.L24>:
    4f24:	008ca503          	lw	a0,8(s9)
    4f28:	010ca703          	lw	a4,16(s9)
    4f2c:	00e50533          	add	a0,a0,a4
    4f30:	e51fe0ef          	jal	ra,3d80 <malloc>
    4f34:	00aca223          	sw	a0,4(s9)
    4f38:	04050e63          	beqz	a0,4f94 <.L20>
    4f3c:	014ca703          	lw	a4,20(s9)
    4f40:	00176713          	ori	a4,a4,1
    4f44:	00ecaa23          	sw	a4,20(s9)

00004f48 <.L22>:
    4f48:	004ca703          	lw	a4,4(s9)
    4f4c:	008ca683          	lw	a3,8(s9)
    4f50:	00000d93          	li	s11,0
    4f54:	00002c37          	lui	s8,0x2
    4f58:	00d70733          	add	a4,a4,a3
    4f5c:	00eca623          	sw	a4,12(s9)
    4f60:	05c00d13          	li	s10,92

00004f64 <.L26>:
    4f64:	010ca583          	lw	a1,16(s9)
    4f68:	00cca503          	lw	a0,12(s9)
    4f6c:	000ca603          	lw	a2,0(s9)
    4f70:	41b585b3          	sub	a1,a1,s11
    4f74:	01b50533          	add	a0,a0,s11
    4f78:	0ed010ef          	jal	ra,6864 <__GI_fgets>
    4f7c:	00cca703          	lw	a4,12(s9)
    4f80:	04051c63          	bnez	a0,4fd8 <.L27>
    4f84:	010ca603          	lw	a2,16(s9)
    4f88:	00000593          	li	a1,0
    4f8c:	00070513          	mv	a0,a4
    4f90:	8a1fe0ef          	jal	ra,3830 <__GI_memset>

00004f94 <.L20>:
    4f94:	00000d93          	li	s11,0

00004f98 <.L18>:
    4f98:	05c12083          	lw	ra,92(sp)
    4f9c:	05812403          	lw	s0,88(sp)
    4fa0:	05412483          	lw	s1,84(sp)
    4fa4:	05012903          	lw	s2,80(sp)
    4fa8:	04c12983          	lw	s3,76(sp)
    4fac:	04812a03          	lw	s4,72(sp)
    4fb0:	04412a83          	lw	s5,68(sp)
    4fb4:	04012b03          	lw	s6,64(sp)
    4fb8:	03c12b83          	lw	s7,60(sp)
    4fbc:	03812c03          	lw	s8,56(sp)
    4fc0:	03412c83          	lw	s9,52(sp)
    4fc4:	03012d03          	lw	s10,48(sp)
    4fc8:	000d8513          	mv	a0,s11
    4fcc:	02c12d83          	lw	s11,44(sp)
    4fd0:	06010113          	addi	sp,sp,96
    4fd4:	00008067          	ret

00004fd8 <.L27>:
    4fd8:	01b70533          	add	a0,a4,s11
    4fdc:	00e12a23          	sw	a4,20(sp)
    4fe0:	8f9fe0ef          	jal	ra,38d8 <__GI_strlen>
    4fe4:	01412703          	lw	a4,20(sp)
    4fe8:	00ad8db3          	add	s11,s11,a0
    4fec:	00a00593          	li	a1,10
    4ff0:	00070513          	mv	a0,a4
    4ff4:	311010ef          	jal	ra,6b04 <__GI_strchr>
    4ff8:	02050063          	beqz	a0,5018 <.L29>
    4ffc:	00054703          	lbu	a4,0(a0)
    5000:	fff70713          	addi	a4,a4,-1 # 3fff <.L6+0xb>
    5004:	0ff77713          	zext.b	a4,a4
    5008:	00e50023          	sb	a4,0(a0)
    500c:	0fa71c63          	bne	a4,s10,5104 <.L30>
    5010:	ffed8d93          	addi	s11,s11,-2
    5014:	f51ff06f          	j	4f64 <.L26>

00005018 <.L29>:
    5018:	014ca703          	lw	a4,20(s9)
    501c:	02071863          	bnez	a4,504c <.L72>
    5020:	fff00d13          	li	s10,-1
    5024:	00a00c13          	li	s8,10

00005028 <.L32>:
    5028:	000ca503          	lw	a0,0(s9)
    502c:	01052703          	lw	a4,16(a0)
    5030:	01852683          	lw	a3,24(a0)
    5034:	04d77463          	bgeu	a4,a3,507c <.L33>
    5038:	00170693          	addi	a3,a4,1
    503c:	00d52823          	sw	a3,16(a0)
    5040:	00074503          	lbu	a0,0(a4)

00005044 <.L34>:
    5044:	ff8512e3          	bne	a0,s8,5028 <.L32>
    5048:	03c0006f          	j	5084 <.L35>

0000504c <.L72>:
    504c:	010ca703          	lw	a4,16(s9)
    5050:	008ca583          	lw	a1,8(s9)
    5054:	004ca503          	lw	a0,4(s9)
    5058:	00ec0733          	add	a4,s8,a4
    505c:	00eca823          	sw	a4,16(s9)
    5060:	00b705b3          	add	a1,a4,a1
    5064:	599010ef          	jal	ra,6dfc <realloc>
    5068:	008ca703          	lw	a4,8(s9)
    506c:	00aca223          	sw	a0,4(s9)
    5070:	00e50533          	add	a0,a0,a4
    5074:	00aca623          	sw	a0,12(s9)
    5078:	eedff06f          	j	4f64 <.L26>

0000507c <.L33>:
    507c:	6dc010ef          	jal	ra,6758 <__GI___fgetc_unlocked>
    5080:	fda512e3          	bne	a0,s10,5044 <.L34>

00005084 <.L35>:
    5084:	fff00713          	li	a4,-1
    5088:	f0ed86e3          	beq	s11,a4,4f94 <.L20>
    508c:	00ccad03          	lw	s10,12(s9)
    5090:	00098a63          	beqz	s3,50a4 <.L37>
    5094:	000d0513          	mv	a0,s10
    5098:	00140593          	addi	a1,s0,1
    509c:	4c1010ef          	jal	ra,6d5c <__GI_strspn>
    50a0:	00ad0d33          	add	s10,s10,a0

000050a4 <.L37>:
    50a4:	000d4683          	lbu	a3,0(s10)
    50a8:	004ca503          	lw	a0,4(s9)
    50ac:	e40688e3          	beqz	a3,4efc <.L21>
    50b0:	00044603          	lbu	a2,0(s0)
    50b4:	e4d604e3          	beq	a2,a3,4efc <.L21>
    50b8:	00c12603          	lw	a2,12(sp)
    50bc:	00a92023          	sw	a0,0(s2)
    50c0:	00000593          	li	a1,0
    50c4:	f6cfe0ef          	jal	ra,3830 <__GI_memset>
    50c8:	fffa0793          	addi	a5,s4,-1
    50cc:	00f12c23          	sw	a5,24(sp)
    50d0:	00140793          	addi	a5,s0,1
    50d4:	00000d93          	li	s11,0
    50d8:	00f12e23          	sw	a5,28(sp)

000050dc <.L39>:
    50dc:	000d4603          	lbu	a2,0(s10)
    50e0:	00060863          	beqz	a2,50f0 <.L51>
    50e4:	00044583          	lbu	a1,0(s0)
    50e8:	00c58463          	beq	a1,a2,50f0 <.L51>
    50ec:	034dc063          	blt	s11,s4,510c <.L52>

000050f0 <.L51>:
    50f0:	eb5dd4e3          	bge	s11,s5,4f98 <.L18>
    50f4:	00100737          	lui	a4,0x100
    50f8:	00e4f733          	and	a4,s1,a4
    50fc:	e00700e3          	beqz	a4,4efc <.L21>
    5100:	e95ff06f          	j	4f94 <.L20>

00005104 <.L30>:
    5104:	fffd8d93          	addi	s11,s11,-1
    5108:	f7dff06f          	j	5084 <.L35>

0000510c <.L52>:
    510c:	00092603          	lw	a2,0(s2)
    5110:	002d9593          	slli	a1,s11,0x2
    5114:	01812783          	lw	a5,24(sp)
    5118:	00b60633          	add	a2,a2,a1
    511c:	01a62023          	sw	s10,0(a2)
    5120:	00044c03          	lbu	s8,0(s0)
    5124:	01b79463          	bne	a5,s11,512c <.L40>
    5128:	040b1063          	bnez	s6,5168 <.L41>

0000512c <.L40>:
    512c:	001c3593          	seqz	a1,s8
    5130:	000d0513          	mv	a0,s10
    5134:	00b405b3          	add	a1,s0,a1
    5138:	35d010ef          	jal	ra,6c94 <__GI_strcspn>
    513c:	00ad0d33          	add	s10,s10,a0

00005140 <.L43>:
    5140:	000d4603          	lbu	a2,0(s10)
    5144:	04cc1c63          	bne	s8,a2,519c <.L46>
    5148:	000d0023          	sb	zero,0(s10)

0000514c <.L49>:
    514c:	000b8a63          	beqz	s7,5160 <.L50>
    5150:	01c12583          	lw	a1,28(sp)
    5154:	000d0513          	mv	a0,s10
    5158:	405010ef          	jal	ra,6d5c <__GI_strspn>
    515c:	00ad0d33          	add	s10,s10,a0

00005160 <.L50>:
    5160:	001d8d93          	addi	s11,s11,1
    5164:	f79ff06f          	j	50dc <.L39>

00005168 <.L41>:
    5168:	000d0513          	mv	a0,s10
    516c:	000c0593          	mv	a1,s8
    5170:	251010ef          	jal	ra,6bc0 <__GI_strchrnul>
    5174:	00050d13          	mv	s10,a0
    5178:	fc0984e3          	beqz	s3,5140 <.L43>
    517c:	00140793          	addi	a5,s0,1
    5180:	00f12a23          	sw	a5,20(sp)

00005184 <.L44>:
    5184:	fffd4583          	lbu	a1,-1(s10)
    5188:	01412503          	lw	a0,20(sp)
    518c:	179010ef          	jal	ra,6b04 <__GI_strchr>
    5190:	fa0508e3          	beqz	a0,5140 <.L43>
    5194:	fffd0d13          	addi	s10,s10,-1
    5198:	fedff06f          	j	5184 <.L44>

0000519c <.L46>:
    519c:	fa0608e3          	beqz	a2,514c <.L49>
    51a0:	000d0023          	sb	zero,0(s10)
    51a4:	001d0d13          	addi	s10,s10,1
    51a8:	fa5ff06f          	j	514c <.L49>

000051ac <__GI_fclose>:
    51ac:	00007717          	auipc	a4,0x7
    51b0:	cf872703          	lw	a4,-776(a4) # bea4 <_GLOBAL_OFFSET_TABLE_+0x1c>
    51b4:	00072783          	lw	a5,0(a4)
    51b8:	ff010113          	addi	sp,sp,-16
    51bc:	00812423          	sw	s0,8(sp)
    51c0:	00112623          	sw	ra,12(sp)
    51c4:	00912223          	sw	s1,4(sp)
    51c8:	00050413          	mv	s0,a0
    51cc:	0aa79863          	bne	a5,a0,527c <.L2>
    51d0:	02052783          	lw	a5,32(a0)
    51d4:	00f72023          	sw	a5,0(a4)

000051d8 <.L3>:
    51d8:	00045783          	lhu	a5,0(s0)
    51dc:	00000493          	li	s1,0
    51e0:	0407f793          	andi	a5,a5,64
    51e4:	00078863          	beqz	a5,51f4 <.L5>
    51e8:	00040513          	mv	a0,s0
    51ec:	494010ef          	jal	ra,6680 <__GI_fflush>
    51f0:	00050493          	mv	s1,a0

000051f4 <.L5>:
    51f4:	00442503          	lw	a0,4(s0)
    51f8:	ffe00793          	li	a5,-2
    51fc:	08f51c63          	bne	a0,a5,5294 <.L6>
    5200:	03442783          	lw	a5,52(s0)
    5204:	00078a63          	beqz	a5,5218 <.L9>
    5208:	02442503          	lw	a0,36(s0)
    520c:	000780e7          	jalr	a5

00005210 <.L8>:
    5210:	00055463          	bgez	a0,5218 <.L9>
    5214:	fff00493          	li	s1,-1

00005218 <.L9>:
    5218:	00045703          	lhu	a4,0(s0)
    521c:	fff00793          	li	a5,-1
    5220:	00f42223          	sw	a5,4(s0)
    5224:	000067b7          	lui	a5,0x6
    5228:	00f777b3          	and	a5,a4,a5
    522c:	0307e793          	ori	a5,a5,48
    5230:	00f41023          	sh	a5,0(s0)
    5234:	000047b7          	lui	a5,0x4
    5238:	00f77733          	and	a4,a4,a5
    523c:	00070663          	beqz	a4,5248 <.L10>
    5240:	00842503          	lw	a0,8(s0)
    5244:	d55fe0ef          	jal	ra,3f98 <free>

00005248 <.L10>:
    5248:	00045783          	lhu	a5,0(s0)
    524c:	00002737          	lui	a4,0x2
    5250:	00e7f7b3          	and	a5,a5,a4
    5254:	00078663          	beqz	a5,5260 <.L1>
    5258:	00040513          	mv	a0,s0
    525c:	d3dfe0ef          	jal	ra,3f98 <free>

00005260 <.L1>:
    5260:	00c12083          	lw	ra,12(sp)
    5264:	00812403          	lw	s0,8(sp)
    5268:	00048513          	mv	a0,s1
    526c:	00412483          	lw	s1,4(sp)
    5270:	01010113          	addi	sp,sp,16
    5274:	00008067          	ret

00005278 <.L12>:
    5278:	00070793          	mv	a5,a4

0000527c <.L2>:
    527c:	f4078ee3          	beqz	a5,51d8 <.L3>
    5280:	0207a703          	lw	a4,32(a5) # 4020 <.L5+0xc>
    5284:	fe871ae3          	bne	a4,s0,5278 <.L12>
    5288:	02042703          	lw	a4,32(s0)
    528c:	02e7a023          	sw	a4,32(a5)
    5290:	f49ff06f          	j	51d8 <.L3>

00005294 <.L6>:
    5294:	5c1010ef          	jal	ra,7054 <__GI_close>
    5298:	f79ff06f          	j	5210 <.L8>

0000529c <__GI_fopen>:
    529c:	fff00693          	li	a3,-1
    52a0:	00000613          	li	a2,0
    52a4:	1600006f          	j	5404 <_stdio_fopen>

000052a8 <__stdio_WRITE>:
    52a8:	fd010113          	addi	sp,sp,-48
    52ac:	01412c23          	sw	s4,24(sp)
    52b0:	80000a37          	lui	s4,0x80000
    52b4:	02812423          	sw	s0,40(sp)
    52b8:	02912223          	sw	s1,36(sp)
    52bc:	03212023          	sw	s2,32(sp)
    52c0:	01312e23          	sw	s3,28(sp)
    52c4:	01512a23          	sw	s5,20(sp)
    52c8:	01612823          	sw	s6,16(sp)
    52cc:	01712623          	sw	s7,12(sp)
    52d0:	02112623          	sw	ra,44(sp)
    52d4:	00050493          	mv	s1,a0
    52d8:	00058413          	mv	s0,a1
    52dc:	00060993          	mv	s3,a2
    52e0:	00060913          	mv	s2,a2
    52e4:	fffa4a13          	not	s4,s4
    52e8:	ffe00b13          	li	s6,-2
    52ec:	00007a97          	auipc	s5,0x7
    52f0:	ba8aaa83          	lw	s5,-1112(s5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    52f4:	00b00b93          	li	s7,11

000052f8 <.L2>:
    52f8:	04090a63          	beqz	s2,534c <.L10>
    52fc:	000a0613          	mv	a2,s4
    5300:	00094463          	bltz	s2,5308 <.L3>
    5304:	00090613          	mv	a2,s2

00005308 <.L3>:
    5308:	0044a503          	lw	a0,4(s1)
    530c:	09651a63          	bne	a0,s6,53a0 <.L4>
    5310:	02c4a783          	lw	a5,44(s1)
    5314:	06079463          	bnez	a5,537c <.L5>
    5318:	01600793          	li	a5,22
    531c:	00faa023          	sw	a5,0(s5)

00005320 <.L6>:
    5320:	0004d783          	lhu	a5,0(s1)
    5324:	00400713          	li	a4,4
    5328:	0087e793          	ori	a5,a5,8
    532c:	00f49023          	sh	a5,0(s1)
    5330:	00007797          	auipc	a5,0x7
    5334:	b647a783          	lw	a5,-1180(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    5338:	0007a783          	lw	a5,0(a5)
    533c:	06e78863          	beq	a5,a4,53ac <.L9>
    5340:	00b00713          	li	a4,11
    5344:	06e78463          	beq	a5,a4,53ac <.L9>

00005348 <.L11>:
    5348:	412989b3          	sub	s3,s3,s2

0000534c <.L10>:
    534c:	02c12083          	lw	ra,44(sp)
    5350:	02812403          	lw	s0,40(sp)
    5354:	02412483          	lw	s1,36(sp)
    5358:	02012903          	lw	s2,32(sp)
    535c:	01812a03          	lw	s4,24(sp)
    5360:	01412a83          	lw	s5,20(sp)
    5364:	01012b03          	lw	s6,16(sp)
    5368:	00c12b83          	lw	s7,12(sp)
    536c:	00098513          	mv	a0,s3
    5370:	01c12983          	lw	s3,28(sp)
    5374:	03010113          	addi	sp,sp,48
    5378:	00008067          	ret

0000537c <.L5>:
    537c:	0244a503          	lw	a0,36(s1)
    5380:	017aa023          	sw	s7,0(s5)
    5384:	00040593          	mv	a1,s0
    5388:	000780e7          	jalr	a5
    538c:	f8050ae3          	beqz	a0,5320 <.L6>

00005390 <.L7>:
    5390:	f80548e3          	bltz	a0,5320 <.L6>
    5394:	40a90933          	sub	s2,s2,a0
    5398:	00a40433          	add	s0,s0,a0
    539c:	f5dff06f          	j	52f8 <.L2>

000053a0 <.L4>:
    53a0:	00040593          	mv	a1,s0
    53a4:	595010ef          	jal	ra,7138 <__GI_write>
    53a8:	fe9ff06f          	j	5390 <.L7>

000053ac <.L9>:
    53ac:	0084a783          	lw	a5,8(s1)
    53b0:	00c4a683          	lw	a3,12(s1)
    53b4:	40f68733          	sub	a4,a3,a5
    53b8:	f8f688e3          	beq	a3,a5,5348 <.L11>
    53bc:	00e97463          	bgeu	s2,a4,53c4 <.L12>
    53c0:	00090713          	mv	a4,s2

000053c4 <.L12>:
    53c4:	00a00613          	li	a2,10
    53c8:	00e40733          	add	a4,s0,a4

000053cc <.L15>:
    53cc:	00044683          	lbu	a3,0(s0)
    53d0:	00d78023          	sb	a3,0(a5)
    53d4:	00c69863          	bne	a3,a2,53e4 <.L13>
    53d8:	0004d683          	lhu	a3,0(s1)
    53dc:	1006f693          	andi	a3,a3,256
    53e0:	00069863          	bnez	a3,53f0 <.L14>

000053e4 <.L13>:
    53e4:	00140413          	addi	s0,s0,1
    53e8:	00178793          	addi	a5,a5,1
    53ec:	fee410e3          	bne	s0,a4,53cc <.L15>

000053f0 <.L14>:
    53f0:	0084a703          	lw	a4,8(s1)
    53f4:	00f4a823          	sw	a5,16(s1)
    53f8:	40e787b3          	sub	a5,a5,a4
    53fc:	40f90933          	sub	s2,s2,a5
    5400:	f49ff06f          	j	5348 <.L11>

00005404 <_stdio_fopen>:
    5404:	fe010113          	addi	sp,sp,-32
    5408:	00812c23          	sw	s0,24(sp)
    540c:	01212823          	sw	s2,16(sp)
    5410:	01312623          	sw	s3,12(sp)
    5414:	00112e23          	sw	ra,28(sp)
    5418:	00912a23          	sw	s1,20(sp)
    541c:	0005c783          	lbu	a5,0(a1)
    5420:	07200713          	li	a4,114
    5424:	00050913          	mv	s2,a0
    5428:	00060413          	mv	s0,a2
    542c:	00068993          	mv	s3,a3
    5430:	04e78863          	beq	a5,a4,5480 <.L24>
    5434:	07700713          	li	a4,119
    5438:	0ee78a63          	beq	a5,a4,552c <.L25>
    543c:	06100713          	li	a4,97
    5440:	44100493          	li	s1,1089
    5444:	04e78063          	beq	a5,a4,5484 <.L2>
    5448:	00007797          	auipc	a5,0x7
    544c:	a4c7a783          	lw	a5,-1460(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    5450:	01600713          	li	a4,22
    5454:	00e7a023          	sw	a4,0(a5)
    5458:	0a061c63          	bnez	a2,5510 <.L4>

0000545c <.L7>:
    545c:	00000413          	li	s0,0

00005460 <.L5>:
    5460:	01c12083          	lw	ra,28(sp)
    5464:	00040513          	mv	a0,s0
    5468:	01812403          	lw	s0,24(sp)
    546c:	01412483          	lw	s1,20(sp)
    5470:	01012903          	lw	s2,16(sp)
    5474:	00c12983          	lw	s3,12(sp)
    5478:	02010113          	addi	sp,sp,32
    547c:	00008067          	ret

00005480 <.L24>:
    5480:	00000493          	li	s1,0

00005484 <.L2>:
    5484:	0015c703          	lbu	a4,1(a1)
    5488:	06200793          	li	a5,98
    548c:	00f71463          	bne	a4,a5,5494 <.L8>
    5490:	00158593          	addi	a1,a1,1

00005494 <.L8>:
    5494:	0015c703          	lbu	a4,1(a1)
    5498:	02b00793          	li	a5,43
    549c:	00f71863          	bne	a4,a5,54ac <.L9>
    54a0:	0014e493          	ori	s1,s1,1
    54a4:	00158593          	addi	a1,a1,1
    54a8:	00148493          	addi	s1,s1,1

000054ac <.L9>:
    54ac:	07800713          	li	a4,120

000054b0 <.L10>:
    54b0:	0015c783          	lbu	a5,1(a1)
    54b4:	00158593          	addi	a1,a1,1
    54b8:	06079e63          	bnez	a5,5534 <.L12>
    54bc:	02041063          	bnez	s0,54dc <.L13>
    54c0:	02400513          	li	a0,36
    54c4:	8bdfe0ef          	jal	ra,3d80 <malloc>
    54c8:	00050413          	mv	s0,a0
    54cc:	f80508e3          	beqz	a0,545c <.L7>
    54d0:	000027b7          	lui	a5,0x2
    54d4:	00f51023          	sh	a5,0(a0)
    54d8:	00052423          	sw	zero,8(a0)

000054dc <.L13>:
    54dc:	1409ce63          	bltz	s3,5638 <.L14>
    54e0:	000087b7          	lui	a5,0x8
    54e4:	00378793          	addi	a5,a5,3 # 8003 <.LVL164+0x3>
    54e8:	00f4f7b3          	and	a5,s1,a5
    54ec:	00178793          	addi	a5,a5,1
    54f0:	00190713          	addi	a4,s2,1
    54f4:	01342223          	sw	s3,4(s0)
    54f8:	00f77733          	and	a4,a4,a5
    54fc:	04f70263          	beq	a4,a5,5540 <.L15>

00005500 <.L43>:
    5500:	00007797          	auipc	a5,0x7
    5504:	9947a783          	lw	a5,-1644(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    5508:	01600713          	li	a4,22
    550c:	00e7a023          	sw	a4,0(a5)

00005510 <.L4>:
    5510:	00045783          	lhu	a5,0(s0)
    5514:	00002737          	lui	a4,0x2
    5518:	00e7f7b3          	and	a5,a5,a4
    551c:	f40780e3          	beqz	a5,545c <.L7>
    5520:	00040513          	mv	a0,s0
    5524:	a75fe0ef          	jal	ra,3f98 <free>
    5528:	f35ff06f          	j	545c <.L7>

0000552c <.L25>:
    552c:	24100493          	li	s1,577
    5530:	f55ff06f          	j	5484 <.L2>

00005534 <.L12>:
    5534:	f6e79ee3          	bne	a5,a4,54b0 <.L10>
    5538:	0804e493          	ori	s1,s1,128
    553c:	f75ff06f          	j	54b0 <.L10>

00005540 <.L15>:
    5540:	fff94793          	not	a5,s2
    5544:	0097f7b3          	and	a5,a5,s1
    5548:	4007f793          	andi	a5,a5,1024
    554c:	00078c63          	beqz	a5,5564 <.L16>
    5550:	40000613          	li	a2,1024
    5554:	00400593          	li	a1,4
    5558:	00098513          	mv	a0,s3
    555c:	27d010ef          	jal	ra,6fd8 <__GI_fcntl>
    5560:	fa0510e3          	bnez	a0,5500 <.L43>

00005564 <.L16>:
    5564:	000087b7          	lui	a5,0x8
    5568:	00f977b3          	and	a5,s2,a5
    556c:	00f4e4b3          	or	s1,s1,a5

00005570 <.L18>:
    5570:	00045783          	lhu	a5,0(s0)
    5574:	00002737          	lui	a4,0x2
    5578:	00442503          	lw	a0,4(s0)
    557c:	00e7f7b3          	and	a5,a5,a4
    5580:	ffff8737          	lui	a4,0xffff8
    5584:	40070713          	addi	a4,a4,1024 # ffff8400 <_ebss+0xfffe85b0>
    5588:	00e4f733          	and	a4,s1,a4
    558c:	0034f493          	andi	s1,s1,3
    5590:	00148493          	addi	s1,s1,1
    5594:	0034c493          	xori	s1,s1,3
    5598:	00e7e7b3          	or	a5,a5,a4
    559c:	00449493          	slli	s1,s1,0x4
    55a0:	0097e7b3          	or	a5,a5,s1
    55a4:	00f41023          	sh	a5,0(s0)
    55a8:	800007b7          	lui	a5,0x80000
    55ac:	fff7c793          	not	a5,a5
    55b0:	02f50463          	beq	a0,a5,55d8 <.L20>
    55b4:	00007497          	auipc	s1,0x7
    55b8:	8e04a483          	lw	s1,-1824(s1) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    55bc:	0004a903          	lw	s2,0(s1)
    55c0:	db0fe0ef          	jal	ra,3b70 <__GI_isatty>
    55c4:	00050863          	beqz	a0,55d4 <.L21>
    55c8:	00045783          	lhu	a5,0(s0)
    55cc:	1007e793          	ori	a5,a5,256
    55d0:	00f41023          	sh	a5,0(s0)

000055d4 <.L21>:
    55d4:	0124a023          	sw	s2,0(s1)

000055d8 <.L20>:
    55d8:	00842783          	lw	a5,8(s0)
    55dc:	02079863          	bnez	a5,560c <.L22>
    55e0:	00001537          	lui	a0,0x1
    55e4:	f9cfe0ef          	jal	ra,3d80 <malloc>
    55e8:	00a42423          	sw	a0,8(s0)
    55ec:	06050c63          	beqz	a0,5664 <.L23>
    55f0:	000017b7          	lui	a5,0x1
    55f4:	00f50533          	add	a0,a0,a5
    55f8:	00045783          	lhu	a5,0(s0)
    55fc:	00004737          	lui	a4,0x4
    5600:	00a42623          	sw	a0,12(s0)
    5604:	00e7e7b3          	or	a5,a5,a4
    5608:	00f41023          	sh	a5,0(s0)

0000560c <.L22>:
    560c:	00842783          	lw	a5,8(s0)
    5610:	00f42c23          	sw	a5,24(s0)
    5614:	00f42e23          	sw	a5,28(s0)
    5618:	00f42823          	sw	a5,16(s0)
    561c:	00f42a23          	sw	a5,20(s0)
    5620:	00007797          	auipc	a5,0x7
    5624:	8847a783          	lw	a5,-1916(a5) # bea4 <_GLOBAL_OFFSET_TABLE_+0x1c>
    5628:	0007a703          	lw	a4,0(a5)
    562c:	0087a023          	sw	s0,0(a5)
    5630:	02e42023          	sw	a4,32(s0)
    5634:	e2dff06f          	j	5460 <.L5>

00005638 <.L14>:
    5638:	fff00793          	li	a5,-1
    563c:	00f98663          	beq	s3,a5,5648 <.L19>
    5640:	000087b7          	lui	a5,0x8
    5644:	00f4e4b3          	or	s1,s1,a5

00005648 <.L19>:
    5648:	1b600613          	li	a2,438
    564c:	00048593          	mv	a1,s1
    5650:	00090513          	mv	a0,s2
    5654:	235010ef          	jal	ra,7088 <__GI_open>
    5658:	00a42223          	sw	a0,4(s0)
    565c:	f0055ae3          	bgez	a0,5570 <.L18>
    5660:	eb1ff06f          	j	5510 <.L4>

00005664 <.L23>:
    5664:	00042623          	sw	zero,12(s0)
    5668:	fa5ff06f          	j	560c <.L22>

0000566c <__stdio_fwrite>:
    566c:	00065783          	lhu	a5,0(a2)
    5670:	fe010113          	addi	sp,sp,-32
    5674:	00812c23          	sw	s0,24(sp)
    5678:	00912a23          	sw	s1,20(sp)
    567c:	01212823          	sw	s2,16(sp)
    5680:	00112e23          	sw	ra,28(sp)
    5684:	01312623          	sw	s3,12(sp)
    5688:	2007f793          	andi	a5,a5,512
    568c:	00050913          	mv	s2,a0
    5690:	00058413          	mv	s0,a1
    5694:	00060493          	mv	s1,a2
    5698:	02078663          	beqz	a5,56c4 <.L2>

0000569c <.L11>:
    569c:	00040613          	mv	a2,s0
    56a0:	01812403          	lw	s0,24(sp)
    56a4:	01c12083          	lw	ra,28(sp)
    56a8:	00c12983          	lw	s3,12(sp)
    56ac:	00090593          	mv	a1,s2
    56b0:	00048513          	mv	a0,s1
    56b4:	01012903          	lw	s2,16(sp)
    56b8:	01412483          	lw	s1,20(sp)
    56bc:	02010113          	addi	sp,sp,32
    56c0:	be9ff06f          	j	52a8 <__stdio_WRITE>

000056c4 <.L2>:
    56c4:	01062503          	lw	a0,16(a2)
    56c8:	00c62783          	lw	a5,12(a2)
    56cc:	00462683          	lw	a3,4(a2)
    56d0:	ffd00713          	li	a4,-3
    56d4:	40a787b3          	sub	a5,a5,a0
    56d8:	04e69463          	bne	a3,a4,5720 <.L3>
    56dc:	00058993          	mv	s3,a1
    56e0:	00b7f463          	bgeu	a5,a1,56e8 <.L4>
    56e4:	00078993          	mv	s3,a5

000056e8 <.L4>:
    56e8:	00098613          	mv	a2,s3
    56ec:	00090593          	mv	a1,s2
    56f0:	e99fd0ef          	jal	ra,3588 <__GI_memcpy>
    56f4:	0104a783          	lw	a5,16(s1)
    56f8:	013787b3          	add	a5,a5,s3

000056fc <.L25>:
    56fc:	00f4a823          	sw	a5,16(s1)

00005700 <.L5>:
    5700:	01c12083          	lw	ra,28(sp)
    5704:	00040513          	mv	a0,s0
    5708:	01812403          	lw	s0,24(sp)
    570c:	01412483          	lw	s1,20(sp)
    5710:	01012903          	lw	s2,16(sp)
    5714:	00c12983          	lw	s3,12(sp)
    5718:	02010113          	addi	sp,sp,32
    571c:	00008067          	ret

00005720 <.L3>:
    5720:	08b7e063          	bltu	a5,a1,57a0 <.L6>
    5724:	00058613          	mv	a2,a1
    5728:	00090593          	mv	a1,s2
    572c:	e5dfd0ef          	jal	ra,3588 <__GI_memcpy>
    5730:	0104a783          	lw	a5,16(s1)
    5734:	008787b3          	add	a5,a5,s0
    5738:	00f4a823          	sw	a5,16(s1)
    573c:	0004d783          	lhu	a5,0(s1)
    5740:	1007f793          	andi	a5,a5,256
    5744:	fa078ee3          	beqz	a5,5700 <.L5>
    5748:	00040613          	mv	a2,s0
    574c:	00a00593          	li	a1,10
    5750:	00090513          	mv	a0,s2
    5754:	2e0010ef          	jal	ra,6a34 <__GI_memrchr>
    5758:	fa0504e3          	beqz	a0,5700 <.L5>
    575c:	00048513          	mv	a0,s1
    5760:	b29fc0ef          	jal	ra,2288 <__stdio_wcommit>
    5764:	f8050ee3          	beqz	a0,5700 <.L5>
    5768:	00040613          	mv	a2,s0
    576c:	00857463          	bgeu	a0,s0,5774 <.L10>
    5770:	00050613          	mv	a2,a0

00005774 <.L10>:
    5774:	40c40533          	sub	a0,s0,a2
    5778:	00a00593          	li	a1,10
    577c:	00a90533          	add	a0,s2,a0
    5780:	1b8010ef          	jal	ra,6938 <__GI_memchr>
    5784:	f6050ee3          	beqz	a0,5700 <.L5>
    5788:	0104a783          	lw	a5,16(s1)
    578c:	00890933          	add	s2,s2,s0
    5790:	40a90533          	sub	a0,s2,a0
    5794:	40a40433          	sub	s0,s0,a0
    5798:	40a787b3          	sub	a5,a5,a0
    579c:	f61ff06f          	j	56fc <.L25>

000057a0 <.L6>:
    57a0:	00862783          	lw	a5,8(a2)
    57a4:	eea78ce3          	beq	a5,a0,569c <.L11>
    57a8:	00060513          	mv	a0,a2
    57ac:	addfc0ef          	jal	ra,2288 <__stdio_wcommit>
    57b0:	ee0506e3          	beqz	a0,569c <.L11>
    57b4:	00000413          	li	s0,0
    57b8:	f49ff06f          	j	5700 <.L5>

000057bc <__stdio_trans2w>:
    57bc:	00055603          	lhu	a2,0(a0) # 1000 <.L4+0x8>
    57c0:	ff010113          	addi	sp,sp,-16
    57c4:	00812423          	sw	s0,8(sp)
    57c8:	00112623          	sw	ra,12(sp)
    57cc:	02067793          	andi	a5,a2,32
    57d0:	00050413          	mv	s0,a0
    57d4:	02078a63          	beqz	a5,5808 <.L2>
    57d8:	00006797          	auipc	a5,0x6
    57dc:	6bc7a783          	lw	a5,1724(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    57e0:	00900713          	li	a4,9
    57e4:	00e7a023          	sw	a4,0(a5)

000057e8 <.L3>:
    57e8:	00045783          	lhu	a5,0(s0)
    57ec:	fff00513          	li	a0,-1
    57f0:	0087e793          	ori	a5,a5,8
    57f4:	00f41023          	sh	a5,0(s0)

000057f8 <.L1>:
    57f8:	00c12083          	lw	ra,12(sp)
    57fc:	00812403          	lw	s0,8(sp)
    5800:	01010113          	addi	sp,sp,16
    5804:	00008067          	ret

00005808 <.L2>:
    5808:	00367793          	andi	a5,a2,3
    580c:	02078463          	beqz	a5,5834 <.L5>
    5810:	00467793          	andi	a5,a2,4
    5814:	02078e63          	beqz	a5,5850 <.L6>

00005818 <.L8>:
    5818:	00045783          	lhu	a5,0(s0)
    581c:	ffc7f793          	andi	a5,a5,-4
    5820:	00f41023          	sh	a5,0(s0)
    5824:	00842783          	lw	a5,8(s0)
    5828:	00f42c23          	sw	a5,24(s0)
    582c:	00f42823          	sw	a5,16(s0)
    5830:	00f42a23          	sw	a5,20(s0)

00005834 <.L5>:
    5834:	00045783          	lhu	a5,0(s0)
    5838:	0407e713          	ori	a4,a5,64
    583c:	00e41023          	sh	a4,0(s0)
    5840:	3007f793          	andi	a5,a5,768
    5844:	04078063          	beqz	a5,5884 <.L10>

00005848 <.L11>:
    5848:	00000513          	li	a0,0
    584c:	fadff06f          	j	57f8 <.L1>

00005850 <.L6>:
    5850:	01452703          	lw	a4,20(a0)
    5854:	01052783          	lw	a5,16(a0)
    5858:	00f71663          	bne	a4,a5,5864 <.L7>
    585c:	00267793          	andi	a5,a2,2
    5860:	fa078ce3          	beqz	a5,5818 <.L8>

00005864 <.L7>:
    5864:	40067613          	andi	a2,a2,1024
    5868:	00c03633          	snez	a2,a2
    586c:	00160613          	addi	a2,a2,1
    5870:	00000593          	li	a1,0
    5874:	00040513          	mv	a0,s0
    5878:	285010ef          	jal	ra,72fc <__GI_fseek>
    587c:	f8050ee3          	beqz	a0,5818 <.L8>
    5880:	f69ff06f          	j	57e8 <.L3>

00005884 <.L10>:
    5884:	00c42783          	lw	a5,12(s0)
    5888:	00f42e23          	sw	a5,28(s0)
    588c:	fbdff06f          	j	5848 <.L11>

00005890 <_load_inttype>:
    5890:	00001737          	lui	a4,0x1
    5894:	80070713          	addi	a4,a4,-2048 # 800 <core_list_init+0x34>
    5898:	00050793          	mv	a5,a0
    589c:	00e57733          	and	a4,a0,a4
    58a0:	0005a503          	lw	a0,0(a1)
    58a4:	02064c63          	bltz	a2,58dc <.L2>
    58a8:	00070663          	beqz	a4,58b4 <.L3>

000058ac <.L10>:
    58ac:	0045a583          	lw	a1,4(a1)
    58b0:	00008067          	ret

000058b4 <.L3>:
    58b4:	10000713          	li	a4,256
    58b8:	00e79863          	bne	a5,a4,58c8 <.L5>
    58bc:	0ff57513          	zext.b	a0,a0

000058c0 <.L6>:
    58c0:	00000593          	li	a1,0
    58c4:	00008067          	ret

000058c8 <.L5>:
    58c8:	20000713          	li	a4,512
    58cc:	fee79ae3          	bne	a5,a4,58c0 <.L6>
    58d0:	01051513          	slli	a0,a0,0x10
    58d4:	01055513          	srli	a0,a0,0x10
    58d8:	fe9ff06f          	j	58c0 <.L6>

000058dc <.L2>:
    58dc:	fc0718e3          	bnez	a4,58ac <.L10>
    58e0:	10000713          	li	a4,256
    58e4:	00e79a63          	bne	a5,a4,58f8 <.L8>
    58e8:	01851513          	slli	a0,a0,0x18
    58ec:	41855513          	srai	a0,a0,0x18

000058f0 <.L9>:
    58f0:	41f55593          	srai	a1,a0,0x1f
    58f4:	00008067          	ret

000058f8 <.L8>:
    58f8:	20000713          	li	a4,512
    58fc:	fee79ae3          	bne	a5,a4,58f0 <.L9>
    5900:	01051513          	slli	a0,a0,0x10
    5904:	41055513          	srai	a0,a0,0x10
    5908:	fe9ff06f          	j	58f0 <.L9>

0000590c <_store_inttype>:
    590c:	10000793          	li	a5,256
    5910:	00f59663          	bne	a1,a5,591c <.L2>
    5914:	00c50023          	sb	a2,0(a0)
    5918:	00008067          	ret

0000591c <.L2>:
    591c:	80058793          	addi	a5,a1,-2048
    5920:	00079863          	bnez	a5,5930 <.L4>
    5924:	00c52023          	sw	a2,0(a0)
    5928:	00d52223          	sw	a3,4(a0)
    592c:	00008067          	ret

00005930 <.L4>:
    5930:	20000793          	li	a5,512
    5934:	00f59663          	bne	a1,a5,5940 <.L5>
    5938:	00c51023          	sh	a2,0(a0)
    593c:	00008067          	ret

00005940 <.L5>:
    5940:	00c52023          	sw	a2,0(a0)
    5944:	00008067          	ret

00005948 <_uintmaxtostr>:
    5948:	00050893          	mv	a7,a0
    594c:	00000e13          	li	t3,0
    5950:	0206d063          	bgez	a3,5970 <.L2>
    5954:	40d006b3          	neg	a3,a3
    5958:	00065c63          	bgez	a2,5970 <.L2>
    595c:	00b037b3          	snez	a5,a1
    5960:	40c00633          	neg	a2,a2
    5964:	40f60633          	sub	a2,a2,a5
    5968:	40b005b3          	neg	a1,a1
    596c:	00100e13          	li	t3,1

00005970 <.L2>:
    5970:	fff00813          	li	a6,-1
    5974:	02d85333          	divu	t1,a6,a3
    5978:	00088023          	sb	zero,0(a7)
    597c:	02d87833          	remu	a6,a6,a3
    5980:	00180813          	addi	a6,a6,1
    5984:	01069663          	bne	a3,a6,5990 <.L4>
    5988:	00130313          	addi	t1,t1,1
    598c:	00000813          	li	a6,0

00005990 <.L4>:
    5990:	00900e93          	li	t4,9

00005994 <.L8>:
    5994:	02d5f533          	remu	a0,a1,a3
    5998:	02d5d5b3          	divu	a1,a1,a3
    599c:	02060463          	beqz	a2,59c4 <.L5>
    59a0:	02d677b3          	remu	a5,a2,a3
    59a4:	02f80f33          	mul	t5,a6,a5
    59a8:	02f307b3          	mul	a5,t1,a5
    59ac:	00af0533          	add	a0,t5,a0
    59b0:	00b785b3          	add	a1,a5,a1
    59b4:	02d557b3          	divu	a5,a0,a3
    59b8:	02d65633          	divu	a2,a2,a3
    59bc:	00f585b3          	add	a1,a1,a5
    59c0:	02d57533          	remu	a0,a0,a3

000059c4 <.L5>:
    59c4:	0ff57793          	zext.b	a5,a0
    59c8:	02aeec63          	bltu	t4,a0,5a00 <.L6>
    59cc:	03078793          	addi	a5,a5,48

000059d0 <.L19>:
    59d0:	0ff7f793          	zext.b	a5,a5
    59d4:	fef88fa3          	sb	a5,-1(a7)
    59d8:	00b667b3          	or	a5,a2,a1
    59dc:	fff88513          	addi	a0,a7,-1
    59e0:	00079c63          	bnez	a5,59f8 <.L12>
    59e4:	000e0863          	beqz	t3,59f4 <.L1>
    59e8:	02d00793          	li	a5,45
    59ec:	fef50fa3          	sb	a5,-1(a0)
    59f0:	ffe88513          	addi	a0,a7,-2

000059f4 <.L1>:
    59f4:	00008067          	ret

000059f8 <.L12>:
    59f8:	00050893          	mv	a7,a0
    59fc:	f99ff06f          	j	5994 <.L8>

00005a00 <.L6>:
    5a00:	00e787b3          	add	a5,a5,a4
    5a04:	fcdff06f          	j	59d0 <.L19>

00005a08 <_fpmaxtostr>:
    5a08:	e7010113          	addi	sp,sp,-400
    5a0c:	00462783          	lw	a5,4(a2)
    5a10:	18812423          	sw	s0,392(sp)
    5a14:	00864403          	lbu	s0,8(a2)
    5a18:	02f12c23          	sw	a5,56(sp)
    5a1c:	06500793          	li	a5,101
    5a20:	18912223          	sw	s1,388(sp)
    5a24:	19212023          	sw	s2,384(sp)
    5a28:	17312e23          	sw	s3,380(sp)
    5a2c:	17412c23          	sw	s4,376(sp)
    5a30:	17512a23          	sw	s5,372(sp)
    5a34:	17612823          	sw	s6,368(sp)
    5a38:	17912223          	sw	s9,356(sp)
    5a3c:	0af10c23          	sb	a5,184(sp)
    5a40:	18112623          	sw	ra,396(sp)
    5a44:	17712623          	sw	s7,364(sp)
    5a48:	17812423          	sw	s8,360(sp)
    5a4c:	17a12023          	sw	s10,352(sp)
    5a50:	15b12e23          	sw	s11,348(sp)
    5a54:	04a12823          	sw	a0,80(sp)
    5a58:	04d12a23          	sw	a3,84(sp)
    5a5c:	02046c93          	ori	s9,s0,32
    5a60:	06100793          	li	a5,97
    5a64:	0005aa03          	lw	s4,0(a1)
    5a68:	0045aa83          	lw	s5,4(a1)
    5a6c:	0085ab03          	lw	s6,8(a1)
    5a70:	00c5a903          	lw	s2,12(a1)
    5a74:	00062483          	lw	s1,0(a2)
    5a78:	00060993          	mv	s3,a2
    5a7c:	1cfc9e63          	bne	s9,a5,5c58 <.L2>
    5a80:	07000793          	li	a5,112
    5a84:	0af10c23          	sb	a5,184(sp)
    5a88:	1e04c063          	bltz	s1,5c68 <.L78>

00005a8c <.L4>:
    5a8c:	02012423          	sw	zero,40(sp)

00005a90 <.L3>:
    5a90:	00c9a783          	lw	a5,12(s3) # 2000c <_ebss+0x101bc>
    5a94:	0a010823          	sb	zero,176(sp)
    5a98:	0027f713          	andi	a4,a5,2
    5a9c:	1c070e63          	beqz	a4,5c78 <.L5>
    5aa0:	02b00793          	li	a5,43

00005aa4 <.L131>:
    5aa4:	0af10823          	sb	a5,176(sp)

00005aa8 <.L6>:
    5aa8:	0a010c13          	addi	s8,sp,160
    5aac:	09010b93          	addi	s7,sp,144
    5ab0:	000b8593          	mv	a1,s7
    5ab4:	000c0513          	mv	a0,s8
    5ab8:	0a0108a3          	sb	zero,177(sp)
    5abc:	10012223          	sw	zero,260(sp)
    5ac0:	0b412023          	sw	s4,160(sp)
    5ac4:	0b512223          	sw	s5,164(sp)
    5ac8:	0b612423          	sw	s6,168(sp)
    5acc:	0b212623          	sw	s2,172(sp)
    5ad0:	09412823          	sw	s4,144(sp)
    5ad4:	09512a23          	sw	s5,148(sp)
    5ad8:	09612c23          	sw	s6,152(sp)
    5adc:	09212e23          	sw	s2,156(sp)
    5ae0:	31d020ef          	jal	ra,85fc <__eqtf2>
    5ae4:	1a050263          	beqz	a0,5c88 <.L126>
    5ae8:	00800793          	li	a5,8
    5aec:	10f12223          	sw	a5,260(sp)

00005af0 <.L9>:
    5af0:	02000793          	li	a5,32
    5af4:	00f9a823          	sw	a5,16(s3)
    5af8:	07000793          	li	a5,112
    5afc:	0ef12e23          	sw	a5,252(sp)
    5b00:	00300793          	li	a5,3
    5b04:	10f12023          	sw	a5,256(sp)
    5b08:	06000793          	li	a5,96
    5b0c:	0087e863          	bltu	a5,s0,5b1c <.L18>
    5b10:	10412783          	lw	a5,260(sp)
    5b14:	00478793          	addi	a5,a5,4
    5b18:	10f12223          	sw	a5,260(sp)

00005b1c <.L18>:
    5b1c:	10412783          	lw	a5,260(sp)
    5b20:	00008717          	auipc	a4,0x8
    5b24:	97070713          	addi	a4,a4,-1680 # d490 <fmt>
    5b28:	00040513          	mv	a0,s0
    5b2c:	00e787b3          	add	a5,a5,a4
    5b30:	10f12223          	sw	a5,260(sp)
    5b34:	10810913          	addi	s2,sp,264

00005b38 <.L19>:
    5b38:	10010793          	addi	a5,sp,256

00005b3c <.L69>:
    5b3c:	0007a703          	lw	a4,0(a5)
    5b40:	03812683          	lw	a3,56(sp)
    5b44:	00c78793          	addi	a5,a5,12
    5b48:	40e68733          	sub	a4,a3,a4
    5b4c:	02e12c23          	sw	a4,56(sp)
    5b50:	ff27e6e3          	bltu	a5,s2,5b3c <.L69>
    5b54:	0a000793          	li	a5,160
    5b58:	0ef12823          	sw	a5,240(sp)
    5b5c:	0b014783          	lbu	a5,176(sp)
    5b60:	0b010713          	addi	a4,sp,176
    5b64:	02056513          	ori	a0,a0,32
    5b68:	00f037b3          	snez	a5,a5
    5b6c:	0ef12a23          	sw	a5,244(sp)
    5b70:	0ee12c23          	sw	a4,248(sp)
    5b74:	0ff57513          	zext.b	a0,a0
    5b78:	06100693          	li	a3,97
    5b7c:	02d51a63          	bne	a0,a3,5bb0 <.L70>
    5b80:	0fc12603          	lw	a2,252(sp)
    5b84:	00f00693          	li	a3,15
    5b88:	02c6d463          	bge	a3,a2,5bb0 <.L70>
    5b8c:	00f70733          	add	a4,a4,a5
    5b90:	03000693          	li	a3,48
    5b94:	00d70023          	sb	a3,0(a4)
    5b98:	0b814683          	lbu	a3,184(sp)
    5b9c:	00278793          	addi	a5,a5,2
    5ba0:	00070123          	sb	zero,2(a4)
    5ba4:	00868693          	addi	a3,a3,8
    5ba8:	00d700a3          	sb	a3,1(a4)
    5bac:	0ef12a23          	sw	a5,244(sp)

00005bb0 <.L70>:
    5bb0:	03812703          	lw	a4,56(sp)
    5bb4:	40f707b3          	sub	a5,a4,a5
    5bb8:	02f05663          	blez	a5,5be4 <.L73>
    5bbc:	00c9a703          	lw	a4,12(s3)
    5bc0:	00877713          	andi	a4,a4,8
    5bc4:	280704e3          	beqz	a4,664c <.L72>
    5bc8:	00f92223          	sw	a5,4(s2)
    5bcc:	0a000713          	li	a4,160
    5bd0:	00008797          	auipc	a5,0x8
    5bd4:	8c378793          	addi	a5,a5,-1853 # d493 <fmt+0x3>
    5bd8:	00e92023          	sw	a4,0(s2)
    5bdc:	00f92423          	sw	a5,8(s2)
    5be0:	00c90913          	addi	s2,s2,12

00005be4 <.L73>:
    5be4:	0f010413          	addi	s0,sp,240
    5be8:	00000493          	li	s1,0

00005bec <.L76>:
    5bec:	00442983          	lw	s3,4(s0)
    5bf0:	00842683          	lw	a3,8(s0)
    5bf4:	00042583          	lw	a1,0(s0)
    5bf8:	05012503          	lw	a0,80(sp)
    5bfc:	05412783          	lw	a5,84(sp)
    5c00:	00098613          	mv	a2,s3
    5c04:	000780e7          	jalr	a5
    5c08:	273518e3          	bne	a0,s3,6678 <.L98>
    5c0c:	00c40413          	addi	s0,s0,12
    5c10:	00a484b3          	add	s1,s1,a0
    5c14:	fd246ce3          	bltu	s0,s2,5bec <.L76>

00005c18 <.L1>:
    5c18:	18c12083          	lw	ra,396(sp)
    5c1c:	18812403          	lw	s0,392(sp)
    5c20:	18012903          	lw	s2,384(sp)
    5c24:	17c12983          	lw	s3,380(sp)
    5c28:	17812a03          	lw	s4,376(sp)
    5c2c:	17412a83          	lw	s5,372(sp)
    5c30:	17012b03          	lw	s6,368(sp)
    5c34:	16c12b83          	lw	s7,364(sp)
    5c38:	16812c03          	lw	s8,360(sp)
    5c3c:	16412c83          	lw	s9,356(sp)
    5c40:	16012d03          	lw	s10,352(sp)
    5c44:	15c12d83          	lw	s11,348(sp)
    5c48:	00048513          	mv	a0,s1
    5c4c:	18412483          	lw	s1,388(sp)
    5c50:	19010113          	addi	sp,sp,400
    5c54:	00008067          	ret

00005c58 <.L2>:
    5c58:	e204dae3          	bgez	s1,5a8c <.L4>
    5c5c:	02012423          	sw	zero,40(sp)
    5c60:	00600493          	li	s1,6
    5c64:	e2dff06f          	j	5a90 <.L3>

00005c68 <.L78>:
    5c68:	00100793          	li	a5,1
    5c6c:	02f12423          	sw	a5,40(sp)
    5c70:	01d00493          	li	s1,29
    5c74:	e1dff06f          	j	5a90 <.L3>

00005c78 <.L5>:
    5c78:	0017f793          	andi	a5,a5,1
    5c7c:	e20786e3          	beqz	a5,5aa8 <.L6>
    5c80:	02000793          	li	a5,32
    5c84:	e21ff06f          	j	5aa4 <.L131>

00005c88 <.L126>:
    5c88:	000b8593          	mv	a1,s7
    5c8c:	000c0513          	mv	a0,s8
    5c90:	0b412023          	sw	s4,160(sp)
    5c94:	0b512223          	sw	s5,164(sp)
    5c98:	0b612423          	sw	s6,168(sp)
    5c9c:	0b212623          	sw	s2,172(sp)
    5ca0:	08012823          	sw	zero,144(sp)
    5ca4:	08012a23          	sw	zero,148(sp)
    5ca8:	08012c23          	sw	zero,152(sp)
    5cac:	08012e23          	sw	zero,156(sp)
    5cb0:	14d020ef          	jal	ra,85fc <__eqtf2>
    5cb4:	24051c63          	bnez	a0,5f0c <.L127>
    5cb8:	000c0513          	mv	a0,s8
    5cbc:	618050ef          	jal	ra,b2d4 <__trunctfdf2>
    5cc0:	00b50663          	beq	a0,a1,5ccc <.L12>
    5cc4:	02d00793          	li	a5,45
    5cc8:	0af10823          	sb	a5,176(sp)

00005ccc <.L12>:
    5ccc:	02400793          	li	a5,36
    5cd0:	02f12823          	sw	a5,48(sp)
    5cd4:	00900793          	li	a5,9
    5cd8:	00008617          	auipc	a2,0x8
    5cdc:	e4860613          	addi	a2,a2,-440 # db20 <.LC2>
    5ce0:	02f12623          	sw	a5,44(sp)
    5ce4:	00a00793          	li	a5,10
    5ce8:	00f12623          	sw	a5,12(sp)
    5cec:	00062783          	lw	a5,0(a2)
    5cf0:	000a0c93          	mv	s9,s4
    5cf4:	000a8d13          	mv	s10,s5
    5cf8:	00f12c23          	sw	a5,24(sp)
    5cfc:	00462783          	lw	a5,4(a2)
    5d00:	000b0d93          	mv	s11,s6
    5d04:	00090b93          	mv	s7,s2
    5d08:	00f12e23          	sw	a5,28(sp)
    5d0c:	00862783          	lw	a5,8(a2)
    5d10:	fff00c13          	li	s8,-1
    5d14:	02f12023          	sw	a5,32(sp)
    5d18:	00c62783          	lw	a5,12(a2)
    5d1c:	02f12223          	sw	a5,36(sp)

00005d20 <.L13>:
    5d20:	0a010793          	addi	a5,sp,160
    5d24:	00f12823          	sw	a5,16(sp)
    5d28:	09010793          	addi	a5,sp,144
    5d2c:	00f12a23          	sw	a5,20(sp)
    5d30:	08010793          	addi	a5,sp,128
    5d34:	00400913          	li	s2,4
    5d38:	0ca10a13          	addi	s4,sp,202
    5d3c:	02f12a23          	sw	a5,52(sp)
    5d40:	07010b13          	addi	s6,sp,112

00005d44 <.L29>:
    5d44:	01012503          	lw	a0,16(sp)
    5d48:	0b912023          	sw	s9,160(sp)
    5d4c:	0ba12223          	sw	s10,164(sp)
    5d50:	0bb12423          	sw	s11,168(sp)
    5d54:	0b712623          	sw	s7,172(sp)
    5d58:	150050ef          	jal	ra,aea8 <__fixunstfsi>
    5d5c:	00050593          	mv	a1,a0
    5d60:	00050a93          	mv	s5,a0
    5d64:	01012503          	lw	a0,16(sp)
    5d68:	22c050ef          	jal	ra,af94 <__floatunsitf>
    5d6c:	0a012703          	lw	a4,160(sp)
    5d70:	03412583          	lw	a1,52(sp)
    5d74:	01412503          	lw	a0,20(sp)
    5d78:	06e12823          	sw	a4,112(sp)
    5d7c:	0a412703          	lw	a4,164(sp)
    5d80:	000b0613          	mv	a2,s6
    5d84:	09912023          	sw	s9,128(sp)
    5d88:	06e12a23          	sw	a4,116(sp)
    5d8c:	0a812703          	lw	a4,168(sp)
    5d90:	09a12223          	sw	s10,132(sp)
    5d94:	09b12423          	sw	s11,136(sp)
    5d98:	06e12c23          	sw	a4,120(sp)
    5d9c:	0ac12703          	lw	a4,172(sp)
    5da0:	09712623          	sw	s7,140(sp)
    5da4:	06e12e23          	sw	a4,124(sp)
    5da8:	449030ef          	jal	ra,99f0 <__subtf3>
    5dac:	01812783          	lw	a5,24(sp)
    5db0:	03412603          	lw	a2,52(sp)
    5db4:	01012503          	lw	a0,16(sp)
    5db8:	08f12023          	sw	a5,128(sp)
    5dbc:	01c12783          	lw	a5,28(sp)
    5dc0:	01412583          	lw	a1,20(sp)
    5dc4:	08f12223          	sw	a5,132(sp)
    5dc8:	02012783          	lw	a5,32(sp)
    5dcc:	08f12423          	sw	a5,136(sp)
    5dd0:	02412783          	lw	a5,36(sp)
    5dd4:	08f12623          	sw	a5,140(sp)
    5dd8:	3c1020ef          	jal	ra,8998 <__multf3>
    5ddc:	02c12783          	lw	a5,44(sp)
    5de0:	0a012c83          	lw	s9,160(sp)
    5de4:	0a412d03          	lw	s10,164(sp)
    5de8:	0a812d83          	lw	s11,168(sp)
    5dec:	0ac12b83          	lw	s7,172(sp)
    5df0:	00fa0a33          	add	s4,s4,a5
    5df4:	000a0613          	mv	a2,s4
    5df8:	40fa0533          	sub	a0,s4,a5

00005dfc <.L28>:
    5dfc:	00c12783          	lw	a5,12(sp)
    5e00:	fff60613          	addi	a2,a2,-1
    5e04:	02faf5b3          	remu	a1,s5,a5
    5e08:	03058593          	addi	a1,a1,48
    5e0c:	00b60023          	sb	a1,0(a2)
    5e10:	02fadab3          	divu	s5,s5,a5
    5e14:	fec514e3          	bne	a0,a2,5dfc <.L28>
    5e18:	fff90913          	addi	s2,s2,-1
    5e1c:	f20914e3          	bnez	s2,5d44 <.L29>
    5e20:	06000713          	li	a4,96
    5e24:	00876c63          	bltu	a4,s0,5e3c <.L30>
    5e28:	0b814703          	lbu	a4,184(sp)
    5e2c:	02040413          	addi	s0,s0,32
    5e30:	0ff47413          	zext.b	s0,s0
    5e34:	fe070713          	addi	a4,a4,-32
    5e38:	0ae10c23          	sb	a4,184(sp)

00005e3c <.L30>:
    5e3c:	06700713          	li	a4,103
    5e40:	0c910913          	addi	s2,sp,201
    5e44:	50e41263          	bne	s0,a4,6348 <.L31>
    5e48:	54048c63          	beqz	s1,63a0 <.L32>
    5e4c:	fff48493          	addi	s1,s1,-1

00005e50 <.L81>:
    5e50:	00048693          	mv	a3,s1

00005e54 <.L33>:
    5e54:	03012783          	lw	a5,48(sp)
    5e58:	00003737          	lui	a4,0x3
    5e5c:	0ce11423          	sh	a4,200(sp)
    5e60:	50f6ce63          	blt	a3,a5,637c <.L34>
    5e64:	00178613          	addi	a2,a5,1
    5e68:	00c90633          	add	a2,s2,a2
    5e6c:	00000593          	li	a1,0

00005e70 <.L35>:
    5e70:	00c12783          	lw	a5,12(sp)
    5e74:	03000513          	li	a0,48
    5e78:	02f78b93          	addi	s7,a5,47

00005e7c <.L120>:
    5e7c:	fff64703          	lbu	a4,-1(a2)
    5e80:	fff60613          	addi	a2,a2,-1
    5e84:	00b70733          	add	a4,a4,a1
    5e88:	0ff77713          	zext.b	a4,a4
    5e8c:	00e60023          	sb	a4,0(a2)
    5e90:	fea706e3          	beq	a4,a0,5e7c <.L120>
    5e94:	feebe4e3          	bltu	s7,a4,5e7c <.L120>
    5e98:	02046713          	ori	a4,s0,32
    5e9c:	06100593          	li	a1,97
    5ea0:	52b71863          	bne	a4,a1,63d0 <.L37>
    5ea4:	0b814583          	lbu	a1,184(sp)
    5ea8:	00060513          	mv	a0,a2
    5eac:	03900813          	li	a6,57
    5eb0:	fb758593          	addi	a1,a1,-73
    5eb4:	0ff5f593          	zext.b	a1,a1

00005eb8 <.L38>:
    5eb8:	00054703          	lbu	a4,0(a0)
    5ebc:	4e071a63          	bnez	a4,63b0 <.L40>
    5ec0:	50c96263          	bltu	s2,a2,63c4 <.L41>

00005ec4 <.L43>:
    5ec4:	001c0c13          	addi	s8,s8,1 # 2001 <.LVL14+0x1>
    5ec8:	00090613          	mv	a2,s2
    5ecc:	00090713          	mv	a4,s2

00005ed0 <.L42>:
    5ed0:	000600a3          	sb	zero,1(a2)
    5ed4:	06700593          	li	a1,103
    5ed8:	50b41063          	bne	s0,a1,63d8 <.L44>
    5edc:	ffc00593          	li	a1,-4
    5ee0:	60bc4063          	blt	s8,a1,64e0 <.L83>
    5ee4:	5f86ce63          	blt	a3,s8,64e0 <.L83>
    5ee8:	418684b3          	sub	s1,a3,s8

00005eec <.L46>:
    5eec:	000c0693          	mv	a3,s8
    5ef0:	000c5a63          	bgez	s8,5f04 <.L136>
    5ef4:	03000693          	li	a3,48
    5ef8:	fed70fa3          	sb	a3,-1(a4) # 2fff <.L25+0x3>
    5efc:	000c0693          	mv	a3,s8
    5f00:	fff70713          	addi	a4,a4,-1

00005f04 <.L136>:
    5f04:	06600513          	li	a0,102
    5f08:	4e00006f          	j	63e8 <.L45>

00005f0c <.L127>:
    5f0c:	000b8593          	mv	a1,s7
    5f10:	000c0513          	mv	a0,s8
    5f14:	0b412023          	sw	s4,160(sp)
    5f18:	0b512223          	sw	s5,164(sp)
    5f1c:	0b612423          	sw	s6,168(sp)
    5f20:	0b212623          	sw	s2,172(sp)
    5f24:	08012823          	sw	zero,144(sp)
    5f28:	08012a23          	sw	zero,148(sp)
    5f2c:	08012c23          	sw	zero,152(sp)
    5f30:	08012e23          	sw	zero,156(sp)
    5f34:	101020ef          	jal	ra,8834 <__letf2>
    5f38:	00055a63          	bgez	a0,5f4c <.L14>
    5f3c:	02d00793          	li	a5,45
    5f40:	0af10823          	sb	a5,176(sp)
    5f44:	800007b7          	lui	a5,0x80000
    5f48:	0127c933          	xor	s2,a5,s2

00005f4c <.L14>:
    5f4c:	00008797          	auipc	a5,0x8
    5f50:	bf478793          	addi	a5,a5,-1036 # db40 <.LC4>
    5f54:	0007a603          	lw	a2,0(a5)
    5f58:	0047a683          	lw	a3,4(a5)
    5f5c:	0087a703          	lw	a4,8(a5)
    5f60:	00c7a783          	lw	a5,12(a5)
    5f64:	08010d13          	addi	s10,sp,128
    5f68:	08c12023          	sw	a2,128(sp)
    5f6c:	000b8593          	mv	a1,s7
    5f70:	000c0513          	mv	a0,s8
    5f74:	000d0613          	mv	a2,s10
    5f78:	08f12623          	sw	a5,140(sp)
    5f7c:	09412823          	sw	s4,144(sp)
    5f80:	09512a23          	sw	s5,148(sp)
    5f84:	09612c23          	sw	s6,152(sp)
    5f88:	09212e23          	sw	s2,156(sp)
    5f8c:	08d12223          	sw	a3,132(sp)
    5f90:	08e12423          	sw	a4,136(sp)
    5f94:	205020ef          	jal	ra,8998 <__multf3>
    5f98:	0a012783          	lw	a5,160(sp)
    5f9c:	000d0593          	mv	a1,s10
    5fa0:	000b8513          	mv	a0,s7
    5fa4:	08f12823          	sw	a5,144(sp)
    5fa8:	0a412783          	lw	a5,164(sp)
    5fac:	09412023          	sw	s4,128(sp)
    5fb0:	09512223          	sw	s5,132(sp)
    5fb4:	08f12a23          	sw	a5,148(sp)
    5fb8:	0a812783          	lw	a5,168(sp)
    5fbc:	09612423          	sw	s6,136(sp)
    5fc0:	09212623          	sw	s2,140(sp)
    5fc4:	08f12c23          	sw	a5,152(sp)
    5fc8:	0ac12783          	lw	a5,172(sp)
    5fcc:	08f12e23          	sw	a5,156(sp)
    5fd0:	62c020ef          	jal	ra,85fc <__eqtf2>
    5fd4:	b0050ee3          	beqz	a0,5af0 <.L9>
    5fd8:	06100793          	li	a5,97
    5fdc:	2afc9063          	bne	s9,a5,627c <.L79>
    5fe0:	01d00793          	li	a5,29
    5fe4:	02f12823          	sw	a5,48(sp)
    5fe8:	00800793          	li	a5,8
    5fec:	00008717          	auipc	a4,0x8
    5ff0:	b1470713          	addi	a4,a4,-1260 # db00 <.LC0>
    5ff4:	02f12623          	sw	a5,44(sp)
    5ff8:	01000793          	li	a5,16
    5ffc:	00f12623          	sw	a5,12(sp)
    6000:	00072783          	lw	a5,0(a4)
    6004:	00700c13          	li	s8,7
    6008:	00007317          	auipc	t1,0x7
    600c:	2e830313          	addi	t1,t1,744 # d2f0 <exp16_table>
    6010:	00f12c23          	sw	a5,24(sp)
    6014:	00472783          	lw	a5,4(a4)
    6018:	00f12e23          	sw	a5,28(sp)
    601c:	00872783          	lw	a5,8(a4)
    6020:	02f12023          	sw	a5,32(sp)
    6024:	00c72783          	lw	a5,12(a4)
    6028:	00008717          	auipc	a4,0x8
    602c:	ae870713          	addi	a4,a4,-1304 # db10 <.LC1>
    6030:	02f12223          	sw	a5,36(sp)

00006034 <.L132>:
    6034:	00072783          	lw	a5,0(a4)
    6038:	0c030e13          	addi	t3,t1,192
    603c:	000a0c93          	mv	s9,s4
    6040:	02f12e23          	sw	a5,60(sp)
    6044:	00472783          	lw	a5,4(a4)
    6048:	000a8d13          	mv	s10,s5
    604c:	000b0d93          	mv	s11,s6
    6050:	04f12023          	sw	a5,64(sp)
    6054:	00872783          	lw	a5,8(a4)
    6058:	00090b93          	mv	s7,s2
    605c:	04f12223          	sw	a5,68(sp)
    6060:	00c72783          	lw	a5,12(a4)
    6064:	04f12423          	sw	a5,72(sp)
    6068:	000017b7          	lui	a5,0x1
    606c:	02f12a23          	sw	a5,52(sp)
    6070:	0a010793          	addi	a5,sp,160
    6074:	00f12823          	sw	a5,16(sp)
    6078:	09010793          	addi	a5,sp,144
    607c:	00f12a23          	sw	a5,20(sp)
    6080:	08010793          	addi	a5,sp,128
    6084:	04f12623          	sw	a5,76(sp)

00006088 <.L26>:
    6088:	03c12783          	lw	a5,60(sp)
    608c:	000e2f83          	lw	t6,0(t3)
    6090:	004e2f03          	lw	t5,4(t3)
    6094:	008e2e83          	lw	t4,8(t3)
    6098:	00ce2603          	lw	a2,12(t3)
    609c:	08f12823          	sw	a5,144(sp)
    60a0:	04012783          	lw	a5,64(sp)
    60a4:	01412583          	lw	a1,20(sp)
    60a8:	01012503          	lw	a0,16(sp)
    60ac:	08f12a23          	sw	a5,148(sp)
    60b0:	04412783          	lw	a5,68(sp)
    60b4:	06612623          	sw	t1,108(sp)
    60b8:	07f12423          	sw	t6,104(sp)
    60bc:	08f12c23          	sw	a5,152(sp)
    60c0:	04812783          	lw	a5,72(sp)
    60c4:	07e12223          	sw	t5,100(sp)
    60c8:	07d12023          	sw	t4,96(sp)
    60cc:	05c12e23          	sw	t3,92(sp)
    60d0:	04c12c23          	sw	a2,88(sp)
    60d4:	0b412023          	sw	s4,160(sp)
    60d8:	0b512223          	sw	s5,164(sp)
    60dc:	0b612423          	sw	s6,168(sp)
    60e0:	0b212623          	sw	s2,172(sp)
    60e4:	08f12e23          	sw	a5,156(sp)
    60e8:	74c020ef          	jal	ra,8834 <__letf2>
    60ec:	05812603          	lw	a2,88(sp)
    60f0:	06812f83          	lw	t6,104(sp)
    60f4:	06c12303          	lw	t1,108(sp)
    60f8:	05c12e03          	lw	t3,92(sp)
    60fc:	06012e83          	lw	t4,96(sp)
    6100:	06412f03          	lw	t5,100(sp)
    6104:	08c12623          	sw	a2,140(sp)
    6108:	07c12623          	sw	t3,108(sp)
    610c:	06612423          	sw	t1,104(sp)
    6110:	09912823          	sw	s9,144(sp)
    6114:	09a12a23          	sw	s10,148(sp)
    6118:	09b12c23          	sw	s11,152(sp)
    611c:	09712e23          	sw	s7,156(sp)
    6120:	09f12023          	sw	t6,128(sp)
    6124:	09e12223          	sw	t5,132(sp)
    6128:	09d12423          	sw	t4,136(sp)
    612c:	04c12603          	lw	a2,76(sp)
    6130:	01412583          	lw	a1,20(sp)
    6134:	1a055463          	bgez	a0,62dc <.L129>
    6138:	01012503          	lw	a0,16(sp)
    613c:	05d020ef          	jal	ra,8998 <__multf3>
    6140:	01812783          	lw	a5,24(sp)
    6144:	0a012f83          	lw	t6,160(sp)
    6148:	0a412f03          	lw	t5,164(sp)
    614c:	08f12823          	sw	a5,144(sp)
    6150:	01c12783          	lw	a5,28(sp)
    6154:	0a812e83          	lw	t4,168(sp)
    6158:	0ac12603          	lw	a2,172(sp)
    615c:	08f12a23          	sw	a5,148(sp)
    6160:	02012783          	lw	a5,32(sp)
    6164:	01412583          	lw	a1,20(sp)
    6168:	01012503          	lw	a0,16(sp)
    616c:	08f12c23          	sw	a5,152(sp)
    6170:	02412783          	lw	a5,36(sp)
    6174:	07f12223          	sw	t6,100(sp)
    6178:	07e12023          	sw	t5,96(sp)
    617c:	05d12e23          	sw	t4,92(sp)
    6180:	04c12c23          	sw	a2,88(sp)
    6184:	08f12e23          	sw	a5,156(sp)
    6188:	6ac020ef          	jal	ra,8834 <__letf2>
    618c:	06812303          	lw	t1,104(sp)
    6190:	06c12e03          	lw	t3,108(sp)
    6194:	02055663          	bgez	a0,61c0 <.L23>
    6198:	03412783          	lw	a5,52(sp)
    619c:	40fc0c33          	sub	s8,s8,a5

000061a0 <.L133>:
    61a0:	06412f83          	lw	t6,100(sp)
    61a4:	06012f03          	lw	t5,96(sp)
    61a8:	05c12e83          	lw	t4,92(sp)
    61ac:	05812603          	lw	a2,88(sp)
    61b0:	000f8c93          	mv	s9,t6
    61b4:	000f0d13          	mv	s10,t5
    61b8:	000e8d93          	mv	s11,t4
    61bc:	00060b93          	mv	s7,a2

000061c0 <.L23>:
    61c0:	03412783          	lw	a5,52(sp)
    61c4:	ff0e0613          	addi	a2,t3,-16
    61c8:	4017d793          	srai	a5,a5,0x1
    61cc:	02f12a23          	sw	a5,52(sp)
    61d0:	11c31263          	bne	t1,t3,62d4 <.L80>
    61d4:	01812783          	lw	a5,24(sp)
    61d8:	0a010913          	addi	s2,sp,160
    61dc:	09010593          	addi	a1,sp,144
    61e0:	08f12823          	sw	a5,144(sp)
    61e4:	01c12783          	lw	a5,28(sp)
    61e8:	00090513          	mv	a0,s2
    61ec:	00612a23          	sw	t1,20(sp)
    61f0:	08f12a23          	sw	a5,148(sp)
    61f4:	02012783          	lw	a5,32(sp)
    61f8:	0b912023          	sw	s9,160(sp)
    61fc:	0ba12223          	sw	s10,164(sp)
    6200:	08f12c23          	sw	a5,152(sp)
    6204:	02412783          	lw	a5,36(sp)
    6208:	0bb12423          	sw	s11,168(sp)
    620c:	0b712623          	sw	s7,172(sp)
    6210:	08f12e23          	sw	a5,156(sp)
    6214:	00b12823          	sw	a1,16(sp)
    6218:	4b8020ef          	jal	ra,86d0 <__getf2>
    621c:	b00542e3          	bltz	a0,5d20 <.L13>
    6220:	01412303          	lw	t1,20(sp)
    6224:	09912823          	sw	s9,144(sp)
    6228:	09a12a23          	sw	s10,148(sp)
    622c:	09b12c23          	sw	s11,152(sp)
    6230:	09712e23          	sw	s7,156(sp)
    6234:	00032703          	lw	a4,0(t1)
    6238:	01012583          	lw	a1,16(sp)
    623c:	08010613          	addi	a2,sp,128
    6240:	08e12023          	sw	a4,128(sp)
    6244:	00432703          	lw	a4,4(t1)
    6248:	00090513          	mv	a0,s2
    624c:	001c0c13          	addi	s8,s8,1
    6250:	08e12223          	sw	a4,132(sp)
    6254:	00832703          	lw	a4,8(t1)
    6258:	08e12423          	sw	a4,136(sp)
    625c:	00c32703          	lw	a4,12(t1)
    6260:	08e12623          	sw	a4,140(sp)
    6264:	598010ef          	jal	ra,77fc <__divtf3>
    6268:	0a012c83          	lw	s9,160(sp)
    626c:	0a412d03          	lw	s10,164(sp)
    6270:	0a812d83          	lw	s11,168(sp)
    6274:	0ac12b83          	lw	s7,172(sp)
    6278:	aa9ff06f          	j	5d20 <.L13>

0000627c <.L79>:
    627c:	02400793          	li	a5,36
    6280:	02f12823          	sw	a5,48(sp)
    6284:	00900793          	li	a5,9
    6288:	00008717          	auipc	a4,0x8
    628c:	89870713          	addi	a4,a4,-1896 # db20 <.LC2>
    6290:	02f12623          	sw	a5,44(sp)
    6294:	00a00793          	li	a5,10
    6298:	00f12623          	sw	a5,12(sp)
    629c:	00072783          	lw	a5,0(a4)
    62a0:	00800c13          	li	s8,8
    62a4:	00007317          	auipc	t1,0x7
    62a8:	11c30313          	addi	t1,t1,284 # d3c0 <exp10_table>
    62ac:	00f12c23          	sw	a5,24(sp)
    62b0:	00472783          	lw	a5,4(a4)
    62b4:	00f12e23          	sw	a5,28(sp)
    62b8:	00872783          	lw	a5,8(a4)
    62bc:	02f12023          	sw	a5,32(sp)
    62c0:	00c72783          	lw	a5,12(a4)
    62c4:	00008717          	auipc	a4,0x8
    62c8:	86c70713          	addi	a4,a4,-1940 # db30 <.LC3>
    62cc:	02f12223          	sw	a5,36(sp)
    62d0:	d65ff06f          	j	6034 <.L132>

000062d4 <.L80>:
    62d4:	00060e13          	mv	t3,a2
    62d8:	db1ff06f          	j	6088 <.L26>

000062dc <.L129>:
    62dc:	01012503          	lw	a0,16(sp)
    62e0:	51c010ef          	jal	ra,77fc <__divtf3>
    62e4:	03c12783          	lw	a5,60(sp)
    62e8:	0a012f83          	lw	t6,160(sp)
    62ec:	0a412f03          	lw	t5,164(sp)
    62f0:	08f12823          	sw	a5,144(sp)
    62f4:	04012783          	lw	a5,64(sp)
    62f8:	0a812e83          	lw	t4,168(sp)
    62fc:	0ac12603          	lw	a2,172(sp)
    6300:	08f12a23          	sw	a5,148(sp)
    6304:	04412783          	lw	a5,68(sp)
    6308:	01412583          	lw	a1,20(sp)
    630c:	01012503          	lw	a0,16(sp)
    6310:	08f12c23          	sw	a5,152(sp)
    6314:	04812783          	lw	a5,72(sp)
    6318:	07f12223          	sw	t6,100(sp)
    631c:	07e12023          	sw	t5,96(sp)
    6320:	05d12e23          	sw	t4,92(sp)
    6324:	04c12c23          	sw	a2,88(sp)
    6328:	08f12e23          	sw	a5,156(sp)
    632c:	3a4020ef          	jal	ra,86d0 <__getf2>
    6330:	06812303          	lw	t1,104(sp)
    6334:	06c12e03          	lw	t3,108(sp)
    6338:	e80544e3          	bltz	a0,61c0 <.L23>
    633c:	03412783          	lw	a5,52(sp)
    6340:	00fc0c33          	add	s8,s8,a5
    6344:	e5dff06f          	j	61a0 <.L133>

00006348 <.L31>:
    6348:	06600713          	li	a4,102
    634c:	b0e412e3          	bne	s0,a4,5e50 <.L81>
    6350:	009c06b3          	add	a3,s8,s1
    6354:	fff00713          	li	a4,-1
    6358:	aee6dee3          	bge	a3,a4,5e54 <.L33>
    635c:	02400613          	li	a2,36
    6360:	03000593          	li	a1,48
    6364:	0c810513          	addi	a0,sp,200
    6368:	cc8fd0ef          	jal	ra,3830 <__GI_memset>
    636c:	000037b7          	lui	a5,0x3
    6370:	0cf11423          	sh	a5,200(sp)
    6374:	fff00c13          	li	s8,-1
    6378:	fff00693          	li	a3,-1

0000637c <.L34>:
    637c:	00c12783          	lw	a5,12(sp)
    6380:	00268613          	addi	a2,a3,2
    6384:	00c90633          	add	a2,s2,a2
    6388:	00064583          	lbu	a1,0(a2)
    638c:	0017d713          	srli	a4,a5,0x1
    6390:	03070713          	addi	a4,a4,48
    6394:	00e5b5b3          	sltu	a1,a1,a4
    6398:	0015c593          	xori	a1,a1,1
    639c:	ad5ff06f          	j	5e70 <.L35>

000063a0 <.L32>:
    63a0:	00003737          	lui	a4,0x3
    63a4:	0ce11423          	sh	a4,200(sp)
    63a8:	00000693          	li	a3,0
    63ac:	fd1ff06f          	j	637c <.L34>

000063b0 <.L40>:
    63b0:	00e87663          	bgeu	a6,a4,63bc <.L39>
    63b4:	00b70733          	add	a4,a4,a1
    63b8:	00e50023          	sb	a4,0(a0)

000063bc <.L39>:
    63bc:	fff50513          	addi	a0,a0,-1
    63c0:	af9ff06f          	j	5eb8 <.L38>

000063c4 <.L41>:
    63c4:	002c1c13          	slli	s8,s8,0x2

000063c8 <.L134>:
    63c8:	0ca10713          	addi	a4,sp,202
    63cc:	b05ff06f          	j	5ed0 <.L42>

000063d0 <.L37>:
    63d0:	aec97ae3          	bgeu	s2,a2,5ec4 <.L43>
    63d4:	ff5ff06f          	j	63c8 <.L134>

000063d8 <.L44>:
    63d8:	06600693          	li	a3,102
    63dc:	00040513          	mv	a0,s0
    63e0:	b0d406e3          	beq	s0,a3,5eec <.L46>

000063e4 <.L135>:
    63e4:	00000693          	li	a3,0

000063e8 <.L45>:
    63e8:	00100593          	li	a1,1
    63ec:	10b12023          	sw	a1,256(sp)
    63f0:	0b410593          	addi	a1,sp,180
    63f4:	10b12223          	sw	a1,260(sp)
    63f8:	00074583          	lbu	a1,0(a4) # 3000 <.L25+0x4>
    63fc:	0b000893          	li	a7,176
    6400:	0f112e23          	sw	a7,252(sp)
    6404:	0ab10a23          	sb	a1,180(sp)
    6408:	00c9a583          	lw	a1,12(s3)
    640c:	0a010aa3          	sb	zero,181(sp)
    6410:	00170813          	addi	a6,a4,1
    6414:	0105f593          	andi	a1,a1,16
    6418:	40e60733          	sub	a4,a2,a4
    641c:	1406c663          	bltz	a3,6568 <.L86>
    6420:	07000613          	li	a2,112
    6424:	10c12423          	sw	a2,264(sp)
    6428:	11012823          	sw	a6,272(sp)
    642c:	0ee6ca63          	blt	a3,a4,6520 <.L48>
    6430:	10e12623          	sw	a4,268(sp)
    6434:	40e68733          	sub	a4,a3,a4
    6438:	0a071863          	bnez	a4,64e8 <.L49>
    643c:	11410913          	addi	s2,sp,276
    6440:	16059263          	bnez	a1,65a4 <.L93>
    6444:	06700693          	li	a3,103
    6448:	10d40663          	beq	s0,a3,6554 <.L140>
    644c:	06100693          	li	a3,97
    6450:	14d41863          	bne	s0,a3,65a0 <.L52>

00006454 <.L58>:
    6454:	00000613          	li	a2,0
    6458:	00000713          	li	a4,0

0000645c <.L61>:
    645c:	02812783          	lw	a5,40(sp)
    6460:	18078e63          	beqz	a5,65fc <.L64>

00006464 <.L65>:
    6464:	06600713          	li	a4,102
    6468:	ece50863          	beq	a0,a4,5b38 <.L19>
    646c:	06100713          	li	a4,97
    6470:	0b814803          	lbu	a6,184(sp)
    6474:	00300613          	li	a2,3
    6478:	0ee41463          	bne	s0,a4,6560 <.L137>

0000647c <.L63>:
    647c:	02b00313          	li	t1,43
    6480:	000c5663          	bgez	s8,648c <.L66>
    6484:	41800c33          	neg	s8,s8
    6488:	02d00313          	li	t1,45

0000648c <.L66>:
    648c:	0c0103a3          	sb	zero,199(sp)
    6490:	00200693          	li	a3,2
    6494:	0c710713          	addi	a4,sp,199
    6498:	00a00e13          	li	t3,10

0000649c <.L67>:
    649c:	03cc68b3          	rem	a7,s8,t3
    64a0:	00168693          	addi	a3,a3,1
    64a4:	fff70593          	addi	a1,a4,-1
    64a8:	03088893          	addi	a7,a7,48
    64ac:	ff170fa3          	sb	a7,-1(a4)
    64b0:	03cc4c33          	div	s8,s8,t3
    64b4:	18c6c663          	blt	a3,a2,6640 <.L97>
    64b8:	180c1663          	bnez	s8,6644 <.L68>
    64bc:	07000793          	li	a5,112
    64c0:	ffd70713          	addi	a4,a4,-3
    64c4:	00f92023          	sw	a5,0(s2)
    64c8:	00d92223          	sw	a3,4(s2)
    64cc:	00e92423          	sw	a4,8(s2)
    64d0:	fe658fa3          	sb	t1,-1(a1)
    64d4:	ff058f23          	sb	a6,-2(a1)
    64d8:	00c90913          	addi	s2,s2,12
    64dc:	e5cff06f          	j	5b38 <.L19>

000064e0 <.L83>:
    64e0:	06700513          	li	a0,103
    64e4:	f01ff06f          	j	63e4 <.L135>

000064e8 <.L49>:
    64e8:	10e12c23          	sw	a4,280(sp)
    64ec:	00007717          	auipc	a4,0x7
    64f0:	fa770713          	addi	a4,a4,-89 # d493 <fmt+0x3>
    64f4:	11112a23          	sw	a7,276(sp)
    64f8:	10e12e23          	sw	a4,284(sp)
    64fc:	12010913          	addi	s2,sp,288
    6500:	00059c63          	bnez	a1,6518 <.L92>
    6504:	06700713          	li	a4,103
    6508:	04e40663          	beq	s0,a4,6554 <.L140>
    650c:	06100713          	li	a4,97
    6510:	f4e402e3          	beq	s0,a4,6454 <.L58>
    6514:	f40480e3          	beqz	s1,6454 <.L58>

00006518 <.L92>:
    6518:	00000713          	li	a4,0
    651c:	0880006f          	j	65a4 <.L93>

00006520 <.L48>:
    6520:	10068c63          	beqz	a3,6638 <.L91>
    6524:	10d12623          	sw	a3,268(sp)
    6528:	00d80833          	add	a6,a6,a3
    652c:	40d70733          	sub	a4,a4,a3
    6530:	11410913          	addi	s2,sp,276
    6534:	fff00693          	li	a3,-1

00006538 <.L47>:
    6538:	06059863          	bnez	a1,65a8 <.L50>
    653c:	06071663          	bnez	a4,65a8 <.L50>
    6540:	06700893          	li	a7,103
    6544:	00168613          	addi	a2,a3,1
    6548:	03141463          	bne	s0,a7,6570 <.L55>
    654c:	fff00893          	li	a7,-1
    6550:	03169663          	bne	a3,a7,657c <.L56>

00006554 <.L140>:
    6554:	06600713          	li	a4,102
    6558:	dee50063          	beq	a0,a4,5b38 <.L19>
    655c:	0b814803          	lbu	a6,184(sp)

00006560 <.L137>:
    6560:	00400613          	li	a2,4
    6564:	f19ff06f          	j	647c <.L63>

00006568 <.L86>:
    6568:	10810913          	addi	s2,sp,264
    656c:	fcdff06f          	j	6538 <.L47>

00006570 <.L55>:
    6570:	06100893          	li	a7,97
    6574:	0b141a63          	bne	s0,a7,6628 <.L57>
    6578:	ec060ee3          	beqz	a2,6454 <.L58>

0000657c <.L56>:
    657c:	fff6c693          	not	a3,a3
    6580:	00d92223          	sw	a3,4(s2)
    6584:	0b000893          	li	a7,176
    6588:	00007697          	auipc	a3,0x7
    658c:	f0b68693          	addi	a3,a3,-245 # d493 <fmt+0x3>
    6590:	01192023          	sw	a7,0(s2)
    6594:	00d92423          	sw	a3,8(s2)
    6598:	00c90913          	addi	s2,s2,12
    659c:	0340006f          	j	65d0 <.L59>

000065a0 <.L52>:
    65a0:	ea048ae3          	beqz	s1,6454 <.L58>

000065a4 <.L93>:
    65a4:	fff00693          	li	a3,-1

000065a8 <.L50>:
    65a8:	07000613          	li	a2,112
    65ac:	00c92023          	sw	a2,0(s2)
    65b0:	00100613          	li	a2,1
    65b4:	00c92223          	sw	a2,4(s2)
    65b8:	00007617          	auipc	a2,0x7
    65bc:	ee860613          	addi	a2,a2,-280 # d4a0 <fmt+0x10>
    65c0:	00c92423          	sw	a2,8(s2)
    65c4:	00168613          	addi	a2,a3,1
    65c8:	00c90913          	addi	s2,s2,12
    65cc:	fa0618e3          	bnez	a2,657c <.L56>

000065d0 <.L59>:
    65d0:	00070c63          	beqz	a4,65e8 <.L60>
    65d4:	07000693          	li	a3,112
    65d8:	00d92023          	sw	a3,0(s2)
    65dc:	00e92223          	sw	a4,4(s2)
    65e0:	01092423          	sw	a6,8(s2)
    65e4:	00c90913          	addi	s2,s2,12

000065e8 <.L60>:
    65e8:	06700693          	li	a3,103
    65ec:	e6d418e3          	bne	s0,a3,645c <.L61>
    65f0:	f60582e3          	beqz	a1,6554 <.L140>
    65f4:	02812783          	lw	a5,40(sp)
    65f8:	f4079ee3          	bnez	a5,6554 <.L140>

000065fc <.L64>:
    65fc:	40c70633          	sub	a2,a4,a2
    6600:	e69652e3          	bge	a2,s1,6464 <.L65>
    6604:	0b000713          	li	a4,176
    6608:	00e92023          	sw	a4,0(s2)
    660c:	40c48633          	sub	a2,s1,a2
    6610:	00007717          	auipc	a4,0x7
    6614:	e8370713          	addi	a4,a4,-381 # d493 <fmt+0x3>
    6618:	00c92223          	sw	a2,4(s2)
    661c:	00e92423          	sw	a4,8(s2)
    6620:	00c90913          	addi	s2,s2,12
    6624:	e41ff06f          	j	6464 <.L65>

00006628 <.L57>:
    6628:	f80490e3          	bnez	s1,65a8 <.L50>
    662c:	fff00893          	li	a7,-1
    6630:	f51696e3          	bne	a3,a7,657c <.L56>
    6634:	e21ff06f          	j	6454 <.L58>

00006638 <.L91>:
    6638:	10810913          	addi	s2,sp,264
    663c:	f69ff06f          	j	65a4 <.L93>

00006640 <.L97>:
    6640:	00300693          	li	a3,3

00006644 <.L68>:
    6644:	00058713          	mv	a4,a1
    6648:	e55ff06f          	j	649c <.L67>

0000664c <.L72>:
    664c:	0109a603          	lw	a2,16(s3)
    6650:	03000693          	li	a3,48
    6654:	0f412703          	lw	a4,244(sp)
    6658:	00d61a63          	bne	a2,a3,666c <.L74>
    665c:	10012703          	lw	a4,256(sp)
    6660:	00f707b3          	add	a5,a4,a5
    6664:	10f12023          	sw	a5,256(sp)
    6668:	d7cff06f          	j	5be4 <.L73>

0000666c <.L74>:
    666c:	00e787b3          	add	a5,a5,a4
    6670:	0ef12a23          	sw	a5,244(sp)
    6674:	d70ff06f          	j	5be4 <.L73>

00006678 <.L98>:
    6678:	fff00493          	li	s1,-1
    667c:	d9cff06f          	j	5c18 <.L1>

00006680 <__GI_fflush>:
    6680:	ff010113          	addi	sp,sp,-16
    6684:	00112623          	sw	ra,12(sp)
    6688:	00812423          	sw	s0,8(sp)
    668c:	00912223          	sw	s1,4(sp)
    6690:	01212023          	sw	s2,0(sp)
    6694:	00006797          	auipc	a5,0x6
    6698:	8107a783          	lw	a5,-2032(a5) # bea4 <_GLOBAL_OFFSET_TABLE_+0x1c>
    669c:	04f50263          	beq	a0,a5,66e0 <.L11>
    66a0:	00050413          	mv	s0,a0
    66a4:	10000913          	li	s2,256
    66a8:	02050e63          	beqz	a0,66e4 <.L2>
    66ac:	00055783          	lhu	a5,0(a0)
    66b0:	0407f793          	andi	a5,a5,64
    66b4:	02078263          	beqz	a5,66d8 <.L10>
    66b8:	bd1fb0ef          	jal	ra,2288 <__stdio_wcommit>
    66bc:	fff00493          	li	s1,-1
    66c0:	02051863          	bnez	a0,66f0 <.L1>
    66c4:	00842783          	lw	a5,8(s0)
    66c8:	00f42e23          	sw	a5,28(s0)
    66cc:	00045783          	lhu	a5,0(s0)
    66d0:	fbf7f793          	andi	a5,a5,-65
    66d4:	00f41023          	sh	a5,0(s0)

000066d8 <.L10>:
    66d8:	00000493          	li	s1,0
    66dc:	0140006f          	j	66f0 <.L1>

000066e0 <.L11>:
    66e0:	00000913          	li	s2,0

000066e4 <.L2>:
    66e4:	0007a403          	lw	s0,0(a5)
    66e8:	00000493          	li	s1,0

000066ec <.L4>:
    66ec:	02041063          	bnez	s0,670c <.L8>

000066f0 <.L1>:
    66f0:	00c12083          	lw	ra,12(sp)
    66f4:	00812403          	lw	s0,8(sp)
    66f8:	00012903          	lw	s2,0(sp)
    66fc:	00048513          	mv	a0,s1
    6700:	00412483          	lw	s1,4(sp)
    6704:	01010113          	addi	sp,sp,16
    6708:	00008067          	ret

0000670c <.L8>:
    670c:	00045783          	lhu	a5,0(s0)
    6710:	0407f713          	andi	a4,a5,64
    6714:	02070a63          	beqz	a4,6748 <.L7>
    6718:	0127e7b3          	or	a5,a5,s2
    671c:	1407c793          	xori	a5,a5,320
    6720:	3407f793          	andi	a5,a5,832
    6724:	02079263          	bnez	a5,6748 <.L7>
    6728:	00040513          	mv	a0,s0
    672c:	b5dfb0ef          	jal	ra,2288 <__stdio_wcommit>
    6730:	02051063          	bnez	a0,6750 <.L12>
    6734:	00842783          	lw	a5,8(s0)
    6738:	00f42e23          	sw	a5,28(s0)
    673c:	00045783          	lhu	a5,0(s0)
    6740:	fbf7f793          	andi	a5,a5,-65
    6744:	00f41023          	sh	a5,0(s0)

00006748 <.L7>:
    6748:	02042403          	lw	s0,32(s0)
    674c:	fa1ff06f          	j	66ec <.L4>

00006750 <.L12>:
    6750:	fff00493          	li	s1,-1
    6754:	ff5ff06f          	j	6748 <.L7>

00006758 <__GI___fgetc_unlocked>:
    6758:	01052783          	lw	a5,16(a0)
    675c:	01852703          	lw	a4,24(a0)
    6760:	fe010113          	addi	sp,sp,-32
    6764:	00812c23          	sw	s0,24(sp)
    6768:	00112e23          	sw	ra,28(sp)
    676c:	00050413          	mv	s0,a0
    6770:	00e7fa63          	bgeu	a5,a4,6784 <.L2>

00006774 <.L29>:
    6774:	00178713          	addi	a4,a5,1
    6778:	00e42823          	sw	a4,16(s0)
    677c:	0007c503          	lbu	a0,0(a5)
    6780:	0340006f          	j	67b4 <.L1>

00006784 <.L2>:
    6784:	00055783          	lhu	a5,0(a0)
    6788:	0037f793          	andi	a5,a5,3
    678c:	02078c63          	beqz	a5,67c4 <.L4>

00006790 <.L7>:
    6790:	00045783          	lhu	a5,0(s0)
    6794:	0027f713          	andi	a4,a5,2
    6798:	02070e63          	beqz	a4,67d4 <.L27>
    679c:	fff78713          	addi	a4,a5,-1
    67a0:	0017f793          	andi	a5,a5,1
    67a4:	00e41023          	sh	a4,0(s0)
    67a8:	00f407b3          	add	a5,s0,a5
    67ac:	0027c503          	lbu	a0,2(a5)
    67b0:	000401a3          	sb	zero,3(s0)

000067b4 <.L1>:
    67b4:	01c12083          	lw	ra,28(sp)
    67b8:	01812403          	lw	s0,24(sp)
    67bc:	02010113          	addi	sp,sp,32
    67c0:	00008067          	ret

000067c4 <.L4>:
    67c4:	58d000ef          	jal	ra,7550 <__stdio_trans2r>
    67c8:	fc0504e3          	beqz	a0,6790 <.L7>

000067cc <.L8>:
    67cc:	fff00513          	li	a0,-1
    67d0:	fe5ff06f          	j	67b4 <.L1>

000067d4 <.L27>:
    67d4:	01042703          	lw	a4,16(s0)
    67d8:	01442683          	lw	a3,20(s0)
    67dc:	00e68a63          	beq	a3,a4,67f0 <.L9>
    67e0:	00170793          	addi	a5,a4,1
    67e4:	00f42823          	sw	a5,16(s0)
    67e8:	00074503          	lbu	a0,0(a4)
    67ec:	fc9ff06f          	j	67b4 <.L1>

000067f0 <.L9>:
    67f0:	00442683          	lw	a3,4(s0)
    67f4:	ffd00713          	li	a4,-3
    67f8:	00e69863          	bne	a3,a4,6808 <.L10>
    67fc:	0047e793          	ori	a5,a5,4
    6800:	00f41023          	sh	a5,0(s0)
    6804:	fc9ff06f          	j	67cc <.L8>

00006808 <.L10>:
    6808:	3007f793          	andi	a5,a5,768
    680c:	00078863          	beqz	a5,681c <.L11>
    6810:	00005517          	auipc	a0,0x5
    6814:	69452503          	lw	a0,1684(a0) # bea4 <_GLOBAL_OFFSET_TABLE_+0x1c>
    6818:	e69ff0ef          	jal	ra,6680 <__GI_fflush>

0000681c <.L11>:
    681c:	00842783          	lw	a5,8(s0)
    6820:	00c42703          	lw	a4,12(s0)
    6824:	02f70263          	beq	a4,a5,6848 <.L12>
    6828:	00f42c23          	sw	a5,24(s0)
    682c:	00040513          	mv	a0,s0
    6830:	4e1000ef          	jal	ra,7510 <__stdio_rfill>
    6834:	f8050ce3          	beqz	a0,67cc <.L8>
    6838:	01442783          	lw	a5,20(s0)
    683c:	00f42c23          	sw	a5,24(s0)
    6840:	01042783          	lw	a5,16(s0)
    6844:	f31ff06f          	j	6774 <.L29>

00006848 <.L12>:
    6848:	00100613          	li	a2,1
    684c:	00f10593          	addi	a1,sp,15
    6850:	00040513          	mv	a0,s0
    6854:	399000ef          	jal	ra,73ec <__stdio_READ>
    6858:	f6050ae3          	beqz	a0,67cc <.L8>
    685c:	00f14503          	lbu	a0,15(sp)
    6860:	f55ff06f          	j	67b4 <.L1>

00006864 <__GI_fgets>:
    6864:	fe010113          	addi	sp,sp,-32
    6868:	00112e23          	sw	ra,28(sp)
    686c:	00812c23          	sw	s0,24(sp)
    6870:	00912a23          	sw	s1,20(sp)
    6874:	01212823          	sw	s2,16(sp)
    6878:	01312623          	sw	s3,12(sp)
    687c:	01412423          	sw	s4,8(sp)
    6880:	01512223          	sw	s5,4(sp)
    6884:	02b04863          	bgtz	a1,68b4 <.L2>

00006888 <.L9>:
    6888:	00000493          	li	s1,0

0000688c <.L3>:
    688c:	01c12083          	lw	ra,28(sp)
    6890:	01812403          	lw	s0,24(sp)
    6894:	01012903          	lw	s2,16(sp)
    6898:	00c12983          	lw	s3,12(sp)
    689c:	00812a03          	lw	s4,8(sp)
    68a0:	00412a83          	lw	s5,4(sp)
    68a4:	00048513          	mv	a0,s1
    68a8:	01412483          	lw	s1,20(sp)
    68ac:	02010113          	addi	sp,sp,32
    68b0:	00008067          	ret

000068b4 <.L2>:
    68b4:	00050493          	mv	s1,a0
    68b8:	00060913          	mv	s2,a2
    68bc:	00150413          	addi	s0,a0,1
    68c0:	00b509b3          	add	s3,a0,a1
    68c4:	fff00a93          	li	s5,-1
    68c8:	00a00a13          	li	s4,10

000068cc <.L4>:
    68cc:	05340663          	beq	s0,s3,6918 <.L11>
    68d0:	01092703          	lw	a4,16(s2)
    68d4:	01892783          	lw	a5,24(s2)
    68d8:	02f77463          	bgeu	a4,a5,6900 <.L5>
    68dc:	00170793          	addi	a5,a4,1
    68e0:	00f92823          	sw	a5,16(s2)
    68e4:	00074703          	lbu	a4,0(a4)
    68e8:	00040793          	mv	a5,s0
    68ec:	fee40fa3          	sb	a4,-1(s0)
    68f0:	05471063          	bne	a4,s4,6930 <.L7>

000068f4 <.L6>:
    68f4:	f8f4fae3          	bgeu	s1,a5,6888 <.L9>
    68f8:	00078023          	sb	zero,0(a5)
    68fc:	f91ff06f          	j	688c <.L3>

00006900 <.L5>:
    6900:	00090513          	mv	a0,s2
    6904:	e55ff0ef          	jal	ra,6758 <__GI___fgetc_unlocked>
    6908:	01551c63          	bne	a0,s5,6920 <.L8>
    690c:	00095783          	lhu	a5,0(s2)
    6910:	0087f793          	andi	a5,a5,8
    6914:	f6079ae3          	bnez	a5,6888 <.L9>

00006918 <.L11>:
    6918:	fff40793          	addi	a5,s0,-1
    691c:	fd9ff06f          	j	68f4 <.L6>

00006920 <.L8>:
    6920:	0ff57513          	zext.b	a0,a0
    6924:	fea40fa3          	sb	a0,-1(s0)
    6928:	00040793          	mv	a5,s0
    692c:	fd4504e3          	beq	a0,s4,68f4 <.L6>

00006930 <.L7>:
    6930:	00140413          	addi	s0,s0,1
    6934:	f99ff06f          	j	68cc <.L4>

00006938 <__GI_memchr>:
    6938:	0ff5f793          	zext.b	a5,a1

0000693c <.L2>:
    693c:	00060663          	beqz	a2,6948 <.L4>
    6940:	00357713          	andi	a4,a0,3
    6944:	02071c63          	bnez	a4,697c <.L5>

00006948 <.L4>:
    6948:	01010737          	lui	a4,0x1010
    694c:	0ff5f593          	zext.b	a1,a1
    6950:	10170713          	addi	a4,a4,257 # 1010101 <_ebss+0x10002b1>
    6954:	02e585b3          	mul	a1,a1,a4
    6958:	7eff0837          	lui	a6,0x7eff0
    695c:	00300313          	li	t1,3
    6960:	eff80813          	addi	a6,a6,-257 # 7efefeff <_ebss+0x7efe00af>
    6964:	fff00e13          	li	t3,-1

00006968 <.L6>:
    6968:	02c36463          	bltu	t1,a2,6990 <.L10>
    696c:	00c50633          	add	a2,a0,a2

00006970 <.L11>:
    6970:	08c51063          	bne	a0,a2,69f0 <.L12>
    6974:	00000513          	li	a0,0

00006978 <.L1>:
    6978:	00008067          	ret

0000697c <.L5>:
    697c:	00054703          	lbu	a4,0(a0)
    6980:	fef70ce3          	beq	a4,a5,6978 <.L1>
    6984:	fff60613          	addi	a2,a2,-1
    6988:	00150513          	addi	a0,a0,1
    698c:	fb1ff06f          	j	693c <.L2>

00006990 <.L10>:
    6990:	00052883          	lw	a7,0(a0)
    6994:	00450713          	addi	a4,a0,4
    6998:	0115c8b3          	xor	a7,a1,a7
    699c:	010886b3          	add	a3,a7,a6
    69a0:	0116c6b3          	xor	a3,a3,a7
    69a4:	0106e6b3          	or	a3,a3,a6
    69a8:	03c68e63          	beq	a3,t3,69e4 <.L7>
    69ac:	ffc74683          	lbu	a3,-4(a4)
    69b0:	fcf684e3          	beq	a3,a5,6978 <.L1>
    69b4:	ffd74683          	lbu	a3,-3(a4)
    69b8:	00f69663          	bne	a3,a5,69c4 <.L8>
    69bc:	00150513          	addi	a0,a0,1
    69c0:	00008067          	ret

000069c4 <.L8>:
    69c4:	ffe74683          	lbu	a3,-2(a4)
    69c8:	00f69663          	bne	a3,a5,69d4 <.L9>
    69cc:	00250513          	addi	a0,a0,2
    69d0:	00008067          	ret

000069d4 <.L9>:
    69d4:	fff74683          	lbu	a3,-1(a4)
    69d8:	00f69663          	bne	a3,a5,69e4 <.L7>
    69dc:	00350513          	addi	a0,a0,3
    69e0:	00008067          	ret

000069e4 <.L7>:
    69e4:	ffc60613          	addi	a2,a2,-4
    69e8:	00070513          	mv	a0,a4
    69ec:	f7dff06f          	j	6968 <.L6>

000069f0 <.L12>:
    69f0:	00054703          	lbu	a4,0(a0)
    69f4:	f8f702e3          	beq	a4,a5,6978 <.L1>
    69f8:	00150513          	addi	a0,a0,1
    69fc:	f75ff06f          	j	6970 <.L11>

00006a00 <__GI_mempcpy>:
    6a00:	ff010113          	addi	sp,sp,-16
    6a04:	00812423          	sw	s0,8(sp)
    6a08:	00912223          	sw	s1,4(sp)
    6a0c:	00112623          	sw	ra,12(sp)
    6a10:	00050493          	mv	s1,a0
    6a14:	00060413          	mv	s0,a2
    6a18:	b71fc0ef          	jal	ra,3588 <__GI_memcpy>
    6a1c:	00848533          	add	a0,s1,s0
    6a20:	00c12083          	lw	ra,12(sp)
    6a24:	00812403          	lw	s0,8(sp)
    6a28:	00412483          	lw	s1,4(sp)
    6a2c:	01010113          	addi	sp,sp,16
    6a30:	00008067          	ret

00006a34 <__GI_memrchr>:
    6a34:	0ff5f793          	zext.b	a5,a1
    6a38:	00c50533          	add	a0,a0,a2

00006a3c <.L2>:
    6a3c:	00060663          	beqz	a2,6a48 <.L4>
    6a40:	00357713          	andi	a4,a0,3
    6a44:	02071e63          	bnez	a4,6a80 <.L5>

00006a48 <.L4>:
    6a48:	01010737          	lui	a4,0x1010
    6a4c:	0ff5f593          	zext.b	a1,a1
    6a50:	10170713          	addi	a4,a4,257 # 1010101 <_ebss+0x10002b1>
    6a54:	02e585b3          	mul	a1,a1,a4
    6a58:	7eff0837          	lui	a6,0x7eff0
    6a5c:	00050693          	mv	a3,a0
    6a60:	00300313          	li	t1,3
    6a64:	eff80813          	addi	a6,a6,-257 # 7efefeff <_ebss+0x7efe00af>
    6a68:	fff00e13          	li	t3,-1

00006a6c <.L6>:
    6a6c:	02c36463          	bltu	t1,a2,6a94 <.L11>
    6a70:	40c50633          	sub	a2,a0,a2

00006a74 <.L12>:
    6a74:	08c51063          	bne	a0,a2,6af4 <.L13>
    6a78:	00000513          	li	a0,0
    6a7c:	0840006f          	j	6b00 <.L1>

00006a80 <.L5>:
    6a80:	fff54703          	lbu	a4,-1(a0)
    6a84:	fff50513          	addi	a0,a0,-1
    6a88:	06f70c63          	beq	a4,a5,6b00 <.L1>
    6a8c:	fff60613          	addi	a2,a2,-1
    6a90:	fadff06f          	j	6a3c <.L2>

00006a94 <.L11>:
    6a94:	ffc52883          	lw	a7,-4(a0)
    6a98:	ffc50513          	addi	a0,a0,-4
    6a9c:	0115c8b3          	xor	a7,a1,a7
    6aa0:	01088733          	add	a4,a7,a6
    6aa4:	01174733          	xor	a4,a4,a7
    6aa8:	01076733          	or	a4,a4,a6
    6aac:	03c70e63          	beq	a4,t3,6ae8 <.L7>
    6ab0:	00354703          	lbu	a4,3(a0)
    6ab4:	00f71663          	bne	a4,a5,6ac0 <.L8>
    6ab8:	fff68513          	addi	a0,a3,-1
    6abc:	00008067          	ret

00006ac0 <.L8>:
    6ac0:	00254703          	lbu	a4,2(a0)
    6ac4:	00f71663          	bne	a4,a5,6ad0 <.L9>
    6ac8:	ffe68513          	addi	a0,a3,-2
    6acc:	00008067          	ret

00006ad0 <.L9>:
    6ad0:	00154703          	lbu	a4,1(a0)
    6ad4:	00f71663          	bne	a4,a5,6ae0 <.L10>
    6ad8:	ffd68513          	addi	a0,a3,-3
    6adc:	00008067          	ret

00006ae0 <.L10>:
    6ae0:	00054703          	lbu	a4,0(a0)
    6ae4:	00f70e63          	beq	a4,a5,6b00 <.L1>

00006ae8 <.L7>:
    6ae8:	ffc60613          	addi	a2,a2,-4
    6aec:	00050693          	mv	a3,a0
    6af0:	f7dff06f          	j	6a6c <.L6>

00006af4 <.L13>:
    6af4:	fff54703          	lbu	a4,-1(a0)
    6af8:	fff50513          	addi	a0,a0,-1
    6afc:	f6f71ce3          	bne	a4,a5,6a74 <.L12>

00006b00 <.L1>:
    6b00:	00008067          	ret

00006b04 <__GI_strchr>:
    6b04:	0ff5f693          	zext.b	a3,a1

00006b08 <.L2>:
    6b08:	00357793          	andi	a5,a0,3
    6b0c:	06079263          	bnez	a5,6b70 <.L4>
    6b10:	010107b7          	lui	a5,0x1010
    6b14:	0ff5f593          	zext.b	a1,a1
    6b18:	10178793          	addi	a5,a5,257 # 1010101 <_ebss+0x10002b1>
    6b1c:	02f585b3          	mul	a1,a1,a5
    6b20:	7eff0637          	lui	a2,0x7eff0
    6b24:	eff60613          	addi	a2,a2,-257 # 7efefeff <_ebss+0x7efe00af>
    6b28:	fff00313          	li	t1,-1

00006b2c <.L5>:
    6b2c:	00052803          	lw	a6,0(a0)
    6b30:	00450713          	addi	a4,a0,4
    6b34:	0105c8b3          	xor	a7,a1,a6
    6b38:	00c807b3          	add	a5,a6,a2
    6b3c:	0107c7b3          	xor	a5,a5,a6
    6b40:	00c88833          	add	a6,a7,a2
    6b44:	01184833          	xor	a6,a6,a7
    6b48:	0107f7b3          	and	a5,a5,a6
    6b4c:	00c7e7b3          	or	a5,a5,a2
    6b50:	02678a63          	beq	a5,t1,6b84 <.L6>
    6b54:	ffc74783          	lbu	a5,-4(a4)
    6b58:	06d78263          	beq	a5,a3,6bbc <.L1>
    6b5c:	04078e63          	beqz	a5,6bb8 <.L13>
    6b60:	ffd74783          	lbu	a5,-3(a4)
    6b64:	02d79463          	bne	a5,a3,6b8c <.L7>
    6b68:	00150513          	addi	a0,a0,1
    6b6c:	00008067          	ret

00006b70 <.L4>:
    6b70:	00054783          	lbu	a5,0(a0)
    6b74:	04d78463          	beq	a5,a3,6bbc <.L1>
    6b78:	04078063          	beqz	a5,6bb8 <.L13>
    6b7c:	00150513          	addi	a0,a0,1
    6b80:	f89ff06f          	j	6b08 <.L2>

00006b84 <.L6>:
    6b84:	00070513          	mv	a0,a4
    6b88:	fa5ff06f          	j	6b2c <.L5>

00006b8c <.L7>:
    6b8c:	02078663          	beqz	a5,6bb8 <.L13>
    6b90:	ffe74783          	lbu	a5,-2(a4)
    6b94:	00d79663          	bne	a5,a3,6ba0 <.L8>
    6b98:	00250513          	addi	a0,a0,2
    6b9c:	00008067          	ret

00006ba0 <.L8>:
    6ba0:	00078c63          	beqz	a5,6bb8 <.L13>
    6ba4:	fff74783          	lbu	a5,-1(a4)
    6ba8:	00d79663          	bne	a5,a3,6bb4 <.L9>
    6bac:	00350513          	addi	a0,a0,3
    6bb0:	00008067          	ret

00006bb4 <.L9>:
    6bb4:	fc0798e3          	bnez	a5,6b84 <.L6>

00006bb8 <.L13>:
    6bb8:	00000513          	li	a0,0

00006bbc <.L1>:
    6bbc:	00008067          	ret

00006bc0 <__GI_strchrnul>:
    6bc0:	0ff5f693          	zext.b	a3,a1

00006bc4 <.L2>:
    6bc4:	00357793          	andi	a5,a0,3
    6bc8:	08079463          	bnez	a5,6c50 <.L4>
    6bcc:	010107b7          	lui	a5,0x1010
    6bd0:	0ff5f593          	zext.b	a1,a1
    6bd4:	10178793          	addi	a5,a5,257 # 1010101 <_ebss+0x10002b1>
    6bd8:	02f585b3          	mul	a1,a1,a5
    6bdc:	7eff0637          	lui	a2,0x7eff0
    6be0:	eff60613          	addi	a2,a2,-257 # 7efefeff <_ebss+0x7efe00af>
    6be4:	fff00313          	li	t1,-1

00006be8 <.L5>:
    6be8:	00052803          	lw	a6,0(a0)
    6bec:	00450793          	addi	a5,a0,4
    6bf0:	0105c8b3          	xor	a7,a1,a6
    6bf4:	00c80733          	add	a4,a6,a2
    6bf8:	01074733          	xor	a4,a4,a6
    6bfc:	00c88833          	add	a6,a7,a2
    6c00:	01184833          	xor	a6,a6,a7
    6c04:	01077733          	and	a4,a4,a6
    6c08:	00c76733          	or	a4,a4,a2
    6c0c:	04670c63          	beq	a4,t1,6c64 <.L6>
    6c10:	ffc7c703          	lbu	a4,-4(a5)
    6c14:	02d70c63          	beq	a4,a3,6c4c <.L1>
    6c18:	02070a63          	beqz	a4,6c4c <.L1>
    6c1c:	ffd7c703          	lbu	a4,-3(a5)
    6c20:	00150513          	addi	a0,a0,1
    6c24:	02d70463          	beq	a4,a3,6c4c <.L1>
    6c28:	02070263          	beqz	a4,6c4c <.L1>
    6c2c:	ffe7c703          	lbu	a4,-2(a5)
    6c30:	ffe78513          	addi	a0,a5,-2
    6c34:	00d70c63          	beq	a4,a3,6c4c <.L1>
    6c38:	00070a63          	beqz	a4,6c4c <.L1>
    6c3c:	fff7c703          	lbu	a4,-1(a5)
    6c40:	fff78513          	addi	a0,a5,-1
    6c44:	00d70463          	beq	a4,a3,6c4c <.L1>
    6c48:	00071e63          	bnez	a4,6c64 <.L6>

00006c4c <.L1>:
    6c4c:	00008067          	ret

00006c50 <.L4>:
    6c50:	00054783          	lbu	a5,0(a0)
    6c54:	fed78ce3          	beq	a5,a3,6c4c <.L1>
    6c58:	fe078ae3          	beqz	a5,6c4c <.L1>
    6c5c:	00150513          	addi	a0,a0,1
    6c60:	f65ff06f          	j	6bc4 <.L2>

00006c64 <.L6>:
    6c64:	00078513          	mv	a0,a5
    6c68:	f81ff06f          	j	6be8 <.L5>

00006c6c <__GI_strcmp>:
    6c6c:	00054703          	lbu	a4,0(a0)
    6c70:	00150513          	addi	a0,a0,1
    6c74:	00158593          	addi	a1,a1,1
    6c78:	fff5c783          	lbu	a5,-1(a1)
    6c7c:	00071663          	bnez	a4,6c88 <.L2>
    6c80:	40f00533          	neg	a0,a5
    6c84:	00008067          	ret

00006c88 <.L2>:
    6c88:	fef702e3          	beq	a4,a5,6c6c <__GI_strcmp>
    6c8c:	40f70533          	sub	a0,a4,a5
    6c90:	00008067          	ret

00006c94 <__GI_strcspn>:
    6c94:	ff010113          	addi	sp,sp,-16
    6c98:	00812423          	sw	s0,8(sp)
    6c9c:	00912223          	sw	s1,4(sp)
    6ca0:	01212023          	sw	s2,0(sp)
    6ca4:	00112623          	sw	ra,12(sp)
    6ca8:	00050493          	mv	s1,a0
    6cac:	00058913          	mv	s2,a1
    6cb0:	00000413          	li	s0,0

00006cb4 <.L2>:
    6cb4:	008487b3          	add	a5,s1,s0
    6cb8:	0007c583          	lbu	a1,0(a5)
    6cbc:	02059063          	bnez	a1,6cdc <.L4>

00006cc0 <.L1>:
    6cc0:	00c12083          	lw	ra,12(sp)
    6cc4:	00040513          	mv	a0,s0
    6cc8:	00812403          	lw	s0,8(sp)
    6ccc:	00412483          	lw	s1,4(sp)
    6cd0:	00012903          	lw	s2,0(sp)
    6cd4:	01010113          	addi	sp,sp,16
    6cd8:	00008067          	ret

00006cdc <.L4>:
    6cdc:	00090513          	mv	a0,s2
    6ce0:	e25ff0ef          	jal	ra,6b04 <__GI_strchr>
    6ce4:	fc051ee3          	bnez	a0,6cc0 <.L1>
    6ce8:	00140413          	addi	s0,s0,1
    6cec:	fc9ff06f          	j	6cb4 <.L2>

00006cf0 <__GI_strrchr>:
    6cf0:	ff010113          	addi	sp,sp,-16
    6cf4:	00812423          	sw	s0,8(sp)
    6cf8:	00112623          	sw	ra,12(sp)
    6cfc:	00912223          	sw	s1,4(sp)
    6d00:	0ff5f413          	zext.b	s0,a1
    6d04:	04041663          	bnez	s0,6d50 <.L6>
    6d08:	00812403          	lw	s0,8(sp)
    6d0c:	00c12083          	lw	ra,12(sp)
    6d10:	00412483          	lw	s1,4(sp)
    6d14:	00000593          	li	a1,0
    6d18:	01010113          	addi	sp,sp,16
    6d1c:	de9ff06f          	j	6b04 <__GI_strchr>

00006d20 <.L3>:
    6d20:	00150793          	addi	a5,a0,1
    6d24:	00050493          	mv	s1,a0

00006d28 <.L2>:
    6d28:	00040593          	mv	a1,s0
    6d2c:	00078513          	mv	a0,a5
    6d30:	dd5ff0ef          	jal	ra,6b04 <__GI_strchr>
    6d34:	fe0516e3          	bnez	a0,6d20 <.L3>
    6d38:	00c12083          	lw	ra,12(sp)
    6d3c:	00812403          	lw	s0,8(sp)
    6d40:	00048513          	mv	a0,s1
    6d44:	00412483          	lw	s1,4(sp)
    6d48:	01010113          	addi	sp,sp,16
    6d4c:	00008067          	ret

00006d50 <.L6>:
    6d50:	00050793          	mv	a5,a0
    6d54:	00000493          	li	s1,0
    6d58:	fd1ff06f          	j	6d28 <.L2>

00006d5c <__GI_strspn>:
    6d5c:	00050793          	mv	a5,a0
    6d60:	00000513          	li	a0,0

00006d64 <.L2>:
    6d64:	00a78733          	add	a4,a5,a0
    6d68:	00074683          	lbu	a3,0(a4)
    6d6c:	00069e63          	bnez	a3,6d88 <.L7>
    6d70:	00008067          	ret

00006d74 <.L4>:
    6d74:	00d60e63          	beq	a2,a3,6d90 <.L3>
    6d78:	00170713          	addi	a4,a4,1

00006d7c <.L6>:
    6d7c:	00074603          	lbu	a2,0(a4)
    6d80:	fe061ae3          	bnez	a2,6d74 <.L4>
    6d84:	00008067          	ret

00006d88 <.L7>:
    6d88:	00058713          	mv	a4,a1
    6d8c:	ff1ff06f          	j	6d7c <.L6>

00006d90 <.L3>:
    6d90:	00150513          	addi	a0,a0,1
    6d94:	fd1ff06f          	j	6d64 <.L2>

00006d98 <calloc>:
    6d98:	02a5b7b3          	mulhu	a5,a1,a0
    6d9c:	fe010113          	addi	sp,sp,-32
    6da0:	00112e23          	sw	ra,28(sp)
    6da4:	00812c23          	sw	s0,24(sp)
    6da8:	02a58633          	mul	a2,a1,a0
    6dac:	02078663          	beqz	a5,6dd8 <.L11>
    6db0:	00005797          	auipc	a5,0x5
    6db4:	0e47a783          	lw	a5,228(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    6db8:	00c00713          	li	a4,12
    6dbc:	00e7a023          	sw	a4,0(a5)

00006dc0 <.L6>:
    6dc0:	00000413          	li	s0,0

00006dc4 <.L1>:
    6dc4:	01c12083          	lw	ra,28(sp)
    6dc8:	00040513          	mv	a0,s0
    6dcc:	01812403          	lw	s0,24(sp)
    6dd0:	02010113          	addi	sp,sp,32
    6dd4:	00008067          	ret

00006dd8 <.L11>:
    6dd8:	00060513          	mv	a0,a2
    6ddc:	00c12623          	sw	a2,12(sp)
    6de0:	fa1fc0ef          	jal	ra,3d80 <malloc>
    6de4:	00050413          	mv	s0,a0
    6de8:	fc050ce3          	beqz	a0,6dc0 <.L6>
    6dec:	00c12603          	lw	a2,12(sp)
    6df0:	00000593          	li	a1,0
    6df4:	a3dfc0ef          	jal	ra,3830 <__GI_memset>
    6df8:	fcdff06f          	j	6dc4 <.L1>

00006dfc <realloc>:
    6dfc:	00051663          	bnez	a0,6e08 <.L2>
    6e00:	00058513          	mv	a0,a1
    6e04:	f7dfc06f          	j	3d80 <malloc>

00006e08 <.L2>:
    6e08:	ff010113          	addi	sp,sp,-16
    6e0c:	00112623          	sw	ra,12(sp)
    6e10:	00812423          	sw	s0,8(sp)
    6e14:	00912223          	sw	s1,4(sp)
    6e18:	01212023          	sw	s2,0(sp)
    6e1c:	02059463          	bnez	a1,6e44 <.L3>
    6e20:	978fd0ef          	jal	ra,3f98 <free>

00006e24 <.L4>:
    6e24:	00000413          	li	s0,0

00006e28 <.L1>:
    6e28:	00c12083          	lw	ra,12(sp)
    6e2c:	00040513          	mv	a0,s0
    6e30:	00812403          	lw	s0,8(sp)
    6e34:	00412483          	lw	s1,4(sp)
    6e38:	00012903          	lw	s2,0(sp)
    6e3c:	01010113          	addi	sp,sp,16
    6e40:	00008067          	ret

00006e44 <.L3>:
    6e44:	ff000793          	li	a5,-16
    6e48:	fcb7eee3          	bltu	a5,a1,6e24 <.L4>
    6e4c:	ff852903          	lw	s2,-8(a0)
    6e50:	00f58413          	addi	s0,a1,15
    6e54:	ff847413          	andi	s0,s0,-8
    6e58:	00050493          	mv	s1,a0
    6e5c:	ff850793          	addi	a5,a0,-8
    6e60:	04897a63          	bgeu	s2,s0,6eb4 <.L7>
    6e64:	41240633          	sub	a2,s0,s2
    6e68:	012785b3          	add	a1,a5,s2
    6e6c:	00007517          	auipc	a0,0x7
    6e70:	ef050513          	addi	a0,a0,-272 # dd5c <__malloc_heap>
    6e74:	064000ef          	jal	ra,6ed8 <__heap_alloc_at>
    6e78:	00050a63          	beqz	a0,6e8c <.L8>
    6e7c:	00a90933          	add	s2,s2,a0
    6e80:	ff24ac23          	sw	s2,-8(s1)

00006e84 <.L9>:
    6e84:	00048413          	mv	s0,s1
    6e88:	fa1ff06f          	j	6e28 <.L1>

00006e8c <.L8>:
    6e8c:	ff840513          	addi	a0,s0,-8
    6e90:	ef1fc0ef          	jal	ra,3d80 <malloc>
    6e94:	00050413          	mv	s0,a0
    6e98:	f80506e3          	beqz	a0,6e24 <.L4>
    6e9c:	ff890613          	addi	a2,s2,-8
    6ea0:	00048593          	mv	a1,s1
    6ea4:	ee4fc0ef          	jal	ra,3588 <__GI_memcpy>
    6ea8:	00048513          	mv	a0,s1
    6eac:	8ecfd0ef          	jal	ra,3f98 <free>
    6eb0:	f79ff06f          	j	6e28 <.L1>

00006eb4 <.L7>:
    6eb4:	02040713          	addi	a4,s0,32
    6eb8:	fce966e3          	bltu	s2,a4,6e84 <.L9>
    6ebc:	40890633          	sub	a2,s2,s0
    6ec0:	008785b3          	add	a1,a5,s0
    6ec4:	00007517          	auipc	a0,0x7
    6ec8:	e9850513          	addi	a0,a0,-360 # dd5c <__malloc_heap>
    6ecc:	960fd0ef          	jal	ra,402c <__heap_free>
    6ed0:	fe84ac23          	sw	s0,-8(s1)
    6ed4:	fb1ff06f          	j	6e84 <.L9>

00006ed8 <__heap_alloc_at>:
    6ed8:	00052783          	lw	a5,0(a0)
    6edc:	00050713          	mv	a4,a0
    6ee0:	00c00813          	li	a6,12

00006ee4 <.L2>:
    6ee4:	00079663          	bnez	a5,6ef0 <.L9>

00006ee8 <.L11>:
    6ee8:	00000513          	li	a0,0
    6eec:	00008067          	ret

00006ef0 <.L9>:
    6ef0:	0007a503          	lw	a0,0(a5)
    6ef4:	40a806b3          	sub	a3,a6,a0
    6ef8:	00d786b3          	add	a3,a5,a3
    6efc:	04d5ea63          	bltu	a1,a3,6f50 <.L3>
    6f00:	feb694e3          	bne	a3,a1,6ee8 <.L11>
    6f04:	00760613          	addi	a2,a2,7
    6f08:	ff867613          	andi	a2,a2,-8
    6f0c:	fcc56ee3          	bltu	a0,a2,6ee8 <.L11>
    6f10:	03060693          	addi	a3,a2,48
    6f14:	02d57663          	bgeu	a0,a3,6f40 <.L5>
    6f18:	0047a683          	lw	a3,4(a5)
    6f1c:	00068663          	beqz	a3,6f28 <.L6>
    6f20:	0087a603          	lw	a2,8(a5)
    6f24:	00c6a423          	sw	a2,8(a3)

00006f28 <.L6>:
    6f28:	0087a783          	lw	a5,8(a5)
    6f2c:	00078663          	beqz	a5,6f38 <.L7>
    6f30:	00d7a223          	sw	a3,4(a5)
    6f34:	00008067          	ret

00006f38 <.L7>:
    6f38:	00d72023          	sw	a3,0(a4)
    6f3c:	00008067          	ret

00006f40 <.L5>:
    6f40:	40c50533          	sub	a0,a0,a2
    6f44:	00a7a023          	sw	a0,0(a5)
    6f48:	00060513          	mv	a0,a2
    6f4c:	00008067          	ret

00006f50 <.L3>:
    6f50:	0047a783          	lw	a5,4(a5)
    6f54:	f91ff06f          	j	6ee4 <.L2>

00006f58 <__GI_exit>:
    6f58:	ff010113          	addi	sp,sp,-16
    6f5c:	00812423          	sw	s0,8(sp)
    6f60:	00009717          	auipc	a4,0x9
    6f64:	e8072703          	lw	a4,-384(a4) # fde0 <__exit_cleanup>
    6f68:	00112623          	sw	ra,12(sp)
    6f6c:	00070793          	mv	a5,a4
    6f70:	00050413          	mv	s0,a0
    6f74:	00078463          	beqz	a5,6f7c <.L2>
    6f78:	000700e7          	jalr	a4

00006f7c <.L2>:
    6f7c:	f50fd0ef          	jal	ra,46cc <__uClibc_fini>
    6f80:	00005717          	auipc	a4,0x5
    6f84:	f4472703          	lw	a4,-188(a4) # bec4 <.LLST21+0x12>
    6f88:	00070793          	mv	a5,a4
    6f8c:	00078463          	beqz	a5,6f94 <.L3>
    6f90:	000700e7          	jalr	a4

00006f94 <.L3>:
    6f94:	00040513          	mv	a0,s0
    6f98:	090000ef          	jal	ra,7028 <__GI__exit>

00006f9c <__fcntl_nocancel>:
    6f9c:	ff458793          	addi	a5,a1,-12
    6fa0:	00200713          	li	a4,2
    6fa4:	02f76663          	bltu	a4,a5,6fd0 <.L4>
    6fa8:	01900893          	li	a7,25
    6fac:	00000073          	ecall
    6fb0:	fffff7b7          	lui	a5,0xfffff
    6fb4:	00a7fc63          	bgeu	a5,a0,6fcc <.L1>
    6fb8:	40a00533          	neg	a0,a0

00006fbc <.L2>:
    6fbc:	00005797          	auipc	a5,0x5
    6fc0:	ed87a783          	lw	a5,-296(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    6fc4:	00a7a023          	sw	a0,0(a5)
    6fc8:	fff00513          	li	a0,-1

00006fcc <.L1>:
    6fcc:	00008067          	ret

00006fd0 <.L4>:
    6fd0:	02600513          	li	a0,38
    6fd4:	fe9ff06f          	j	6fbc <.L2>

00006fd8 <__GI_fcntl>:
    6fd8:	fd010113          	addi	sp,sp,-48
    6fdc:	02f12223          	sw	a5,36(sp)
    6fe0:	01810793          	addi	a5,sp,24
    6fe4:	03112623          	sw	a7,44(sp)
    6fe8:	00c12c23          	sw	a2,24(sp)
    6fec:	00d12e23          	sw	a3,28(sp)
    6ff0:	02e12023          	sw	a4,32(sp)
    6ff4:	03012423          	sw	a6,40(sp)
    6ff8:	00f12623          	sw	a5,12(sp)
    6ffc:	01900893          	li	a7,25
    7000:	00000073          	ecall
    7004:	fffff7b7          	lui	a5,0xfffff
    7008:	00a7fc63          	bgeu	a5,a0,7020 <.L5>
    700c:	40a00533          	neg	a0,a0
    7010:	00005797          	auipc	a5,0x5
    7014:	e847a783          	lw	a5,-380(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    7018:	00a7a023          	sw	a0,0(a5)
    701c:	fff00513          	li	a0,-1

00007020 <.L5>:
    7020:	03010113          	addi	sp,sp,48
    7024:	00008067          	ret

00007028 <__GI__exit>:
    7028:	00050713          	mv	a4,a0
    702c:	fffff637          	lui	a2,0xfffff
    7030:	00005697          	auipc	a3,0x5
    7034:	e646a683          	lw	a3,-412(a3) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>

00007038 <.L2>:
    7038:	00070513          	mv	a0,a4
    703c:	05d00893          	li	a7,93
    7040:	00000073          	ecall
    7044:	fea67ae3          	bgeu	a2,a0,7038 <.L2>
    7048:	40a007b3          	neg	a5,a0
    704c:	00f6a023          	sw	a5,0(a3)
    7050:	fe9ff06f          	j	7038 <.L2>

00007054 <__GI_close>:
    7054:	03900893          	li	a7,57
    7058:	00000073          	ecall
    705c:	fffff7b7          	lui	a5,0xfffff
    7060:	00a7fc63          	bgeu	a5,a0,7078 <.L1>
    7064:	40a00533          	neg	a0,a0
    7068:	00005797          	auipc	a5,0x5
    706c:	e2c7a783          	lw	a5,-468(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    7070:	00a7a023          	sw	a0,0(a5)
    7074:	fff00513          	li	a0,-1

00007078 <.L1>:
    7078:	00008067          	ret

0000707c <__close_nocancel_no_status>:
    707c:	03900893          	li	a7,57
    7080:	00000073          	ecall
    7084:	00008067          	ret

00007088 <__GI_open>:
    7088:	fc010113          	addi	sp,sp,-64
    708c:	02f12a23          	sw	a5,52(sp)
    7090:	004007b7          	lui	a5,0x400
    7094:	04078793          	addi	a5,a5,64 # 400040 <_ebss+0x3f01f0>
    7098:	02d12623          	sw	a3,44(sp)
    709c:	00112e23          	sw	ra,28(sp)
    70a0:	02c12423          	sw	a2,40(sp)
    70a4:	02e12823          	sw	a4,48(sp)
    70a8:	03012c23          	sw	a6,56(sp)
    70ac:	03112e23          	sw	a7,60(sp)
    70b0:	00f5f7b3          	and	a5,a1,a5
    70b4:	00000693          	li	a3,0
    70b8:	00078863          	beqz	a5,70c8 <.L2>
    70bc:	02810793          	addi	a5,sp,40
    70c0:	00f12623          	sw	a5,12(sp)
    70c4:	00060693          	mv	a3,a2

000070c8 <.L2>:
    70c8:	00058613          	mv	a2,a1
    70cc:	00050593          	mv	a1,a0
    70d0:	f9c00513          	li	a0,-100
    70d4:	018000ef          	jal	ra,70ec <__GI_openat>
    70d8:	01c12083          	lw	ra,28(sp)
    70dc:	04010113          	addi	sp,sp,64
    70e0:	00008067          	ret

000070e4 <__open2_nocancel>:
    70e4:	fa5ff06f          	j	7088 <__GI_open>

000070e8 <__open_nocancel>:
    70e8:	fa1ff06f          	j	7088 <__GI_open>

000070ec <__GI_openat>:
    70ec:	fd010113          	addi	sp,sp,-48
    70f0:	02f12223          	sw	a5,36(sp)
    70f4:	01c10793          	addi	a5,sp,28
    70f8:	03112623          	sw	a7,44(sp)
    70fc:	00d12e23          	sw	a3,28(sp)
    7100:	02e12023          	sw	a4,32(sp)
    7104:	03012423          	sw	a6,40(sp)
    7108:	00f12623          	sw	a5,12(sp)
    710c:	03800893          	li	a7,56
    7110:	00000073          	ecall
    7114:	fffff7b7          	lui	a5,0xfffff
    7118:	00a7fc63          	bgeu	a5,a0,7130 <.L1>
    711c:	40a00533          	neg	a0,a0
    7120:	00005797          	auipc	a5,0x5
    7124:	d747a783          	lw	a5,-652(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    7128:	00a7a023          	sw	a0,0(a5)
    712c:	fff00513          	li	a0,-1

00007130 <.L1>:
    7130:	03010113          	addi	sp,sp,48
    7134:	00008067          	ret

00007138 <__GI_write>:
    7138:	04000893          	li	a7,64
    713c:	00000073          	ecall
    7140:	fffff7b7          	lui	a5,0xfffff
    7144:	00a7fc63          	bgeu	a5,a0,715c <.L1>
    7148:	40a00533          	neg	a0,a0
    714c:	00005797          	auipc	a5,0x5
    7150:	d487a783          	lw	a5,-696(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    7154:	00a7a023          	sw	a0,0(a5)
    7158:	fff00513          	li	a0,-1

0000715c <.L1>:
    715c:	00008067          	ret

00007160 <__GI_fstat64>:
    7160:	05000893          	li	a7,80
    7164:	00000073          	ecall
    7168:	fffff7b7          	lui	a5,0xfffff
    716c:	00a7fc63          	bgeu	a5,a0,7184 <.L1>
    7170:	40a00533          	neg	a0,a0
    7174:	00005797          	auipc	a5,0x5
    7178:	d207a783          	lw	a5,-736(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    717c:	00a7a023          	sw	a0,0(a5)
    7180:	fff00513          	li	a0,-1

00007184 <.L1>:
    7184:	00008067          	ret

00007188 <__getdents>:
    7188:	fd010113          	addi	sp,sp,-48
    718c:	01812423          	sw	s8,8(sp)
    7190:	00050c13          	mv	s8,a0
    7194:	00060513          	mv	a0,a2
    7198:	01312e23          	sw	s3,28(sp)
    719c:	01412c23          	sw	s4,24(sp)
    71a0:	01512a23          	sw	s5,20(sp)
    71a4:	00060a13          	mv	s4,a2
    71a8:	00058a93          	mv	s5,a1
    71ac:	02112623          	sw	ra,44(sp)
    71b0:	02812423          	sw	s0,40(sp)
    71b4:	02912223          	sw	s1,36(sp)
    71b8:	03212023          	sw	s2,32(sp)
    71bc:	01612823          	sw	s6,16(sp)
    71c0:	01712623          	sw	s7,12(sp)
    71c4:	01912223          	sw	s9,4(sp)
    71c8:	bb9fc0ef          	jal	ra,3d80 <malloc>
    71cc:	00050993          	mv	s3,a0
    71d0:	00098593          	mv	a1,s3
    71d4:	000c0513          	mv	a0,s8
    71d8:	000a0613          	mv	a2,s4
    71dc:	03d00893          	li	a7,61
    71e0:	00000073          	ecall
    71e4:	fffff737          	lui	a4,0xfffff
    71e8:	0ea77c63          	bgeu	a4,a0,72e0 <.L9>
    71ec:	40a007b3          	neg	a5,a0
    71f0:	00005717          	auipc	a4,0x5
    71f4:	ca472703          	lw	a4,-860(a4) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    71f8:	00098513          	mv	a0,s3
    71fc:	00f72023          	sw	a5,0(a4)
    7200:	d99fc0ef          	jal	ra,3f98 <free>

00007204 <.L3>:
    7204:	fff00513          	li	a0,-1
    7208:	0a40006f          	j	72ac <.L1>

0000720c <.L5>:
    720c:	00098513          	mv	a0,s3
    7210:	d89fc0ef          	jal	ra,3f98 <free>
    7214:	00005797          	auipc	a5,0x5
    7218:	c807a783          	lw	a5,-896(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    721c:	01600713          	li	a4,22
    7220:	00e7a023          	sw	a4,0(a5)
    7224:	fe1ff06f          	j	7204 <.L3>

00007228 <.L4>:
    7228:	00492783          	lw	a5,4(s2)
    722c:	00892b03          	lw	s6,8(s2)
    7230:	00c92b83          	lw	s7,12(s2)
    7234:	00092703          	lw	a4,0(s2)
    7238:	00f42223          	sw	a5,4(s0)
    723c:	01294783          	lbu	a5,18(s2)
    7240:	00e42023          	sw	a4,0(s0)
    7244:	01642423          	sw	s6,8(s0)
    7248:	00f40923          	sb	a5,18(s0)
    724c:	01742623          	sw	s7,12(s0)
    7250:	00d41823          	sh	a3,16(s0)
    7254:	01390593          	addi	a1,s2,19
    7258:	01340513          	addi	a0,s0,19
    725c:	fed60613          	addi	a2,a2,-19 # ffffefed <_ebss+0xfffef19d>
    7260:	b28fc0ef          	jal	ra,3588 <__GI_memcpy>
    7264:	01095783          	lhu	a5,16(s2)
    7268:	000c8413          	mv	s0,s9
    726c:	00f90933          	add	s2,s2,a5

00007270 <.L2>:
    7270:	02997863          	bgeu	s2,s1,72a0 <.L8>
    7274:	01095603          	lhu	a2,16(s2)
    7278:	00760693          	addi	a3,a2,7
    727c:	ff86f693          	andi	a3,a3,-8
    7280:	00d40cb3          	add	s9,s0,a3
    7284:	fb9a72e3          	bgeu	s4,s9,7228 <.L4>
    7288:	00000693          	li	a3,0
    728c:	000b0593          	mv	a1,s6
    7290:	000b8613          	mv	a2,s7
    7294:	000c0513          	mv	a0,s8
    7298:	480000ef          	jal	ra,7718 <__GI_lseek64>
    729c:	f75408e3          	beq	s0,s5,720c <.L5>

000072a0 <.L8>:
    72a0:	00098513          	mv	a0,s3
    72a4:	cf5fc0ef          	jal	ra,3f98 <free>
    72a8:	41540533          	sub	a0,s0,s5

000072ac <.L1>:
    72ac:	02c12083          	lw	ra,44(sp)
    72b0:	02812403          	lw	s0,40(sp)
    72b4:	02412483          	lw	s1,36(sp)
    72b8:	02012903          	lw	s2,32(sp)
    72bc:	01c12983          	lw	s3,28(sp)
    72c0:	01812a03          	lw	s4,24(sp)
    72c4:	01412a83          	lw	s5,20(sp)
    72c8:	01012b03          	lw	s6,16(sp)
    72cc:	00c12b83          	lw	s7,12(sp)
    72d0:	00812c03          	lw	s8,8(sp)
    72d4:	00412c83          	lw	s9,4(sp)
    72d8:	03010113          	addi	sp,sp,48
    72dc:	00008067          	ret

000072e0 <.L9>:
    72e0:	00098913          	mv	s2,s3
    72e4:	000a8413          	mv	s0,s5
    72e8:	fff00b13          	li	s6,-1
    72ec:	fff00b93          	li	s7,-1
    72f0:	00a984b3          	add	s1,s3,a0
    72f4:	014a8a33          	add	s4,s5,s4
    72f8:	f79ff06f          	j	7270 <.L2>

000072fc <__GI_fseek>:
    72fc:	00060693          	mv	a3,a2
    7300:	41f5d613          	srai	a2,a1,0x1f
    7304:	0040006f          	j	7308 <__GI_fseeko64>

00007308 <__GI_fseeko64>:
    7308:	fd010113          	addi	sp,sp,-48
    730c:	02112623          	sw	ra,44(sp)
    7310:	02812423          	sw	s0,40(sp)
    7314:	00b12c23          	sw	a1,24(sp)
    7318:	00c12e23          	sw	a2,28(sp)
    731c:	00200793          	li	a5,2
    7320:	02d7f463          	bgeu	a5,a3,7348 <.L2>
    7324:	00005797          	auipc	a5,0x5
    7328:	b707a783          	lw	a5,-1168(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    732c:	01600713          	li	a4,22
    7330:	00e7a023          	sw	a4,0(a5)

00007334 <.L3>:
    7334:	fff00513          	li	a0,-1

00007338 <.L1>:
    7338:	02c12083          	lw	ra,44(sp)
    733c:	02812403          	lw	s0,40(sp)
    7340:	03010113          	addi	sp,sp,48
    7344:	00008067          	ret

00007348 <.L2>:
    7348:	00055783          	lhu	a5,0(a0)
    734c:	00050413          	mv	s0,a0
    7350:	00068613          	mv	a2,a3
    7354:	0407f793          	andi	a5,a5,64
    7358:	06079863          	bnez	a5,73c8 <.L4>

0000735c <.L7>:
    735c:	00100793          	li	a5,1
    7360:	00f61e63          	bne	a2,a5,737c <.L5>
    7364:	01810593          	addi	a1,sp,24
    7368:	00040513          	mv	a0,s0
    736c:	00c12623          	sw	a2,12(sp)
    7370:	120000ef          	jal	ra,7490 <__stdio_adjust_position>
    7374:	00c12603          	lw	a2,12(sp)
    7378:	fa054ee3          	bltz	a0,7334 <.L3>

0000737c <.L5>:
    737c:	00442703          	lw	a4,4(s0)
    7380:	ffe00793          	li	a5,-2
    7384:	04f71c63          	bne	a4,a5,73dc <.L20>
    7388:	03042783          	lw	a5,48(s0)
    738c:	fa0784e3          	beqz	a5,7334 <.L3>
    7390:	02442503          	lw	a0,36(s0)
    7394:	01810593          	addi	a1,sp,24
    7398:	000780e7          	jalr	a5

0000739c <.L12>:
    739c:	f8054ce3          	bltz	a0,7334 <.L3>
    73a0:	00045783          	lhu	a5,0(s0)
    73a4:	00000513          	li	a0,0
    73a8:	fb87f793          	andi	a5,a5,-72
    73ac:	00f41023          	sh	a5,0(s0)
    73b0:	00842783          	lw	a5,8(s0)
    73b4:	00f42823          	sw	a5,16(s0)
    73b8:	00f42a23          	sw	a5,20(s0)
    73bc:	00f42c23          	sw	a5,24(s0)
    73c0:	00f42e23          	sw	a5,28(s0)
    73c4:	f75ff06f          	j	7338 <.L1>

000073c8 <.L4>:
    73c8:	00d12623          	sw	a3,12(sp)
    73cc:	ebdfa0ef          	jal	ra,2288 <__stdio_wcommit>
    73d0:	00c12603          	lw	a2,12(sp)
    73d4:	f80504e3          	beqz	a0,735c <.L7>
    73d8:	f5dff06f          	j	7334 <.L3>

000073dc <.L20>:
    73dc:	01810593          	addi	a1,sp,24
    73e0:	00040513          	mv	a0,s0
    73e4:	1ec000ef          	jal	ra,75d0 <__stdio_seek>
    73e8:	fb5ff06f          	j	739c <.L12>

000073ec <__stdio_READ>:
    73ec:	00055783          	lhu	a5,0(a0)
    73f0:	0047f793          	andi	a5,a5,4
    73f4:	08079a63          	bnez	a5,7488 <.L13>
    73f8:	ff010113          	addi	sp,sp,-16
    73fc:	800007b7          	lui	a5,0x80000
    7400:	00812423          	sw	s0,8(sp)
    7404:	00912223          	sw	s1,4(sp)
    7408:	00112623          	sw	ra,12(sp)
    740c:	fff7c793          	not	a5,a5
    7410:	00050413          	mv	s0,a0
    7414:	00060493          	mv	s1,a2
    7418:	00c7f463          	bgeu	a5,a2,7420 <.L3>
    741c:	00078493          	mv	s1,a5

00007420 <.L3>:
    7420:	00442503          	lw	a0,4(s0)
    7424:	ffe00793          	li	a5,-2
    7428:	04f51663          	bne	a0,a5,7474 <.L4>
    742c:	02842783          	lw	a5,40(s0)
    7430:	02078063          	beqz	a5,7450 <.L5>
    7434:	02442503          	lw	a0,36(s0)
    7438:	00048613          	mv	a2,s1
    743c:	000780e7          	jalr	a5 # 80000000 <_ebss+0x7fff01b0>

00007440 <.L6>:
    7440:	04a04063          	bgtz	a0,7480 <.L7>
    7444:	00045783          	lhu	a5,0(s0)
    7448:	0047e793          	ori	a5,a5,4
    744c:	00050663          	beqz	a0,7458 <.L17>

00007450 <.L5>:
    7450:	00045783          	lhu	a5,0(s0)
    7454:	0087e793          	ori	a5,a5,8

00007458 <.L17>:
    7458:	00f41023          	sh	a5,0(s0)
    745c:	00000513          	li	a0,0

00007460 <.L8>:
    7460:	00c12083          	lw	ra,12(sp)
    7464:	00812403          	lw	s0,8(sp)
    7468:	00412483          	lw	s1,4(sp)
    746c:	01010113          	addi	sp,sp,16
    7470:	00008067          	ret

00007474 <.L4>:
    7474:	00048613          	mv	a2,s1
    7478:	24c000ef          	jal	ra,76c4 <__GI_read>
    747c:	fc5ff06f          	j	7440 <.L6>

00007480 <.L7>:
    7480:	fea4f0e3          	bgeu	s1,a0,7460 <.L8>
    7484:	190000ef          	jal	ra,7614 <__GI_abort>

00007488 <.L13>:
    7488:	00000513          	li	a0,0
    748c:	00008067          	ret

00007490 <__stdio_adjust_position>:
    7490:	00055783          	lhu	a5,0(a0)
    7494:	00000713          	li	a4,0
    7498:	0037f693          	andi	a3,a5,3
    749c:	00068463          	beqz	a3,74a4 <.L2>
    74a0:	fff68713          	addi	a4,a3,-1

000074a4 <.L2>:
    74a4:	0407f793          	andi	a5,a5,64
    74a8:	06078063          	beqz	a5,7508 <.L3>
    74ac:	00852783          	lw	a5,8(a0)

000074b0 <.L4>:
    74b0:	01052683          	lw	a3,16(a0)
    74b4:	0045a603          	lw	a2,4(a1)
    74b8:	40d78533          	sub	a0,a5,a3
    74bc:	00e50533          	add	a0,a0,a4
    74c0:	0005a703          	lw	a4,0(a1)
    74c4:	41f55793          	srai	a5,a0,0x1f
    74c8:	40f607b3          	sub	a5,a2,a5
    74cc:	40a706b3          	sub	a3,a4,a0
    74d0:	00d73833          	sltu	a6,a4,a3
    74d4:	410787b3          	sub	a5,a5,a6
    74d8:	00d5a023          	sw	a3,0(a1)
    74dc:	00f5a223          	sw	a5,4(a1)
    74e0:	00f64663          	blt	a2,a5,74ec <.L9>
    74e4:	00c79663          	bne	a5,a2,74f0 <.L5>
    74e8:	00d77463          	bgeu	a4,a3,74f0 <.L5>

000074ec <.L9>:
    74ec:	40a00533          	neg	a0,a0

000074f0 <.L5>:
    74f0:	00055a63          	bgez	a0,7504 <.L1>
    74f4:	00005797          	auipc	a5,0x5
    74f8:	9a07a783          	lw	a5,-1632(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    74fc:	04b00713          	li	a4,75
    7500:	00e7a023          	sw	a4,0(a5)

00007504 <.L1>:
    7504:	00008067          	ret

00007508 <.L3>:
    7508:	01452783          	lw	a5,20(a0)
    750c:	fa5ff06f          	j	74b0 <.L4>

00007510 <__stdio_rfill>:
    7510:	00852583          	lw	a1,8(a0)
    7514:	00c52603          	lw	a2,12(a0)
    7518:	ff010113          	addi	sp,sp,-16
    751c:	00812423          	sw	s0,8(sp)
    7520:	40b60633          	sub	a2,a2,a1
    7524:	00112623          	sw	ra,12(sp)
    7528:	00050413          	mv	s0,a0
    752c:	ec1ff0ef          	jal	ra,73ec <__stdio_READ>
    7530:	00842783          	lw	a5,8(s0)
    7534:	00c12083          	lw	ra,12(sp)
    7538:	00f42823          	sw	a5,16(s0)
    753c:	00a787b3          	add	a5,a5,a0
    7540:	00f42a23          	sw	a5,20(s0)
    7544:	00812403          	lw	s0,8(sp)
    7548:	01010113          	addi	sp,sp,16
    754c:	00008067          	ret

00007550 <__stdio_trans2r>:
    7550:	00055783          	lhu	a5,0(a0)
    7554:	ff010113          	addi	sp,sp,-16
    7558:	00812423          	sw	s0,8(sp)
    755c:	00112623          	sw	ra,12(sp)
    7560:	0107f713          	andi	a4,a5,16
    7564:	00050413          	mv	s0,a0
    7568:	02070a63          	beqz	a4,759c <.L2>
    756c:	00005797          	auipc	a5,0x5
    7570:	9287a783          	lw	a5,-1752(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    7574:	00900713          	li	a4,9
    7578:	00e7a023          	sw	a4,0(a5)

0000757c <.L3>:
    757c:	00045783          	lhu	a5,0(s0)
    7580:	fff00513          	li	a0,-1
    7584:	0087e793          	ori	a5,a5,8

00007588 <.L4>:
    7588:	00c12083          	lw	ra,12(sp)
    758c:	00f41023          	sh	a5,0(s0)
    7590:	00812403          	lw	s0,8(sp)
    7594:	01010113          	addi	sp,sp,16
    7598:	00008067          	ret

0000759c <.L2>:
    759c:	0407f793          	andi	a5,a5,64
    75a0:	02078063          	beqz	a5,75c0 <.L5>
    75a4:	ce5fa0ef          	jal	ra,2288 <__stdio_wcommit>
    75a8:	fc051ae3          	bnez	a0,757c <.L3>
    75ac:	00842783          	lw	a5,8(s0)
    75b0:	00f42e23          	sw	a5,28(s0)
    75b4:	00045783          	lhu	a5,0(s0)
    75b8:	fbf7f793          	andi	a5,a5,-65
    75bc:	00f41023          	sh	a5,0(s0)

000075c0 <.L5>:
    75c0:	00045783          	lhu	a5,0(s0)
    75c4:	00000513          	li	a0,0
    75c8:	0017e793          	ori	a5,a5,1
    75cc:	fbdff06f          	j	7588 <.L4>

000075d0 <__stdio_seek>:
    75d0:	ff010113          	addi	sp,sp,-16
    75d4:	00812423          	sw	s0,8(sp)
    75d8:	00058413          	mv	s0,a1
    75dc:	00060693          	mv	a3,a2
    75e0:	0005a583          	lw	a1,0(a1)
    75e4:	00442603          	lw	a2,4(s0)
    75e8:	00452503          	lw	a0,4(a0)
    75ec:	00112623          	sw	ra,12(sp)
    75f0:	128000ef          	jal	ra,7718 <__GI_lseek64>
    75f4:	0005c863          	bltz	a1,7604 <.L1>
    75f8:	00a42023          	sw	a0,0(s0)
    75fc:	00b42223          	sw	a1,4(s0)
    7600:	00000513          	li	a0,0

00007604 <.L1>:
    7604:	00c12083          	lw	ra,12(sp)
    7608:	00812403          	lw	s0,8(sp)
    760c:	01010113          	addi	sp,sp,16
    7610:	00008067          	ret

00007614 <__GI_abort>:
    7614:	fd010113          	addi	sp,sp,-48
    7618:	02000793          	li	a5,32
    761c:	00000613          	li	a2,0
    7620:	00410593          	addi	a1,sp,4
    7624:	00100513          	li	a0,1
    7628:	02812423          	sw	s0,40(sp)
    762c:	00f12223          	sw	a5,4(sp)
    7630:	02112623          	sw	ra,44(sp)
    7634:	02912223          	sw	s1,36(sp)
    7638:	00012423          	sw	zero,8(sp)
    763c:	00008417          	auipc	s0,0x8
    7640:	7ac40413          	addi	s0,s0,1964 # fde8 <been_there_done_that>
    7644:	0a8000ef          	jal	ra,76ec <__GI_sigprocmask>
    7648:	00042783          	lw	a5,0(s0)
    764c:	00079a63          	bnez	a5,7660 <.L2>
    7650:	00100793          	li	a5,1
    7654:	00f42023          	sw	a5,0(s0)

00007658 <.L3>:
    7658:	00600513          	li	a0,6
    765c:	124000ef          	jal	ra,7780 <__GI_raise>

00007660 <.L2>:
    7660:	00042783          	lw	a5,0(s0)
    7664:	00100713          	li	a4,1
    7668:	04e79063          	bne	a5,a4,76a8 <.L4>
    766c:	00c10493          	addi	s1,sp,12
    7670:	00200793          	li	a5,2
    7674:	01400613          	li	a2,20
    7678:	00000593          	li	a1,0
    767c:	00048513          	mv	a0,s1
    7680:	00f42023          	sw	a5,0(s0)
    7684:	9acfc0ef          	jal	ra,3830 <__GI_memset>
    7688:	fff00793          	li	a5,-1
    768c:	00000613          	li	a2,0
    7690:	00048593          	mv	a1,s1
    7694:	00600513          	li	a0,6
    7698:	00f12c23          	sw	a5,24(sp)
    769c:	00f12e23          	sw	a5,28(sp)
    76a0:	0d8000ef          	jal	ra,7778 <__GI_sigaction>
    76a4:	fb5ff06f          	j	7658 <.L3>

000076a8 <.L4>:
    76a8:	ffe78793          	addi	a5,a5,-2
    76ac:	00f76a63          	bltu	a4,a5,76c0 <.L5>
    76b0:	00400793          	li	a5,4
    76b4:	07f00513          	li	a0,127
    76b8:	00f42023          	sw	a5,0(s0)
    76bc:	96dff0ef          	jal	ra,7028 <__GI__exit>

000076c0 <.L5>:
    76c0:	0000006f          	j	76c0 <.L5>

000076c4 <__GI_read>:
    76c4:	03f00893          	li	a7,63
    76c8:	00000073          	ecall
    76cc:	fffff7b7          	lui	a5,0xfffff
    76d0:	00a7fc63          	bgeu	a5,a0,76e8 <.L1>
    76d4:	40a00533          	neg	a0,a0
    76d8:	00004797          	auipc	a5,0x4
    76dc:	7bc7a783          	lw	a5,1980(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    76e0:	00a7a023          	sw	a0,0(a5)
    76e4:	fff00513          	li	a0,-1

000076e8 <.L1>:
    76e8:	00008067          	ret

000076ec <__GI_sigprocmask>:
    76ec:	00800693          	li	a3,8
    76f0:	08700893          	li	a7,135
    76f4:	00000073          	ecall
    76f8:	fffff7b7          	lui	a5,0xfffff
    76fc:	00a7fc63          	bgeu	a5,a0,7714 <.L1>
    7700:	40a00533          	neg	a0,a0
    7704:	00004797          	auipc	a5,0x4
    7708:	7907a783          	lw	a5,1936(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    770c:	00a7a023          	sw	a0,0(a5)
    7710:	fff00513          	li	a0,-1

00007714 <.L1>:
    7714:	00008067          	ret

00007718 <__GI_lseek64>:
    7718:	00058793          	mv	a5,a1
    771c:	ff010113          	addi	sp,sp,-16
    7720:	00068713          	mv	a4,a3
    7724:	00060593          	mv	a1,a2
    7728:	00810693          	addi	a3,sp,8
    772c:	00078613          	mv	a2,a5
    7730:	03e00893          	li	a7,62
    7734:	00000073          	ecall
    7738:	fffff7b7          	lui	a5,0xfffff
    773c:	02a7f263          	bgeu	a5,a0,7760 <.L2>
    7740:	40a00533          	neg	a0,a0
    7744:	00004797          	auipc	a5,0x4
    7748:	7507a783          	lw	a5,1872(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    774c:	00a7a023          	sw	a0,0(a5)
    7750:	fff00593          	li	a1,-1
    7754:	fff00513          	li	a0,-1

00007758 <.L1>:
    7758:	01010113          	addi	sp,sp,16
    775c:	00008067          	ret

00007760 <.L2>:
    7760:	41f55593          	srai	a1,a0,0x1f
    7764:	00b567b3          	or	a5,a0,a1
    7768:	fe0798e3          	bnez	a5,7758 <.L1>
    776c:	00812503          	lw	a0,8(sp)
    7770:	00c12583          	lw	a1,12(sp)
    7774:	fe5ff06f          	j	7758 <.L1>

00007778 <__GI_sigaction>:
    7778:	00800693          	li	a3,8
    777c:	0240006f          	j	77a0 <__syscall_rt_sigaction>

00007780 <__GI_raise>:
    7780:	fe010113          	addi	sp,sp,-32
    7784:	00112e23          	sw	ra,28(sp)
    7788:	00a12623          	sw	a0,12(sp)
    778c:	03c000ef          	jal	ra,77c8 <__GI_getpid>
    7790:	00c12583          	lw	a1,12(sp)
    7794:	01c12083          	lw	ra,28(sp)
    7798:	02010113          	addi	sp,sp,32
    779c:	0380006f          	j	77d4 <__GI_kill>

000077a0 <__syscall_rt_sigaction>:
    77a0:	08600893          	li	a7,134
    77a4:	00000073          	ecall
    77a8:	fffff7b7          	lui	a5,0xfffff
    77ac:	00a7fc63          	bgeu	a5,a0,77c4 <.L1>
    77b0:	40a00533          	neg	a0,a0
    77b4:	00004797          	auipc	a5,0x4
    77b8:	6e07a783          	lw	a5,1760(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    77bc:	00a7a023          	sw	a0,0(a5)
    77c0:	fff00513          	li	a0,-1

000077c4 <.L1>:
    77c4:	00008067          	ret

000077c8 <__GI_getpid>:
    77c8:	0ac00893          	li	a7,172
    77cc:	00000073          	ecall
    77d0:	00008067          	ret

000077d4 <__GI_kill>:
    77d4:	08100893          	li	a7,129
    77d8:	00000073          	ecall
    77dc:	fffff7b7          	lui	a5,0xfffff
    77e0:	00a7fc63          	bgeu	a5,a0,77f8 <.L1>
    77e4:	40a00533          	neg	a0,a0
    77e8:	00004797          	auipc	a5,0x4
    77ec:	6ac7a783          	lw	a5,1708(a5) # be94 <_GLOBAL_OFFSET_TABLE_+0xc>
    77f0:	00a7a023          	sw	a0,0(a5)
    77f4:	fff00513          	li	a0,-1

000077f8 <.L1>:
    77f8:	00008067          	ret

000077fc <__divtf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__divtf3 (TFtype a, TFtype b)
{
    77fc:	f5010113          	addi	sp,sp,-176
    7800:	09312e23          	sw	s3,156(sp)
    7804:	00c5a983          	lw	s3,12(a1)
    7808:	0045a783          	lw	a5,4(a1)
    780c:	0085a683          	lw	a3,8(a1)
    7810:	0a812423          	sw	s0,168(sp)
    7814:	00050413          	mv	s0,a0
    7818:	0005a503          	lw	a0,0(a1)

0000781c <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_Q (A, a);
    781c:	01099713          	slli	a4,s3,0x10
    7820:	000085b7          	lui	a1,0x8

00007824 <.LBE3>:
{
    7824:	0a912223          	sw	s1,164(sp)

00007828 <.LBB4>:
  FP_UNPACK_Q (A, a);
    7828:	01075713          	srli	a4,a4,0x10
    782c:	0109d493          	srli	s1,s3,0x10
    7830:	fff58593          	addi	a1,a1,-1 # 7fff <.LVL163+0x7>

00007834 <.LBE4>:
{
    7834:	0b212023          	sw	s2,160(sp)
    7838:	09412c23          	sw	s4,152(sp)
    783c:	00462903          	lw	s2,4(a2)
    7840:	00c62a03          	lw	s4,12(a2)
    7844:	09512a23          	sw	s5,148(sp)
    7848:	09612823          	sw	s6,144(sp)
    784c:	00862a83          	lw	s5,8(a2)
    7850:	00062b03          	lw	s6,0(a2)

00007854 <.LBB5>:
  FP_UNPACK_Q (A, a);
    7854:	07312623          	sw	s3,108(sp)

00007858 <.LBE5>:
{
    7858:	0a112623          	sw	ra,172(sp)
    785c:	09712623          	sw	s7,140(sp)
    7860:	09812423          	sw	s8,136(sp)
    7864:	09912223          	sw	s9,132(sp)
    7868:	09a12023          	sw	s10,128(sp)
    786c:	07b12e23          	sw	s11,124(sp)

00007870 <.LBB6>:
  FP_UNPACK_Q (A, a);
    7870:	06a12023          	sw	a0,96(sp)
    7874:	06f12223          	sw	a5,100(sp)
    7878:	06d12423          	sw	a3,104(sp)
    787c:	02a12823          	sw	a0,48(sp)
    7880:	02f12a23          	sw	a5,52(sp)
    7884:	02d12c23          	sw	a3,56(sp)
    7888:	02e12e23          	sw	a4,60(sp)
    788c:	00b4f633          	and	a2,s1,a1

00007890 <.LVL2>:
    7890:	01f9d993          	srli	s3,s3,0x1f

00007894 <.LBE6>:
    7894:	12060263          	beqz	a2,79b8 <.L2>
    7898:	26b60463          	beq	a2,a1,7b00 <.L3>
    789c:	000107b7          	lui	a5,0x10
    78a0:	00f76733          	or	a4,a4,a5
    78a4:	02e12e23          	sw	a4,60(sp)

000078a8 <.LBB7>:
    78a8:	03010593          	addi	a1,sp,48
    78ac:	03c10793          	addi	a5,sp,60

000078b0 <.L4>:
    78b0:	0007a703          	lw	a4,0(a5) # 10000 <_ebss+0x1b0>
    78b4:	ffc7a683          	lw	a3,-4(a5)
    78b8:	ffc78793          	addi	a5,a5,-4
    78bc:	00371713          	slli	a4,a4,0x3
    78c0:	01d6d693          	srli	a3,a3,0x1d
    78c4:	00d76733          	or	a4,a4,a3
    78c8:	00e7a223          	sw	a4,4(a5)
    78cc:	fef592e3          	bne	a1,a5,78b0 <.L4>

000078d0 <.LVL6>:
    78d0:	03012783          	lw	a5,48(sp)
    78d4:	00379793          	slli	a5,a5,0x3
    78d8:	02f12823          	sw	a5,48(sp)

000078dc <.LBE7>:
    78dc:	ffffc7b7          	lui	a5,0xffffc
    78e0:	00178793          	addi	a5,a5,1 # ffffc001 <_ebss+0xfffec1b1>
    78e4:	00f604b3          	add	s1,a2,a5

000078e8 <.L197>:
    78e8:	00000b93          	li	s7,0

000078ec <.L5>:
  FP_UNPACK_Q (B, b);
    78ec:	010a1513          	slli	a0,s4,0x10
    78f0:	00008737          	lui	a4,0x8
    78f4:	010a5793          	srli	a5,s4,0x10
    78f8:	01055513          	srli	a0,a0,0x10
    78fc:	fff70713          	addi	a4,a4,-1 # 7fff <.LVL163+0x7>
    7900:	07412623          	sw	s4,108(sp)
    7904:	07612023          	sw	s6,96(sp)
    7908:	07212223          	sw	s2,100(sp)
    790c:	07512423          	sw	s5,104(sp)
    7910:	05612023          	sw	s6,64(sp)
    7914:	05212223          	sw	s2,68(sp)
    7918:	05512423          	sw	s5,72(sp)
    791c:	04a12623          	sw	a0,76(sp)
    7920:	00e7f7b3          	and	a5,a5,a4

00007924 <.LVL9>:
    7924:	01fa5a13          	srli	s4,s4,0x1f

00007928 <.LBE13>:
    7928:	20078263          	beqz	a5,7b2c <.L18>
    792c:	34e78463          	beq	a5,a4,7c74 <.L19>
    7930:	00010737          	lui	a4,0x10
    7934:	00e56533          	or	a0,a0,a4
    7938:	04a12623          	sw	a0,76(sp)

0000793c <.LBB14>:
    793c:	04010593          	addi	a1,sp,64
    7940:	04c10713          	addi	a4,sp,76

00007944 <.L20>:
    7944:	00072683          	lw	a3,0(a4) # 10000 <_ebss+0x1b0>
    7948:	ffc72603          	lw	a2,-4(a4)
    794c:	ffc70713          	addi	a4,a4,-4
    7950:	00369693          	slli	a3,a3,0x3
    7954:	01d65613          	srli	a2,a2,0x1d
    7958:	00c6e6b3          	or	a3,a3,a2
    795c:	00d72223          	sw	a3,4(a4)
    7960:	fee592e3          	bne	a1,a4,7944 <.L20>

00007964 <.LVL13>:
    7964:	04012703          	lw	a4,64(sp)
    7968:	00371713          	slli	a4,a4,0x3
    796c:	04e12023          	sw	a4,64(sp)

00007970 <.LBE14>:
    7970:	ffffc737          	lui	a4,0xffffc
    7974:	00170713          	addi	a4,a4,1 # ffffc001 <_ebss+0xfffec1b1>
    7978:	00e787b3          	add	a5,a5,a4

0000797c <.L198>:
    797c:	00000713          	li	a4,0

00007980 <.L21>:
  FP_DIV_Q (R, A, B);
    7980:	40f48633          	sub	a2,s1,a5
    7984:	002b9793          	slli	a5,s7,0x2

00007988 <.LVL16>:
    7988:	00e7e7b3          	or	a5,a5,a4
    798c:	fff78793          	addi	a5,a5,-1
    7990:	00e00693          	li	a3,14
    7994:	0149c933          	xor	s2,s3,s4

00007998 <.LVL17>:
    7998:	30f6e263          	bltu	a3,a5,7c9c <.L34>
    799c:	00006697          	auipc	a3,0x6
    79a0:	b0868693          	addi	a3,a3,-1272 # d4a4 <.L36>
    79a4:	00279793          	slli	a5,a5,0x2
    79a8:	00d787b3          	add	a5,a5,a3
    79ac:	0007a783          	lw	a5,0(a5)
    79b0:	00d787b3          	add	a5,a5,a3
    79b4:	00078067          	jr	a5

000079b8 <.L2>:
  FP_UNPACK_Q (A, a);
    79b8:	00a7e633          	or	a2,a5,a0

000079bc <.LVL19>:
    79bc:	00d66633          	or	a2,a2,a3
    79c0:	00e66633          	or	a2,a2,a4
    79c4:	14060e63          	beqz	a2,7b20 <.L149>

000079c8 <.LBB20>:
    79c8:	04070e63          	beqz	a4,7a24 <.L6>
    79cc:	00070513          	mv	a0,a4
    79d0:	ee0fa0ef          	jal	ra,20b0 <__clzsi2>

000079d4 <.LBB9>:
    79d4:	ff450693          	addi	a3,a0,-12

000079d8 <.LVL21>:
    79d8:	02000593          	li	a1,32
    79dc:	40d585b3          	sub	a1,a1,a3

000079e0 <.LVL22>:
    79e0:	00000793          	li	a5,0

000079e4 <.L7>:
    79e4:	ffc00613          	li	a2,-4
    79e8:	02c78633          	mul	a2,a5,a2
    79ec:	03010313          	addi	t1,sp,48
    79f0:	00c60713          	addi	a4,a2,12
    79f4:	00e30733          	add	a4,t1,a4
    79f8:	40c00633          	neg	a2,a2

000079fc <.L12>:
    79fc:	0ee31063          	bne	t1,a4,7adc <.L15>
    7a00:	fff78713          	addi	a4,a5,-1

00007a04 <.LVL24>:
    7a04:	00279793          	slli	a5,a5,0x2
    7a08:	03010613          	addi	a2,sp,48
    7a0c:	04078793          	addi	a5,a5,64
    7a10:	00c787b3          	add	a5,a5,a2
    7a14:	03012603          	lw	a2,48(sp)
    7a18:	00d616b3          	sll	a3,a2,a3

00007a1c <.LVL25>:
    7a1c:	fcd7a023          	sw	a3,-64(a5)
    7a20:	07c0006f          	j	7a9c <.L14>

00007a24 <.L6>:
    7a24:	02068663          	beqz	a3,7a50 <.L8>
    7a28:	00068513          	mv	a0,a3
    7a2c:	e84fa0ef          	jal	ra,20b0 <__clzsi2>

00007a30 <.LVL27>:
    7a30:	02050513          	addi	a0,a0,32

00007a34 <.L9>:
    7a34:	ff450693          	addi	a3,a0,-12
    7a38:	4056d793          	srai	a5,a3,0x5

00007a3c <.LVL29>:
    7a3c:	01f6f693          	andi	a3,a3,31

00007a40 <.LVL30>:
    7a40:	02068863          	beqz	a3,7a70 <.L11>
    7a44:	02000593          	li	a1,32
    7a48:	40d585b3          	sub	a1,a1,a3

00007a4c <.LVL31>:
    7a4c:	f99ff06f          	j	79e4 <.L7>

00007a50 <.L8>:
    7a50:	00078a63          	beqz	a5,7a64 <.L10>
    7a54:	00078513          	mv	a0,a5
    7a58:	e58fa0ef          	jal	ra,20b0 <__clzsi2>

00007a5c <.LVL33>:
    7a5c:	04050513          	addi	a0,a0,64
    7a60:	fd5ff06f          	j	7a34 <.L9>

00007a64 <.L10>:
    7a64:	e4cfa0ef          	jal	ra,20b0 <__clzsi2>

00007a68 <.LVL36>:
    7a68:	06050513          	addi	a0,a0,96
    7a6c:	fc9ff06f          	j	7a34 <.L9>

00007a70 <.L11>:
    7a70:	ffc00613          	li	a2,-4
    7a74:	02c78633          	mul	a2,a5,a2
    7a78:	03c10713          	addi	a4,sp,60

00007a7c <.LBB11>:
    7a7c:	00300693          	li	a3,3

00007a80 <.L13>:
    7a80:	00c705b3          	add	a1,a4,a2
    7a84:	0005a583          	lw	a1,0(a1)
    7a88:	fff68693          	addi	a3,a3,-1

00007a8c <.LVL40>:
    7a8c:	ffc70713          	addi	a4,a4,-4
    7a90:	00b72223          	sw	a1,4(a4)

00007a94 <.LVL41>:
    7a94:	fef6d6e3          	bge	a3,a5,7a80 <.L13>
    7a98:	fff78713          	addi	a4,a5,-1

00007a9c <.L14>:
    7a9c:	00170793          	addi	a5,a4,1
    7aa0:	00279793          	slli	a5,a5,0x2
    7aa4:	00800693          	li	a3,8
    7aa8:	03010713          	addi	a4,sp,48
    7aac:	00d7ea63          	bltu	a5,a3,7ac0 <.L16>
    7ab0:	02012823          	sw	zero,48(sp)
    7ab4:	00072223          	sw	zero,4(a4)
    7ab8:	ff878793          	addi	a5,a5,-8
    7abc:	03810713          	addi	a4,sp,56

00007ac0 <.L16>:
    7ac0:	00400693          	li	a3,4
    7ac4:	00d7e463          	bltu	a5,a3,7acc <.L17>
    7ac8:	00072023          	sw	zero,0(a4)

00007acc <.L17>:
    7acc:	ffffc637          	lui	a2,0xffffc
    7ad0:	01160613          	addi	a2,a2,17 # ffffc011 <_ebss+0xfffec1c1>
    7ad4:	40a604b3          	sub	s1,a2,a0

00007ad8 <.LVL43>:
    7ad8:	e11ff06f          	j	78e8 <.L197>

00007adc <.L15>:
    7adc:	00072803          	lw	a6,0(a4)
    7ae0:	ffc72883          	lw	a7,-4(a4)
    7ae4:	00c70e33          	add	t3,a4,a2
    7ae8:	00d81833          	sll	a6,a6,a3
    7aec:	00b8d8b3          	srl	a7,a7,a1
    7af0:	01186833          	or	a6,a6,a7
    7af4:	010e2023          	sw	a6,0(t3)
    7af8:	ffc70713          	addi	a4,a4,-4
    7afc:	f01ff06f          	j	79fc <.L12>

00007b00 <.L3>:
    7b00:	00a7e7b3          	or	a5,a5,a0
    7b04:	00d7e7b3          	or	a5,a5,a3
    7b08:	00e7e7b3          	or	a5,a5,a4

00007b0c <.LBB21>:
    7b0c:	00060493          	mv	s1,a2

00007b10 <.LBE21>:
    7b10:	00200b93          	li	s7,2
    7b14:	dc078ce3          	beqz	a5,78ec <.L5>
    7b18:	00300b93          	li	s7,3
    7b1c:	dd1ff06f          	j	78ec <.L5>

00007b20 <.L149>:
    7b20:	00000493          	li	s1,0

00007b24 <.LBE22>:
    7b24:	00100b93          	li	s7,1
    7b28:	dc5ff06f          	j	78ec <.L5>

00007b2c <.L18>:
  FP_UNPACK_Q (B, b);
    7b2c:	016967b3          	or	a5,s2,s6

00007b30 <.LVL49>:
    7b30:	0157e7b3          	or	a5,a5,s5
    7b34:	00a7e7b3          	or	a5,a5,a0
    7b38:	14078c63          	beqz	a5,7c90 <.L151>

00007b3c <.LBB23>:
    7b3c:	04050c63          	beqz	a0,7b94 <.L22>
    7b40:	d70fa0ef          	jal	ra,20b0 <__clzsi2>

00007b44 <.LBB16>:
    7b44:	ff450693          	addi	a3,a0,-12

00007b48 <.LVL51>:
    7b48:	02000613          	li	a2,32
    7b4c:	40d60633          	sub	a2,a2,a3

00007b50 <.LVL52>:
    7b50:	00000793          	li	a5,0

00007b54 <.L23>:
    7b54:	ffc00593          	li	a1,-4
    7b58:	02b785b3          	mul	a1,a5,a1
    7b5c:	04010313          	addi	t1,sp,64
    7b60:	00c58713          	addi	a4,a1,12
    7b64:	00e30733          	add	a4,t1,a4
    7b68:	40b005b3          	neg	a1,a1

00007b6c <.L28>:
    7b6c:	0ee31263          	bne	t1,a4,7c50 <.L31>
    7b70:	fff78713          	addi	a4,a5,-1

00007b74 <.LVL54>:
    7b74:	00279793          	slli	a5,a5,0x2
    7b78:	03010613          	addi	a2,sp,48

00007b7c <.LVL55>:
    7b7c:	04078793          	addi	a5,a5,64
    7b80:	00c787b3          	add	a5,a5,a2
    7b84:	04012603          	lw	a2,64(sp)
    7b88:	00d616b3          	sll	a3,a2,a3

00007b8c <.LVL56>:
    7b8c:	fcd7a823          	sw	a3,-48(a5)
    7b90:	0800006f          	j	7c10 <.L30>

00007b94 <.L22>:
    7b94:	020a8663          	beqz	s5,7bc0 <.L24>
    7b98:	000a8513          	mv	a0,s5
    7b9c:	d14fa0ef          	jal	ra,20b0 <__clzsi2>

00007ba0 <.LVL58>:
    7ba0:	02050513          	addi	a0,a0,32

00007ba4 <.L25>:
    7ba4:	ff450693          	addi	a3,a0,-12
    7ba8:	4056d793          	srai	a5,a3,0x5

00007bac <.LVL60>:
    7bac:	01f6f693          	andi	a3,a3,31

00007bb0 <.LVL61>:
    7bb0:	02068a63          	beqz	a3,7be4 <.L27>
    7bb4:	02000613          	li	a2,32
    7bb8:	40d60633          	sub	a2,a2,a3

00007bbc <.LVL62>:
    7bbc:	f99ff06f          	j	7b54 <.L23>

00007bc0 <.L24>:
    7bc0:	00090a63          	beqz	s2,7bd4 <.L26>
    7bc4:	00090513          	mv	a0,s2
    7bc8:	ce8fa0ef          	jal	ra,20b0 <__clzsi2>

00007bcc <.LVL64>:
    7bcc:	04050513          	addi	a0,a0,64
    7bd0:	fd5ff06f          	j	7ba4 <.L25>

00007bd4 <.L26>:
    7bd4:	000b0513          	mv	a0,s6
    7bd8:	cd8fa0ef          	jal	ra,20b0 <__clzsi2>

00007bdc <.LVL67>:
    7bdc:	06050513          	addi	a0,a0,96
    7be0:	fc5ff06f          	j	7ba4 <.L25>

00007be4 <.L27>:
    7be4:	ffc00613          	li	a2,-4
    7be8:	02c78633          	mul	a2,a5,a2
    7bec:	04c10713          	addi	a4,sp,76

00007bf0 <.LBB18>:
    7bf0:	00300693          	li	a3,3

00007bf4 <.L29>:
    7bf4:	00c705b3          	add	a1,a4,a2
    7bf8:	0005a583          	lw	a1,0(a1)
    7bfc:	fff68693          	addi	a3,a3,-1

00007c00 <.LVL71>:
    7c00:	ffc70713          	addi	a4,a4,-4
    7c04:	00b72223          	sw	a1,4(a4)

00007c08 <.LVL72>:
    7c08:	fef6d6e3          	bge	a3,a5,7bf4 <.L29>
    7c0c:	fff78713          	addi	a4,a5,-1

00007c10 <.L30>:
    7c10:	00170793          	addi	a5,a4,1
    7c14:	00279793          	slli	a5,a5,0x2
    7c18:	00800693          	li	a3,8
    7c1c:	04010713          	addi	a4,sp,64
    7c20:	00d7ea63          	bltu	a5,a3,7c34 <.L32>
    7c24:	04012023          	sw	zero,64(sp)
    7c28:	00072223          	sw	zero,4(a4)
    7c2c:	ff878793          	addi	a5,a5,-8
    7c30:	04810713          	addi	a4,sp,72

00007c34 <.L32>:
    7c34:	00400693          	li	a3,4
    7c38:	00d7e463          	bltu	a5,a3,7c40 <.L33>
    7c3c:	00072023          	sw	zero,0(a4)

00007c40 <.L33>:
    7c40:	ffffc7b7          	lui	a5,0xffffc
    7c44:	01178793          	addi	a5,a5,17 # ffffc011 <_ebss+0xfffec1c1>
    7c48:	40a787b3          	sub	a5,a5,a0
    7c4c:	d31ff06f          	j	797c <.L198>

00007c50 <.L31>:
    7c50:	00072803          	lw	a6,0(a4)
    7c54:	ffc72883          	lw	a7,-4(a4)
    7c58:	00b70e33          	add	t3,a4,a1
    7c5c:	00d81833          	sll	a6,a6,a3
    7c60:	00c8d8b3          	srl	a7,a7,a2
    7c64:	01186833          	or	a6,a6,a7
    7c68:	010e2023          	sw	a6,0(t3)
    7c6c:	ffc70713          	addi	a4,a4,-4
    7c70:	efdff06f          	j	7b6c <.L28>

00007c74 <.L19>:
    7c74:	01696933          	or	s2,s2,s6
    7c78:	01596933          	or	s2,s2,s5
    7c7c:	00a96933          	or	s2,s2,a0
    7c80:	00200713          	li	a4,2
    7c84:	ce090ee3          	beqz	s2,7980 <.L21>
    7c88:	00300713          	li	a4,3
    7c8c:	cf5ff06f          	j	7980 <.L21>

00007c90 <.L151>:
    7c90:	00000793          	li	a5,0

00007c94 <.LBE24>:
    7c94:	00100713          	li	a4,1

00007c98 <.LVL77>:
    7c98:	ce9ff06f          	j	7980 <.L21>

00007c9c <.L34>:
  FP_DIV_Q (R, A, B);
    7c9c:	03c12503          	lw	a0,60(sp)
    7ca0:	04c12583          	lw	a1,76(sp)
    7ca4:	06012623          	sw	zero,108(sp)
    7ca8:	06012423          	sw	zero,104(sp)
    7cac:	06012223          	sw	zero,100(sp)
    7cb0:	06012023          	sw	zero,96(sp)
    7cb4:	03012783          	lw	a5,48(sp)
    7cb8:	03412703          	lw	a4,52(sp)

00007cbc <.LVL79>:
    7cbc:	04812683          	lw	a3,72(sp)
    7cc0:	02a5e463          	bltu	a1,a0,7ce8 <.L41>
    7cc4:	14b51e63          	bne	a0,a1,7e20 <.L42>
    7cc8:	03812583          	lw	a1,56(sp)
    7ccc:	00b6ee63          	bltu	a3,a1,7ce8 <.L41>
    7cd0:	14d59863          	bne	a1,a3,7e20 <.L42>
    7cd4:	04412683          	lw	a3,68(sp)
    7cd8:	00e6e863          	bltu	a3,a4,7ce8 <.L41>
    7cdc:	14e69263          	bne	a3,a4,7e20 <.L42>
    7ce0:	04012703          	lw	a4,64(sp)
    7ce4:	12e7ee63          	bltu	a5,a4,7e20 <.L42>

00007ce8 <.L41>:
    7ce8:	01f79793          	slli	a5,a5,0x1f
    7cec:	06f12623          	sw	a5,108(sp)

00007cf0 <.LBB26>:
    7cf0:	03c10593          	addi	a1,sp,60
    7cf4:	03010793          	addi	a5,sp,48

00007cf8 <.L43>:
    7cf8:	0007a703          	lw	a4,0(a5)
    7cfc:	0047a683          	lw	a3,4(a5)
    7d00:	00478793          	addi	a5,a5,4
    7d04:	00175713          	srli	a4,a4,0x1
    7d08:	01f69693          	slli	a3,a3,0x1f
    7d0c:	00d76733          	or	a4,a4,a3
    7d10:	fee7ae23          	sw	a4,-4(a5)
    7d14:	fef592e3          	bne	a1,a5,7cf8 <.L43>

00007d18 <.LVL82>:
    7d18:	03c12783          	lw	a5,60(sp)
    7d1c:	0017d793          	srli	a5,a5,0x1
    7d20:	02f12e23          	sw	a5,60(sp)

00007d24 <.L44>:
    7d24:	04010593          	addi	a1,sp,64
    7d28:	04c10793          	addi	a5,sp,76

00007d2c <.L45>:
    7d2c:	0007a703          	lw	a4,0(a5)
    7d30:	ffc7a683          	lw	a3,-4(a5)
    7d34:	ffc78793          	addi	a5,a5,-4
    7d38:	00c71713          	slli	a4,a4,0xc
    7d3c:	0146d693          	srli	a3,a3,0x14
    7d40:	00d76733          	or	a4,a4,a3
    7d44:	00e7a223          	sw	a4,4(a5)
    7d48:	fef592e3          	bne	a1,a5,7d2c <.L45>

00007d4c <.LBE27>:
    7d4c:	04c12283          	lw	t0,76(sp)

00007d50 <.LBB28>:
    7d50:	04012803          	lw	a6,64(sp)

00007d54 <.LBB29>:
    7d54:	00010f37          	lui	t5,0x10

00007d58 <.LBB30>:
    7d58:	04412883          	lw	a7,68(sp)

00007d5c <.LBB54>:
    7d5c:	ffff0f13          	addi	t5,t5,-1 # ffff <_ebss+0x1af>

00007d60 <.LBB55>:
    7d60:	00c81813          	slli	a6,a6,0xc

00007d64 <.LBB56>:
    7d64:	01e2f7b3          	and	a5,t0,t5

00007d68 <.LBB32>:
    7d68:	04812e83          	lw	t4,72(sp)

00007d6c <.LBB58>:
    7d6c:	00f12e23          	sw	a5,28(sp)

00007d70 <.LBB33>:
    7d70:	01085793          	srli	a5,a6,0x10
    7d74:	00f12423          	sw	a5,8(sp)

00007d78 <.LBB34>:
    7d78:	0108d793          	srli	a5,a7,0x10
    7d7c:	00f12623          	sw	a5,12(sp)
    7d80:	01e8f7b3          	and	a5,a7,t5
    7d84:	00f12a23          	sw	a5,20(sp)

00007d88 <.LBB35>:
    7d88:	010ed793          	srli	a5,t4,0x10
    7d8c:	00f12823          	sw	a5,16(sp)
    7d90:	01eef7b3          	and	a5,t4,t5
    7d94:	00f12c23          	sw	a5,24(sp)
    7d98:	01e877b3          	and	a5,a6,t5
    7d9c:	02f12023          	sw	a5,32(sp)
    7da0:	03812503          	lw	a0,56(sp)

00007da4 <.LBB60>:
    7da4:	410887b3          	sub	a5,a7,a6
    7da8:	03c12683          	lw	a3,60(sp)
    7dac:	03412583          	lw	a1,52(sp)
    7db0:	03012703          	lw	a4,48(sp)
    7db4:	02f12223          	sw	a5,36(sp)
    7db8:	411e87b3          	sub	a5,t4,a7

00007dbc <.LBB61>:
    7dbc:	0102dd13          	srli	s10,t0,0x10
    7dc0:	05010a13          	addi	s4,sp,80

00007dc4 <.LVL86>:
    7dc4:	06010c13          	addi	s8,sp,96

00007dc8 <.LBE61>:
    7dc8:	00300c93          	li	s9,3

00007dcc <.LBB62>:
    7dcc:	00010db7          	lui	s11,0x10

00007dd0 <.LBB63>:
    7dd0:	02f12423          	sw	a5,40(sp)

00007dd4 <.L116>:
    7dd4:	12d29a63          	bne	t0,a3,7f08 <.L46>
    7dd8:	fff00793          	li	a5,-1
    7ddc:	00fa2623          	sw	a5,12(s4) # 8000000c <_ebss+0x7fff01bc>
    7de0:	400c8663          	beqz	s9,81ec <.L117>

00007de4 <.LBB64>:
    7de4:	00cc2483          	lw	s1,12(s8)

00007de8 <.LVL88>:
    7de8:	40e807b3          	sub	a5,a6,a4
    7dec:	00f83e33          	sltu	t3,a6,a5
    7df0:	40b88333          	sub	t1,a7,a1
    7df4:	009039b3          	snez	s3,s1

00007df8 <.LVL89>:
    7df8:	000e0a93          	mv	s5,t3

00007dfc <.LVL90>:
    7dfc:	01c033b3          	snez	t2,t3

00007e00 <.LVL91>:
    7e00:	0068bfb3          	sltu	t6,a7,t1
    7e04:	02048263          	beqz	s1,7e28 <.L52>
    7e08:	02e81063          	bne	a6,a4,7e28 <.L52>

00007e0c <.LVL92>:
    7e0c:	fff30313          	addi	t1,t1,-1

00007e10 <.L53>:
    7e10:	40b883b3          	sub	t2,a7,a1
    7e14:	0013b393          	seqz	t2,t2
    7e18:	00100a93          	li	s5,1
    7e1c:	0180006f          	j	7e34 <.L54>

00007e20 <.L42>:
    7e20:	fff60613          	addi	a2,a2,-1
    7e24:	f01ff06f          	j	7d24 <.L44>

00007e28 <.L52>:
    7e28:	40730333          	sub	t1,t1,t2

00007e2c <.LVL97>:
    7e2c:	00000393          	li	t2,0

00007e30 <.LVL98>:
    7e30:	fe0e10e3          	bnez	t3,7e10 <.L53>

00007e34 <.L54>:
    7e34:	02412e03          	lw	t3,36(sp)

00007e38 <.LBB67>:
    7e38:	01f3e3b3          	or	t2,t2,t6

00007e3c <.LBB68>:
    7e3c:	02812f83          	lw	t6,40(sp)
    7e40:	00ee0733          	add	a4,t3,a4
    7e44:	009804b3          	add	s1,a6,s1

00007e48 <.LVL101>:
    7e48:	00bf8fb3          	add	t6,t6,a1
    7e4c:	01370733          	add	a4,a4,s3

00007e50 <.LVL102>:
    7e50:	00983e33          	sltu	t3,a6,s1
    7e54:	015f8fb3          	add	t6,t6,s5
    7e58:	00e8bb33          	sltu	s6,a7,a4

00007e5c <.LVL103>:
    7e5c:	41c70e33          	sub	t3,a4,t3

00007e60 <.LVL104>:
    7e60:	01feb5b3          	sltu	a1,t4,t6
    7e64:	00987e63          	bgeu	a6,s1,7e80 <.L55>

00007e68 <.LBB69>:
    7e68:	413787b3          	sub	a5,a5,s3

00007e6c <.LBB70>:
    7e6c:	01179a63          	bne	a5,a7,7e80 <.L55>

00007e70 <.LVL106>:
    7e70:	ffff8f93          	addi	t6,t6,-1

00007e74 <.L56>:
    7e74:	406e8333          	sub	t1,t4,t1

00007e78 <.LVL108>:
    7e78:	00133993          	seqz	s3,t1
    7e7c:	0100006f          	j	7e8c <.L57>

00007e80 <.L55>:
    7e80:	416f8fb3          	sub	t6,t6,s6

00007e84 <.LVL110>:
    7e84:	00000993          	li	s3,0

00007e88 <.LVL111>:
    7e88:	fee8e6e3          	bltu	a7,a4,7e74 <.L56>

00007e8c <.L57>:
    7e8c:	41d687b3          	sub	a5,a3,t4
    7e90:	00a787b3          	add	a5,a5,a0
    7e94:	007787b3          	add	a5,a5,t2
    7e98:	00b9e9b3          	or	s3,s3,a1

00007e9c <.LVL113>:
    7e9c:	413787b3          	sub	a5,a5,s3

00007ea0 <.LBE70>:
    7ea0:	04f6f463          	bgeu	a3,a5,7ee8 <.L58>
    7ea4:	011e0533          	add	a0,t3,a7
    7ea8:	009804b3          	add	s1,a6,s1

00007eac <.LVL114>:
    7eac:	01c535b3          	sltu	a1,a0,t3

00007eb0 <.LBB71>:
    7eb0:	0104be33          	sltu	t3,s1,a6

00007eb4 <.LVL115>:
    7eb4:	01c50e33          	add	t3,a0,t3

00007eb8 <.LBE71>:
    7eb8:	ffe00713          	li	a4,-2

00007ebc <.LBB72>:
    7ebc:	00ae3533          	sltu	a0,t3,a0

00007ec0 <.LBE72>:
    7ec0:	00ea2623          	sw	a4,12(s4)

00007ec4 <.LBB73>:
    7ec4:	00a5e5b3          	or	a1,a1,a0
    7ec8:	01fe8733          	add	a4,t4,t6

00007ecc <.LVL118>:
    7ecc:	00b705b3          	add	a1,a4,a1
    7ed0:	00058f93          	mv	t6,a1

00007ed4 <.LVL119>:
    7ed4:	01d735b3          	sltu	a1,a4,t4

00007ed8 <.LVL120>:
    7ed8:	00efb733          	sltu	a4,t6,a4

00007edc <.LVL121>:
    7edc:	00e5e5b3          	or	a1,a1,a4

00007ee0 <.LVL122>:
    7ee0:	00d786b3          	add	a3,a5,a3
    7ee4:	00d587b3          	add	a5,a1,a3

00007ee8 <.L58>:
    7ee8:	fffc8c93          	addi	s9,s9,-1
    7eec:	ffca0a13          	addi	s4,s4,-4
    7ef0:	ffcc0c13          	addi	s8,s8,-4
    7ef4:	000f8513          	mv	a0,t6
    7ef8:	000e0593          	mv	a1,t3
    7efc:	00048713          	mv	a4,s1
    7f00:	00078693          	mv	a3,a5
    7f04:	ed1ff06f          	j	7dd4 <.L116>

00007f08 <.L46>:
    7f08:	03a6d333          	divu	t1,a3,s10

00007f0c <.LVL126>:
    7f0c:	01c12783          	lw	a5,28(sp)
    7f10:	01055e13          	srli	t3,a0,0x10
    7f14:	03a6f6b3          	remu	a3,a3,s10

00007f18 <.LVL127>:
    7f18:	00030f93          	mv	t6,t1
    7f1c:	026787b3          	mul	a5,a5,t1

00007f20 <.LVL128>:
    7f20:	01069693          	slli	a3,a3,0x10

00007f24 <.LVL129>:
    7f24:	00de66b3          	or	a3,t3,a3

00007f28 <.LVL130>:
    7f28:	00f6fe63          	bgeu	a3,a5,7f44 <.L69>
    7f2c:	00d286b3          	add	a3,t0,a3

00007f30 <.LVL131>:
    7f30:	fff30f93          	addi	t6,t1,-1

00007f34 <.LVL132>:
    7f34:	0056e863          	bltu	a3,t0,7f44 <.L69>
    7f38:	00f6f663          	bgeu	a3,a5,7f44 <.L69>
    7f3c:	ffe30f93          	addi	t6,t1,-2
    7f40:	005686b3          	add	a3,a3,t0

00007f44 <.L69>:
    7f44:	40f686b3          	sub	a3,a3,a5

00007f48 <.LVL135>:
    7f48:	03a6d333          	divu	t1,a3,s10

00007f4c <.LVL136>:
    7f4c:	01c12783          	lw	a5,28(sp)

00007f50 <.LVL137>:
    7f50:	01e57533          	and	a0,a0,t5
    7f54:	03a6f6b3          	remu	a3,a3,s10

00007f58 <.LVL138>:
    7f58:	026787b3          	mul	a5,a5,t1

00007f5c <.LVL139>:
    7f5c:	01069693          	slli	a3,a3,0x10

00007f60 <.LVL140>:
    7f60:	00d56533          	or	a0,a0,a3

00007f64 <.LVL141>:
    7f64:	00030693          	mv	a3,t1
    7f68:	00f57e63          	bgeu	a0,a5,7f84 <.L72>
    7f6c:	00a28533          	add	a0,t0,a0

00007f70 <.LVL142>:
    7f70:	fff30693          	addi	a3,t1,-1

00007f74 <.LVL143>:
    7f74:	00556863          	bltu	a0,t0,7f84 <.L72>
    7f78:	00f57663          	bgeu	a0,a5,7f84 <.L72>
    7f7c:	ffe30693          	addi	a3,t1,-2
    7f80:	00550533          	add	a0,a0,t0

00007f84 <.L72>:
    7f84:	02012303          	lw	t1,32(sp)

00007f88 <.LBB76>:
    7f88:	010f9f93          	slli	t6,t6,0x10

00007f8c <.LVL146>:
    7f8c:	00dfefb3          	or	t6,t6,a3

00007f90 <.LBB37>:
    7f90:	010fd393          	srli	t2,t6,0x10
    7f94:	026384b3          	mul	s1,t2,t1

00007f98 <.LBB78>:
    7f98:	40f507b3          	sub	a5,a0,a5

00007f9c <.LBB38>:
    7f9c:	00812303          	lw	t1,8(sp)
    7fa0:	02012503          	lw	a0,32(sp)
    7fa4:	01eff6b3          	and	a3,t6,t5

00007fa8 <.LBB80>:
    7fa8:	01fa2623          	sw	t6,12(s4)

00007fac <.LBB39>:
    7fac:	02d50533          	mul	a0,a0,a3

00007fb0 <.LVL150>:
    7fb0:	02638e33          	mul	t3,t2,t1

00007fb4 <.LVL151>:
    7fb4:	01055993          	srli	s3,a0,0x10
    7fb8:	02d30333          	mul	t1,t1,a3

00007fbc <.LVL152>:
    7fbc:	00930333          	add	t1,t1,s1

00007fc0 <.LVL153>:
    7fc0:	00698333          	add	t1,s3,t1

00007fc4 <.LVL154>:
    7fc4:	00937463          	bgeu	t1,s1,7fcc <.L75>
    7fc8:	01be0e33          	add	t3,t3,s11

00007fcc <.L75>:
    7fcc:	01035493          	srli	s1,t1,0x10

00007fd0 <.LVL156>:
    7fd0:	01e37333          	and	t1,t1,t5

00007fd4 <.LVL157>:
    7fd4:	01e57533          	and	a0,a0,t5

00007fd8 <.LVL158>:
    7fd8:	01031313          	slli	t1,t1,0x10
    7fdc:	01c484b3          	add	s1,s1,t3

00007fe0 <.LVL159>:
    7fe0:	00a30333          	add	t1,t1,a0

00007fe4 <.LBB40>:
    7fe4:	00c12e03          	lw	t3,12(sp)

00007fe8 <.LVL161>:
    7fe8:	01412503          	lw	a0,20(sp)
    7fec:	03c38ab3          	mul	s5,t2,t3
    7ff0:	02d509b3          	mul	s3,a0,a3

00007ff4 <.LVL162>:
    7ff4:	02de0e33          	mul	t3,t3,a3

00007ff8 <.LVL163>:
    7ff8:	0109db13          	srli	s6,s3,0x10
    7ffc:	02a38533          	mul	a0,t2,a0

00008000 <.LVL164>:
    8000:	00ae0e33          	add	t3,t3,a0

00008004 <.LVL165>:
    8004:	01cb0e33          	add	t3,s6,t3

00008008 <.LVL166>:
    8008:	00ae7463          	bgeu	t3,a0,8010 <.L76>
    800c:	01ba8ab3          	add	s5,s5,s11

00008010 <.L76>:
    8010:	01ee7533          	and	a0,t3,t5
    8014:	01e9f9b3          	and	s3,s3,t5

00008018 <.LVL168>:
    8018:	01051513          	slli	a0,a0,0x10
    801c:	01350533          	add	a0,a0,s3
    8020:	00a48533          	add	a0,s1,a0

00008024 <.LBB43>:
    8024:	01812983          	lw	s3,24(sp)

00008028 <.LBB45>:
    8028:	009534b3          	sltu	s1,a0,s1

0000802c <.LBB46>:
    802c:	010e5e13          	srli	t3,t3,0x10

00008030 <.LBB47>:
    8030:	009e0e33          	add	t3,t3,s1
    8034:	015e0e33          	add	t3,t3,s5

00008038 <.LBB48>:
    8038:	03338ab3          	mul	s5,t2,s3

0000803c <.LVL173>:
    803c:	01012983          	lw	s3,16(sp)
    8040:	01812483          	lw	s1,24(sp)
    8044:	033389b3          	mul	s3,t2,s3
    8048:	01012383          	lw	t2,16(sp)

0000804c <.LVL174>:
    804c:	02d484b3          	mul	s1,s1,a3

00008050 <.LVL175>:
    8050:	02d386b3          	mul	a3,t2,a3

00008054 <.LVL176>:
    8054:	0104d393          	srli	t2,s1,0x10
    8058:	015686b3          	add	a3,a3,s5

0000805c <.LVL177>:
    805c:	00d386b3          	add	a3,t2,a3

00008060 <.LVL178>:
    8060:	0156f463          	bgeu	a3,s5,8068 <.L79>
    8064:	01b989b3          	add	s3,s3,s11

00008068 <.L79>:
    8068:	01e6f3b3          	and	t2,a3,t5
    806c:	01039393          	slli	t2,t2,0x10
    8070:	01e4f4b3          	and	s1,s1,t5

00008074 <.LVL180>:
    8074:	009383b3          	add	t2,t2,s1
    8078:	007e03b3          	add	t2,t3,t2

0000807c <.LBB51>:
    807c:	0106d693          	srli	a3,a3,0x10

00008080 <.LBB53>:
    8080:	01c3be33          	sltu	t3,t2,t3

00008084 <.LVL183>:
    8084:	01c686b3          	add	a3,a3,t3
    8088:	013686b3          	add	a3,a3,s3

0000808c <.LBE53>:
    808c:	00cc2983          	lw	s3,12(s8)

00008090 <.LVL185>:
    8090:	00d7ee63          	bltu	a5,a3,80ac <.L82>
    8094:	0ef69463          	bne	a3,a5,817c <.L83>
    8098:	0075ea63          	bltu	a1,t2,80ac <.L82>
    809c:	0e759063          	bne	a1,t2,817c <.L83>
    80a0:	00a76663          	bltu	a4,a0,80ac <.L82>
    80a4:	0ca71c63          	bne	a4,a0,817c <.L83>
    80a8:	0c69fa63          	bgeu	s3,t1,817c <.L83>

000080ac <.L82>:
    80ac:	ffff8e13          	addi	t3,t6,-1
    80b0:	01380ab3          	add	s5,a6,s3

000080b4 <.LVL186>:
    80b4:	00e88b33          	add	s6,a7,a4

000080b8 <.LVL187>:
    80b8:	01ca2623          	sw	t3,12(s4)

000080bc <.LBB82>:
    80bc:	010abe33          	sltu	t3,s5,a6
    80c0:	01cb04b3          	add	s1,s6,t3
    80c4:	03c12623          	sw	t3,44(sp)
    80c8:	011b3e33          	sltu	t3,s6,a7
    80cc:	0164bb33          	sltu	s6,s1,s6
    80d0:	00be8bb3          	add	s7,t4,a1
    80d4:	016e6e33          	or	t3,t3,s6
    80d8:	01cb8e33          	add	t3,s7,t3
    80dc:	01dbbb33          	sltu	s6,s7,t4
    80e0:	017e3bb3          	sltu	s7,t3,s7
    80e4:	017b6b33          	or	s6,s6,s7
    80e8:	005b0b33          	add	s6,s6,t0
    80ec:	016787b3          	add	a5,a5,s6

000080f0 <.LVL188>:
    80f0:	000a8993          	mv	s3,s5

000080f4 <.LVL189>:
    80f4:	00048713          	mv	a4,s1
    80f8:	000e0593          	mv	a1,t3

000080fc <.LBE82>:
    80fc:	02f2e063          	bltu	t0,a5,811c <.L94>
    8100:	06f29e63          	bne	t0,a5,817c <.L83>
    8104:	01ceec63          	bltu	t4,t3,811c <.L94>
    8108:	07ce9a63          	bne	t4,t3,817c <.L83>
    810c:	0098e863          	bltu	a7,s1,811c <.L94>
    8110:	06989663          	bne	a7,s1,817c <.L83>
    8114:	010abb33          	sltu	s6,s5,a6
    8118:	060b1263          	bnez	s6,817c <.L83>

0000811c <.L94>:
    811c:	00d7ee63          	bltu	a5,a3,8138 <.L95>
    8120:	04f69e63          	bne	a3,a5,817c <.L83>
    8124:	007e6a63          	bltu	t3,t2,8138 <.L95>
    8128:	047e1a63          	bne	t3,t2,817c <.L83>
    812c:	00a4e663          	bltu	s1,a0,8138 <.L95>
    8130:	04a49663          	bne	s1,a0,817c <.L83>
    8134:	046af463          	bgeu	s5,t1,817c <.L83>

00008138 <.L95>:
    8138:	01580ab3          	add	s5,a6,s5
    813c:	009884b3          	add	s1,a7,s1

00008140 <.LBB83>:
    8140:	010ab733          	sltu	a4,s5,a6
    8144:	00e48733          	add	a4,s1,a4
    8148:	0114b5b3          	sltu	a1,s1,a7
    814c:	009734b3          	sltu	s1,a4,s1
    8150:	01ce8e33          	add	t3,t4,t3
    8154:	0095e5b3          	or	a1,a1,s1

00008158 <.LBE83>:
    8158:	ffef8f93          	addi	t6,t6,-2

0000815c <.LVL191>:
    815c:	00be05b3          	add	a1,t3,a1
    8160:	01fa2623          	sw	t6,12(s4)

00008164 <.LBB84>:
    8164:	01de3fb3          	sltu	t6,t3,t4

00008168 <.LVL193>:
    8168:	01c5be33          	sltu	t3,a1,t3
    816c:	01cfefb3          	or	t6,t6,t3
    8170:	005f8fb3          	add	t6,t6,t0
    8174:	000a8993          	mv	s3,s5

00008178 <.LVL194>:
    8178:	01f787b3          	add	a5,a5,t6

0000817c <.L83>:
    817c:	40698ab3          	sub	s5,s3,t1
    8180:	40a70e33          	sub	t3,a4,a0
    8184:	0159bbb3          	sltu	s7,s3,s5
    8188:	01c73b33          	sltu	s6,a4,t3
    818c:	417e0e33          	sub	t3,t3,s7
    8190:	40758bb3          	sub	s7,a1,t2
    8194:	000a8493          	mv	s1,s5

00008198 <.LVL196>:
    8198:	000b0f93          	mv	t6,s6

0000819c <.LVL197>:
    819c:	0175b5b3          	sltu	a1,a1,s7

000081a0 <.LVL198>:
    81a0:	0159fa63          	bgeu	s3,s5,81b4 <.L112>
    81a4:	00a71863          	bne	a4,a0,81b4 <.L112>

000081a8 <.LVL199>:
    81a8:	fffb8f93          	addi	t6,s7,-1 # ffff <_ebss+0x1af>

000081ac <.L113>:
    81ac:	001bb713          	seqz	a4,s7
    81b0:	0100006f          	j	81c0 <.L114>

000081b4 <.L112>:
    81b4:	41fb8fb3          	sub	t6,s7,t6

000081b8 <.LVL202>:
    81b8:	00000713          	li	a4,0

000081bc <.LVL203>:
    81bc:	fe0b18e3          	bnez	s6,81ac <.L113>

000081c0 <.L114>:
    81c0:	40d787b3          	sub	a5,a5,a3

000081c4 <.LVL205>:
    81c4:	00b76733          	or	a4,a4,a1

000081c8 <.LVL206>:
    81c8:	40e787b3          	sub	a5,a5,a4

000081cc <.LBE85>:
    81cc:	d00c9ee3          	bnez	s9,7ee8 <.L58>
    81d0:	01531863          	bne	t1,s5,81e0 <.L115>
    81d4:	00ae1663          	bne	t3,a0,81e0 <.L115>
    81d8:	01f39463          	bne	t2,t6,81e0 <.L115>
    81dc:	00f68863          	beq	a3,a5,81ec <.L117>

000081e0 <.L115>:
    81e0:	05012783          	lw	a5,80(sp)
    81e4:	0017e793          	ori	a5,a5,1
    81e8:	04f12823          	sw	a5,80(sp)

000081ec <.L117>:
  FP_PACK_Q (r, R);
    81ec:	000047b7          	lui	a5,0x4
    81f0:	fff78793          	addi	a5,a5,-1 # 3fff <.L6+0xb>
    81f4:	00f607b3          	add	a5,a2,a5

000081f8 <.LVL208>:
    81f8:	1cf05263          	blez	a5,83bc <.L119>
    81fc:	05012703          	lw	a4,80(sp)
    8200:	00777693          	andi	a3,a4,7
    8204:	04068463          	beqz	a3,824c <.L120>
    8208:	00f77693          	andi	a3,a4,15
    820c:	00400593          	li	a1,4
    8210:	02b68e63          	beq	a3,a1,824c <.L120>

00008214 <.LBB87>:
    8214:	00470713          	addi	a4,a4,4
    8218:	00473693          	sltiu	a3,a4,4
    821c:	04e12823          	sw	a4,80(sp)

00008220 <.LVL209>:
    8220:	05412703          	lw	a4,84(sp)

00008224 <.LVL210>:
    8224:	00e68733          	add	a4,a3,a4
    8228:	04e12a23          	sw	a4,84(sp)

0000822c <.LVL211>:
    822c:	00d73733          	sltu	a4,a4,a3

00008230 <.LVL212>:
    8230:	05812683          	lw	a3,88(sp)
    8234:	00e68733          	add	a4,a3,a4

00008238 <.LVL213>:
    8238:	04e12c23          	sw	a4,88(sp)

0000823c <.LVL214>:
    823c:	00d73733          	sltu	a4,a4,a3

00008240 <.LVL215>:
    8240:	05c12683          	lw	a3,92(sp)
    8244:	00d70733          	add	a4,a4,a3

00008248 <.LVL216>:
    8248:	04e12e23          	sw	a4,92(sp)

0000824c <.L120>:
    824c:	05c12703          	lw	a4,92(sp)
    8250:	001006b7          	lui	a3,0x100
    8254:	00d776b3          	and	a3,a4,a3
    8258:	00068e63          	beqz	a3,8274 <.L125>
    825c:	fff007b7          	lui	a5,0xfff00

00008260 <.LVL218>:
    8260:	fff78793          	addi	a5,a5,-1 # ffefffff <_ebss+0xffef01af>
    8264:	00f77733          	and	a4,a4,a5
    8268:	000047b7          	lui	a5,0x4

0000826c <.LVL219>:
    826c:	04e12e23          	sw	a4,92(sp)
    8270:	00f607b3          	add	a5,a2,a5

00008274 <.L125>:
    8274:	05010713          	addi	a4,sp,80
    8278:	05c10593          	addi	a1,sp,92

0000827c <.L126>:
    827c:	00072683          	lw	a3,0(a4)
    8280:	00472603          	lw	a2,4(a4)
    8284:	00470713          	addi	a4,a4,4
    8288:	0036d693          	srli	a3,a3,0x3
    828c:	01d61613          	slli	a2,a2,0x1d
    8290:	00c6e6b3          	or	a3,a3,a2
    8294:	fed72e23          	sw	a3,-4(a4)
    8298:	feb712e3          	bne	a4,a1,827c <.L126>

0000829c <.LBE88>:
    829c:	000086b7          	lui	a3,0x8
    82a0:	ffe68613          	addi	a2,a3,-2 # 7ffe <.LVL163+0x6>

000082a4 <.LBB89>:
    82a4:	05c12703          	lw	a4,92(sp)

000082a8 <.LBE89>:
    82a8:	0ef64e63          	blt	a2,a5,83a4 <.L127>

000082ac <.LBB90>:
    82ac:	00375713          	srli	a4,a4,0x3
    82b0:	04e12e23          	sw	a4,92(sp)

000082b4 <.L128>:
    82b4:	00f91913          	slli	s2,s2,0xf

000082b8 <.LVL224>:
    82b8:	00f96933          	or	s2,s2,a5

000082bc <.LBE91>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    82bc:	05012783          	lw	a5,80(sp)

000082c0 <.LBB92>:
  FP_PACK_Q (r, R);
    82c0:	05c12703          	lw	a4,92(sp)
    82c4:	07211723          	sh	s2,110(sp)

000082c8 <.LBE92>:
  return r;
    82c8:	00f42023          	sw	a5,0(s0)
    82cc:	05412783          	lw	a5,84(sp)

000082d0 <.LBB93>:
  FP_PACK_Q (r, R);
    82d0:	06e11623          	sh	a4,108(sp)

000082d4 <.LBE93>:
}
    82d4:	0ac12083          	lw	ra,172(sp)
  return r;
    82d8:	00f42223          	sw	a5,4(s0)
    82dc:	05812783          	lw	a5,88(sp)

000082e0 <.LVL227>:
}
    82e0:	00040513          	mv	a0,s0
    82e4:	0a412483          	lw	s1,164(sp)
  return r;
    82e8:	00f42423          	sw	a5,8(s0)
    82ec:	06c12783          	lw	a5,108(sp)
}
    82f0:	0a012903          	lw	s2,160(sp)
    82f4:	09c12983          	lw	s3,156(sp)
  return r;
    82f8:	00f42623          	sw	a5,12(s0)
}
    82fc:	0a812403          	lw	s0,168(sp)
    8300:	09812a03          	lw	s4,152(sp)
    8304:	09412a83          	lw	s5,148(sp)
    8308:	09012b03          	lw	s6,144(sp)
    830c:	08c12b83          	lw	s7,140(sp)
    8310:	08812c03          	lw	s8,136(sp)
    8314:	08412c83          	lw	s9,132(sp)
    8318:	08012d03          	lw	s10,128(sp)
    831c:	07c12d83          	lw	s11,124(sp)
    8320:	0b010113          	addi	sp,sp,176

00008324 <.LVL229>:
    8324:	00008067          	ret

00008328 <.L37>:
  FP_DIV_Q (R, A, B);
    8328:	03012783          	lw	a5,48(sp)

0000832c <.LBB94>:
  FP_UNPACK_Q (A, a);
    832c:	00098913          	mv	s2,s3

00008330 <.LBE94>:
  FP_DIV_Q (R, A, B);
    8330:	04f12823          	sw	a5,80(sp)
    8334:	03412783          	lw	a5,52(sp)
    8338:	04f12a23          	sw	a5,84(sp)
    833c:	03812783          	lw	a5,56(sp)
    8340:	04f12c23          	sw	a5,88(sp)
    8344:	03c12783          	lw	a5,60(sp)

00008348 <.L118>:
    8348:	04f12e23          	sw	a5,92(sp)

0000834c <.LVL233>:
  FP_PACK_Q (r, R);
    834c:	00100793          	li	a5,1
    8350:	26fb8c63          	beq	s7,a5,85c8 <.L199>
    8354:	e80b8ce3          	beqz	s7,81ec <.L117>
    8358:	00200793          	li	a5,2
    835c:	28fb9063          	bne	s7,a5,85dc <.L35>

00008360 <.L39>:
    8360:	000087b7          	lui	a5,0x8
    8364:	04012e23          	sw	zero,92(sp)
    8368:	04012c23          	sw	zero,88(sp)
    836c:	04012a23          	sw	zero,84(sp)
    8370:	04012823          	sw	zero,80(sp)
    8374:	fff78793          	addi	a5,a5,-1 # 7fff <.LVL163+0x7>
    8378:	f3dff06f          	j	82b4 <.L128>

0000837c <.L38>:
  FP_DIV_Q (R, A, B);
    837c:	04012783          	lw	a5,64(sp)

00008380 <.LBB95>:
  FP_UNPACK_Q (B, b);
    8380:	000a0913          	mv	s2,s4

00008384 <.LBE95>:
  FP_DIV_Q (R, A, B);
    8384:	00070b93          	mv	s7,a4

00008388 <.LVL237>:
    8388:	04f12823          	sw	a5,80(sp)
    838c:	04412783          	lw	a5,68(sp)
    8390:	04f12a23          	sw	a5,84(sp)
    8394:	04812783          	lw	a5,72(sp)
    8398:	04f12c23          	sw	a5,88(sp)
    839c:	04c12783          	lw	a5,76(sp)

000083a0 <.LVL238>:
    83a0:	fa9ff06f          	j	8348 <.L118>

000083a4 <.L127>:
  FP_PACK_Q (r, R);
    83a4:	04012e23          	sw	zero,92(sp)
    83a8:	04012c23          	sw	zero,88(sp)
    83ac:	04012a23          	sw	zero,84(sp)
    83b0:	04012823          	sw	zero,80(sp)
    83b4:	fff68793          	addi	a5,a3,-1
    83b8:	efdff06f          	j	82b4 <.L128>

000083bc <.L119>:
    83bc:	00100693          	li	a3,1
    83c0:	00078863          	beqz	a5,83d0 <.L129>
    83c4:	40f686b3          	sub	a3,a3,a5

000083c8 <.LVL241>:
    83c8:	07400793          	li	a5,116
    83cc:	1cd7ce63          	blt	a5,a3,85a8 <.L130>

000083d0 <.L129>:
    83d0:	05010513          	addi	a0,sp,80
    83d4:	4056d713          	srai	a4,a3,0x5

000083d8 <.LVL243>:
    83d8:	00050593          	mv	a1,a0
    83dc:	01f6f693          	andi	a3,a3,31

000083e0 <.LVL244>:
    83e0:	00000793          	li	a5,0
    83e4:	00000613          	li	a2,0

000083e8 <.L131>:
    83e8:	02e61e63          	bne	a2,a4,8424 <.L132>
    83ec:	00300613          	li	a2,3

000083f0 <.LVL246>:
    83f0:	40e60633          	sub	a2,a2,a4
    83f4:	00271593          	slli	a1,a4,0x2
    83f8:	04069063          	bnez	a3,8438 <.L133>
    83fc:	00050813          	mv	a6,a0

00008400 <.L134>:
    8400:	00b808b3          	add	a7,a6,a1
    8404:	0008a883          	lw	a7,0(a7)
    8408:	00168693          	addi	a3,a3,1

0000840c <.LVL248>:
    840c:	00480813          	addi	a6,a6,4
    8410:	ff182e23          	sw	a7,-4(a6)

00008414 <.LVL249>:
    8414:	fed656e3          	bge	a2,a3,8400 <.L134>
    8418:	00400693          	li	a3,4

0000841c <.LVL250>:
    841c:	40e68733          	sub	a4,a3,a4

00008420 <.LVL251>:
    8420:	06c0006f          	j	848c <.L138>

00008424 <.L132>:
    8424:	0005a803          	lw	a6,0(a1)
    8428:	00160613          	addi	a2,a2,1

0000842c <.LVL253>:
    842c:	00458593          	addi	a1,a1,4
    8430:	0107e7b3          	or	a5,a5,a6

00008434 <.LVL254>:
    8434:	fb5ff06f          	j	83e8 <.L131>

00008438 <.L133>:
    8438:	04058813          	addi	a6,a1,64
    843c:	03010893          	addi	a7,sp,48
    8440:	01180833          	add	a6,a6,a7
    8444:	fe082803          	lw	a6,-32(a6)
    8448:	02000313          	li	t1,32
    844c:	40d30333          	sub	t1,t1,a3
    8450:	00681833          	sll	a6,a6,t1
    8454:	0107e7b3          	or	a5,a5,a6

00008458 <.LVL256>:
    8458:	00000e13          	li	t3,0
    845c:	00b50833          	add	a6,a0,a1
    8460:	40b005b3          	neg	a1,a1

00008464 <.L136>:
    8464:	0ece4263          	blt	t3,a2,8548 <.L137>
    8468:	00400593          	li	a1,4
    846c:	00261613          	slli	a2,a2,0x2
    8470:	40e58733          	sub	a4,a1,a4

00008474 <.LVL258>:
    8474:	04060613          	addi	a2,a2,64
    8478:	03010593          	addi	a1,sp,48
    847c:	00b60633          	add	a2,a2,a1
    8480:	05c12583          	lw	a1,92(sp)
    8484:	00d5d6b3          	srl	a3,a1,a3

00008488 <.LVL259>:
    8488:	fed62023          	sw	a3,-32(a2)

0000848c <.L138>:
    848c:	00400693          	li	a3,4
    8490:	40e686b3          	sub	a3,a3,a4
    8494:	00269693          	slli	a3,a3,0x2
    8498:	00271713          	slli	a4,a4,0x2
    849c:	00800613          	li	a2,8
    84a0:	00e50733          	add	a4,a0,a4
    84a4:	00c6ea63          	bltu	a3,a2,84b8 <.L139>
    84a8:	00072023          	sw	zero,0(a4)
    84ac:	00072223          	sw	zero,4(a4)
    84b0:	ff868693          	addi	a3,a3,-8
    84b4:	00870713          	addi	a4,a4,8

000084b8 <.L139>:
    84b8:	00400613          	li	a2,4
    84bc:	00c6e463          	bltu	a3,a2,84c4 <.L140>
    84c0:	00072023          	sw	zero,0(a4)

000084c4 <.L140>:
    84c4:	05012703          	lw	a4,80(sp)

000084c8 <.LBB99>:
    84c8:	00f037b3          	snez	a5,a5

000084cc <.LBE99>:
    84cc:	00e7e7b3          	or	a5,a5,a4
    84d0:	04f12823          	sw	a5,80(sp)

000084d4 <.LBE97>:
    84d4:	0077f713          	andi	a4,a5,7
    84d8:	04070463          	beqz	a4,8520 <.L141>
    84dc:	00f7f713          	andi	a4,a5,15
    84e0:	00400693          	li	a3,4
    84e4:	02d70e63          	beq	a4,a3,8520 <.L141>

000084e8 <.LBB101>:
    84e8:	05412703          	lw	a4,84(sp)
    84ec:	00478793          	addi	a5,a5,4
    84f0:	04f12823          	sw	a5,80(sp)

000084f4 <.LVL262>:
    84f4:	0047b793          	sltiu	a5,a5,4

000084f8 <.LVL263>:
    84f8:	00f707b3          	add	a5,a4,a5
    84fc:	04f12a23          	sw	a5,84(sp)

00008500 <.LVL264>:
    8500:	00e7b7b3          	sltu	a5,a5,a4

00008504 <.LVL265>:
    8504:	05812703          	lw	a4,88(sp)
    8508:	00f707b3          	add	a5,a4,a5

0000850c <.LVL266>:
    850c:	04f12c23          	sw	a5,88(sp)

00008510 <.LVL267>:
    8510:	00e7b7b3          	sltu	a5,a5,a4

00008514 <.LVL268>:
    8514:	05c12703          	lw	a4,92(sp)
    8518:	00e787b3          	add	a5,a5,a4

0000851c <.LVL269>:
    851c:	04f12e23          	sw	a5,92(sp)

00008520 <.L141>:
    8520:	05c12703          	lw	a4,92(sp)
    8524:	000807b7          	lui	a5,0x80
    8528:	00e7f7b3          	and	a5,a5,a4
    852c:	04078263          	beqz	a5,8570 <.L146>

00008530 <.LVL271>:
    8530:	04012e23          	sw	zero,92(sp)
    8534:	04012c23          	sw	zero,88(sp)
    8538:	04012a23          	sw	zero,84(sp)
    853c:	04012823          	sw	zero,80(sp)
    8540:	00100793          	li	a5,1
    8544:	d71ff06f          	j	82b4 <.L128>

00008548 <.L137>:
    8548:	00082883          	lw	a7,0(a6)
    854c:	00482e83          	lw	t4,4(a6)
    8550:	00b80f33          	add	t5,a6,a1
    8554:	00d8d8b3          	srl	a7,a7,a3
    8558:	006e9eb3          	sll	t4,t4,t1
    855c:	01d8e8b3          	or	a7,a7,t4
    8560:	011f2023          	sw	a7,0(t5)

00008564 <.LVL273>:
    8564:	001e0e13          	addi	t3,t3,1

00008568 <.LVL274>:
    8568:	00480813          	addi	a6,a6,4
    856c:	ef9ff06f          	j	8464 <.L136>

00008570 <.L146>:
    8570:	00c50693          	addi	a3,a0,12

00008574 <.L147>:
    8574:	00052783          	lw	a5,0(a0)
    8578:	00452703          	lw	a4,4(a0)
    857c:	00450513          	addi	a0,a0,4
    8580:	0037d793          	srli	a5,a5,0x3
    8584:	01d71713          	slli	a4,a4,0x1d
    8588:	00e7e7b3          	or	a5,a5,a4
    858c:	fef52e23          	sw	a5,-4(a0)
    8590:	fea692e3          	bne	a3,a0,8574 <.L147>

00008594 <.LVL276>:
    8594:	05c12783          	lw	a5,92(sp)
    8598:	0037d793          	srli	a5,a5,0x3
    859c:	04f12e23          	sw	a5,92(sp)

000085a0 <.L148>:
    85a0:	00000793          	li	a5,0
    85a4:	d11ff06f          	j	82b4 <.L128>

000085a8 <.L130>:
    85a8:	05412703          	lw	a4,84(sp)
    85ac:	05012783          	lw	a5,80(sp)
    85b0:	00e7e7b3          	or	a5,a5,a4
    85b4:	05812703          	lw	a4,88(sp)
    85b8:	00e7e7b3          	or	a5,a5,a4
    85bc:	05c12703          	lw	a4,92(sp)
    85c0:	00e7e7b3          	or	a5,a5,a4
    85c4:	fc078ee3          	beqz	a5,85a0 <.L148>

000085c8 <.L199>:
    85c8:	04012e23          	sw	zero,92(sp)
    85cc:	04012c23          	sw	zero,88(sp)
    85d0:	04012a23          	sw	zero,84(sp)

000085d4 <.LBB104>:
    85d4:	04012823          	sw	zero,80(sp)
    85d8:	fc9ff06f          	j	85a0 <.L148>

000085dc <.L35>:
    85dc:	000087b7          	lui	a5,0x8
    85e0:	04f12e23          	sw	a5,92(sp)
    85e4:	04012c23          	sw	zero,88(sp)
    85e8:	04012a23          	sw	zero,84(sp)
    85ec:	04012823          	sw	zero,80(sp)

000085f0 <.LVL282>:
    85f0:	fff78793          	addi	a5,a5,-1 # 7fff <.LVL163+0x7>
    85f4:	00000913          	li	s2,0
    85f8:	cbdff06f          	j	82b4 <.L128>

000085fc <__eqtf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__eqtf2 (TFtype a, TFtype b)
{
    85fc:	00c52703          	lw	a4,12(a0)
    8600:	00c5a603          	lw	a2,12(a1)
    8604:	0005a283          	lw	t0,0(a1)
    8608:	0045af83          	lw	t6,4(a1)
    860c:	0085af03          	lw	t5,8(a1)

00008610 <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    8610:	000085b7          	lui	a1,0x8
    8614:	01075813          	srli	a6,a4,0x10
    8618:	fff58593          	addi	a1,a1,-1 # 7fff <.LVL163+0x7>
    861c:	01071893          	slli	a7,a4,0x10

00008620 <.LBB4>:
  FP_UNPACK_RAW_Q (B, b);
    8620:	01061e93          	slli	t4,a2,0x10
    8624:	01065693          	srli	a3,a2,0x10

00008628 <.LBB5>:
  FP_UNPACK_RAW_Q (A, a);
    8628:	00b87833          	and	a6,a6,a1

0000862c <.LBE5>:
{
    862c:	00052783          	lw	a5,0(a0)

00008630 <.LBB6>:
    8630:	00452e03          	lw	t3,4(a0)

00008634 <.LBB7>:
    8634:	00852303          	lw	t1,8(a0)

00008638 <.LBB8>:
    8638:	ff010113          	addi	sp,sp,-16

0000863c <.LBB9>:
  FP_UNPACK_RAW_Q (A, a);
    863c:	0108d893          	srli	a7,a7,0x10

00008640 <.LVL4>:
    8640:	01f75713          	srli	a4,a4,0x1f

00008644 <.LBB10>:
  FP_UNPACK_RAW_Q (B, b);
    8644:	010ede93          	srli	t4,t4,0x10

00008648 <.LVL6>:
    8648:	00b6f6b3          	and	a3,a3,a1
    864c:	01f65613          	srli	a2,a2,0x1f

00008650 <.LBE10>:
  FP_CMP_EQ_Q (r, A, B, 1);
    8650:	00100513          	li	a0,1
    8654:	00b80863          	beq	a6,a1,8664 <.L2>
    8658:	02b69e63          	bne	a3,a1,8694 <.L15>

0000865c <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    865c:	01010113          	addi	sp,sp,16
    8660:	00008067          	ret

00008664 <.L2>:
  FP_CMP_EQ_Q (r, A, B, 1);
    8664:	ff069ce3          	bne	a3,a6,865c <.L1>
    8668:	01c7e7b3          	or	a5,a5,t3

0000866c <.LVL11>:
    866c:	0067e7b3          	or	a5,a5,t1
    8670:	0117e7b3          	or	a5,a5,a7
    8674:	0057e7b3          	or	a5,a5,t0
    8678:	01f7e7b3          	or	a5,a5,t6
    867c:	01e7e7b3          	or	a5,a5,t5
    8680:	01d7e7b3          	or	a5,a5,t4
    8684:	fc079ce3          	bnez	a5,865c <.L1>
    8688:	40c70733          	sub	a4,a4,a2

0000868c <.LVL12>:
    868c:	00e03533          	snez	a0,a4
    8690:	fcdff06f          	j	865c <.L1>

00008694 <.L15>:
    8694:	00100513          	li	a0,1
    8698:	fd0692e3          	bne	a3,a6,865c <.L1>
    869c:	fc5790e3          	bne	a5,t0,865c <.L1>
    86a0:	fbfe1ee3          	bne	t3,t6,865c <.L1>
    86a4:	fbe31ce3          	bne	t1,t5,865c <.L1>
    86a8:	fbd89ae3          	bne	a7,t4,865c <.L1>
    86ac:	00c70e63          	beq	a4,a2,86c8 <.L13>
    86b0:	fa0696e3          	bnez	a3,865c <.L1>
    86b4:	01c7e533          	or	a0,a5,t3
    86b8:	00656533          	or	a0,a0,t1
    86bc:	01156533          	or	a0,a0,a7
    86c0:	00a03533          	snez	a0,a0
    86c4:	f99ff06f          	j	865c <.L1>

000086c8 <.L13>:
    86c8:	00000513          	li	a0,0
    86cc:	f91ff06f          	j	865c <.L1>

000086d0 <__getf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__getf2 (TFtype a, TFtype b)
{
    86d0:	00052883          	lw	a7,0(a0)

000086d4 <.LBB3>:
    86d4:	00452303          	lw	t1,4(a0)

000086d8 <.LBB4>:
    86d8:	00852e03          	lw	t3,8(a0)

000086dc <.LBB5>:
    86dc:	00c52503          	lw	a0,12(a0)
    86e0:	00c5a803          	lw	a6,12(a1)

000086e4 <.LBB6>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    86e4:	00008737          	lui	a4,0x8
    86e8:	01055693          	srli	a3,a0,0x10
    86ec:	fff70713          	addi	a4,a4,-1 # 7fff <.LVL163+0x7>
    86f0:	01051613          	slli	a2,a0,0x10

000086f4 <.LBB7>:
  FP_UNPACK_RAW_Q (B, b);
    86f4:	01081f13          	slli	t5,a6,0x10

000086f8 <.LBE7>:
{
    86f8:	0005a783          	lw	a5,0(a1)
    86fc:	0045af83          	lw	t6,4(a1)
    8700:	0085ae83          	lw	t4,8(a1)

00008704 <.LBB8>:
  FP_UNPACK_RAW_Q (A, a);
    8704:	00e6f6b3          	and	a3,a3,a4
    8708:	01f55593          	srli	a1,a0,0x1f

0000870c <.LBB9>:
  FP_UNPACK_RAW_Q (B, b);
    870c:	01085513          	srli	a0,a6,0x10

00008710 <.LBE9>:
{
    8710:	ff010113          	addi	sp,sp,-16

00008714 <.LBB10>:
  FP_UNPACK_RAW_Q (A, a);
    8714:	01065613          	srli	a2,a2,0x10

00008718 <.LBB11>:
  FP_UNPACK_RAW_Q (B, b);
    8718:	010f5f13          	srli	t5,t5,0x10

0000871c <.LVL5>:
    871c:	00e57533          	and	a0,a0,a4

00008720 <.LVL6>:
    8720:	01f85813          	srli	a6,a6,0x1f

00008724 <.LBE11>:
  FP_CMP_Q (r, A, B, -2, 2);
    8724:	04e69663          	bne	a3,a4,8770 <.L2>
    8728:	011368b3          	or	a7,t1,a7

0000872c <.LVL8>:
    872c:	01c8e8b3          	or	a7,a7,t3
    8730:	00c8e8b3          	or	a7,a7,a2
    8734:	0e089c63          	bnez	a7,882c <.L26>
    8738:	00d50a63          	beq	a0,a3,874c <.L4>

0000873c <.L21>:
    873c:	00100513          	li	a0,1
    8740:	02058463          	beqz	a1,8768 <.L1>
    8744:	fff00513          	li	a0,-1
    8748:	0200006f          	j	8768 <.L1>

0000874c <.L4>:
    874c:	01f7e7b3          	or	a5,a5,t6

00008750 <.LVL11>:
    8750:	01d7e7b3          	or	a5,a5,t4
    8754:	01e7e7b3          	or	a5,a5,t5
    8758:	ffe00513          	li	a0,-2

0000875c <.LVL12>:
    875c:	00079663          	bnez	a5,8768 <.L1>

00008760 <.LBB13>:
    8760:	00000513          	li	a0,0
    8764:	fcb81ce3          	bne	a6,a1,873c <.L21>

00008768 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    8768:	01010113          	addi	sp,sp,16
    876c:	00008067          	ret

00008770 <.L2>:
  FP_CMP_Q (r, A, B, -2, 2);
    8770:	02e51663          	bne	a0,a4,879c <.L10>
    8774:	01f7e733          	or	a4,a5,t6
    8778:	01d76733          	or	a4,a4,t4
    877c:	01e76733          	or	a4,a4,t5
    8780:	0a071663          	bnez	a4,882c <.L26>

00008784 <.LBB14>:
    8784:	02068863          	beqz	a3,87b4 <.L11>

00008788 <.LVL15>:
    8788:	fab81ae3          	bne	a6,a1,873c <.L21>

0000878c <.L22>:
    878c:	fff00513          	li	a0,-1
    8790:	fc058ce3          	beqz	a1,8768 <.L1>
    8794:	00058513          	mv	a0,a1
    8798:	fd1ff06f          	j	8768 <.L1>

0000879c <.L10>:
    879c:	02068c63          	beqz	a3,87d4 <.L13>

000087a0 <.LVL18>:
    87a0:	f8050ee3          	beqz	a0,873c <.L21>

000087a4 <.L14>:
    87a4:	f8b81ce3          	bne	a6,a1,873c <.L21>
    87a8:	f8d54ae3          	blt	a0,a3,873c <.L21>
    87ac:	04a6d863          	bge	a3,a0,87fc <.L18>
    87b0:	fddff06f          	j	878c <.L22>

000087b4 <.L11>:
    87b4:	01136733          	or	a4,t1,a7
    87b8:	01c76733          	or	a4,a4,t3
    87bc:	00c76733          	or	a4,a4,a2

000087c0 <.L15>:
    87c0:	fe0712e3          	bnez	a4,87a4 <.L14>

000087c4 <.L17>:
    87c4:	fff00513          	li	a0,-1

000087c8 <.LVL22>:
    87c8:	fa0800e3          	beqz	a6,8768 <.L1>
    87cc:	00080513          	mv	a0,a6
    87d0:	f99ff06f          	j	8768 <.L1>

000087d4 <.L13>:
    87d4:	01136733          	or	a4,t1,a7
    87d8:	01c76733          	or	a4,a4,t3
    87dc:	00c76733          	or	a4,a4,a2

000087e0 <.LVL24>:
    87e0:	fe0510e3          	bnez	a0,87c0 <.L15>
    87e4:	01f7e6b3          	or	a3,a5,t6

000087e8 <.LVL25>:
    87e8:	01d6e6b3          	or	a3,a3,t4
    87ec:	01e6e6b3          	or	a3,a3,t5
    87f0:	02068a63          	beqz	a3,8824 <.L16>

000087f4 <.LVL26>:
    87f4:	fc0708e3          	beqz	a4,87c4 <.L17>

000087f8 <.LVL27>:
    87f8:	f4b812e3          	bne	a6,a1,873c <.L21>

000087fc <.L18>:
    87fc:	f4cf60e3          	bltu	t5,a2,873c <.L21>
    8800:	f9e616e3          	bne	a2,t5,878c <.L22>
    8804:	f3ceece3          	bltu	t4,t3,873c <.L21>
    8808:	f9de12e3          	bne	t3,t4,878c <.L22>
    880c:	f26fe8e3          	bltu	t6,t1,873c <.L21>
    8810:	f7f31ee3          	bne	t1,t6,878c <.L22>
    8814:	f317e4e3          	bltu	a5,a7,873c <.L21>
    8818:	00000513          	li	a0,0

0000881c <.LVL28>:
    881c:	f6f8e8e3          	bltu	a7,a5,878c <.L22>
    8820:	f49ff06f          	j	8768 <.L1>

00008824 <.L16>:
    8824:	f40702e3          	beqz	a4,8768 <.L1>
    8828:	f15ff06f          	j	873c <.L21>

0000882c <.L26>:
    882c:	ffe00513          	li	a0,-2

00008830 <.LVL31>:
    8830:	f39ff06f          	j	8768 <.L1>

00008834 <__letf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__letf2 (TFtype a, TFtype b)
{
    8834:	00052883          	lw	a7,0(a0)

00008838 <.LBB3>:
    8838:	00452303          	lw	t1,4(a0)

0000883c <.LBB4>:
    883c:	00852e03          	lw	t3,8(a0)

00008840 <.LBB5>:
    8840:	00c52503          	lw	a0,12(a0)
    8844:	00c5a803          	lw	a6,12(a1)

00008848 <.LBB6>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    8848:	00008737          	lui	a4,0x8
    884c:	01055693          	srli	a3,a0,0x10
    8850:	fff70713          	addi	a4,a4,-1 # 7fff <.LVL163+0x7>
    8854:	01051613          	slli	a2,a0,0x10

00008858 <.LBB7>:
  FP_UNPACK_RAW_Q (B, b);
    8858:	01081f13          	slli	t5,a6,0x10

0000885c <.LBE7>:
{
    885c:	0005a783          	lw	a5,0(a1)
    8860:	0045af83          	lw	t6,4(a1)
    8864:	0085ae83          	lw	t4,8(a1)

00008868 <.LBB8>:
  FP_UNPACK_RAW_Q (A, a);
    8868:	00e6f6b3          	and	a3,a3,a4
    886c:	01f55593          	srli	a1,a0,0x1f

00008870 <.LBB9>:
  FP_UNPACK_RAW_Q (B, b);
    8870:	01085513          	srli	a0,a6,0x10

00008874 <.LBE9>:
{
    8874:	ff010113          	addi	sp,sp,-16

00008878 <.LBB10>:
  FP_UNPACK_RAW_Q (A, a);
    8878:	01065613          	srli	a2,a2,0x10

0000887c <.LBB11>:
  FP_UNPACK_RAW_Q (B, b);
    887c:	010f5f13          	srli	t5,t5,0x10

00008880 <.LVL5>:
    8880:	00e57533          	and	a0,a0,a4

00008884 <.LVL6>:
    8884:	01f85813          	srli	a6,a6,0x1f

00008888 <.LBE11>:
  FP_CMP_Q (r, A, B, 2, 2);
    8888:	04e69663          	bne	a3,a4,88d4 <.L2>
    888c:	011368b3          	or	a7,t1,a7

00008890 <.LVL8>:
    8890:	01c8e8b3          	or	a7,a7,t3
    8894:	00c8e8b3          	or	a7,a7,a2
    8898:	0e089c63          	bnez	a7,8990 <.L26>
    889c:	00d50a63          	beq	a0,a3,88b0 <.L4>

000088a0 <.L21>:
    88a0:	00100513          	li	a0,1
    88a4:	02058463          	beqz	a1,88cc <.L1>
    88a8:	fff00513          	li	a0,-1
    88ac:	0200006f          	j	88cc <.L1>

000088b0 <.L4>:
    88b0:	01f7e7b3          	or	a5,a5,t6

000088b4 <.LVL11>:
    88b4:	01d7e7b3          	or	a5,a5,t4
    88b8:	01e7e7b3          	or	a5,a5,t5
    88bc:	00200513          	li	a0,2

000088c0 <.LVL12>:
    88c0:	00079663          	bnez	a5,88cc <.L1>

000088c4 <.LBB13>:
    88c4:	00000513          	li	a0,0
    88c8:	fcb81ce3          	bne	a6,a1,88a0 <.L21>

000088cc <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    88cc:	01010113          	addi	sp,sp,16
    88d0:	00008067          	ret

000088d4 <.L2>:
  FP_CMP_Q (r, A, B, 2, 2);
    88d4:	02e51663          	bne	a0,a4,8900 <.L10>
    88d8:	01f7e733          	or	a4,a5,t6
    88dc:	01d76733          	or	a4,a4,t4
    88e0:	01e76733          	or	a4,a4,t5
    88e4:	0a071663          	bnez	a4,8990 <.L26>

000088e8 <.LBB14>:
    88e8:	02068863          	beqz	a3,8918 <.L11>

000088ec <.LVL15>:
    88ec:	fab81ae3          	bne	a6,a1,88a0 <.L21>

000088f0 <.L22>:
    88f0:	fff00513          	li	a0,-1
    88f4:	fc058ce3          	beqz	a1,88cc <.L1>
    88f8:	00058513          	mv	a0,a1
    88fc:	fd1ff06f          	j	88cc <.L1>

00008900 <.L10>:
    8900:	02068c63          	beqz	a3,8938 <.L13>

00008904 <.LVL18>:
    8904:	f8050ee3          	beqz	a0,88a0 <.L21>

00008908 <.L14>:
    8908:	f8b81ce3          	bne	a6,a1,88a0 <.L21>
    890c:	f8d54ae3          	blt	a0,a3,88a0 <.L21>
    8910:	04a6d863          	bge	a3,a0,8960 <.L18>
    8914:	fddff06f          	j	88f0 <.L22>

00008918 <.L11>:
    8918:	01136733          	or	a4,t1,a7
    891c:	01c76733          	or	a4,a4,t3
    8920:	00c76733          	or	a4,a4,a2

00008924 <.L15>:
    8924:	fe0712e3          	bnez	a4,8908 <.L14>

00008928 <.L17>:
    8928:	fff00513          	li	a0,-1

0000892c <.LVL22>:
    892c:	fa0800e3          	beqz	a6,88cc <.L1>
    8930:	00080513          	mv	a0,a6
    8934:	f99ff06f          	j	88cc <.L1>

00008938 <.L13>:
    8938:	01136733          	or	a4,t1,a7
    893c:	01c76733          	or	a4,a4,t3
    8940:	00c76733          	or	a4,a4,a2

00008944 <.LVL24>:
    8944:	fe0510e3          	bnez	a0,8924 <.L15>
    8948:	01f7e6b3          	or	a3,a5,t6

0000894c <.LVL25>:
    894c:	01d6e6b3          	or	a3,a3,t4
    8950:	01e6e6b3          	or	a3,a3,t5
    8954:	02068a63          	beqz	a3,8988 <.L16>

00008958 <.LVL26>:
    8958:	fc0708e3          	beqz	a4,8928 <.L17>

0000895c <.LVL27>:
    895c:	f4b812e3          	bne	a6,a1,88a0 <.L21>

00008960 <.L18>:
    8960:	f4cf60e3          	bltu	t5,a2,88a0 <.L21>
    8964:	f9e616e3          	bne	a2,t5,88f0 <.L22>
    8968:	f3ceece3          	bltu	t4,t3,88a0 <.L21>
    896c:	f9de12e3          	bne	t3,t4,88f0 <.L22>
    8970:	f26fe8e3          	bltu	t6,t1,88a0 <.L21>
    8974:	f7f31ee3          	bne	t1,t6,88f0 <.L22>
    8978:	f317e4e3          	bltu	a5,a7,88a0 <.L21>
    897c:	00000513          	li	a0,0

00008980 <.LVL28>:
    8980:	f6f8e8e3          	bltu	a7,a5,88f0 <.L22>
    8984:	f49ff06f          	j	88cc <.L1>

00008988 <.L16>:
    8988:	f40702e3          	beqz	a4,88cc <.L1>
    898c:	f15ff06f          	j	88a0 <.L21>

00008990 <.L26>:
    8990:	00200513          	li	a0,2

00008994 <.LVL31>:
    8994:	f39ff06f          	j	88cc <.L1>

00008998 <__multf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__multf3 (TFtype a, TFtype b)
{
    8998:	f5010113          	addi	sp,sp,-176
    899c:	09312e23          	sw	s3,156(sp)
    89a0:	00c5a983          	lw	s3,12(a1)
    89a4:	0005a783          	lw	a5,0(a1)
    89a8:	0085a683          	lw	a3,8(a1)
    89ac:	0a812423          	sw	s0,168(sp)
    89b0:	00050413          	mv	s0,a0
    89b4:	0045a503          	lw	a0,4(a1)

000089b8 <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_Q (A, a);
    89b8:	01099713          	slli	a4,s3,0x10

000089bc <.LBE3>:
{
    89bc:	0b212023          	sw	s2,160(sp)
    89c0:	09412c23          	sw	s4,152(sp)
    89c4:	00062903          	lw	s2,0(a2)
    89c8:	00c62a03          	lw	s4,12(a2)
    89cc:	09512a23          	sw	s5,148(sp)
    89d0:	09612823          	sw	s6,144(sp)
    89d4:	00862a83          	lw	s5,8(a2)
    89d8:	00462b03          	lw	s6,4(a2)

000089dc <.LBB4>:
  FP_UNPACK_Q (A, a);
    89dc:	00008637          	lui	a2,0x8

000089e0 <.LBE4>:
{
    89e0:	0a912223          	sw	s1,164(sp)

000089e4 <.LBB5>:
  FP_UNPACK_Q (A, a);
    89e4:	01075713          	srli	a4,a4,0x10
    89e8:	0109d493          	srli	s1,s3,0x10
    89ec:	fff60613          	addi	a2,a2,-1 # 7fff <.LVL163+0x7>
    89f0:	05312e23          	sw	s3,92(sp)

000089f4 <.LBE5>:
{
    89f4:	0a112623          	sw	ra,172(sp)
    89f8:	09712623          	sw	s7,140(sp)
    89fc:	09812423          	sw	s8,136(sp)
    8a00:	09912223          	sw	s9,132(sp)
    8a04:	09a12023          	sw	s10,128(sp)
    8a08:	07b12e23          	sw	s11,124(sp)

00008a0c <.LBB6>:
  FP_UNPACK_Q (A, a);
    8a0c:	04f12823          	sw	a5,80(sp)
    8a10:	04a12a23          	sw	a0,84(sp)
    8a14:	04d12c23          	sw	a3,88(sp)
    8a18:	02f12023          	sw	a5,32(sp)
    8a1c:	02a12223          	sw	a0,36(sp)
    8a20:	02d12423          	sw	a3,40(sp)
    8a24:	02e12623          	sw	a4,44(sp)
    8a28:	00c4f4b3          	and	s1,s1,a2

00008a2c <.LVL2>:
    8a2c:	01f9d993          	srli	s3,s3,0x1f

00008a30 <.LBE6>:
    8a30:	1c0484e3          	beqz	s1,93f8 <.L2>
    8a34:	30c486e3          	beq	s1,a2,9540 <.L3>
    8a38:	000107b7          	lui	a5,0x10
    8a3c:	00f76733          	or	a4,a4,a5
    8a40:	02e12623          	sw	a4,44(sp)

00008a44 <.LBB7>:
    8a44:	02010613          	addi	a2,sp,32
    8a48:	02c10793          	addi	a5,sp,44

00008a4c <.L4>:
    8a4c:	0007a703          	lw	a4,0(a5) # 10000 <_ebss+0x1b0>
    8a50:	ffc7a683          	lw	a3,-4(a5)
    8a54:	ffc78793          	addi	a5,a5,-4
    8a58:	00371713          	slli	a4,a4,0x3
    8a5c:	01d6d693          	srli	a3,a3,0x1d
    8a60:	00d76733          	or	a4,a4,a3
    8a64:	00e7a223          	sw	a4,4(a5)
    8a68:	fef612e3          	bne	a2,a5,8a4c <.L4>

00008a6c <.LVL6>:
    8a6c:	02012783          	lw	a5,32(sp)
    8a70:	00379793          	slli	a5,a5,0x3
    8a74:	02f12023          	sw	a5,32(sp)

00008a78 <.LBE7>:
    8a78:	ffffc7b7          	lui	a5,0xffffc
    8a7c:	00178793          	addi	a5,a5,1 # ffffc001 <_ebss+0xfffec1b1>
    8a80:	00f484b3          	add	s1,s1,a5

00008a84 <.L203>:
    8a84:	00000b93          	li	s7,0

00008a88 <.L5>:
  FP_UNPACK_Q (B, b);
    8a88:	010a1513          	slli	a0,s4,0x10
    8a8c:	00008737          	lui	a4,0x8
    8a90:	010a5793          	srli	a5,s4,0x10
    8a94:	01055513          	srli	a0,a0,0x10
    8a98:	fff70713          	addi	a4,a4,-1 # 7fff <.LVL163+0x7>
    8a9c:	05412e23          	sw	s4,92(sp)
    8aa0:	05212823          	sw	s2,80(sp)
    8aa4:	05612a23          	sw	s6,84(sp)
    8aa8:	05512c23          	sw	s5,88(sp)
    8aac:	03212823          	sw	s2,48(sp)
    8ab0:	03612a23          	sw	s6,52(sp)
    8ab4:	03512c23          	sw	s5,56(sp)
    8ab8:	02a12e23          	sw	a0,60(sp)
    8abc:	00e7f7b3          	and	a5,a5,a4

00008ac0 <.LVL9>:
    8ac0:	01fa5a13          	srli	s4,s4,0x1f

00008ac4 <.LBE13>:
    8ac4:	2a0782e3          	beqz	a5,9568 <.L18>
    8ac8:	3ee784e3          	beq	a5,a4,96b0 <.L19>
    8acc:	00010737          	lui	a4,0x10
    8ad0:	00e56533          	or	a0,a0,a4
    8ad4:	02a12e23          	sw	a0,60(sp)

00008ad8 <.LBB14>:
    8ad8:	03010593          	addi	a1,sp,48
    8adc:	03c10713          	addi	a4,sp,60

00008ae0 <.L20>:
    8ae0:	00072683          	lw	a3,0(a4) # 10000 <_ebss+0x1b0>
    8ae4:	ffc72603          	lw	a2,-4(a4)
    8ae8:	ffc70713          	addi	a4,a4,-4
    8aec:	00369693          	slli	a3,a3,0x3
    8af0:	01d65613          	srli	a2,a2,0x1d
    8af4:	00c6e6b3          	or	a3,a3,a2
    8af8:	00d72223          	sw	a3,4(a4)
    8afc:	fee592e3          	bne	a1,a4,8ae0 <.L20>

00008b00 <.LVL13>:
    8b00:	03012703          	lw	a4,48(sp)
    8b04:	00371713          	slli	a4,a4,0x3
    8b08:	02e12823          	sw	a4,48(sp)

00008b0c <.LBE14>:
    8b0c:	ffffc737          	lui	a4,0xffffc
    8b10:	00170713          	addi	a4,a4,1 # ffffc001 <_ebss+0xfffec1b1>
    8b14:	00e787b3          	add	a5,a5,a4

00008b18 <.L204>:
    8b18:	00000693          	li	a3,0

00008b1c <.L21>:
  FP_MUL_Q (R, A, B);
    8b1c:	009787b3          	add	a5,a5,s1

00008b20 <.LVL16>:
    8b20:	00f12623          	sw	a5,12(sp)
    8b24:	00178793          	addi	a5,a5,1
    8b28:	0149c733          	xor	a4,s3,s4
    8b2c:	00f12423          	sw	a5,8(sp)
    8b30:	002b9793          	slli	a5,s7,0x2
    8b34:	00e12223          	sw	a4,4(sp)

00008b38 <.LVL17>:
    8b38:	00d7e7b3          	or	a5,a5,a3
    8b3c:	00a00713          	li	a4,10

00008b40 <.LVL18>:
    8b40:	3cf74ce3          	blt	a4,a5,9718 <.L34>
    8b44:	00200713          	li	a4,2
    8b48:	38f748e3          	blt	a4,a5,96d8 <.L35>
    8b4c:	fff78793          	addi	a5,a5,-1
    8b50:	00100713          	li	a4,1
    8b54:	42f774e3          	bgeu	a4,a5,977c <.L37>

00008b58 <.L36>:
    8b58:	02012883          	lw	a7,32(sp)

00008b5c <.LVL20>:
    8b5c:	03012f03          	lw	t5,48(sp)
    8b60:	000105b7          	lui	a1,0x10
    8b64:	fff58713          	addi	a4,a1,-1 # ffff <_ebss+0x1af>
    8b68:	0108d993          	srli	s3,a7,0x10

00008b6c <.LVL21>:
    8b6c:	010f5913          	srli	s2,t5,0x10

00008b70 <.LVL22>:
    8b70:	00e8f8b3          	and	a7,a7,a4

00008b74 <.LVL23>:
    8b74:	00ef7f33          	and	t5,t5,a4

00008b78 <.LVL24>:
    8b78:	031f0633          	mul	a2,t5,a7

00008b7c <.LVL25>:
    8b7c:	03e98533          	mul	a0,s3,t5

00008b80 <.LVL26>:
    8b80:	01065793          	srli	a5,a2,0x10
    8b84:	031906b3          	mul	a3,s2,a7

00008b88 <.LVL27>:
    8b88:	00a686b3          	add	a3,a3,a0

00008b8c <.LVL28>:
    8b8c:	00d787b3          	add	a5,a5,a3
    8b90:	03298bb3          	mul	s7,s3,s2

00008b94 <.LVL29>:
    8b94:	00a7f463          	bgeu	a5,a0,8b9c <.L42>
    8b98:	00bb8bb3          	add	s7,s7,a1

00008b9c <.L42>:
    8b9c:	03412e83          	lw	t4,52(sp)

00008ba0 <.LBB24>:
    8ba0:	0107d693          	srli	a3,a5,0x10
    8ba4:	00e7f7b3          	and	a5,a5,a4

00008ba8 <.LVL31>:
    8ba8:	00e67633          	and	a2,a2,a4

00008bac <.LVL32>:
    8bac:	01079793          	slli	a5,a5,0x10
    8bb0:	00c787b3          	add	a5,a5,a2

00008bb4 <.LBB25>:
    8bb4:	010ed393          	srli	t2,t4,0x10
    8bb8:	00eefeb3          	and	t4,t4,a4
    8bbc:	03d98633          	mul	a2,s3,t4

00008bc0 <.LBB26>:
    8bc0:	00f12823          	sw	a5,16(sp)
    8bc4:	04f12823          	sw	a5,80(sp)

00008bc8 <.LBB27>:
    8bc8:	03138733          	mul	a4,t2,a7
    8bcc:	031e87b3          	mul	a5,t4,a7

00008bd0 <.LVL34>:
    8bd0:	00c70733          	add	a4,a4,a2

00008bd4 <.LVL35>:
    8bd4:	0107d313          	srli	t1,a5,0x10
    8bd8:	00e30333          	add	t1,t1,a4
    8bdc:	02798b33          	mul	s6,s3,t2

00008be0 <.LVL36>:
    8be0:	00c37663          	bgeu	t1,a2,8bec <.L43>
    8be4:	00010737          	lui	a4,0x10
    8be8:	00eb0b33          	add	s6,s6,a4

00008bec <.L43>:
    8bec:	02412803          	lw	a6,36(sp)

00008bf0 <.LBB29>:
    8bf0:	00010737          	lui	a4,0x10
    8bf4:	fff70613          	addi	a2,a4,-1 # ffff <_ebss+0x1af>

00008bf8 <.LVL38>:
    8bf8:	01035513          	srli	a0,t1,0x10

00008bfc <.LVL39>:
    8bfc:	00c37333          	and	t1,t1,a2

00008c00 <.LVL40>:
    8c00:	00c7f7b3          	and	a5,a5,a2

00008c04 <.LBB30>:
    8c04:	01085493          	srli	s1,a6,0x10

00008c08 <.LBB31>:
    8c08:	01031313          	slli	t1,t1,0x10
    8c0c:	00c87833          	and	a6,a6,a2
    8c10:	00f30333          	add	t1,t1,a5

00008c14 <.LBB32>:
    8c14:	03e48fb3          	mul	t6,s1,t5
    8c18:	006686b3          	add	a3,a3,t1

00008c1c <.LBB33>:
    8c1c:	03e807b3          	mul	a5,a6,t5

00008c20 <.LVL44>:
    8c20:	03090e33          	mul	t3,s2,a6

00008c24 <.LVL45>:
    8c24:	0107d613          	srli	a2,a5,0x10
    8c28:	01fe0e33          	add	t3,t3,t6

00008c2c <.LVL46>:
    8c2c:	01c60633          	add	a2,a2,t3
    8c30:	029905b3          	mul	a1,s2,s1

00008c34 <.LVL47>:
    8c34:	01f67463          	bgeu	a2,t6,8c3c <.L44>
    8c38:	00e585b3          	add	a1,a1,a4

00008c3c <.L44>:
    8c3c:	01065a93          	srli	s5,a2,0x10
    8c40:	00010737          	lui	a4,0x10
    8c44:	00ba8ab3          	add	s5,s5,a1

00008c48 <.LVL49>:
    8c48:	fff70593          	addi	a1,a4,-1 # ffff <_ebss+0x1af>

00008c4c <.LVL50>:
    8c4c:	00b7f7b3          	and	a5,a5,a1

00008c50 <.LVL51>:
    8c50:	00b67633          	and	a2,a2,a1

00008c54 <.LVL52>:
    8c54:	01061613          	slli	a2,a2,0x10

00008c58 <.LBB34>:
    8c58:	030e85b3          	mul	a1,t4,a6

00008c5c <.LBB35>:
    8c5c:	00f60633          	add	a2,a2,a5

00008c60 <.LBB36>:
    8c60:	03d48fb3          	mul	t6,s1,t4

00008c64 <.LVL54>:
    8c64:	0105d793          	srli	a5,a1,0x10
    8c68:	03038e33          	mul	t3,t2,a6

00008c6c <.LVL55>:
    8c6c:	01fe0e33          	add	t3,t3,t6

00008c70 <.LVL56>:
    8c70:	01c787b3          	add	a5,a5,t3
    8c74:	029382b3          	mul	t0,t2,s1

00008c78 <.LVL57>:
    8c78:	01f7f463          	bgeu	a5,t6,8c80 <.L45>
    8c7c:	00e282b3          	add	t0,t0,a4

00008c80 <.L45>:
    8c80:	0107d713          	srli	a4,a5,0x10
    8c84:	00570733          	add	a4,a4,t0
    8c88:	00010a37          	lui	s4,0x10

00008c8c <.LVL59>:
    8c8c:	00e12a23          	sw	a4,20(sp)

00008c90 <.LVL60>:
    8c90:	fffa0713          	addi	a4,s4,-1 # ffff <_ebss+0x1af>

00008c94 <.LBB37>:
    8c94:	03812e03          	lw	t3,56(sp)

00008c98 <.LBB38>:
    8c98:	00e7f7b3          	and	a5,a5,a4

00008c9c <.LVL62>:
    8c9c:	00e5f5b3          	and	a1,a1,a4

00008ca0 <.LVL63>:
    8ca0:	01079793          	slli	a5,a5,0x10
    8ca4:	00b787b3          	add	a5,a5,a1
    8ca8:	00f12c23          	sw	a5,24(sp)

00008cac <.LBB39>:
    8cac:	010e5793          	srli	a5,t3,0x10

00008cb0 <.LVL65>:
    8cb0:	00ee7e33          	and	t3,t3,a4

00008cb4 <.LVL66>:
    8cb4:	031e05b3          	mul	a1,t3,a7

00008cb8 <.LVL67>:
    8cb8:	03c98c33          	mul	s8,s3,t3

00008cbc <.LVL68>:
    8cbc:	0105d713          	srli	a4,a1,0x10
    8cc0:	031782b3          	mul	t0,a5,a7

00008cc4 <.LVL69>:
    8cc4:	018282b3          	add	t0,t0,s8

00008cc8 <.LVL70>:
    8cc8:	00570733          	add	a4,a4,t0
    8ccc:	02f98fb3          	mul	t6,s3,a5

00008cd0 <.LVL71>:
    8cd0:	01877463          	bgeu	a4,s8,8cd8 <.L46>
    8cd4:	014f8fb3          	add	t6,t6,s4

00008cd8 <.L46>:
    8cd8:	01075293          	srli	t0,a4,0x10
    8cdc:	01f28fb3          	add	t6,t0,t6

00008ce0 <.LVL73>:
    8ce0:	00010cb7          	lui	s9,0x10
    8ce4:	01f12e23          	sw	t6,28(sp)

00008ce8 <.LVL74>:
    8ce8:	fffc8f93          	addi	t6,s9,-1 # ffff <_ebss+0x1af>

00008cec <.LVL75>:
    8cec:	01f77733          	and	a4,a4,t6

00008cf0 <.LVL76>:
    8cf0:	01f5f5b3          	and	a1,a1,t6

00008cf4 <.LVL77>:
    8cf4:	01071713          	slli	a4,a4,0x10
    8cf8:	00b70733          	add	a4,a4,a1

00008cfc <.LBB40>:
    8cfc:	02812583          	lw	a1,40(sp)

00008d00 <.LVL79>:
    8d00:	0105d293          	srli	t0,a1,0x10

00008d04 <.LVL80>:
    8d04:	01f5f5b3          	and	a1,a1,t6

00008d08 <.LVL81>:
    8d08:	03e58fb3          	mul	t6,a1,t5

00008d0c <.LVL82>:
    8d0c:	03e28d33          	mul	s10,t0,t5

00008d10 <.LVL83>:
    8d10:	010fdd93          	srli	s11,t6,0x10
    8d14:	02b90a33          	mul	s4,s2,a1

00008d18 <.LVL84>:
    8d18:	01aa0a33          	add	s4,s4,s10

00008d1c <.LVL85>:
    8d1c:	014d8a33          	add	s4,s11,s4
    8d20:	02590c33          	mul	s8,s2,t0

00008d24 <.LVL86>:
    8d24:	01aa7463          	bgeu	s4,s10,8d2c <.L47>
    8d28:	019c0c33          	add	s8,s8,s9

00008d2c <.L47>:
    8d2c:	017686b3          	add	a3,a3,s7
    8d30:	0066b333          	sltu	t1,a3,t1

00008d34 <.LBB42>:
    8d34:	010a5d13          	srli	s10,s4,0x10

00008d38 <.LBB43>:
    8d38:	00650533          	add	a0,a0,t1

00008d3c <.LBB44>:
    8d3c:	00010cb7          	lui	s9,0x10

00008d40 <.LBB45>:
    8d40:	01650533          	add	a0,a0,s6

00008d44 <.LBB46>:
    8d44:	018d0d33          	add	s10,s10,s8

00008d48 <.LVL91>:
    8d48:	00c68633          	add	a2,a3,a2

00008d4c <.LVL92>:
    8d4c:	fffc8c13          	addi	s8,s9,-1 # ffff <_ebss+0x1af>

00008d50 <.LVL93>:
    8d50:	01550ab3          	add	s5,a0,s5

00008d54 <.LVL94>:
    8d54:	018a7a33          	and	s4,s4,s8

00008d58 <.LBB47>:
    8d58:	00d636b3          	sltu	a3,a2,a3
    8d5c:	00da86b3          	add	a3,s5,a3

00008d60 <.LBB48>:
    8d60:	010a1a13          	slli	s4,s4,0x10
    8d64:	018fffb3          	and	t6,t6,s8

00008d68 <.LVL96>:
    8d68:	01fa0fb3          	add	t6,s4,t6

00008d6c <.LBB49>:
    8d6c:	00aaba33          	sltu	s4,s5,a0
    8d70:	0156bab3          	sltu	s5,a3,s5
    8d74:	015a6a33          	or	s4,s4,s5

00008d78 <.LBB51>:
    8d78:	00653533          	sltu	a0,a0,t1

00008d7c <.LBB52>:
    8d7c:	00aa0533          	add	a0,s4,a0
    8d80:	01812303          	lw	t1,24(sp)

00008d84 <.LVL99>:
    8d84:	01412a03          	lw	s4,20(sp)
    8d88:	04c12a23          	sw	a2,84(sp)

00008d8c <.LBB53>:
    8d8c:	00668333          	add	t1,a3,t1

00008d90 <.LVL101>:
    8d90:	01450ab3          	add	s5,a0,s4

00008d94 <.LVL102>:
    8d94:	01c12a03          	lw	s4,28(sp)
    8d98:	00d336b3          	sltu	a3,t1,a3

00008d9c <.LVL103>:
    8d9c:	00da86b3          	add	a3,s5,a3

00008da0 <.LBB54>:
    8da0:	00e30733          	add	a4,t1,a4

00008da4 <.LVL105>:
    8da4:	01468b33          	add	s6,a3,s4

00008da8 <.LVL106>:
    8da8:	00673333          	sltu	t1,a4,t1

00008dac <.LVL107>:
    8dac:	006b0333          	add	t1,s6,t1

00008db0 <.LVL108>:
    8db0:	01f70fb3          	add	t6,a4,t6

00008db4 <.LVL109>:
    8db4:	01a30d33          	add	s10,t1,s10

00008db8 <.LBB55>:
    8db8:	00efb733          	sltu	a4,t6,a4

00008dbc <.LBB56>:
    8dbc:	00aab533          	sltu	a0,s5,a0

00008dc0 <.LVL111>:
    8dc0:	00ed0733          	add	a4,s10,a4
    8dc4:	0156bab3          	sltu	s5,a3,s5

00008dc8 <.LBB57>:
    8dc8:	00db36b3          	sltu	a3,s6,a3

00008dcc <.LVL113>:
    8dcc:	01633b33          	sltu	s6,t1,s6

00008dd0 <.LVL114>:
    8dd0:	0166e6b3          	or	a3,a3,s6

00008dd4 <.LBB58>:
    8dd4:	006d3a33          	sltu	s4,s10,t1

00008dd8 <.LBB59>:
    8dd8:	01556ab3          	or	s5,a0,s5

00008ddc <.LBB60>:
    8ddc:	01a73d33          	sltu	s10,a4,s10

00008de0 <.LBB61>:
    8de0:	00da8ab3          	add	s5,s5,a3

00008de4 <.LBB62>:
    8de4:	01aa6a33          	or	s4,s4,s10
    8de8:	015a0a33          	add	s4,s4,s5

00008dec <.LBB63>:
    8dec:	03c12a83          	lw	s5,60(sp)

00008df0 <.LBB64>:
    8df0:	05f12c23          	sw	t6,88(sp)

00008df4 <.LBB65>:
    8df4:	010adb13          	srli	s6,s5,0x10

00008df8 <.LVL118>:
    8df8:	018afab3          	and	s5,s5,s8

00008dfc <.LVL119>:
    8dfc:	031a86b3          	mul	a3,s5,a7

00008e00 <.LVL120>:
    8e00:	03598533          	mul	a0,s3,s5

00008e04 <.LVL121>:
    8e04:	031b08b3          	mul	a7,s6,a7

00008e08 <.LVL122>:
    8e08:	00a88333          	add	t1,a7,a0
    8e0c:	0106d893          	srli	a7,a3,0x10

00008e10 <.LVL123>:
    8e10:	006888b3          	add	a7,a7,t1
    8e14:	036989b3          	mul	s3,s3,s6

00008e18 <.LVL124>:
    8e18:	00a8f463          	bgeu	a7,a0,8e20 <.L72>
    8e1c:	019989b3          	add	s3,s3,s9

00008e20 <.L72>:
    8e20:	02c12b83          	lw	s7,44(sp)

00008e24 <.LBB67>:
    8e24:	0108d513          	srli	a0,a7,0x10

00008e28 <.LVL127>:
    8e28:	01350533          	add	a0,a0,s3
    8e2c:	00010c37          	lui	s8,0x10
    8e30:	00a12a23          	sw	a0,20(sp)

00008e34 <.LVL128>:
    8e34:	fffc0513          	addi	a0,s8,-1 # ffff <_ebss+0x1af>

00008e38 <.LBB68>:
    8e38:	010bd993          	srli	s3,s7,0x10

00008e3c <.LVL130>:
    8e3c:	00abfbb3          	and	s7,s7,a0

00008e40 <.LBB69>:
    8e40:	00a6f6b3          	and	a3,a3,a0

00008e44 <.LVL131>:
    8e44:	00a8f8b3          	and	a7,a7,a0

00008e48 <.LBB70>:
    8e48:	03390333          	mul	t1,s2,s3

00008e4c <.LBB71>:
    8e4c:	01089893          	slli	a7,a7,0x10
    8e50:	00d888b3          	add	a7,a7,a3

00008e54 <.LBB72>:
    8e54:	03eb8533          	mul	a0,s7,t5

00008e58 <.LVL135>:
    8e58:	03790933          	mul	s2,s2,s7

00008e5c <.LVL136>:
    8e5c:	01055693          	srli	a3,a0,0x10
    8e60:	03e98f33          	mul	t5,s3,t5

00008e64 <.LVL137>:
    8e64:	01e90933          	add	s2,s2,t5

00008e68 <.LVL138>:
    8e68:	012686b3          	add	a3,a3,s2

00008e6c <.LVL139>:
    8e6c:	01e6f463          	bgeu	a3,t5,8e74 <.L73>
    8e70:	01830333          	add	t1,t1,s8

00008e74 <.L73>:
    8e74:	0106df13          	srli	t5,a3,0x10

00008e78 <.LVL141>:
    8e78:	006f0333          	add	t1,t5,t1

00008e7c <.LVL142>:
    8e7c:	00010cb7          	lui	s9,0x10

00008e80 <.LVL143>:
    8e80:	00612c23          	sw	t1,24(sp)

00008e84 <.LVL144>:
    8e84:	fffc8313          	addi	t1,s9,-1 # ffff <_ebss+0x1af>

00008e88 <.LVL145>:
    8e88:	00657533          	and	a0,a0,t1

00008e8c <.LVL146>:
    8e8c:	0066f6b3          	and	a3,a3,t1

00008e90 <.LBB73>:
    8e90:	03c48f33          	mul	t5,s1,t3

00008e94 <.LBB74>:
    8e94:	01069693          	slli	a3,a3,0x10
    8e98:	00a686b3          	add	a3,a3,a0

00008e9c <.LBB75>:
    8e9c:	03c80333          	mul	t1,a6,t3

00008ea0 <.LVL149>:
    8ea0:	03078933          	mul	s2,a5,a6

00008ea4 <.LVL150>:
    8ea4:	01035513          	srli	a0,t1,0x10
    8ea8:	01e90933          	add	s2,s2,t5

00008eac <.LVL151>:
    8eac:	01250533          	add	a0,a0,s2
    8eb0:	02f48c33          	mul	s8,s1,a5

00008eb4 <.LVL152>:
    8eb4:	01e57463          	bgeu	a0,t5,8ebc <.L74>
    8eb8:	019c0c33          	add	s8,s8,s9

00008ebc <.L74>:
    8ebc:	00010d37          	lui	s10,0x10
    8ec0:	fffd0f13          	addi	t5,s10,-1 # ffff <_ebss+0x1af>
    8ec4:	01055913          	srli	s2,a0,0x10
    8ec8:	01e57533          	and	a0,a0,t5

00008ecc <.LVL154>:
    8ecc:	01e37333          	and	t1,t1,t5

00008ed0 <.LVL155>:
    8ed0:	01051513          	slli	a0,a0,0x10
    8ed4:	01890933          	add	s2,s2,s8

00008ed8 <.LBB76>:
    8ed8:	02b38f33          	mul	t5,t2,a1

00008edc <.LBB77>:
    8edc:	00650533          	add	a0,a0,t1

00008ee0 <.LBB78>:
    8ee0:	03d28c33          	mul	s8,t0,t4

00008ee4 <.LVL158>:
    8ee4:	02be8333          	mul	t1,t4,a1

00008ee8 <.LVL159>:
    8ee8:	018f0f33          	add	t5,t5,s8

00008eec <.LVL160>:
    8eec:	01035d93          	srli	s11,t1,0x10

00008ef0 <.LVL161>:
    8ef0:	01ed8f33          	add	t5,s11,t5
    8ef4:	02538cb3          	mul	s9,t2,t0

00008ef8 <.LVL162>:
    8ef8:	018f7463          	bgeu	t5,s8,8f00 <.L75>
    8efc:	01ac8cb3          	add	s9,s9,s10

00008f00 <.L75>:
    8f00:	010f5c13          	srli	s8,t5,0x10
    8f04:	019c0c33          	add	s8,s8,s9

00008f08 <.LVL164>:
    8f08:	00010cb7          	lui	s9,0x10

00008f0c <.LVL165>:
    8f0c:	fffc8d13          	addi	s10,s9,-1 # ffff <_ebss+0x1af>

00008f10 <.LVL166>:
    8f10:	01af7f33          	and	t5,t5,s10

00008f14 <.LVL167>:
    8f14:	010f1f13          	slli	t5,t5,0x10
    8f18:	01a37333          	and	t1,t1,s10

00008f1c <.LVL168>:
    8f1c:	006f0333          	add	t1,t5,t1

00008f20 <.LBB79>:
    8f20:	01412f03          	lw	t5,20(sp)
    8f24:	011708b3          	add	a7,a4,a7

00008f28 <.LVL170>:
    8f28:	01812d03          	lw	s10,24(sp)

00008f2c <.LVL171>:
    8f2c:	01ea0f33          	add	t5,s4,t5

00008f30 <.LVL172>:
    8f30:	00e8b733          	sltu	a4,a7,a4

00008f34 <.LVL173>:
    8f34:	00ef0733          	add	a4,t5,a4

00008f38 <.LBB80>:
    8f38:	00d886b3          	add	a3,a7,a3

00008f3c <.LVL175>:
    8f3c:	01a70d33          	add	s10,a4,s10

00008f40 <.LVL176>:
    8f40:	0116b8b3          	sltu	a7,a3,a7

00008f44 <.LVL177>:
    8f44:	011d08b3          	add	a7,s10,a7

00008f48 <.LVL178>:
    8f48:	00a68533          	add	a0,a3,a0

00008f4c <.LVL179>:
    8f4c:	01288933          	add	s2,a7,s2

00008f50 <.LBB81>:
    8f50:	00d536b3          	sltu	a3,a0,a3
    8f54:	00d906b3          	add	a3,s2,a3

00008f58 <.LBB82>:
    8f58:	014f3a33          	sltu	s4,t5,s4

00008f5c <.LVL181>:
    8f5c:	01e73f33          	sltu	t5,a4,t5

00008f60 <.LBB83>:
    8f60:	00ed3733          	sltu	a4,s10,a4

00008f64 <.LVL183>:
    8f64:	01a8bd33          	sltu	s10,a7,s10

00008f68 <.LBB84>:
    8f68:	01ea6f33          	or	t5,s4,t5

00008f6c <.LBB85>:
    8f6c:	011938b3          	sltu	a7,s2,a7

00008f70 <.LBB86>:
    8f70:	01a76733          	or	a4,a4,s10

00008f74 <.LBB87>:
    8f74:	0126b933          	sltu	s2,a3,s2
    8f78:	01868c33          	add	s8,a3,s8

00008f7c <.LBB88>:
    8f7c:	00ef0733          	add	a4,t5,a4

00008f80 <.LBB89>:
    8f80:	0128e8b3          	or	a7,a7,s2
    8f84:	00e88933          	add	s2,a7,a4

00008f88 <.LBB90>:
    8f88:	03c28f33          	mul	t5,t0,t3

00008f8c <.LBB92>:
    8f8c:	00dc38b3          	sltu	a7,s8,a3
    8f90:	00650333          	add	t1,a0,t1

00008f94 <.LVL189>:
    8f94:	00a33533          	sltu	a0,t1,a0
    8f98:	00ac0533          	add	a0,s8,a0
    8f9c:	01853c33          	sltu	s8,a0,s8
    8fa0:	0188e8b3          	or	a7,a7,s8
    8fa4:	04612e23          	sw	t1,92(sp)
    8fa8:	012888b3          	add	a7,a7,s2

00008fac <.LBB93>:
    8fac:	02be06b3          	mul	a3,t3,a1

00008fb0 <.LVL192>:
    8fb0:	02b78a33          	mul	s4,a5,a1

00008fb4 <.LVL193>:
    8fb4:	0106d713          	srli	a4,a3,0x10
    8fb8:	01ea0a33          	add	s4,s4,t5

00008fbc <.LVL194>:
    8fbc:	01470733          	add	a4,a4,s4
    8fc0:	02578933          	mul	s2,a5,t0

00008fc4 <.LVL195>:
    8fc4:	01e77463          	bgeu	a4,t5,8fcc <.L100>
    8fc8:	01990933          	add	s2,s2,s9

00008fcc <.L100>:
    8fcc:	01075f13          	srli	t5,a4,0x10
    8fd0:	012f0f33          	add	t5,t5,s2

00008fd4 <.LVL197>:
    8fd4:	00010937          	lui	s2,0x10

00008fd8 <.LVL198>:
    8fd8:	fff90a13          	addi	s4,s2,-1 # ffff <_ebss+0x1af>
    8fdc:	01477733          	and	a4,a4,s4

00008fe0 <.LVL199>:
    8fe0:	0146f6b3          	and	a3,a3,s4

00008fe4 <.LVL200>:
    8fe4:	01071713          	slli	a4,a4,0x10

00008fe8 <.LBB94>:
    8fe8:	03548a33          	mul	s4,s1,s5

00008fec <.LBB95>:
    8fec:	00d70733          	add	a4,a4,a3

00008ff0 <.LBB96>:
    8ff0:	030a86b3          	mul	a3,s5,a6

00008ff4 <.LVL202>:
    8ff4:	030b0833          	mul	a6,s6,a6

00008ff8 <.LVL203>:
    8ff8:	01480c33          	add	s8,a6,s4
    8ffc:	0106d813          	srli	a6,a3,0x10

00009000 <.LVL204>:
    9000:	01880833          	add	a6,a6,s8
    9004:	036484b3          	mul	s1,s1,s6

00009008 <.LVL205>:
    9008:	01487463          	bgeu	a6,s4,9010 <.L101>
    900c:	012484b3          	add	s1,s1,s2

00009010 <.L101>:
    9010:	01085913          	srli	s2,a6,0x10
    9014:	00010c37          	lui	s8,0x10
    9018:	009904b3          	add	s1,s2,s1

0000901c <.LVL207>:
    901c:	fffc0913          	addi	s2,s8,-1 # ffff <_ebss+0x1af>
    9020:	0126f6b3          	and	a3,a3,s2

00009024 <.LVL208>:
    9024:	01287833          	and	a6,a6,s2

00009028 <.LVL209>:
    9028:	01081813          	slli	a6,a6,0x10

0000902c <.LBB97>:
    902c:	03db8a33          	mul	s4,s7,t4

00009030 <.LBB98>:
    9030:	00d80833          	add	a6,a6,a3

00009034 <.LBB99>:
    9034:	03d98eb3          	mul	t4,s3,t4

00009038 <.LVL212>:
    9038:	010a5693          	srli	a3,s4,0x10
    903c:	03338933          	mul	s2,t2,s3

00009040 <.LVL213>:
    9040:	037383b3          	mul	t2,t2,s7

00009044 <.LVL214>:
    9044:	01d383b3          	add	t2,t2,t4

00009048 <.LVL215>:
    9048:	007686b3          	add	a3,a3,t2

0000904c <.LVL216>:
    904c:	01d6f463          	bgeu	a3,t4,9054 <.L102>
    9050:	01890933          	add	s2,s2,s8

00009054 <.L102>:
    9054:	0106de93          	srli	t4,a3,0x10

00009058 <.LVL218>:
    9058:	012e8eb3          	add	t4,t4,s2

0000905c <.LVL219>:
    905c:	00010937          	lui	s2,0x10

00009060 <.LVL220>:
    9060:	fff90393          	addi	t2,s2,-1 # ffff <_ebss+0x1af>
    9064:	0076f6b3          	and	a3,a3,t2

00009068 <.LVL221>:
    9068:	007a7a33          	and	s4,s4,t2

0000906c <.LVL222>:
    906c:	01069693          	slli	a3,a3,0x10

00009070 <.LBB100>:
    9070:	02ba83b3          	mul	t2,s5,a1

00009074 <.LBB101>:
    9074:	014686b3          	add	a3,a3,s4

00009078 <.LBB102>:
    9078:	02bb05b3          	mul	a1,s6,a1

0000907c <.LVL224>:
    907c:	03528a33          	mul	s4,t0,s5

00009080 <.LVL225>:
    9080:	01458c33          	add	s8,a1,s4
    9084:	0103d593          	srli	a1,t2,0x10

00009088 <.LVL226>:
    9088:	018585b3          	add	a1,a1,s8
    908c:	036282b3          	mul	t0,t0,s6

00009090 <.LVL227>:
    9090:	0145f463          	bgeu	a1,s4,9098 <.L103>
    9094:	012282b3          	add	t0,t0,s2

00009098 <.L103>:
    9098:	0105d913          	srli	s2,a1,0x10
    909c:	005902b3          	add	t0,s2,t0

000090a0 <.LVL229>:
    90a0:	00010937          	lui	s2,0x10
    90a4:	fff90a13          	addi	s4,s2,-1 # ffff <_ebss+0x1af>

000090a8 <.LVL230>:
    90a8:	0145f5b3          	and	a1,a1,s4

000090ac <.LVL231>:
    90ac:	0143f3b3          	and	t2,t2,s4

000090b0 <.LVL232>:
    90b0:	01059593          	slli	a1,a1,0x10

000090b4 <.LBB103>:
    90b4:	03378a33          	mul	s4,a5,s3

000090b8 <.LBB104>:
    90b8:	007585b3          	add	a1,a1,t2

000090bc <.LBB105>:
    90bc:	037787b3          	mul	a5,a5,s7

000090c0 <.LVL234>:
    90c0:	03cb83b3          	mul	t2,s7,t3

000090c4 <.LVL235>:
    90c4:	03c98e33          	mul	t3,s3,t3

000090c8 <.LVL236>:
    90c8:	0103dc13          	srli	s8,t2,0x10

000090cc <.LVL237>:
    90cc:	01c787b3          	add	a5,a5,t3
    90d0:	00fc07b3          	add	a5,s8,a5

000090d4 <.LVL239>:
    90d4:	01c7f463          	bgeu	a5,t3,90dc <.L104>
    90d8:	012a0a33          	add	s4,s4,s2

000090dc <.L104>:
    90dc:	00e50733          	add	a4,a0,a4

000090e0 <.LVL241>:
    90e0:	0107de13          	srli	t3,a5,0x10

000090e4 <.LVL242>:
    90e4:	00010937          	lui	s2,0x10
    90e8:	01e88f33          	add	t5,a7,t5

000090ec <.LVL243>:
    90ec:	014e0e33          	add	t3,t3,s4

000090f0 <.LBB106>:
    90f0:	00a73533          	sltu	a0,a4,a0

000090f4 <.LBB107>:
    90f4:	fff90a13          	addi	s4,s2,-1 # ffff <_ebss+0x1af>

000090f8 <.LVL245>:
    90f8:	00af0533          	add	a0,t5,a0
    90fc:	01070833          	add	a6,a4,a6

00009100 <.LVL246>:
    9100:	0147f7b3          	and	a5,a5,s4

00009104 <.LVL247>:
    9104:	009504b3          	add	s1,a0,s1

00009108 <.LVL248>:
    9108:	0143f3b3          	and	t2,t2,s4

0000910c <.LBB108>:
    910c:	00e83733          	sltu	a4,a6,a4

00009110 <.LBB109>:
    9110:	01079793          	slli	a5,a5,0x10
    9114:	007787b3          	add	a5,a5,t2

00009118 <.LBB110>:
    9118:	00e483b3          	add	t2,s1,a4

0000911c <.LBB112>:
    911c:	011f38b3          	sltu	a7,t5,a7

00009120 <.LVL252>:
    9120:	01e53f33          	sltu	t5,a0,t5

00009124 <.LBB113>:
    9124:	00a4b533          	sltu	a0,s1,a0

00009128 <.LVL254>:
    9128:	0093b4b3          	sltu	s1,t2,s1

0000912c <.LVL255>:
    912c:	00956533          	or	a0,a0,s1

00009130 <.LBB114>:
    9130:	01e8e8b3          	or	a7,a7,t5

00009134 <.LBB115>:
    9134:	00a888b3          	add	a7,a7,a0

00009138 <.LBB116>:
    9138:	037a8533          	mul	a0,s5,s7
    913c:	00d806b3          	add	a3,a6,a3

00009140 <.LVL258>:
    9140:	01d38eb3          	add	t4,t2,t4

00009144 <.LBB118>:
    9144:	06d12023          	sw	a3,96(sp)

00009148 <.LVL260>:
    9148:	0106b6b3          	sltu	a3,a3,a6

0000914c <.LVL261>:
    914c:	00de8733          	add	a4,t4,a3

00009150 <.LVL262>:
    9150:	007eb3b3          	sltu	t2,t4,t2

00009154 <.LVL263>:
    9154:	01d73eb3          	sltu	t4,a4,t4

00009158 <.LVL264>:
    9158:	01d3e3b3          	or	t2,t2,t4

0000915c <.LVL265>:
    915c:	00b705b3          	add	a1,a4,a1

00009160 <.LBB119>:
    9160:	03598ab3          	mul	s5,s3,s5

00009164 <.LBB120>:
    9164:	011383b3          	add	t2,t2,a7

00009168 <.LBB121>:
    9168:	005382b3          	add	t0,t2,t0

0000916c <.LVL269>:
    916c:	00e5b733          	sltu	a4,a1,a4

00009170 <.LVL270>:
    9170:	00e28733          	add	a4,t0,a4

00009174 <.LVL271>:
    9174:	00f587b3          	add	a5,a1,a5

00009178 <.LVL272>:
    9178:	01c70e33          	add	t3,a4,t3

0000917c <.LBB122>:
    917c:	06f12223          	sw	a5,100(sp)
    9180:	00b7b7b3          	sltu	a5,a5,a1
    9184:	00fe07b3          	add	a5,t3,a5

00009188 <.LBB123>:
    9188:	033b09b3          	mul	s3,s6,s3

0000918c <.LVL274>:
    918c:	01055693          	srli	a3,a0,0x10

00009190 <.LBB124>:
    9190:	0072b3b3          	sltu	t2,t0,t2

00009194 <.LVL276>:
    9194:	005732b3          	sltu	t0,a4,t0

00009198 <.LBB125>:
    9198:	00ee3733          	sltu	a4,t3,a4
    919c:	01c7be33          	sltu	t3,a5,t3

000091a0 <.LBB126>:
    91a0:	0053e3b3          	or	t2,t2,t0

000091a4 <.LBB127>:
    91a4:	01c76733          	or	a4,a4,t3

000091a8 <.LBB128>:
    91a8:	037b0b33          	mul	s6,s6,s7

000091ac <.LVL279>:
    91ac:	015b0b33          	add	s6,s6,s5

000091b0 <.LVL280>:
    91b0:	016686b3          	add	a3,a3,s6

000091b4 <.LVL281>:
    91b4:	0156f463          	bgeu	a3,s5,91bc <.L135>
    91b8:	012989b3          	add	s3,s3,s2

000091bc <.L135>:
    91bc:	00010837          	lui	a6,0x10

000091c0 <.LVL283>:
    91c0:	fff80813          	addi	a6,a6,-1 # ffff <_ebss+0x1af>
    91c4:	0106d593          	srli	a1,a3,0x10
    91c8:	0106f6b3          	and	a3,a3,a6

000091cc <.LVL284>:
    91cc:	01069693          	slli	a3,a3,0x10
    91d0:	01057533          	and	a0,a0,a6

000091d4 <.LVL285>:
    91d4:	00a686b3          	add	a3,a3,a0
    91d8:	00d786b3          	add	a3,a5,a3
    91dc:	007585b3          	add	a1,a1,t2

000091e0 <.LBB129>:
    91e0:	00f6b7b3          	sltu	a5,a3,a5
    91e4:	00e58733          	add	a4,a1,a4

000091e8 <.LVL287>:
    91e8:	00e787b3          	add	a5,a5,a4
    91ec:	013787b3          	add	a5,a5,s3
    91f0:	06f12623          	sw	a5,108(sp)

000091f4 <.LBB131>:
    91f4:	01012783          	lw	a5,16(sp)
    91f8:	00d31313          	slli	t1,t1,0xd

000091fc <.LBB130>:
    91fc:	06d12423          	sw	a3,104(sp)

00009200 <.LBB133>:
    9200:	00c7e7b3          	or	a5,a5,a2

00009204 <.LVL289>:
    9204:	00ffefb3          	or	t6,t6,a5

00009208 <.LVL290>:
    9208:	01f36333          	or	t1,t1,t6

0000920c <.LVL291>:
    920c:	05010793          	addi	a5,sp,80
    9210:	06010613          	addi	a2,sp,96

00009214 <.L138>:
    9214:	00c7a703          	lw	a4,12(a5)
    9218:	0107a683          	lw	a3,16(a5)
    921c:	00478793          	addi	a5,a5,4
    9220:	01375713          	srli	a4,a4,0x13
    9224:	00d69693          	slli	a3,a3,0xd
    9228:	00d76733          	or	a4,a4,a3
    922c:	fee7ae23          	sw	a4,-4(a5)
    9230:	fef612e3          	bne	a2,a5,9214 <.L138>

00009234 <.LBE133>:
    9234:	05812703          	lw	a4,88(sp)

00009238 <.LBB134>:
    9238:	05012783          	lw	a5,80(sp)
    923c:	00603333          	snez	t1,t1

00009240 <.LBE134>:
    9240:	04e12423          	sw	a4,72(sp)
    9244:	05412703          	lw	a4,84(sp)

00009248 <.LBB135>:
    9248:	00f36333          	or	t1,t1,a5

0000924c <.LBE135>:
    924c:	05c12783          	lw	a5,92(sp)
    9250:	04e12223          	sw	a4,68(sp)

00009254 <.LBE20>:
    9254:	00100737          	lui	a4,0x100

00009258 <.LBB136>:
    9258:	04f12623          	sw	a5,76(sp)
    925c:	04612023          	sw	t1,64(sp)

00009260 <.LBE136>:
    9260:	00e7f7b3          	and	a5,a5,a4
    9264:	52078e63          	beqz	a5,97a0 <.L178>

00009268 <.LBB137>:
    9268:	01f31313          	slli	t1,t1,0x1f

0000926c <.LVL295>:
    926c:	04010793          	addi	a5,sp,64
    9270:	04c10613          	addi	a2,sp,76

00009274 <.L140>:
    9274:	0007a703          	lw	a4,0(a5)
    9278:	0047a683          	lw	a3,4(a5)
    927c:	00478793          	addi	a5,a5,4
    9280:	00175713          	srli	a4,a4,0x1
    9284:	01f69693          	slli	a3,a3,0x1f
    9288:	00d76733          	or	a4,a4,a3
    928c:	fee7ae23          	sw	a4,-4(a5)
    9290:	fef612e3          	bne	a2,a5,9274 <.L140>

00009294 <.LVL297>:
    9294:	04c12783          	lw	a5,76(sp)
    9298:	00603333          	snez	t1,t1

0000929c <.LVL298>:
    929c:	0017d793          	srli	a5,a5,0x1
    92a0:	04f12623          	sw	a5,76(sp)

000092a4 <.LBE138>:
    92a4:	04012783          	lw	a5,64(sp)
    92a8:	0067e7b3          	or	a5,a5,t1
    92ac:	04f12023          	sw	a5,64(sp)

000092b0 <.L139>:
  FP_PACK_Q (r, R);
    92b0:	00812703          	lw	a4,8(sp)
    92b4:	000047b7          	lui	a5,0x4
    92b8:	fff78793          	addi	a5,a5,-1 # 3fff <.L6+0xb>
    92bc:	00f707b3          	add	a5,a4,a5

000092c0 <.LVL301>:
    92c0:	50f05263          	blez	a5,97c4 <.L144>
    92c4:	04012703          	lw	a4,64(sp)
    92c8:	00777693          	andi	a3,a4,7
    92cc:	04068463          	beqz	a3,9314 <.L145>
    92d0:	00f77693          	andi	a3,a4,15
    92d4:	00400613          	li	a2,4
    92d8:	02c68e63          	beq	a3,a2,9314 <.L145>

000092dc <.LBB139>:
    92dc:	00470713          	addi	a4,a4,4 # 100004 <_ebss+0xf01b4>
    92e0:	00473693          	sltiu	a3,a4,4
    92e4:	04e12023          	sw	a4,64(sp)

000092e8 <.LVL302>:
    92e8:	04412703          	lw	a4,68(sp)

000092ec <.LVL303>:
    92ec:	00e68733          	add	a4,a3,a4
    92f0:	04e12223          	sw	a4,68(sp)

000092f4 <.LVL304>:
    92f4:	00d73733          	sltu	a4,a4,a3

000092f8 <.LVL305>:
    92f8:	04812683          	lw	a3,72(sp)
    92fc:	00e68733          	add	a4,a3,a4

00009300 <.LVL306>:
    9300:	04e12423          	sw	a4,72(sp)

00009304 <.LVL307>:
    9304:	00d73733          	sltu	a4,a4,a3

00009308 <.LVL308>:
    9308:	04c12683          	lw	a3,76(sp)
    930c:	00d70733          	add	a4,a4,a3

00009310 <.LVL309>:
    9310:	04e12623          	sw	a4,76(sp)

00009314 <.L145>:
    9314:	04c12703          	lw	a4,76(sp)
    9318:	001006b7          	lui	a3,0x100
    931c:	00d776b3          	and	a3,a4,a3
    9320:	02068063          	beqz	a3,9340 <.L150>
    9324:	fff007b7          	lui	a5,0xfff00

00009328 <.LVL311>:
    9328:	fff78793          	addi	a5,a5,-1 # ffefffff <_ebss+0xffef01af>
    932c:	00f77733          	and	a4,a4,a5
    9330:	04e12623          	sw	a4,76(sp)
    9334:	00812703          	lw	a4,8(sp)
    9338:	000047b7          	lui	a5,0x4

0000933c <.LVL312>:
    933c:	00f707b3          	add	a5,a4,a5

00009340 <.L150>:
    9340:	04010713          	addi	a4,sp,64
    9344:	04c10593          	addi	a1,sp,76

00009348 <.L151>:
    9348:	00072683          	lw	a3,0(a4)
    934c:	00472603          	lw	a2,4(a4)
    9350:	00470713          	addi	a4,a4,4
    9354:	0036d693          	srli	a3,a3,0x3
    9358:	01d61613          	slli	a2,a2,0x1d
    935c:	00c6e6b3          	or	a3,a3,a2
    9360:	fed72e23          	sw	a3,-4(a4)
    9364:	feb712e3          	bne	a4,a1,9348 <.L151>

00009368 <.LBE140>:
    9368:	000086b7          	lui	a3,0x8
    936c:	ffe68613          	addi	a2,a3,-2 # 7ffe <.LVL163+0x6>

00009370 <.LBB141>:
    9370:	04c12703          	lw	a4,76(sp)

00009374 <.LBE141>:
    9374:	42f64c63          	blt	a2,a5,97ac <.L152>

00009378 <.LBB142>:
    9378:	00375713          	srli	a4,a4,0x3
    937c:	04e12623          	sw	a4,76(sp)

00009380 <.L153>:
    9380:	04c12703          	lw	a4,76(sp)

00009384 <.LBE143>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    9384:	0ac12083          	lw	ra,172(sp)
    9388:	00040513          	mv	a0,s0

0000938c <.LBB144>:
  FP_PACK_Q (r, R);
    938c:	04e11e23          	sh	a4,92(sp)
    9390:	00412703          	lw	a4,4(sp)

00009394 <.LBE144>:
}
    9394:	0a412483          	lw	s1,164(sp)
    9398:	0a012903          	lw	s2,160(sp)

0000939c <.LBB145>:
  FP_PACK_Q (r, R);
    939c:	00f71713          	slli	a4,a4,0xf
    93a0:	00f767b3          	or	a5,a4,a5

000093a4 <.LVL317>:
    93a4:	04f11f23          	sh	a5,94(sp)

000093a8 <.LBE145>:
  return r;
    93a8:	04012783          	lw	a5,64(sp)
}
    93ac:	09c12983          	lw	s3,156(sp)
    93b0:	09812a03          	lw	s4,152(sp)
  return r;
    93b4:	00f42023          	sw	a5,0(s0)
    93b8:	04412783          	lw	a5,68(sp)
}
    93bc:	09412a83          	lw	s5,148(sp)
    93c0:	09012b03          	lw	s6,144(sp)
  return r;
    93c4:	00f42223          	sw	a5,4(s0)
    93c8:	04812783          	lw	a5,72(sp)
}
    93cc:	08c12b83          	lw	s7,140(sp)
    93d0:	08812c03          	lw	s8,136(sp)
  return r;
    93d4:	00f42423          	sw	a5,8(s0)
    93d8:	05c12783          	lw	a5,92(sp)
}
    93dc:	08412c83          	lw	s9,132(sp)
    93e0:	08012d03          	lw	s10,128(sp)
  return r;
    93e4:	00f42623          	sw	a5,12(s0)
}
    93e8:	0a812403          	lw	s0,168(sp)
    93ec:	07c12d83          	lw	s11,124(sp)
    93f0:	0b010113          	addi	sp,sp,176

000093f4 <.LVL320>:
    93f4:	00008067          	ret

000093f8 <.L2>:
  FP_UNPACK_Q (A, a);
    93f8:	00a7e633          	or	a2,a5,a0
    93fc:	00d66633          	or	a2,a2,a3
    9400:	00e66633          	or	a2,a2,a4
    9404:	14060c63          	beqz	a2,955c <.L174>

00009408 <.LBB146>:
    9408:	04070e63          	beqz	a4,9464 <.L6>
    940c:	00070513          	mv	a0,a4
    9410:	ca1f80ef          	jal	ra,20b0 <__clzsi2>

00009414 <.LBB9>:
    9414:	ff450693          	addi	a3,a0,-12

00009418 <.LVL323>:
    9418:	02000613          	li	a2,32
    941c:	40d60633          	sub	a2,a2,a3

00009420 <.LVL324>:
    9420:	00000793          	li	a5,0

00009424 <.L7>:
    9424:	ffc00593          	li	a1,-4
    9428:	02b785b3          	mul	a1,a5,a1
    942c:	02010313          	addi	t1,sp,32
    9430:	00c58713          	addi	a4,a1,12
    9434:	00e30733          	add	a4,t1,a4
    9438:	40b005b3          	neg	a1,a1

0000943c <.L12>:
    943c:	0ee31063          	bne	t1,a4,951c <.L15>
    9440:	fff78713          	addi	a4,a5,-1 # 3fff <.L6+0xb>

00009444 <.LVL326>:
    9444:	00279793          	slli	a5,a5,0x2
    9448:	02010613          	addi	a2,sp,32

0000944c <.LVL327>:
    944c:	05078793          	addi	a5,a5,80
    9450:	00c787b3          	add	a5,a5,a2
    9454:	02012603          	lw	a2,32(sp)
    9458:	00d616b3          	sll	a3,a2,a3

0000945c <.LVL328>:
    945c:	fad7a823          	sw	a3,-80(a5)
    9460:	07c0006f          	j	94dc <.L14>

00009464 <.L6>:
    9464:	02068663          	beqz	a3,9490 <.L8>
    9468:	00068513          	mv	a0,a3
    946c:	c45f80ef          	jal	ra,20b0 <__clzsi2>

00009470 <.LVL330>:
    9470:	02050513          	addi	a0,a0,32

00009474 <.L9>:
    9474:	ff450693          	addi	a3,a0,-12
    9478:	4056d793          	srai	a5,a3,0x5

0000947c <.LVL332>:
    947c:	01f6f693          	andi	a3,a3,31

00009480 <.LVL333>:
    9480:	02068863          	beqz	a3,94b0 <.L11>
    9484:	02000613          	li	a2,32
    9488:	40d60633          	sub	a2,a2,a3

0000948c <.LVL334>:
    948c:	f99ff06f          	j	9424 <.L7>

00009490 <.L8>:
    9490:	00050863          	beqz	a0,94a0 <.L10>
    9494:	c1df80ef          	jal	ra,20b0 <__clzsi2>

00009498 <.LVL336>:
    9498:	04050513          	addi	a0,a0,64
    949c:	fd9ff06f          	j	9474 <.L9>

000094a0 <.L10>:
    94a0:	00078513          	mv	a0,a5
    94a4:	c0df80ef          	jal	ra,20b0 <__clzsi2>

000094a8 <.LVL339>:
    94a8:	06050513          	addi	a0,a0,96
    94ac:	fc9ff06f          	j	9474 <.L9>

000094b0 <.L11>:
    94b0:	ffc00613          	li	a2,-4
    94b4:	02c78633          	mul	a2,a5,a2
    94b8:	02c10713          	addi	a4,sp,44

000094bc <.LBB11>:
    94bc:	00300693          	li	a3,3

000094c0 <.L13>:
    94c0:	00c705b3          	add	a1,a4,a2
    94c4:	0005a583          	lw	a1,0(a1)
    94c8:	fff68693          	addi	a3,a3,-1

000094cc <.LVL343>:
    94cc:	ffc70713          	addi	a4,a4,-4
    94d0:	00b72223          	sw	a1,4(a4)

000094d4 <.LVL344>:
    94d4:	fef6d6e3          	bge	a3,a5,94c0 <.L13>
    94d8:	fff78713          	addi	a4,a5,-1

000094dc <.L14>:
    94dc:	00170793          	addi	a5,a4,1
    94e0:	00279793          	slli	a5,a5,0x2
    94e4:	00800693          	li	a3,8
    94e8:	02010713          	addi	a4,sp,32
    94ec:	00d7ea63          	bltu	a5,a3,9500 <.L16>
    94f0:	02012023          	sw	zero,32(sp)
    94f4:	00072223          	sw	zero,4(a4)
    94f8:	ff878793          	addi	a5,a5,-8
    94fc:	02810713          	addi	a4,sp,40

00009500 <.L16>:
    9500:	00400693          	li	a3,4
    9504:	00d7e463          	bltu	a5,a3,950c <.L17>
    9508:	00072023          	sw	zero,0(a4)

0000950c <.L17>:
    950c:	ffffc4b7          	lui	s1,0xffffc

00009510 <.LVL346>:
    9510:	01148493          	addi	s1,s1,17 # ffffc011 <_ebss+0xfffec1c1>
    9514:	40a484b3          	sub	s1,s1,a0
    9518:	d6cff06f          	j	8a84 <.L203>

0000951c <.L15>:
    951c:	00072803          	lw	a6,0(a4)
    9520:	ffc72883          	lw	a7,-4(a4)
    9524:	00b70e33          	add	t3,a4,a1
    9528:	00d81833          	sll	a6,a6,a3
    952c:	00c8d8b3          	srl	a7,a7,a2
    9530:	01186833          	or	a6,a6,a7
    9534:	010e2023          	sw	a6,0(t3)
    9538:	ffc70713          	addi	a4,a4,-4
    953c:	f01ff06f          	j	943c <.L12>

00009540 <.L3>:
    9540:	00a7e7b3          	or	a5,a5,a0
    9544:	00d7e7b3          	or	a5,a5,a3
    9548:	00e7e7b3          	or	a5,a5,a4
    954c:	00200b93          	li	s7,2
    9550:	d2078c63          	beqz	a5,8a88 <.L5>
    9554:	00300b93          	li	s7,3
    9558:	d30ff06f          	j	8a88 <.L5>

0000955c <.L174>:
    955c:	00000493          	li	s1,0

00009560 <.LBE147>:
    9560:	00100b93          	li	s7,1
    9564:	d24ff06f          	j	8a88 <.L5>

00009568 <.L18>:
  FP_UNPACK_Q (B, b);
    9568:	016967b3          	or	a5,s2,s6

0000956c <.LVL351>:
    956c:	0157e7b3          	or	a5,a5,s5
    9570:	00a7e7b3          	or	a5,a5,a0
    9574:	14078c63          	beqz	a5,96cc <.L176>

00009578 <.LBB148>:
    9578:	04050c63          	beqz	a0,95d0 <.L22>
    957c:	b35f80ef          	jal	ra,20b0 <__clzsi2>

00009580 <.LBB16>:
    9580:	ff450693          	addi	a3,a0,-12

00009584 <.LVL353>:
    9584:	02000593          	li	a1,32
    9588:	40d585b3          	sub	a1,a1,a3

0000958c <.LVL354>:
    958c:	00000793          	li	a5,0

00009590 <.L23>:
    9590:	ffc00613          	li	a2,-4
    9594:	02c78633          	mul	a2,a5,a2
    9598:	03010313          	addi	t1,sp,48
    959c:	00c60713          	addi	a4,a2,12
    95a0:	00e30733          	add	a4,t1,a4
    95a4:	40c00633          	neg	a2,a2

000095a8 <.L28>:
    95a8:	0ee31263          	bne	t1,a4,968c <.L31>
    95ac:	fff78713          	addi	a4,a5,-1

000095b0 <.LVL356>:
    95b0:	00279793          	slli	a5,a5,0x2
    95b4:	02010613          	addi	a2,sp,32
    95b8:	05078793          	addi	a5,a5,80
    95bc:	00c787b3          	add	a5,a5,a2
    95c0:	03012603          	lw	a2,48(sp)
    95c4:	00d616b3          	sll	a3,a2,a3

000095c8 <.LVL357>:
    95c8:	fcd7a023          	sw	a3,-64(a5)
    95cc:	0800006f          	j	964c <.L30>

000095d0 <.L22>:
    95d0:	020a8663          	beqz	s5,95fc <.L24>
    95d4:	000a8513          	mv	a0,s5
    95d8:	ad9f80ef          	jal	ra,20b0 <__clzsi2>

000095dc <.LVL359>:
    95dc:	02050513          	addi	a0,a0,32

000095e0 <.L25>:
    95e0:	ff450693          	addi	a3,a0,-12
    95e4:	4056d793          	srai	a5,a3,0x5

000095e8 <.LVL361>:
    95e8:	01f6f693          	andi	a3,a3,31

000095ec <.LVL362>:
    95ec:	02068a63          	beqz	a3,9620 <.L27>
    95f0:	02000593          	li	a1,32
    95f4:	40d585b3          	sub	a1,a1,a3

000095f8 <.LVL363>:
    95f8:	f99ff06f          	j	9590 <.L23>

000095fc <.L24>:
    95fc:	000b0a63          	beqz	s6,9610 <.L26>
    9600:	000b0513          	mv	a0,s6
    9604:	aadf80ef          	jal	ra,20b0 <__clzsi2>

00009608 <.LVL365>:
    9608:	04050513          	addi	a0,a0,64
    960c:	fd5ff06f          	j	95e0 <.L25>

00009610 <.L26>:
    9610:	00090513          	mv	a0,s2
    9614:	a9df80ef          	jal	ra,20b0 <__clzsi2>

00009618 <.LVL368>:
    9618:	06050513          	addi	a0,a0,96
    961c:	fc5ff06f          	j	95e0 <.L25>

00009620 <.L27>:
    9620:	ffc00613          	li	a2,-4
    9624:	02c78633          	mul	a2,a5,a2
    9628:	03c10713          	addi	a4,sp,60

0000962c <.LBB18>:
    962c:	00300693          	li	a3,3

00009630 <.L29>:
    9630:	00c705b3          	add	a1,a4,a2
    9634:	0005a583          	lw	a1,0(a1)
    9638:	fff68693          	addi	a3,a3,-1

0000963c <.LVL372>:
    963c:	ffc70713          	addi	a4,a4,-4
    9640:	00b72223          	sw	a1,4(a4)

00009644 <.LVL373>:
    9644:	fef6d6e3          	bge	a3,a5,9630 <.L29>
    9648:	fff78713          	addi	a4,a5,-1

0000964c <.L30>:
    964c:	00170793          	addi	a5,a4,1
    9650:	00279793          	slli	a5,a5,0x2
    9654:	00800693          	li	a3,8
    9658:	03010713          	addi	a4,sp,48
    965c:	00d7ea63          	bltu	a5,a3,9670 <.L32>
    9660:	02012823          	sw	zero,48(sp)
    9664:	00072223          	sw	zero,4(a4)
    9668:	ff878793          	addi	a5,a5,-8
    966c:	03810713          	addi	a4,sp,56

00009670 <.L32>:
    9670:	00400693          	li	a3,4
    9674:	00d7e463          	bltu	a5,a3,967c <.L33>
    9678:	00072023          	sw	zero,0(a4)

0000967c <.L33>:
    967c:	ffffc7b7          	lui	a5,0xffffc
    9680:	01178793          	addi	a5,a5,17 # ffffc011 <_ebss+0xfffec1c1>
    9684:	40a787b3          	sub	a5,a5,a0
    9688:	c90ff06f          	j	8b18 <.L204>

0000968c <.L31>:
    968c:	00072803          	lw	a6,0(a4)
    9690:	ffc72883          	lw	a7,-4(a4)
    9694:	00c70e33          	add	t3,a4,a2
    9698:	00d81833          	sll	a6,a6,a3
    969c:	00b8d8b3          	srl	a7,a7,a1
    96a0:	01186833          	or	a6,a6,a7
    96a4:	010e2023          	sw	a6,0(t3)
    96a8:	ffc70713          	addi	a4,a4,-4
    96ac:	efdff06f          	j	95a8 <.L28>

000096b0 <.L19>:
    96b0:	01696933          	or	s2,s2,s6
    96b4:	01596933          	or	s2,s2,s5
    96b8:	00a96933          	or	s2,s2,a0
    96bc:	00200693          	li	a3,2
    96c0:	c4090e63          	beqz	s2,8b1c <.L21>
    96c4:	00300693          	li	a3,3
    96c8:	c54ff06f          	j	8b1c <.L21>

000096cc <.L176>:
    96cc:	00000793          	li	a5,0

000096d0 <.LBE149>:
    96d0:	00100693          	li	a3,1
    96d4:	c48ff06f          	j	8b1c <.L21>

000096d8 <.L35>:
    96d8:	00100713          	li	a4,1
    96dc:	00f717b3          	sll	a5,a4,a5
  FP_MUL_Q (R, A, B);
    96e0:	5307f713          	andi	a4,a5,1328
    96e4:	04071463          	bnez	a4,972c <.L38>
    96e8:	0887f713          	andi	a4,a5,136
    96ec:	08071663          	bnez	a4,9778 <.L39>
    96f0:	2407f793          	andi	a5,a5,576
    96f4:	c6078263          	beqz	a5,8b58 <.L36>

000096f8 <.L40>:
  FP_PACK_Q (r, R);
    96f8:	000087b7          	lui	a5,0x8
    96fc:	04f12623          	sw	a5,76(sp)
    9700:	04012423          	sw	zero,72(sp)
    9704:	04012223          	sw	zero,68(sp)
    9708:	04012023          	sw	zero,64(sp)

0000970c <.LVL380>:
    970c:	fff78793          	addi	a5,a5,-1 # 7fff <.LVL163+0x7>
    9710:	00012223          	sw	zero,4(sp)
    9714:	c6dff06f          	j	9380 <.L153>

00009718 <.L34>:
  FP_MUL_Q (R, A, B);
    9718:	00f00713          	li	a4,15
    971c:	fce78ee3          	beq	a5,a4,96f8 <.L40>
    9720:	00b00713          	li	a4,11
    9724:	04e78a63          	beq	a5,a4,9778 <.L39>

00009728 <.LBB150>:
  FP_UNPACK_Q (A, a);
    9728:	01312223          	sw	s3,4(sp)

0000972c <.L38>:
  FP_MUL_Q (R, A, B);
    972c:	02012783          	lw	a5,32(sp)
    9730:	04f12023          	sw	a5,64(sp)
    9734:	02412783          	lw	a5,36(sp)
    9738:	04f12223          	sw	a5,68(sp)
    973c:	02812783          	lw	a5,40(sp)
    9740:	04f12423          	sw	a5,72(sp)
    9744:	02c12783          	lw	a5,44(sp)

00009748 <.L141>:
    9748:	04f12623          	sw	a5,76(sp)
  FP_PACK_Q (r, R);
    974c:	00200793          	li	a5,2
    9750:	28fb8263          	beq	s7,a5,99d4 <.L142>
    9754:	00300793          	li	a5,3
    9758:	fafb80e3          	beq	s7,a5,96f8 <.L40>
    975c:	00100793          	li	a5,1
    9760:	b4fb98e3          	bne	s7,a5,92b0 <.L139>

00009764 <.L205>:
    9764:	04012623          	sw	zero,76(sp)
    9768:	04012423          	sw	zero,72(sp)
    976c:	04012223          	sw	zero,68(sp)

00009770 <.LBB159>:
    9770:	04012023          	sw	zero,64(sp)
    9774:	2340006f          	j	99a8 <.L173>

00009778 <.L39>:
  FP_UNPACK_Q (B, b);
    9778:	01412223          	sw	s4,4(sp)

0000977c <.L37>:
  FP_MUL_Q (R, A, B);
    977c:	03012783          	lw	a5,48(sp)
    9780:	00068b93          	mv	s7,a3

00009784 <.LVL388>:
    9784:	04f12023          	sw	a5,64(sp)
    9788:	03412783          	lw	a5,52(sp)
    978c:	04f12223          	sw	a5,68(sp)
    9790:	03812783          	lw	a5,56(sp)
    9794:	04f12423          	sw	a5,72(sp)
    9798:	03c12783          	lw	a5,60(sp)

0000979c <.LVL389>:
    979c:	fadff06f          	j	9748 <.L141>

000097a0 <.L178>:
    97a0:	00c12783          	lw	a5,12(sp)
    97a4:	00f12423          	sw	a5,8(sp)

000097a8 <.LVL391>:
    97a8:	b09ff06f          	j	92b0 <.L139>

000097ac <.L152>:
  FP_PACK_Q (r, R);
    97ac:	04012623          	sw	zero,76(sp)
    97b0:	04012423          	sw	zero,72(sp)
    97b4:	04012223          	sw	zero,68(sp)
    97b8:	04012023          	sw	zero,64(sp)
    97bc:	fff68793          	addi	a5,a3,-1
    97c0:	bc1ff06f          	j	9380 <.L153>

000097c4 <.L144>:
    97c4:	00100693          	li	a3,1
    97c8:	00078863          	beqz	a5,97d8 <.L154>
    97cc:	40f686b3          	sub	a3,a3,a5

000097d0 <.LVL394>:
    97d0:	07400793          	li	a5,116
    97d4:	1cd7ce63          	blt	a5,a3,99b0 <.L155>

000097d8 <.L154>:
    97d8:	04010513          	addi	a0,sp,64
    97dc:	4056d713          	srai	a4,a3,0x5

000097e0 <.LVL396>:
    97e0:	00050593          	mv	a1,a0
    97e4:	01f6f693          	andi	a3,a3,31

000097e8 <.LVL397>:
    97e8:	00000793          	li	a5,0
    97ec:	00000613          	li	a2,0

000097f0 <.L156>:
    97f0:	02e61e63          	bne	a2,a4,982c <.L157>
    97f4:	00300613          	li	a2,3

000097f8 <.LVL399>:
    97f8:	40e60633          	sub	a2,a2,a4
    97fc:	00271593          	slli	a1,a4,0x2
    9800:	04069063          	bnez	a3,9840 <.L158>
    9804:	00050813          	mv	a6,a0

00009808 <.L159>:
    9808:	00b808b3          	add	a7,a6,a1
    980c:	0008a883          	lw	a7,0(a7)
    9810:	00168693          	addi	a3,a3,1

00009814 <.LVL401>:
    9814:	00480813          	addi	a6,a6,4
    9818:	ff182e23          	sw	a7,-4(a6)

0000981c <.LVL402>:
    981c:	fed656e3          	bge	a2,a3,9808 <.L159>
    9820:	00400693          	li	a3,4

00009824 <.LVL403>:
    9824:	40e68733          	sub	a4,a3,a4

00009828 <.LVL404>:
    9828:	06c0006f          	j	9894 <.L163>

0000982c <.L157>:
    982c:	0005a803          	lw	a6,0(a1)
    9830:	00160613          	addi	a2,a2,1

00009834 <.LVL406>:
    9834:	00458593          	addi	a1,a1,4
    9838:	0107e7b3          	or	a5,a5,a6

0000983c <.LVL407>:
    983c:	fb5ff06f          	j	97f0 <.L156>

00009840 <.L158>:
    9840:	05058813          	addi	a6,a1,80
    9844:	02010893          	addi	a7,sp,32
    9848:	01180833          	add	a6,a6,a7
    984c:	fd082803          	lw	a6,-48(a6)
    9850:	02000313          	li	t1,32
    9854:	40d30333          	sub	t1,t1,a3
    9858:	00681833          	sll	a6,a6,t1
    985c:	0107e7b3          	or	a5,a5,a6

00009860 <.LVL409>:
    9860:	00000e13          	li	t3,0
    9864:	00b50833          	add	a6,a0,a1
    9868:	40b005b3          	neg	a1,a1

0000986c <.L161>:
    986c:	0ece4263          	blt	t3,a2,9950 <.L162>
    9870:	00400593          	li	a1,4
    9874:	00261613          	slli	a2,a2,0x2
    9878:	40e58733          	sub	a4,a1,a4

0000987c <.LVL411>:
    987c:	05060613          	addi	a2,a2,80
    9880:	02010593          	addi	a1,sp,32
    9884:	00b60633          	add	a2,a2,a1
    9888:	04c12583          	lw	a1,76(sp)
    988c:	00d5d6b3          	srl	a3,a1,a3

00009890 <.LVL412>:
    9890:	fcd62823          	sw	a3,-48(a2)

00009894 <.L163>:
    9894:	00400693          	li	a3,4
    9898:	40e686b3          	sub	a3,a3,a4
    989c:	00269693          	slli	a3,a3,0x2
    98a0:	00271713          	slli	a4,a4,0x2
    98a4:	00800613          	li	a2,8
    98a8:	00e50733          	add	a4,a0,a4
    98ac:	00c6ea63          	bltu	a3,a2,98c0 <.L164>
    98b0:	00072023          	sw	zero,0(a4)
    98b4:	00072223          	sw	zero,4(a4)
    98b8:	ff868693          	addi	a3,a3,-8
    98bc:	00870713          	addi	a4,a4,8

000098c0 <.L164>:
    98c0:	00400613          	li	a2,4
    98c4:	00c6e463          	bltu	a3,a2,98cc <.L165>
    98c8:	00072023          	sw	zero,0(a4)

000098cc <.L165>:
    98cc:	04012703          	lw	a4,64(sp)

000098d0 <.LBB154>:
    98d0:	00f037b3          	snez	a5,a5

000098d4 <.LBE154>:
    98d4:	00e7e7b3          	or	a5,a5,a4
    98d8:	04f12023          	sw	a5,64(sp)

000098dc <.LBE152>:
    98dc:	0077f713          	andi	a4,a5,7
    98e0:	04070463          	beqz	a4,9928 <.L166>
    98e4:	00f7f713          	andi	a4,a5,15
    98e8:	00400693          	li	a3,4
    98ec:	02d70e63          	beq	a4,a3,9928 <.L166>

000098f0 <.LBB156>:
    98f0:	04412703          	lw	a4,68(sp)
    98f4:	00478793          	addi	a5,a5,4
    98f8:	04f12023          	sw	a5,64(sp)

000098fc <.LVL415>:
    98fc:	0047b793          	sltiu	a5,a5,4

00009900 <.LVL416>:
    9900:	00f707b3          	add	a5,a4,a5
    9904:	04f12223          	sw	a5,68(sp)

00009908 <.LVL417>:
    9908:	00e7b7b3          	sltu	a5,a5,a4

0000990c <.LVL418>:
    990c:	04812703          	lw	a4,72(sp)
    9910:	00f707b3          	add	a5,a4,a5

00009914 <.LVL419>:
    9914:	04f12423          	sw	a5,72(sp)

00009918 <.LVL420>:
    9918:	00e7b7b3          	sltu	a5,a5,a4

0000991c <.LVL421>:
    991c:	04c12703          	lw	a4,76(sp)
    9920:	00e787b3          	add	a5,a5,a4

00009924 <.LVL422>:
    9924:	04f12623          	sw	a5,76(sp)

00009928 <.L166>:
    9928:	04c12703          	lw	a4,76(sp)
    992c:	000807b7          	lui	a5,0x80
    9930:	00e7f7b3          	and	a5,a5,a4
    9934:	04078263          	beqz	a5,9978 <.L171>

00009938 <.LVL424>:
    9938:	04012623          	sw	zero,76(sp)
    993c:	04012423          	sw	zero,72(sp)
    9940:	04012223          	sw	zero,68(sp)
    9944:	04012023          	sw	zero,64(sp)
    9948:	00100793          	li	a5,1
    994c:	a35ff06f          	j	9380 <.L153>

00009950 <.L162>:
    9950:	00082883          	lw	a7,0(a6)
    9954:	00482e83          	lw	t4,4(a6)
    9958:	00b80f33          	add	t5,a6,a1
    995c:	00d8d8b3          	srl	a7,a7,a3
    9960:	006e9eb3          	sll	t4,t4,t1
    9964:	01d8e8b3          	or	a7,a7,t4
    9968:	011f2023          	sw	a7,0(t5)

0000996c <.LVL426>:
    996c:	001e0e13          	addi	t3,t3,1

00009970 <.LVL427>:
    9970:	00480813          	addi	a6,a6,4
    9974:	ef9ff06f          	j	986c <.L161>

00009978 <.L171>:
    9978:	00c50693          	addi	a3,a0,12

0000997c <.L172>:
    997c:	00052783          	lw	a5,0(a0)
    9980:	00452703          	lw	a4,4(a0)
    9984:	00450513          	addi	a0,a0,4
    9988:	0037d793          	srli	a5,a5,0x3
    998c:	01d71713          	slli	a4,a4,0x1d
    9990:	00e7e7b3          	or	a5,a5,a4
    9994:	fef52e23          	sw	a5,-4(a0)
    9998:	fea692e3          	bne	a3,a0,997c <.L172>

0000999c <.LVL429>:
    999c:	04c12783          	lw	a5,76(sp)
    99a0:	0037d793          	srli	a5,a5,0x3
    99a4:	04f12623          	sw	a5,76(sp)

000099a8 <.L173>:
    99a8:	00000793          	li	a5,0
    99ac:	9d5ff06f          	j	9380 <.L153>

000099b0 <.L155>:
    99b0:	04412703          	lw	a4,68(sp)
    99b4:	04012783          	lw	a5,64(sp)
    99b8:	00e7e7b3          	or	a5,a5,a4
    99bc:	04812703          	lw	a4,72(sp)
    99c0:	00e7e7b3          	or	a5,a5,a4
    99c4:	04c12703          	lw	a4,76(sp)
    99c8:	00e7e7b3          	or	a5,a5,a4
    99cc:	fc078ee3          	beqz	a5,99a8 <.L173>
    99d0:	d95ff06f          	j	9764 <.L205>

000099d4 <.L142>:
    99d4:	000087b7          	lui	a5,0x8
    99d8:	04012623          	sw	zero,76(sp)
    99dc:	04012423          	sw	zero,72(sp)
    99e0:	04012223          	sw	zero,68(sp)
    99e4:	04012023          	sw	zero,64(sp)
    99e8:	fff78793          	addi	a5,a5,-1 # 7fff <.LVL163+0x7>
    99ec:	995ff06f          	j	9380 <.L153>

000099f0 <__subtf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__subtf3 (TFtype a, TFtype b)
{
    99f0:	f9010113          	addi	sp,sp,-112
    99f4:	0085a783          	lw	a5,8(a1)
    99f8:	05512a23          	sw	s5,84(sp)
    99fc:	00c5aa83          	lw	s5,12(a1)
    9a00:	0045a703          	lw	a4,4(a1)
    9a04:	05412c23          	sw	s4,88(sp)
    9a08:	00050a13          	mv	s4,a0
    9a0c:	0005a503          	lw	a0,0(a1)
    9a10:	05312e23          	sw	s3,92(sp)

00009a14 <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_Q (A, a);
    9a14:	02f12c23          	sw	a5,56(sp)
    9a18:	00f12c23          	sw	a5,24(sp)

00009a1c <.LBE3>:
{
    9a1c:	00062883          	lw	a7,0(a2)

00009a20 <.LBB4>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    9a20:	010a9793          	slli	a5,s5,0x10

00009a24 <.LBE4>:
{
    9a24:	00462803          	lw	a6,4(a2)
    9a28:	00862683          	lw	a3,8(a2)
    9a2c:	00c62983          	lw	s3,12(a2)
    9a30:	06912223          	sw	s1,100(sp)

00009a34 <.LBB5>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    9a34:	0107d793          	srli	a5,a5,0x10
    9a38:	001a9493          	slli	s1,s5,0x1
    9a3c:	02a12823          	sw	a0,48(sp)
    9a40:	03512e23          	sw	s5,60(sp)
    9a44:	00a12823          	sw	a0,16(sp)

00009a48 <.LBE5>:
{
    9a48:	06112623          	sw	ra,108(sp)
    9a4c:	06812423          	sw	s0,104(sp)
    9a50:	07212023          	sw	s2,96(sp)
    9a54:	05612823          	sw	s6,80(sp)
    9a58:	05712623          	sw	s7,76(sp)
    9a5c:	05812423          	sw	s8,72(sp)

00009a60 <.LBB6>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    9a60:	02e12a23          	sw	a4,52(sp)
    9a64:	00e12a23          	sw	a4,20(sp)
    9a68:	00f12e23          	sw	a5,28(sp)
    9a6c:	0114d493          	srli	s1,s1,0x11

00009a70 <.LVL2>:
    9a70:	01fada93          	srli	s5,s5,0x1f

00009a74 <.LBB7>:
    9a74:	01010513          	addi	a0,sp,16
    9a78:	01c10593          	addi	a1,sp,28

00009a7c <.L2>:
    9a7c:	0005a783          	lw	a5,0(a1)
    9a80:	ffc5a703          	lw	a4,-4(a1)
    9a84:	ffc58593          	addi	a1,a1,-4
    9a88:	00379793          	slli	a5,a5,0x3
    9a8c:	01d75713          	srli	a4,a4,0x1d
    9a90:	00e7e7b3          	or	a5,a5,a4
    9a94:	00f5a223          	sw	a5,4(a1)
    9a98:	feb512e3          	bne	a0,a1,9a7c <.L2>

00009a9c <.LVL5>:
    9a9c:	01012783          	lw	a5,16(sp)

00009aa0 <.LBB8>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    9aa0:	01099713          	slli	a4,s3,0x10
    9aa4:	00199b93          	slli	s7,s3,0x1

00009aa8 <.LBB9>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    9aa8:	00379793          	slli	a5,a5,0x3

00009aac <.LBB10>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    9aac:	01075713          	srli	a4,a4,0x10
    9ab0:	03112823          	sw	a7,48(sp)
    9ab4:	03012a23          	sw	a6,52(sp)
    9ab8:	03312e23          	sw	s3,60(sp)
    9abc:	03112023          	sw	a7,32(sp)
    9ac0:	03012223          	sw	a6,36(sp)

00009ac4 <.LBB11>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    9ac4:	00f12823          	sw	a5,16(sp)

00009ac8 <.LBB12>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    9ac8:	02d12c23          	sw	a3,56(sp)
    9acc:	02d12423          	sw	a3,40(sp)
    9ad0:	02e12623          	sw	a4,44(sp)
    9ad4:	011bdb93          	srli	s7,s7,0x11

00009ad8 <.LVL6>:
    9ad8:	01f9d993          	srli	s3,s3,0x1f

00009adc <.LBB13>:
    9adc:	02010813          	addi	a6,sp,32
    9ae0:	02c10893          	addi	a7,sp,44

00009ae4 <.L3>:
    9ae4:	0008a703          	lw	a4,0(a7)
    9ae8:	ffc8a683          	lw	a3,-4(a7)
    9aec:	ffc88893          	addi	a7,a7,-4
    9af0:	00371713          	slli	a4,a4,0x3
    9af4:	01d6d693          	srli	a3,a3,0x1d
    9af8:	00d76733          	or	a4,a4,a3
    9afc:	00e8a223          	sw	a4,4(a7)
    9b00:	ff1812e3          	bne	a6,a7,9ae4 <.L3>

00009b04 <.LVL9>:
    9b04:	02012403          	lw	s0,32(sp)

00009b08 <.LBE13>:
  FP_SUB_Q (R, A, B);
    9b08:	00008e37          	lui	t3,0x8
    9b0c:	fffe0e13          	addi	t3,t3,-1 # 7fff <.LVL163+0x7>

00009b10 <.LBB14>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    9b10:	00341413          	slli	s0,s0,0x3
    9b14:	02812023          	sw	s0,32(sp)

00009b18 <.LBE14>:
  FP_SUB_Q (R, A, B);
    9b18:	41748333          	sub	t1,s1,s7
    9b1c:	07cb9e63          	bne	s7,t3,9b98 <.L4>
    9b20:	02812683          	lw	a3,40(sp)
    9b24:	02412703          	lw	a4,36(sp)

00009b28 <.LBB15>:
    9b28:	00030e93          	mv	t4,t1

00009b2c <.LBE15>:
    9b2c:	00d76733          	or	a4,a4,a3
    9b30:	02c12683          	lw	a3,44(sp)
    9b34:	00d76733          	or	a4,a4,a3
    9b38:	00876733          	or	a4,a4,s0
    9b3c:	04070a63          	beqz	a4,9b90 <.L5>

00009b40 <.L350>:
    9b40:	333a98e3          	bne	s5,s3,a670 <.L7>

00009b44 <.L6>:
    9b44:	02412903          	lw	s2,36(sp)
    9b48:	02812983          	lw	s3,40(sp)

00009b4c <.LVL11>:
    9b4c:	02c12b03          	lw	s6,44(sp)

00009b50 <.LBB54>:
    9b50:	6c030263          	beqz	t1,a214 <.L48>
    9b54:	409b8833          	sub	a6,s7,s1

00009b58 <.LVL12>:
    9b58:	50049e63          	bnez	s1,a074 <.L49>
    9b5c:	01412683          	lw	a3,20(sp)
    9b60:	01812703          	lw	a4,24(sp)
    9b64:	01c12883          	lw	a7,28(sp)
    9b68:	00e6e633          	or	a2,a3,a4
    9b6c:	01166633          	or	a2,a2,a7
    9b70:	00f66633          	or	a2,a2,a5
    9b74:	48061463          	bnez	a2,9ffc <.L50>

00009b78 <.LVL13>:
    9b78:	02812823          	sw	s0,48(sp)
    9b7c:	03212a23          	sw	s2,52(sp)
    9b80:	03312c23          	sw	s3,56(sp)
    9b84:	03612e23          	sw	s6,60(sp)

00009b88 <.L359>:
    9b88:	00080493          	mv	s1,a6

00009b8c <.LVL15>:
    9b8c:	0f00006f          	j	9c7c <.L11>

00009b90 <.L5>:
    9b90:	0019c993          	xori	s3,s3,1

00009b94 <.LVL17>:
    9b94:	fadff06f          	j	9b40 <.L350>

00009b98 <.L4>:
    9b98:	0019c993          	xori	s3,s3,1

00009b9c <.LBB113>:
    9b9c:	00030e93          	mv	t4,t1

00009ba0 <.LBE113>:
    9ba0:	073a90e3          	bne	s5,s3,a400 <.L8>

00009ba4 <.LBB114>:
    9ba4:	fa6050e3          	blez	t1,9b44 <.L6>

00009ba8 <.LVL21>:
    9ba8:	01412903          	lw	s2,20(sp)
    9bac:	01812983          	lw	s3,24(sp)

00009bb0 <.LVL22>:
    9bb0:	01c12b03          	lw	s6,28(sp)
    9bb4:	0a0b9a63          	bnez	s7,9c68 <.L9>
    9bb8:	02412683          	lw	a3,36(sp)
    9bbc:	02812703          	lw	a4,40(sp)
    9bc0:	02c12583          	lw	a1,44(sp)
    9bc4:	00e6e633          	or	a2,a3,a4
    9bc8:	00b66633          	or	a2,a2,a1
    9bcc:	00866633          	or	a2,a2,s0
    9bd0:	00061e63          	bnez	a2,9bec <.L10>

00009bd4 <.L355>:
    9bd4:	02f12823          	sw	a5,48(sp)
    9bd8:	03212a23          	sw	s2,52(sp)
    9bdc:	03312c23          	sw	s3,56(sp)
    9be0:	03612e23          	sw	s6,60(sp)

00009be4 <.LBB116>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    9be4:	00030493          	mv	s1,t1

00009be8 <.LVL25>:
    9be8:	0940006f          	j	9c7c <.L11>

00009bec <.L10>:
  FP_SUB_Q (R, A, B);
    9bec:	fff30613          	addi	a2,t1,-1

00009bf0 <.LVL27>:
    9bf0:	04061863          	bnez	a2,9c40 <.L12>

00009bf4 <.LBB16>:
    9bf4:	00878433          	add	s0,a5,s0
    9bf8:	01268933          	add	s2,a3,s2
    9bfc:	02812823          	sw	s0,48(sp)

00009c00 <.LVL28>:
    9c00:	00f43433          	sltu	s0,s0,a5

00009c04 <.LVL29>:
    9c04:	00890433          	add	s0,s2,s0

00009c08 <.LVL30>:
    9c08:	02812a23          	sw	s0,52(sp)

00009c0c <.LVL31>:
    9c0c:	00d936b3          	sltu	a3,s2,a3

00009c10 <.LVL32>:
    9c10:	01243433          	sltu	s0,s0,s2

00009c14 <.LVL33>:
    9c14:	013709b3          	add	s3,a4,s3

00009c18 <.LVL34>:
    9c18:	0086e6b3          	or	a3,a3,s0

00009c1c <.LVL35>:
    9c1c:	00d986b3          	add	a3,s3,a3
    9c20:	02d12c23          	sw	a3,56(sp)

00009c24 <.LVL36>:
    9c24:	00e9b7b3          	sltu	a5,s3,a4

00009c28 <.LVL37>:
    9c28:	0136b6b3          	sltu	a3,a3,s3

00009c2c <.LVL38>:
    9c2c:	00d7e7b3          	or	a5,a5,a3

00009c30 <.LVL39>:
    9c30:	016585b3          	add	a1,a1,s6
    9c34:	00b787b3          	add	a5,a5,a1

00009c38 <.L351>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    9c38:	00100493          	li	s1,1

00009c3c <.LBB120>:
  FP_SUB_Q (R, A, B);
    9c3c:	3080006f          	j	9f44 <.L23>

00009c40 <.L12>:
    9c40:	01c30463          	beq	t1,t3,9c48 <.L361>
    9c44:	20c0106f          	j	ae50 <.L24>

00009c48 <.L361>:
    9c48:	02f12823          	sw	a5,48(sp)
    9c4c:	4100006f          	j	a05c <.L360>

00009c50 <.L265>:
    9c50:	00040793          	mv	a5,s0
    9c54:	ff5ff06f          	j	9c48 <.L361>

00009c58 <.L266>:
    9c58:	00068913          	mv	s2,a3
    9c5c:	00070993          	mv	s3,a4
    9c60:	00060b13          	mv	s6,a2

00009c64 <.LVL45>:
    9c64:	fe5ff06f          	j	9c48 <.L361>

00009c68 <.L9>:
    9c68:	17c49c63          	bne	s1,t3,9de0 <.L25>

00009c6c <.LVL47>:
    9c6c:	02f12823          	sw	a5,48(sp)
    9c70:	03212a23          	sw	s2,52(sp)
    9c74:	03312c23          	sw	s3,56(sp)
    9c78:	03612e23          	sw	s6,60(sp)

00009c7c <.L11>:
  FP_PACK_SEMIRAW_Q (r, R);
    9c7c:	03012783          	lw	a5,48(sp)
    9c80:	0077f713          	andi	a4,a5,7
    9c84:	04070463          	beqz	a4,9ccc <.L251>
    9c88:	00f7f713          	andi	a4,a5,15
    9c8c:	00400693          	li	a3,4
    9c90:	02d70e63          	beq	a4,a3,9ccc <.L251>

00009c94 <.LBB109>:
    9c94:	03412703          	lw	a4,52(sp)
    9c98:	00478793          	addi	a5,a5,4
    9c9c:	02f12823          	sw	a5,48(sp)

00009ca0 <.LVL49>:
    9ca0:	0047b793          	sltiu	a5,a5,4

00009ca4 <.LVL50>:
    9ca4:	00f707b3          	add	a5,a4,a5
    9ca8:	02f12a23          	sw	a5,52(sp)

00009cac <.LVL51>:
    9cac:	00e7b7b3          	sltu	a5,a5,a4

00009cb0 <.LVL52>:
    9cb0:	03812703          	lw	a4,56(sp)
    9cb4:	00f707b3          	add	a5,a4,a5

00009cb8 <.LVL53>:
    9cb8:	02f12c23          	sw	a5,56(sp)

00009cbc <.LVL54>:
    9cbc:	00e7b7b3          	sltu	a5,a5,a4

00009cc0 <.LVL55>:
    9cc0:	03c12703          	lw	a4,60(sp)
    9cc4:	00e787b3          	add	a5,a5,a4

00009cc8 <.LVL56>:
    9cc8:	02f12e23          	sw	a5,60(sp)

00009ccc <.L251>:
    9ccc:	03c12783          	lw	a5,60(sp)
    9cd0:	00080737          	lui	a4,0x80
    9cd4:	00e7f733          	and	a4,a5,a4
    9cd8:	02070463          	beqz	a4,9d00 <.L256>
    9cdc:	00008737          	lui	a4,0x8
    9ce0:	00148493          	addi	s1,s1,1

00009ce4 <.LVL58>:
    9ce4:	fff70713          	addi	a4,a4,-1 # 7fff <.LVL163+0x7>
    9ce8:	00e49463          	bne	s1,a4,9cf0 <.LVL58+0xc>
    9cec:	1500106f          	j	ae3c <.L257>
    9cf0:	fff80737          	lui	a4,0xfff80
    9cf4:	fff70713          	addi	a4,a4,-1 # fff7ffff <_ebss+0xfff701af>
    9cf8:	00e7f7b3          	and	a5,a5,a4
    9cfc:	02f12e23          	sw	a5,60(sp)

00009d00 <.L256>:
    9d00:	03010793          	addi	a5,sp,48
    9d04:	03c10613          	addi	a2,sp,60

00009d08 <.L259>:
    9d08:	0007a703          	lw	a4,0(a5)
    9d0c:	0047a683          	lw	a3,4(a5)
    9d10:	00478793          	addi	a5,a5,4
    9d14:	00375713          	srli	a4,a4,0x3
    9d18:	01d69693          	slli	a3,a3,0x1d
    9d1c:	00d76733          	or	a4,a4,a3
    9d20:	fee7ae23          	sw	a4,-4(a5)
    9d24:	fef612e3          	bne	a2,a5,9d08 <.L259>

00009d28 <.LVL61>:
    9d28:	03c12703          	lw	a4,60(sp)

00009d2c <.LBE110>:
    9d2c:	000086b7          	lui	a3,0x8
    9d30:	fff68793          	addi	a5,a3,-1 # 7fff <.LVL163+0x7>

00009d34 <.LBB111>:
    9d34:	00375713          	srli	a4,a4,0x3
    9d38:	02e12e23          	sw	a4,60(sp)

00009d3c <.LBE111>:
    9d3c:	02f49a63          	bne	s1,a5,9d70 <.L260>
    9d40:	03412603          	lw	a2,52(sp)
    9d44:	03012783          	lw	a5,48(sp)
    9d48:	00c7e7b3          	or	a5,a5,a2
    9d4c:	03812603          	lw	a2,56(sp)
    9d50:	00c7e7b3          	or	a5,a5,a2
    9d54:	00e7e7b3          	or	a5,a5,a4
    9d58:	00078c63          	beqz	a5,9d70 <.L260>
    9d5c:	02d12e23          	sw	a3,60(sp)
    9d60:	02012c23          	sw	zero,56(sp)
    9d64:	02012a23          	sw	zero,52(sp)
    9d68:	02012823          	sw	zero,48(sp)

00009d6c <.LVL62>:
    9d6c:	00000a93          	li	s5,0

00009d70 <.L260>:
    9d70:	03c12783          	lw	a5,60(sp)
    9d74:	01149493          	slli	s1,s1,0x11

00009d78 <.LVL64>:
    9d78:	0114d493          	srli	s1,s1,0x11
    9d7c:	00f11623          	sh	a5,12(sp)

00009d80 <.LBE125>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    9d80:	03012783          	lw	a5,48(sp)

00009d84 <.LBB126>:
  FP_PACK_SEMIRAW_Q (r, R);
    9d84:	00fa9a93          	slli	s5,s5,0xf

00009d88 <.LVL65>:
    9d88:	009aeab3          	or	s5,s5,s1

00009d8c <.LBE126>:
  return r;
    9d8c:	00fa2023          	sw	a5,0(s4)
    9d90:	03412783          	lw	a5,52(sp)

00009d94 <.LBB127>:
  FP_PACK_SEMIRAW_Q (r, R);
    9d94:	01511723          	sh	s5,14(sp)

00009d98 <.LBE127>:
}
    9d98:	06c12083          	lw	ra,108(sp)
  return r;
    9d9c:	00fa2223          	sw	a5,4(s4)
    9da0:	03812783          	lw	a5,56(sp)

00009da4 <.LVL67>:
}
    9da4:	06812403          	lw	s0,104(sp)
    9da8:	06412483          	lw	s1,100(sp)
  return r;
    9dac:	00fa2423          	sw	a5,8(s4)
    9db0:	00c12783          	lw	a5,12(sp)
}
    9db4:	06012903          	lw	s2,96(sp)
    9db8:	05c12983          	lw	s3,92(sp)
  return r;
    9dbc:	00fa2623          	sw	a5,12(s4)
}
    9dc0:	05412a83          	lw	s5,84(sp)
    9dc4:	05012b03          	lw	s6,80(sp)
    9dc8:	04c12b83          	lw	s7,76(sp)

00009dcc <.LVL68>:
    9dcc:	04812c03          	lw	s8,72(sp)
    9dd0:	000a0513          	mv	a0,s4
    9dd4:	05812a03          	lw	s4,88(sp)
    9dd8:	07010113          	addi	sp,sp,112

00009ddc <.LVL70>:
    9ddc:	00008067          	ret

00009de0 <.L25>:
  FP_SUB_Q (R, A, B);
    9de0:	02c12703          	lw	a4,44(sp)
    9de4:	000806b7          	lui	a3,0x80
    9de8:	00d76733          	or	a4,a4,a3
    9dec:	02e12623          	sw	a4,44(sp)

00009df0 <.LDL1>:
    9df0:	07400713          	li	a4,116
    9df4:	00675463          	bge	a4,t1,9dfc <.LDL1+0xc>
    9df8:	0640106f          	j	ae5c <.L26>
    9dfc:	00030613          	mv	a2,t1

00009e00 <.L261>:
    9e00:	40565693          	srai	a3,a2,0x5

00009e04 <.LBB129>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    9e04:	00088513          	mv	a0,a7

00009e08 <.LBB130>:
  FP_SUB_Q (R, A, B);
    9e08:	01f67613          	andi	a2,a2,31

00009e0c <.LVL74>:
    9e0c:	00000713          	li	a4,0
    9e10:	00000593          	li	a1,0

00009e14 <.L27>:
    9e14:	02d59c63          	bne	a1,a3,9e4c <.L28>
    9e18:	00300593          	li	a1,3

00009e1c <.LVL76>:
    9e1c:	40d585b3          	sub	a1,a1,a3
    9e20:	00269513          	slli	a0,a3,0x2
    9e24:	02061e63          	bnez	a2,9e60 <.L29>

00009e28 <.L30>:
    9e28:	00a88333          	add	t1,a7,a0
    9e2c:	00032303          	lw	t1,0(t1)
    9e30:	00160613          	addi	a2,a2,1

00009e34 <.LVL78>:
    9e34:	00488893          	addi	a7,a7,4
    9e38:	fe68ae23          	sw	t1,-4(a7)

00009e3c <.LVL79>:
    9e3c:	fec5d6e3          	bge	a1,a2,9e28 <.L30>
    9e40:	00400613          	li	a2,4

00009e44 <.LVL80>:
    9e44:	40d606b3          	sub	a3,a2,a3

00009e48 <.LVL81>:
    9e48:	0640006f          	j	9eac <.L34>

00009e4c <.L28>:
    9e4c:	00052303          	lw	t1,0(a0)
    9e50:	00158593          	addi	a1,a1,1

00009e54 <.LVL83>:
    9e54:	00450513          	addi	a0,a0,4
    9e58:	00676733          	or	a4,a4,t1

00009e5c <.LVL84>:
    9e5c:	fb9ff06f          	j	9e14 <.L27>

00009e60 <.L29>:
    9e60:	04050893          	addi	a7,a0,64
    9e64:	002888b3          	add	a7,a7,sp
    9e68:	fe08a883          	lw	a7,-32(a7)
    9e6c:	02000e13          	li	t3,32
    9e70:	40ce0e33          	sub	t3,t3,a2
    9e74:	01c898b3          	sll	a7,a7,t3
    9e78:	01176733          	or	a4,a4,a7

00009e7c <.LVL86>:
    9e7c:	00000e93          	li	t4,0
    9e80:	00a808b3          	add	a7,a6,a0
    9e84:	40a00533          	neg	a0,a0

00009e88 <.L32>:
    9e88:	14bec663          	blt	t4,a1,9fd4 <.L33>
    9e8c:	00400513          	li	a0,4
    9e90:	40d506b3          	sub	a3,a0,a3

00009e94 <.LVL88>:
    9e94:	02c12503          	lw	a0,44(sp)
    9e98:	00259593          	slli	a1,a1,0x2

00009e9c <.LVL89>:
    9e9c:	04058593          	addi	a1,a1,64
    9ea0:	002585b3          	add	a1,a1,sp
    9ea4:	00c55633          	srl	a2,a0,a2

00009ea8 <.LVL90>:
    9ea8:	fec5a023          	sw	a2,-32(a1)

00009eac <.L34>:
    9eac:	00400613          	li	a2,4
    9eb0:	40d60633          	sub	a2,a2,a3
    9eb4:	00261613          	slli	a2,a2,0x2
    9eb8:	00269693          	slli	a3,a3,0x2
    9ebc:	00800593          	li	a1,8
    9ec0:	00d806b3          	add	a3,a6,a3
    9ec4:	00b66a63          	bltu	a2,a1,9ed8 <.L35>
    9ec8:	0006a023          	sw	zero,0(a3) # 80000 <_ebss+0x701b0>

00009ecc <.LVL92>:
    9ecc:	0006a223          	sw	zero,4(a3)
    9ed0:	ff860613          	addi	a2,a2,-8
    9ed4:	00868693          	addi	a3,a3,8

00009ed8 <.L35>:
    9ed8:	00400593          	li	a1,4
    9edc:	00b66463          	bltu	a2,a1,9ee4 <.L36>
    9ee0:	0006a023          	sw	zero,0(a3)

00009ee4 <.L36>:
    9ee4:	02012683          	lw	a3,32(sp)

00009ee8 <.LBB20>:
    9ee8:	00e03733          	snez	a4,a4

00009eec <.LBE20>:
    9eec:	00d76733          	or	a4,a4,a3

00009ef0 <.L37>:
    9ef0:	02412683          	lw	a3,36(sp)

00009ef4 <.LBB23>:
    9ef4:	02e12023          	sw	a4,32(sp)

00009ef8 <.LBB24>:
    9ef8:	00e78733          	add	a4,a5,a4
    9efc:	01268933          	add	s2,a3,s2
    9f00:	02e12823          	sw	a4,48(sp)

00009f04 <.LVL96>:
    9f04:	00f73733          	sltu	a4,a4,a5

00009f08 <.LVL97>:
    9f08:	02812783          	lw	a5,40(sp)
    9f0c:	00e90733          	add	a4,s2,a4

00009f10 <.LVL98>:
    9f10:	02e12a23          	sw	a4,52(sp)

00009f14 <.LVL99>:
    9f14:	00d936b3          	sltu	a3,s2,a3

00009f18 <.LVL100>:
    9f18:	01273733          	sltu	a4,a4,s2

00009f1c <.LVL101>:
    9f1c:	013789b3          	add	s3,a5,s3

00009f20 <.LVL102>:
    9f20:	00e6e733          	or	a4,a3,a4

00009f24 <.LVL103>:
    9f24:	00e98733          	add	a4,s3,a4
    9f28:	02e12c23          	sw	a4,56(sp)

00009f2c <.LVL104>:
    9f2c:	00f9b7b3          	sltu	a5,s3,a5

00009f30 <.LVL105>:
    9f30:	01373733          	sltu	a4,a4,s3

00009f34 <.LVL106>:
    9f34:	00e7e7b3          	or	a5,a5,a4

00009f38 <.LVL107>:
    9f38:	02c12703          	lw	a4,44(sp)

00009f3c <.LVL108>:
    9f3c:	00eb0733          	add	a4,s6,a4
    9f40:	00e787b3          	add	a5,a5,a4

00009f44 <.L23>:
    9f44:	00080737          	lui	a4,0x80

00009f48 <.LBB25>:
    9f48:	02f12e23          	sw	a5,60(sp)

00009f4c <.LBE25>:
    9f4c:	00e7f733          	and	a4,a5,a4
    9f50:	d20706e3          	beqz	a4,9c7c <.L11>
    9f54:	fff80737          	lui	a4,0xfff80
    9f58:	fff70713          	addi	a4,a4,-1 # fff7ffff <_ebss+0xfff701af>
    9f5c:	00e7f7b3          	and	a5,a5,a4
    9f60:	02f12e23          	sw	a5,60(sp)

00009f64 <.LBB26>:
    9f64:	03012783          	lw	a5,48(sp)

00009f68 <.LBE26>:
    9f68:	00148493          	addi	s1,s1,1

00009f6c <.LBB28>:
    9f6c:	03c10593          	addi	a1,sp,60
    9f70:	01f79713          	slli	a4,a5,0x1f

00009f74 <.LVL112>:
    9f74:	03010793          	addi	a5,sp,48

00009f78 <.L119>:
    9f78:	0007a683          	lw	a3,0(a5)
    9f7c:	0047a603          	lw	a2,4(a5)
    9f80:	00478793          	addi	a5,a5,4
    9f84:	0016d693          	srli	a3,a3,0x1
    9f88:	01f61613          	slli	a2,a2,0x1f
    9f8c:	00c6e6b3          	or	a3,a3,a2
    9f90:	fed7ae23          	sw	a3,-4(a5)
    9f94:	fef592e3          	bne	a1,a5,9f78 <.L119>

00009f98 <.LVL114>:
    9f98:	03c12783          	lw	a5,60(sp)
    9f9c:	0017d793          	srli	a5,a5,0x1
    9fa0:	02f12e23          	sw	a5,60(sp)

00009fa4 <.LBB29>:
    9fa4:	00e037b3          	snez	a5,a4

00009fa8 <.LBE29>:
    9fa8:	03012703          	lw	a4,48(sp)

00009fac <.LVL116>:
    9fac:	00f767b3          	or	a5,a4,a5
    9fb0:	02f12823          	sw	a5,48(sp)

00009fb4 <.LBE30>:
    9fb4:	000087b7          	lui	a5,0x8
    9fb8:	fff78793          	addi	a5,a5,-1 # 7fff <.LVL163+0x7>
    9fbc:	ccf490e3          	bne	s1,a5,9c7c <.L11>

00009fc0 <.LVL117>:
    9fc0:	02012e23          	sw	zero,60(sp)
    9fc4:	02012c23          	sw	zero,56(sp)
    9fc8:	02012a23          	sw	zero,52(sp)
    9fcc:	02012823          	sw	zero,48(sp)

00009fd0 <.LBB131>:
  FP_PACK_SEMIRAW_Q (r, R);
    9fd0:	cadff06f          	j	9c7c <.L11>

00009fd4 <.L33>:
  FP_SUB_Q (R, A, B);
    9fd4:	0008a303          	lw	t1,0(a7)
    9fd8:	0048af03          	lw	t5,4(a7)
    9fdc:	00a88fb3          	add	t6,a7,a0
    9fe0:	00c35333          	srl	t1,t1,a2
    9fe4:	01cf1f33          	sll	t5,t5,t3
    9fe8:	01e36333          	or	t1,t1,t5
    9fec:	006fa023          	sw	t1,0(t6)

00009ff0 <.LVL120>:
    9ff0:	001e8e93          	addi	t4,t4,1

00009ff4 <.LVL121>:
    9ff4:	00488893          	addi	a7,a7,4
    9ff8:	e91ff06f          	j	9e88 <.L32>

00009ffc <.L50>:
    9ffc:	fff80613          	addi	a2,a6,-1

0000a000 <.LVL123>:
    a000:	04061663          	bnez	a2,a04c <.L51>

0000a004 <.LBB32>:
    a004:	00878433          	add	s0,a5,s0
    a008:	01268933          	add	s2,a3,s2
    a00c:	02812823          	sw	s0,48(sp)

0000a010 <.LVL124>:
    a010:	00f43433          	sltu	s0,s0,a5

0000a014 <.LVL125>:
    a014:	00890433          	add	s0,s2,s0

0000a018 <.LVL126>:
    a018:	02812a23          	sw	s0,52(sp)

0000a01c <.LVL127>:
    a01c:	00d936b3          	sltu	a3,s2,a3

0000a020 <.LVL128>:
    a020:	01243433          	sltu	s0,s0,s2

0000a024 <.LVL129>:
    a024:	013709b3          	add	s3,a4,s3

0000a028 <.LVL130>:
    a028:	0086e6b3          	or	a3,a3,s0

0000a02c <.LVL131>:
    a02c:	00d986b3          	add	a3,s3,a3
    a030:	02d12c23          	sw	a3,56(sp)

0000a034 <.LVL132>:
    a034:	00e9b7b3          	sltu	a5,s3,a4

0000a038 <.LVL133>:
    a038:	0136b6b3          	sltu	a3,a3,s3

0000a03c <.LVL134>:
    a03c:	00d7e7b3          	or	a5,a5,a3

0000a040 <.LVL135>:
    a040:	016888b3          	add	a7,a7,s6
    a044:	011787b3          	add	a5,a5,a7
    a048:	bf1ff06f          	j	9c38 <.L351>

0000a04c <.L51>:
    a04c:	000087b7          	lui	a5,0x8
    a050:	fff78793          	addi	a5,a5,-1 # 7fff <.LVL163+0x7>
    a054:	60f81ee3          	bne	a6,a5,ae70 <.L62>

0000a058 <.L63>:
    a058:	02812823          	sw	s0,48(sp)

0000a05c <.L360>:
    a05c:	03212a23          	sw	s2,52(sp)
    a060:	03312c23          	sw	s3,56(sp)
    a064:	03612e23          	sw	s6,60(sp)

0000a068 <.LBB135>:
  FP_PACK_SEMIRAW_Q (r, R);
    a068:	38c0006f          	j	a3f4 <.L357>

0000a06c <.L267>:
    a06c:	00078413          	mv	s0,a5
    a070:	fe9ff06f          	j	a058 <.L63>

0000a074 <.L49>:
  FP_SUB_Q (R, A, B);
    a074:	000087b7          	lui	a5,0x8
    a078:	fff78793          	addi	a5,a5,-1 # 7fff <.LVL163+0x7>
    a07c:	fcfb8ee3          	beq	s7,a5,a058 <.L63>
    a080:	01c12783          	lw	a5,28(sp)
    a084:	00080737          	lui	a4,0x80
    a088:	00e7e7b3          	or	a5,a5,a4
    a08c:	00f12e23          	sw	a5,28(sp)

0000a090 <.LDL2>:
    a090:	07400793          	li	a5,116
    a094:	5f07c2e3          	blt	a5,a6,ae78 <.L64>
    a098:	00080613          	mv	a2,a6

0000a09c <.L262>:
    a09c:	02000713          	li	a4,32
    a0a0:	02e64733          	div	a4,a2,a4

0000a0a4 <.LBB138>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    a0a4:	00058693          	mv	a3,a1

0000a0a8 <.LBB139>:
  FP_SUB_Q (R, A, B);
    a0a8:	00000493          	li	s1,0

0000a0ac <.LVL143>:
    a0ac:	00000793          	li	a5,0

0000a0b0 <.L65>:
    a0b0:	02e7ce63          	blt	a5,a4,a0ec <.L66>
    a0b4:	00300793          	li	a5,3

0000a0b8 <.LVL145>:
    a0b8:	01f67893          	andi	a7,a2,31
    a0bc:	40e787b3          	sub	a5,a5,a4
    a0c0:	00271813          	slli	a6,a4,0x2
    a0c4:	02089e63          	bnez	a7,a100 <.L67>

0000a0c8 <.L68>:
    a0c8:	010586b3          	add	a3,a1,a6
    a0cc:	0006a683          	lw	a3,0(a3)
    a0d0:	00188893          	addi	a7,a7,1

0000a0d4 <.LVL147>:
    a0d4:	00458593          	addi	a1,a1,4
    a0d8:	fed5ae23          	sw	a3,-4(a1)

0000a0dc <.LVL148>:
    a0dc:	ff17d6e3          	bge	a5,a7,a0c8 <.L68>
    a0e0:	00400793          	li	a5,4
    a0e4:	40e78733          	sub	a4,a5,a4

0000a0e8 <.LVL149>:
    a0e8:	0780006f          	j	a160 <.L73>

0000a0ec <.L66>:
    a0ec:	0006a803          	lw	a6,0(a3)
    a0f0:	00178793          	addi	a5,a5,1

0000a0f4 <.LVL151>:
    a0f4:	00468693          	addi	a3,a3,4
    a0f8:	0104e4b3          	or	s1,s1,a6

0000a0fc <.LVL152>:
    a0fc:	fb5ff06f          	j	a0b0 <.L65>

0000a100 <.L67>:
    a100:	02000693          	li	a3,32
    a104:	02d66633          	rem	a2,a2,a3

0000a108 <.LVL154>:
    a108:	40c68633          	sub	a2,a3,a2
    a10c:	00070693          	mv	a3,a4
    a110:	00075463          	bgez	a4,a118 <.L70>

0000a114 <.LVL155>:
    a114:	00000693          	li	a3,0

0000a118 <.L70>:
    a118:	00269693          	slli	a3,a3,0x2
    a11c:	04068693          	addi	a3,a3,64
    a120:	002686b3          	add	a3,a3,sp
    a124:	fd06a683          	lw	a3,-48(a3)
    a128:	00000313          	li	t1,0
    a12c:	00c696b3          	sll	a3,a3,a2
    a130:	00d4e4b3          	or	s1,s1,a3

0000a134 <.LVL157>:
    a134:	010506b3          	add	a3,a0,a6
    a138:	41000833          	neg	a6,a6

0000a13c <.L71>:
    a13c:	0af34863          	blt	t1,a5,a1ec <.L72>
    a140:	00400693          	li	a3,4
    a144:	40e68733          	sub	a4,a3,a4

0000a148 <.LVL159>:
    a148:	01c12683          	lw	a3,28(sp)
    a14c:	00279793          	slli	a5,a5,0x2

0000a150 <.LVL160>:
    a150:	04078793          	addi	a5,a5,64
    a154:	002787b3          	add	a5,a5,sp
    a158:	0116d6b3          	srl	a3,a3,a7
    a15c:	fcd7a823          	sw	a3,-48(a5)

0000a160 <.L73>:
    a160:	00400793          	li	a5,4
    a164:	00000613          	li	a2,0
    a168:	00e7c663          	blt	a5,a4,a174 <.L75>
    a16c:	40e787b3          	sub	a5,a5,a4
    a170:	00279613          	slli	a2,a5,0x2

0000a174 <.L75>:
    a174:	00271713          	slli	a4,a4,0x2
    a178:	00e50533          	add	a0,a0,a4
    a17c:	00000593          	li	a1,0
    a180:	eb0f90ef          	jal	ra,3830 <__GI_memset>

0000a184 <.LBE35>:
    a184:	01012703          	lw	a4,16(sp)

0000a188 <.LBB36>:
    a188:	009037b3          	snez	a5,s1

0000a18c <.LBE36>:
    a18c:	00e7e7b3          	or	a5,a5,a4

0000a190 <.L76>:
    a190:	01412683          	lw	a3,20(sp)

0000a194 <.LBB39>:
    a194:	00f12823          	sw	a5,16(sp)

0000a198 <.LBB40>:
    a198:	00f407b3          	add	a5,s0,a5
    a19c:	01268933          	add	s2,a3,s2
    a1a0:	02f12823          	sw	a5,48(sp)

0000a1a4 <.LVL164>:
    a1a4:	0087b7b3          	sltu	a5,a5,s0

0000a1a8 <.LVL165>:
    a1a8:	00f90733          	add	a4,s2,a5
    a1ac:	01812783          	lw	a5,24(sp)

0000a1b0 <.LVL166>:
    a1b0:	02e12a23          	sw	a4,52(sp)

0000a1b4 <.LVL167>:
    a1b4:	00d936b3          	sltu	a3,s2,a3

0000a1b8 <.LVL168>:
    a1b8:	01273733          	sltu	a4,a4,s2

0000a1bc <.LVL169>:
    a1bc:	013789b3          	add	s3,a5,s3

0000a1c0 <.LVL170>:
    a1c0:	00e6e733          	or	a4,a3,a4

0000a1c4 <.LVL171>:
    a1c4:	00e98733          	add	a4,s3,a4
    a1c8:	02e12c23          	sw	a4,56(sp)

0000a1cc <.LVL172>:
    a1cc:	00f9b7b3          	sltu	a5,s3,a5

0000a1d0 <.LVL173>:
    a1d0:	01373733          	sltu	a4,a4,s3

0000a1d4 <.LVL174>:
    a1d4:	00e7e7b3          	or	a5,a5,a4

0000a1d8 <.LVL175>:
    a1d8:	01c12703          	lw	a4,28(sp)

0000a1dc <.LBB140>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    a1dc:	000b8493          	mv	s1,s7

0000a1e0 <.LBB141>:
  FP_SUB_Q (R, A, B);
    a1e0:	00eb0733          	add	a4,s6,a4
    a1e4:	00e787b3          	add	a5,a5,a4

0000a1e8 <.LBE41>:
    a1e8:	d5dff06f          	j	9f44 <.L23>

0000a1ec <.L72>:
    a1ec:	0006a583          	lw	a1,0(a3)
    a1f0:	0046ae03          	lw	t3,4(a3)
    a1f4:	01068eb3          	add	t4,a3,a6
    a1f8:	0115d5b3          	srl	a1,a1,a7
    a1fc:	00ce1e33          	sll	t3,t3,a2
    a200:	01c5e5b3          	or	a1,a1,t3
    a204:	00bea023          	sw	a1,0(t4)

0000a208 <.LVL178>:
    a208:	00130313          	addi	t1,t1,1

0000a20c <.LVL179>:
    a20c:	00468693          	addi	a3,a3,4
    a210:	f2dff06f          	j	a13c <.L71>

0000a214 <.L48>:
    a214:	00008337          	lui	t1,0x8
    a218:	00148813          	addi	a6,s1,1
    a21c:	ffe30893          	addi	a7,t1,-2 # 7ffe <.LVL163+0x6>
    a220:	011878b3          	and	a7,a6,a7
    a224:	01412683          	lw	a3,20(sp)
    a228:	01812703          	lw	a4,24(sp)
    a22c:	01c12603          	lw	a2,28(sp)
    a230:	03010593          	addi	a1,sp,48
    a234:	03c10513          	addi	a0,sp,60
    a238:	12089263          	bnez	a7,a35c <.L87>
    a23c:	00e6e833          	or	a6,a3,a4
    a240:	00c86833          	or	a6,a6,a2
    a244:	00f86833          	or	a6,a6,a5
    a248:	0a049a63          	bnez	s1,a2fc <.L88>

0000a24c <.LVL181>:
    a24c:	00081e63          	bnez	a6,a268 <.L89>
    a250:	02812823          	sw	s0,48(sp)
    a254:	03212a23          	sw	s2,52(sp)
    a258:	03312c23          	sw	s3,56(sp)
    a25c:	03612e23          	sw	s6,60(sp)

0000a260 <.L354>:
    a260:	00000493          	li	s1,0
    a264:	a19ff06f          	j	9c7c <.L11>

0000a268 <.L89>:
    a268:	013965b3          	or	a1,s2,s3
    a26c:	0165e5b3          	or	a1,a1,s6
    a270:	0085e5b3          	or	a1,a1,s0
    a274:	00059c63          	bnez	a1,a28c <.L90>
    a278:	02f12823          	sw	a5,48(sp)
    a27c:	02d12a23          	sw	a3,52(sp)
    a280:	02e12c23          	sw	a4,56(sp)
    a284:	02c12e23          	sw	a2,60(sp)

0000a288 <.LBB148>:
  FP_PACK_SEMIRAW_Q (r, R);
    a288:	9f5ff06f          	j	9c7c <.L11>

0000a28c <.L90>:
  FP_SUB_Q (R, A, B);
    a28c:	00878433          	add	s0,a5,s0
    a290:	01268933          	add	s2,a3,s2
    a294:	02812823          	sw	s0,48(sp)

0000a298 <.LVL186>:
    a298:	00f43433          	sltu	s0,s0,a5

0000a29c <.LVL187>:
    a29c:	00890433          	add	s0,s2,s0

0000a2a0 <.LVL188>:
    a2a0:	02812a23          	sw	s0,52(sp)

0000a2a4 <.LVL189>:
    a2a4:	00d936b3          	sltu	a3,s2,a3

0000a2a8 <.LVL190>:
    a2a8:	01243433          	sltu	s0,s0,s2

0000a2ac <.LVL191>:
    a2ac:	013709b3          	add	s3,a4,s3

0000a2b0 <.LVL192>:
    a2b0:	0086e6b3          	or	a3,a3,s0

0000a2b4 <.LVL193>:
    a2b4:	00d986b3          	add	a3,s3,a3
    a2b8:	00e9b7b3          	sltu	a5,s3,a4

0000a2bc <.LVL194>:
    a2bc:	02d12c23          	sw	a3,56(sp)

0000a2c0 <.LVL195>:
    a2c0:	0136b6b3          	sltu	a3,a3,s3

0000a2c4 <.LVL196>:
    a2c4:	00d7e7b3          	or	a5,a5,a3

0000a2c8 <.LVL197>:
    a2c8:	01660633          	add	a2,a2,s6
    a2cc:	00c787b3          	add	a5,a5,a2

0000a2d0 <.LBE43>:
    a2d0:	00080737          	lui	a4,0x80

0000a2d4 <.LVL198>:
    a2d4:	00e7f733          	and	a4,a5,a4
    a2d8:	00071663          	bnez	a4,a2e4 <.L101>

0000a2dc <.LBB44>:
    a2dc:	02f12e23          	sw	a5,60(sp)
    a2e0:	f81ff06f          	j	a260 <.L354>

0000a2e4 <.L101>:
    a2e4:	fff80737          	lui	a4,0xfff80
    a2e8:	fff70713          	addi	a4,a4,-1 # fff7ffff <_ebss+0xfff701af>
    a2ec:	00e7f7b3          	and	a5,a5,a4
    a2f0:	02f12e23          	sw	a5,60(sp)

0000a2f4 <.LBB151>:
    a2f4:	00100493          	li	s1,1

0000a2f8 <.LVL200>:
    a2f8:	985ff06f          	j	9c7c <.L11>

0000a2fc <.L88>:
    a2fc:	94080ae3          	beqz	a6,9c50 <.L265>
    a300:	01396933          	or	s2,s2,s3
    a304:	01696933          	or	s2,s2,s6
    a308:	00896933          	or	s2,s2,s0
    a30c:	940906e3          	beqz	s2,9c58 <.L266>

0000a310 <.LBB154>:
    a310:	02612e23          	sw	t1,60(sp)
    a314:	02012c23          	sw	zero,56(sp)
    a318:	02012a23          	sw	zero,52(sp)
    a31c:	02012823          	sw	zero,48(sp)

0000a320 <.LBB45>:
    a320:	00050793          	mv	a5,a0

0000a324 <.L104>:
    a324:	0007a703          	lw	a4,0(a5)
    a328:	ffc7a683          	lw	a3,-4(a5)
    a32c:	ffc78793          	addi	a5,a5,-4
    a330:	00371713          	slli	a4,a4,0x3
    a334:	01d6d693          	srli	a3,a3,0x1d
    a338:	00d76733          	or	a4,a4,a3
    a33c:	00e7a223          	sw	a4,4(a5)
    a340:	fef592e3          	bne	a1,a5,a324 <.L104>

0000a344 <.L352>:
    a344:	03012783          	lw	a5,48(sp)

0000a348 <.LBE67>:
    a348:	000084b7          	lui	s1,0x8

0000a34c <.LVL206>:
    a34c:	fff48493          	addi	s1,s1,-1 # 7fff <.LVL163+0x7>

0000a350 <.LBB68>:
    a350:	00379793          	slli	a5,a5,0x3

0000a354 <.LBB156>:
    a354:	02f12823          	sw	a5,48(sp)
    a358:	5f00006f          	j	a948 <.L356>

0000a35c <.L87>:
    a35c:	00878433          	add	s0,a5,s0
    a360:	01268933          	add	s2,a3,s2
    a364:	02812823          	sw	s0,48(sp)

0000a368 <.LVL208>:
    a368:	00f43433          	sltu	s0,s0,a5

0000a36c <.LVL209>:
    a36c:	00890433          	add	s0,s2,s0

0000a370 <.LVL210>:
    a370:	02812a23          	sw	s0,52(sp)

0000a374 <.LVL211>:
    a374:	00d937b3          	sltu	a5,s2,a3

0000a378 <.LVL212>:
    a378:	01243433          	sltu	s0,s0,s2

0000a37c <.LVL213>:
    a37c:	013709b3          	add	s3,a4,s3

0000a380 <.LVL214>:
    a380:	0087e7b3          	or	a5,a5,s0

0000a384 <.LVL215>:
    a384:	00f987b3          	add	a5,s3,a5
    a388:	02f12c23          	sw	a5,56(sp)

0000a38c <.LVL216>:
    a38c:	00e9b733          	sltu	a4,s3,a4

0000a390 <.LVL217>:
    a390:	0137b7b3          	sltu	a5,a5,s3

0000a394 <.LVL218>:
    a394:	00f767b3          	or	a5,a4,a5

0000a398 <.LVL219>:
    a398:	01660633          	add	a2,a2,s6
    a39c:	00c787b3          	add	a5,a5,a2
    a3a0:	02f12e23          	sw	a5,60(sp)

0000a3a4 <.LBB47>:
    a3a4:	00058793          	mv	a5,a1

0000a3a8 <.L116>:
    a3a8:	0007a703          	lw	a4,0(a5)
    a3ac:	0047a683          	lw	a3,4(a5)
    a3b0:	00478793          	addi	a5,a5,4
    a3b4:	00175713          	srli	a4,a4,0x1
    a3b8:	01f69693          	slli	a3,a3,0x1f
    a3bc:	00d76733          	or	a4,a4,a3
    a3c0:	fee7ae23          	sw	a4,-4(a5)
    a3c4:	fef512e3          	bne	a0,a5,a3a8 <.L116>

0000a3c8 <.LBE47>:
    a3c8:	00008737          	lui	a4,0x8
    a3cc:	fff70713          	addi	a4,a4,-1 # 7fff <.LVL163+0x7>

0000a3d0 <.LBB51>:
    a3d0:	03c12783          	lw	a5,60(sp)

0000a3d4 <.LBE51>:
    a3d4:	00e80863          	beq	a6,a4,a3e4 <.L117>

0000a3d8 <.LBB52>:
    a3d8:	0017d793          	srli	a5,a5,0x1
    a3dc:	02f12e23          	sw	a5,60(sp)
    a3e0:	fa8ff06f          	j	9b88 <.L359>

0000a3e4 <.L117>:
    a3e4:	02012e23          	sw	zero,60(sp)
    a3e8:	02012c23          	sw	zero,56(sp)
    a3ec:	02012a23          	sw	zero,52(sp)
    a3f0:	02012823          	sw	zero,48(sp)

0000a3f4 <.L357>:
    a3f4:	000084b7          	lui	s1,0x8

0000a3f8 <.LVL225>:
    a3f8:	fff48493          	addi	s1,s1,-1 # 7fff <.LVL163+0x7>
    a3fc:	881ff06f          	j	9c7c <.L11>

0000a400 <.L8>:
    a400:	26605863          	blez	t1,a670 <.L7>

0000a404 <.LBB162>:
    a404:	01412903          	lw	s2,20(sp)
    a408:	01812983          	lw	s3,24(sp)

0000a40c <.LVL228>:
    a40c:	01c12b03          	lw	s6,28(sp)

0000a410 <.LBB163>:
    a410:	080b9e63          	bnez	s7,a4ac <.L122>
    a414:	02412f03          	lw	t5,36(sp)
    a418:	02812e83          	lw	t4,40(sp)
    a41c:	02c12683          	lw	a3,44(sp)
    a420:	01df6733          	or	a4,t5,t4
    a424:	00d76733          	or	a4,a4,a3
    a428:	00876733          	or	a4,a4,s0
    a42c:	fa070463          	beqz	a4,9bd4 <.L355>
    a430:	fff30513          	addi	a0,t1,-1

0000a434 <.LVL229>:
    a434:	04051c63          	bnez	a0,a48c <.L124>

0000a438 <.LBB70>:
    a438:	41e90633          	sub	a2,s2,t5
    a43c:	40878733          	sub	a4,a5,s0

0000a440 <.LVL231>:
    a440:	00c938b3          	sltu	a7,s2,a2

0000a444 <.LVL232>:
    a444:	00e7b5b3          	sltu	a1,a5,a4
    a448:	40b60633          	sub	a2,a2,a1

0000a44c <.LVL233>:
    a44c:	00088313          	mv	t1,a7

0000a450 <.LVL234>:
    a450:	41d985b3          	sub	a1,s3,t4
    a454:	01d9b833          	sltu	a6,s3,t4
    a458:	00e7fc63          	bgeu	a5,a4,a470 <.L129>
    a45c:	012f1a63          	bne	t5,s2,a470 <.L129>

0000a460 <.LVL235>:
    a460:	fff58593          	addi	a1,a1,-1

0000a464 <.L130>:
    a464:	413e8eb3          	sub	t4,t4,s3
    a468:	001eb513          	seqz	a0,t4

0000a46c <.LVL237>:
    a46c:	00c0006f          	j	a478 <.L131>

0000a470 <.L129>:
    a470:	406585b3          	sub	a1,a1,t1

0000a474 <.LVL239>:
    a474:	fe0898e3          	bnez	a7,a464 <.L130>

0000a478 <.L131>:
    a478:	40db07b3          	sub	a5,s6,a3
    a47c:	010566b3          	or	a3,a0,a6

0000a480 <.LVL241>:
    a480:	40d787b3          	sub	a5,a5,a3

0000a484 <.L353>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    a484:	00100493          	li	s1,1

0000a488 <.LBB165>:
  FP_SUB_Q (R, A, B);
    a488:	1bc0006f          	j	a644 <.L132>

0000a48c <.L124>:
    a48c:	fbc30e63          	beq	t1,t3,9c48 <.L361>
    a490:	07400713          	li	a4,116
    a494:	02a75c63          	bge	a4,a0,a4cc <.L263>

0000a498 <.L134>:
    a498:	02012623          	sw	zero,44(sp)
    a49c:	02012423          	sw	zero,40(sp)
    a4a0:	02012223          	sw	zero,36(sp)
    a4a4:	00100713          	li	a4,1
    a4a8:	1140006f          	j	a5bc <.L145>

0000a4ac <.L122>:
    a4ac:	bdc480e3          	beq	s1,t3,a06c <.L267>
    a4b0:	02c12703          	lw	a4,44(sp)
    a4b4:	000806b7          	lui	a3,0x80
    a4b8:	00d76733          	or	a4,a4,a3
    a4bc:	02e12623          	sw	a4,44(sp)

0000a4c0 <.LDL3>:
    a4c0:	07400713          	li	a4,116
    a4c4:	fc674ae3          	blt	a4,t1,a498 <.L134>
    a4c8:	00030513          	mv	a0,t1

0000a4cc <.L263>:
    a4cc:	40555693          	srai	a3,a0,0x5

0000a4d0 <.LBB166>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    a4d0:	00088593          	mv	a1,a7

0000a4d4 <.LBB167>:
  FP_SUB_Q (R, A, B);
    a4d4:	01f57513          	andi	a0,a0,31

0000a4d8 <.LVL249>:
    a4d8:	00000713          	li	a4,0
    a4dc:	00000613          	li	a2,0

0000a4e0 <.L135>:
    a4e0:	02d61c63          	bne	a2,a3,a518 <.L136>
    a4e4:	00300613          	li	a2,3

0000a4e8 <.LVL251>:
    a4e8:	40d60633          	sub	a2,a2,a3
    a4ec:	00269593          	slli	a1,a3,0x2
    a4f0:	02051e63          	bnez	a0,a52c <.L137>

0000a4f4 <.L138>:
    a4f4:	00b88333          	add	t1,a7,a1
    a4f8:	00032303          	lw	t1,0(t1)
    a4fc:	00150513          	addi	a0,a0,1

0000a500 <.LVL253>:
    a500:	00488893          	addi	a7,a7,4
    a504:	fe68ae23          	sw	t1,-4(a7)

0000a508 <.LVL254>:
    a508:	fea656e3          	bge	a2,a0,a4f4 <.L138>
    a50c:	00400613          	li	a2,4
    a510:	40d606b3          	sub	a3,a2,a3

0000a514 <.LVL255>:
    a514:	0640006f          	j	a578 <.L142>

0000a518 <.L136>:
    a518:	0005a303          	lw	t1,0(a1)
    a51c:	00160613          	addi	a2,a2,1

0000a520 <.LVL257>:
    a520:	00458593          	addi	a1,a1,4
    a524:	00676733          	or	a4,a4,t1

0000a528 <.LVL258>:
    a528:	fb9ff06f          	j	a4e0 <.L135>

0000a52c <.L137>:
    a52c:	04058893          	addi	a7,a1,64
    a530:	002888b3          	add	a7,a7,sp
    a534:	fe08a883          	lw	a7,-32(a7)
    a538:	02000e13          	li	t3,32
    a53c:	40ae0e33          	sub	t3,t3,a0
    a540:	01c898b3          	sll	a7,a7,t3
    a544:	01176733          	or	a4,a4,a7

0000a548 <.LVL260>:
    a548:	00000e93          	li	t4,0
    a54c:	00b808b3          	add	a7,a6,a1
    a550:	40b005b3          	neg	a1,a1

0000a554 <.L140>:
    a554:	0acec663          	blt	t4,a2,a600 <.L141>
    a558:	00400593          	li	a1,4
    a55c:	40d586b3          	sub	a3,a1,a3

0000a560 <.LVL262>:
    a560:	02c12583          	lw	a1,44(sp)
    a564:	00261613          	slli	a2,a2,0x2

0000a568 <.LVL263>:
    a568:	04060613          	addi	a2,a2,64
    a56c:	00260633          	add	a2,a2,sp
    a570:	00a5d5b3          	srl	a1,a1,a0
    a574:	feb62023          	sw	a1,-32(a2)

0000a578 <.L142>:
    a578:	00400613          	li	a2,4
    a57c:	40d60633          	sub	a2,a2,a3
    a580:	00261613          	slli	a2,a2,0x2
    a584:	00269693          	slli	a3,a3,0x2
    a588:	00800593          	li	a1,8
    a58c:	00d806b3          	add	a3,a6,a3
    a590:	00b66a63          	bltu	a2,a1,a5a4 <.L143>
    a594:	0006a023          	sw	zero,0(a3) # 80000 <_ebss+0x701b0>

0000a598 <.LVL265>:
    a598:	0006a223          	sw	zero,4(a3)
    a59c:	ff860613          	addi	a2,a2,-8
    a5a0:	00868693          	addi	a3,a3,8

0000a5a4 <.L143>:
    a5a4:	00400593          	li	a1,4
    a5a8:	00b66463          	bltu	a2,a1,a5b0 <.L144>
    a5ac:	0006a023          	sw	zero,0(a3)

0000a5b0 <.L144>:
    a5b0:	02012683          	lw	a3,32(sp)

0000a5b4 <.LBB74>:
    a5b4:	00e03733          	snez	a4,a4

0000a5b8 <.LBE74>:
    a5b8:	00d76733          	or	a4,a4,a3

0000a5bc <.L145>:
    a5bc:	02412503          	lw	a0,36(sp)

0000a5c0 <.LBB78>:
    a5c0:	02e12023          	sw	a4,32(sp)

0000a5c4 <.LBB79>:
    a5c4:	40e78733          	sub	a4,a5,a4

0000a5c8 <.LVL270>:
    a5c8:	40a90633          	sub	a2,s2,a0
    a5cc:	00e7b6b3          	sltu	a3,a5,a4
    a5d0:	00c938b3          	sltu	a7,s2,a2

0000a5d4 <.LVL271>:
    a5d4:	40d60633          	sub	a2,a2,a3

0000a5d8 <.LVL272>:
    a5d8:	02812683          	lw	a3,40(sp)
    a5dc:	00088313          	mv	t1,a7

0000a5e0 <.LVL273>:
    a5e0:	40d985b3          	sub	a1,s3,a3
    a5e4:	00d9b833          	sltu	a6,s3,a3
    a5e8:	04e7f063          	bgeu	a5,a4,a628 <.L150>
    a5ec:	03251e63          	bne	a0,s2,a628 <.L150>

0000a5f0 <.LVL274>:
    a5f0:	fff58593          	addi	a1,a1,-1

0000a5f4 <.L151>:
    a5f4:	413686b3          	sub	a3,a3,s3
    a5f8:	0016b513          	seqz	a0,a3
    a5fc:	0380006f          	j	a634 <.L152>

0000a600 <.L141>:
    a600:	0008a303          	lw	t1,0(a7)
    a604:	0048af03          	lw	t5,4(a7)
    a608:	00b88fb3          	add	t6,a7,a1
    a60c:	00a35333          	srl	t1,t1,a0
    a610:	01cf1f33          	sll	t5,t5,t3
    a614:	01e36333          	or	t1,t1,t5
    a618:	006fa023          	sw	t1,0(t6)

0000a61c <.LVL277>:
    a61c:	001e8e93          	addi	t4,t4,1

0000a620 <.LVL278>:
    a620:	00488893          	addi	a7,a7,4
    a624:	f31ff06f          	j	a554 <.L140>

0000a628 <.L150>:
    a628:	406585b3          	sub	a1,a1,t1

0000a62c <.LVL280>:
    a62c:	00000513          	li	a0,0
    a630:	fc0892e3          	bnez	a7,a5f4 <.L151>

0000a634 <.L152>:
    a634:	02c12783          	lw	a5,44(sp)
    a638:	01056533          	or	a0,a0,a6

0000a63c <.LVL282>:
    a63c:	40fb07b3          	sub	a5,s6,a5
    a640:	40a787b3          	sub	a5,a5,a0

0000a644 <.L132>:
    a644:	02e12823          	sw	a4,48(sp)

0000a648 <.LBE82>:
    a648:	00080737          	lui	a4,0x80

0000a64c <.LBB83>:
    a64c:	02f12e23          	sw	a5,60(sp)
    a650:	02b12c23          	sw	a1,56(sp)
    a654:	02c12a23          	sw	a2,52(sp)

0000a658 <.LBE83>:
    a658:	00e7f6b3          	and	a3,a5,a4
    a65c:	e2068063          	beqz	a3,9c7c <.L11>

0000a660 <.LBB84>:
    a660:	fff70713          	addi	a4,a4,-1 # 7ffff <_ebss+0x701af>
    a664:	00e7f7b3          	and	a5,a5,a4
    a668:	02f12e23          	sw	a5,60(sp)
    a66c:	5500006f          	j	abbc <.L227>

0000a670 <.L7>:
    a670:	02412903          	lw	s2,36(sp)
    a674:	02812c03          	lw	s8,40(sp)
    a678:	02c12b03          	lw	s6,44(sp)

0000a67c <.LBB168>:
    a67c:	26030a63          	beqz	t1,a8f0 <.L153>
    a680:	409b8733          	sub	a4,s7,s1

0000a684 <.LVL286>:
    a684:	0a049e63          	bnez	s1,a740 <.L154>
    a688:	01412303          	lw	t1,20(sp)
    a68c:	01812883          	lw	a7,24(sp)
    a690:	01c12683          	lw	a3,28(sp)
    a694:	01136633          	or	a2,t1,a7
    a698:	00d66633          	or	a2,a2,a3
    a69c:	00f66633          	or	a2,a2,a5
    a6a0:	02061063          	bnez	a2,a6c0 <.L155>

0000a6a4 <.LVL287>:
    a6a4:	02812823          	sw	s0,48(sp)
    a6a8:	03212a23          	sw	s2,52(sp)
    a6ac:	03812c23          	sw	s8,56(sp)
    a6b0:	03612e23          	sw	s6,60(sp)

0000a6b4 <.LBB169>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    a6b4:	00070493          	mv	s1,a4

0000a6b8 <.L206>:
  FP_SUB_Q (R, A, B);
    a6b8:	00098a93          	mv	s5,s3

0000a6bc <.LVL290>:
    a6bc:	dc0ff06f          	j	9c7c <.L11>

0000a6c0 <.L155>:
    a6c0:	fff70813          	addi	a6,a4,-1

0000a6c4 <.LVL292>:
    a6c4:	04081c63          	bnez	a6,a71c <.L156>

0000a6c8 <.LBB85>:
    a6c8:	40f40733          	sub	a4,s0,a5

0000a6cc <.LVL294>:
    a6cc:	40690633          	sub	a2,s2,t1
    a6d0:	00c937b3          	sltu	a5,s2,a2

0000a6d4 <.LVL295>:
    a6d4:	00e435b3          	sltu	a1,s0,a4
    a6d8:	40b60633          	sub	a2,a2,a1

0000a6dc <.LVL296>:
    a6dc:	00078e13          	mv	t3,a5

0000a6e0 <.LVL297>:
    a6e0:	411c05b3          	sub	a1,s8,a7
    a6e4:	011c3533          	sltu	a0,s8,a7
    a6e8:	00e47c63          	bgeu	s0,a4,a700 <.L161>
    a6ec:	01231a63          	bne	t1,s2,a700 <.L161>

0000a6f0 <.LVL298>:
    a6f0:	fff58593          	addi	a1,a1,-1

0000a6f4 <.L162>:
    a6f4:	418888b3          	sub	a7,a7,s8
    a6f8:	0018b813          	seqz	a6,a7

0000a6fc <.LVL300>:
    a6fc:	00c0006f          	j	a708 <.L163>

0000a700 <.L161>:
    a700:	41c585b3          	sub	a1,a1,t3

0000a704 <.LVL302>:
    a704:	fe0798e3          	bnez	a5,a6f4 <.L162>

0000a708 <.L163>:
    a708:	40db07b3          	sub	a5,s6,a3
    a70c:	00a866b3          	or	a3,a6,a0

0000a710 <.LVL304>:
    a710:	40d787b3          	sub	a5,a5,a3

0000a714 <.LBE85>:
    a714:	00098a93          	mv	s5,s3

0000a718 <.LVL305>:
    a718:	d6dff06f          	j	a484 <.L353>

0000a71c <.L156>:
    a71c:	000087b7          	lui	a5,0x8
    a720:	fff78793          	addi	a5,a5,-1 # 7fff <.LVL163+0x7>
    a724:	76f71463          	bne	a4,a5,ae8c <.L164>

0000a728 <.L165>:
    a728:	02812823          	sw	s0,48(sp)
    a72c:	03212a23          	sw	s2,52(sp)
    a730:	03812c23          	sw	s8,56(sp)
    a734:	03612e23          	sw	s6,60(sp)
    a738:	00098a93          	mv	s5,s3

0000a73c <.LVL308>:
    a73c:	cb9ff06f          	j	a3f4 <.L357>

0000a740 <.L154>:
    a740:	000087b7          	lui	a5,0x8
    a744:	fff78793          	addi	a5,a5,-1 # 7fff <.LVL163+0x7>
    a748:	fefb80e3          	beq	s7,a5,a728 <.L165>
    a74c:	01c12783          	lw	a5,28(sp)
    a750:	000806b7          	lui	a3,0x80
    a754:	00d7e7b3          	or	a5,a5,a3
    a758:	00f12e23          	sw	a5,28(sp)

0000a75c <.LDL4>:
    a75c:	07400793          	li	a5,116
    a760:	72e7ca63          	blt	a5,a4,ae94 <.L166>
    a764:	00070813          	mv	a6,a4

0000a768 <.L264>:
    a768:	02000793          	li	a5,32
    a76c:	02f847b3          	div	a5,a6,a5

0000a770 <.LBB172>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    a770:	00058693          	mv	a3,a1

0000a774 <.LBB173>:
  FP_SUB_Q (R, A, B);
    a774:	00000493          	li	s1,0

0000a778 <.LVL312>:
    a778:	00000713          	li	a4,0

0000a77c <.L167>:
    a77c:	02f74e63          	blt	a4,a5,a7b8 <.L168>
    a780:	00300693          	li	a3,3
    a784:	01f87893          	andi	a7,a6,31
    a788:	40f686b3          	sub	a3,a3,a5
    a78c:	00279613          	slli	a2,a5,0x2
    a790:	02089e63          	bnez	a7,a7cc <.L169>

0000a794 <.L170>:
    a794:	00c58733          	add	a4,a1,a2
    a798:	00072703          	lw	a4,0(a4)
    a79c:	00188893          	addi	a7,a7,1

0000a7a0 <.LVL315>:
    a7a0:	00458593          	addi	a1,a1,4
    a7a4:	fee5ae23          	sw	a4,-4(a1)

0000a7a8 <.LVL316>:
    a7a8:	ff16d6e3          	bge	a3,a7,a794 <.L170>
    a7ac:	00400713          	li	a4,4
    a7b0:	40f707b3          	sub	a5,a4,a5

0000a7b4 <.LVL317>:
    a7b4:	0780006f          	j	a82c <.L175>

0000a7b8 <.L168>:
    a7b8:	0006a603          	lw	a2,0(a3) # 80000 <_ebss+0x701b0>
    a7bc:	00170713          	addi	a4,a4,1

0000a7c0 <.LVL319>:
    a7c0:	00468693          	addi	a3,a3,4
    a7c4:	00c4e4b3          	or	s1,s1,a2

0000a7c8 <.LVL320>:
    a7c8:	fb5ff06f          	j	a77c <.L167>

0000a7cc <.L169>:
    a7cc:	02000713          	li	a4,32

0000a7d0 <.LVL321>:
    a7d0:	02e86833          	rem	a6,a6,a4

0000a7d4 <.LVL322>:
    a7d4:	41070833          	sub	a6,a4,a6
    a7d8:	00078713          	mv	a4,a5
    a7dc:	0007d463          	bgez	a5,a7e4 <.L172>

0000a7e0 <.LVL323>:
    a7e0:	00000713          	li	a4,0

0000a7e4 <.L172>:
    a7e4:	00271713          	slli	a4,a4,0x2
    a7e8:	04070713          	addi	a4,a4,64
    a7ec:	00270733          	add	a4,a4,sp
    a7f0:	fd072703          	lw	a4,-48(a4)
    a7f4:	00000313          	li	t1,0
    a7f8:	01071733          	sll	a4,a4,a6
    a7fc:	00e4e4b3          	or	s1,s1,a4

0000a800 <.LVL325>:
    a800:	00c50733          	add	a4,a0,a2
    a804:	40c00633          	neg	a2,a2

0000a808 <.L173>:
    a808:	08d34c63          	blt	t1,a3,a8a0 <.L174>
    a80c:	00400713          	li	a4,4
    a810:	00269693          	slli	a3,a3,0x2
    a814:	40f707b3          	sub	a5,a4,a5

0000a818 <.LVL327>:
    a818:	04068713          	addi	a4,a3,64
    a81c:	002706b3          	add	a3,a4,sp
    a820:	01c12703          	lw	a4,28(sp)
    a824:	01175733          	srl	a4,a4,a7
    a828:	fce6a823          	sw	a4,-48(a3)

0000a82c <.L175>:
    a82c:	00400713          	li	a4,4
    a830:	00000613          	li	a2,0
    a834:	00f74663          	blt	a4,a5,a840 <.L177>
    a838:	40f70733          	sub	a4,a4,a5
    a83c:	00271613          	slli	a2,a4,0x2

0000a840 <.L177>:
    a840:	00279793          	slli	a5,a5,0x2
    a844:	00f50533          	add	a0,a0,a5
    a848:	00000593          	li	a1,0
    a84c:	fe5f80ef          	jal	ra,3830 <__GI_memset>

0000a850 <.LBE88>:
    a850:	01012783          	lw	a5,16(sp)

0000a854 <.LBB89>:
    a854:	00903733          	snez	a4,s1

0000a858 <.LBE89>:
    a858:	00f76733          	or	a4,a4,a5

0000a85c <.L178>:
    a85c:	01412683          	lw	a3,20(sp)

0000a860 <.LBB93>:
    a860:	00e12823          	sw	a4,16(sp)

0000a864 <.LBB94>:
    a864:	40e40733          	sub	a4,s0,a4

0000a868 <.LVL331>:
    a868:	40d90633          	sub	a2,s2,a3
    a86c:	00e437b3          	sltu	a5,s0,a4
    a870:	00c93833          	sltu	a6,s2,a2

0000a874 <.LVL332>:
    a874:	40f60633          	sub	a2,a2,a5

0000a878 <.LVL333>:
    a878:	01812783          	lw	a5,24(sp)
    a87c:	00080893          	mv	a7,a6

0000a880 <.LVL334>:
    a880:	40fc05b3          	sub	a1,s8,a5
    a884:	00fc3533          	sltu	a0,s8,a5
    a888:	04e47063          	bgeu	s0,a4,a8c8 <.L183>
    a88c:	03269e63          	bne	a3,s2,a8c8 <.L183>

0000a890 <.LVL335>:
    a890:	fff58593          	addi	a1,a1,-1

0000a894 <.L184>:
    a894:	418787b3          	sub	a5,a5,s8
    a898:	0017b693          	seqz	a3,a5
    a89c:	0380006f          	j	a8d4 <.L185>

0000a8a0 <.L174>:
    a8a0:	00072583          	lw	a1,0(a4)
    a8a4:	00472e03          	lw	t3,4(a4)
    a8a8:	00c70eb3          	add	t4,a4,a2
    a8ac:	0115d5b3          	srl	a1,a1,a7
    a8b0:	010e1e33          	sll	t3,t3,a6
    a8b4:	01c5e5b3          	or	a1,a1,t3
    a8b8:	00bea023          	sw	a1,0(t4)

0000a8bc <.LVL338>:
    a8bc:	00130313          	addi	t1,t1,1

0000a8c0 <.LVL339>:
    a8c0:	00470713          	addi	a4,a4,4
    a8c4:	f45ff06f          	j	a808 <.L173>

0000a8c8 <.L183>:
    a8c8:	411585b3          	sub	a1,a1,a7

0000a8cc <.LVL341>:
    a8cc:	00000693          	li	a3,0
    a8d0:	fc0812e3          	bnez	a6,a894 <.L184>

0000a8d4 <.L185>:
    a8d4:	01c12783          	lw	a5,28(sp)
    a8d8:	00a6e6b3          	or	a3,a3,a0

0000a8dc <.LBB174>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    a8dc:	000b8493          	mv	s1,s7

0000a8e0 <.LBB175>:
  FP_SUB_Q (R, A, B);
    a8e0:	40fb07b3          	sub	a5,s6,a5
    a8e4:	40d787b3          	sub	a5,a5,a3

0000a8e8 <.LBE97>:
    a8e8:	00098a93          	mv	s5,s3

0000a8ec <.LVL344>:
    a8ec:	d59ff06f          	j	a644 <.L132>

0000a8f0 <.L153>:
    a8f0:	000088b7          	lui	a7,0x8
    a8f4:	00148713          	addi	a4,s1,1
    a8f8:	ffe88613          	addi	a2,a7,-2 # 7ffe <.LVL163+0x6>
    a8fc:	00c77733          	and	a4,a4,a2

0000a900 <.LBB176>:
    a900:	01412803          	lw	a6,20(sp)
    a904:	01812503          	lw	a0,24(sp)
    a908:	01c12683          	lw	a3,28(sp)

0000a90c <.LBB177>:
    a90c:	1e071663          	bnez	a4,aaf8 <.L186>
    a910:	01896633          	or	a2,s2,s8
    a914:	00a865b3          	or	a1,a6,a0
    a918:	01666633          	or	a2,a2,s6
    a91c:	00d5e5b3          	or	a1,a1,a3
    a920:	00866633          	or	a2,a2,s0
    a924:	00f5e5b3          	or	a1,a1,a5
    a928:	10049e63          	bnez	s1,aa44 <.L187>

0000a92c <.LVL346>:
    a92c:	02059263          	bnez	a1,a950 <.L188>
    a930:	02812823          	sw	s0,48(sp)
    a934:	03212a23          	sw	s2,52(sp)
    a938:	03812c23          	sw	s8,56(sp)
    a93c:	03612e23          	sw	s6,60(sp)
    a940:	d6061ce3          	bnez	a2,a6b8 <.L206>

0000a944 <.L189>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    a944:	00000493          	li	s1,0

0000a948 <.L356>:
  FP_SUB_Q (R, A, B);
    a948:	00000a93          	li	s5,0

0000a94c <.LVL349>:
    a94c:	b30ff06f          	j	9c7c <.L11>

0000a950 <.L188>:
    a950:	00061c63          	bnez	a2,a968 <.L190>
    a954:	02f12823          	sw	a5,48(sp)
    a958:	03012a23          	sw	a6,52(sp)
    a95c:	02a12c23          	sw	a0,56(sp)
    a960:	02d12e23          	sw	a3,60(sp)

0000a964 <.LBB180>:
  FP_PACK_SEMIRAW_Q (r, R);
    a964:	8fdff06f          	j	a260 <.L354>

0000a968 <.L190>:
  FP_SUB_Q (R, A, B);
    a968:	41280733          	sub	a4,a6,s2
    a96c:	40878633          	sub	a2,a5,s0

0000a970 <.LVL353>:
    a970:	00e835b3          	sltu	a1,a6,a4

0000a974 <.LVL354>:
    a974:	00c7b333          	sltu	t1,a5,a2
    a978:	00058893          	mv	a7,a1

0000a97c <.LVL355>:
    a97c:	40670733          	sub	a4,a4,t1

0000a980 <.LVL356>:
    a980:	41850e33          	sub	t3,a0,s8
    a984:	01853eb3          	sltu	t4,a0,s8
    a988:	00c7fa63          	bgeu	a5,a2,a99c <.L195>
    a98c:	01281863          	bne	a6,s2,a99c <.L195>

0000a990 <.LVL357>:
    a990:	fffe0893          	addi	a7,t3,-1

0000a994 <.L196>:
    a994:	001e3313          	seqz	t1,t3
    a998:	0100006f          	j	a9a8 <.L197>

0000a99c <.L195>:
    a99c:	411e08b3          	sub	a7,t3,a7

0000a9a0 <.LVL360>:
    a9a0:	00000313          	li	t1,0
    a9a4:	fe0598e3          	bnez	a1,a994 <.L196>

0000a9a8 <.L197>:
    a9a8:	01d36333          	or	t1,t1,t4

0000a9ac <.LVL362>:
    a9ac:	416685b3          	sub	a1,a3,s6
    a9b0:	406585b3          	sub	a1,a1,t1

0000a9b4 <.LBE98>:
    a9b4:	00080337          	lui	t1,0x80

0000a9b8 <.LBB99>:
    a9b8:	02b12e23          	sw	a1,60(sp)
    a9bc:	03112c23          	sw	a7,56(sp)
    a9c0:	02e12a23          	sw	a4,52(sp)
    a9c4:	02c12823          	sw	a2,48(sp)

0000a9c8 <.LBE99>:
    a9c8:	0065f333          	and	t1,a1,t1
    a9cc:	06030263          	beqz	t1,aa30 <.L198>

0000a9d0 <.LBB100>:
    a9d0:	41090733          	sub	a4,s2,a6

0000a9d4 <.LVL365>:
    a9d4:	40f407b3          	sub	a5,s0,a5

0000a9d8 <.LVL366>:
    a9d8:	00e938b3          	sltu	a7,s2,a4

0000a9dc <.LVL367>:
    a9dc:	00f43633          	sltu	a2,s0,a5

0000a9e0 <.LVL368>:
    a9e0:	40c70633          	sub	a2,a4,a2
    a9e4:	00088313          	mv	t1,a7

0000a9e8 <.LVL369>:
    a9e8:	40ac05b3          	sub	a1,s8,a0
    a9ec:	00ac3733          	sltu	a4,s8,a0
    a9f0:	00f47a63          	bgeu	s0,a5,aa04 <.L203>
    a9f4:	01281863          	bne	a6,s2,aa04 <.L203>

0000a9f8 <.LVL370>:
    a9f8:	fff58593          	addi	a1,a1,-1

0000a9fc <.L204>:
    a9fc:	001e3813          	seqz	a6,t3
    aa00:	0100006f          	j	aa10 <.L205>

0000aa04 <.L203>:
    aa04:	406585b3          	sub	a1,a1,t1

0000aa08 <.LVL373>:
    aa08:	00000813          	li	a6,0
    aa0c:	fe0898e3          	bnez	a7,a9fc <.L204>

0000aa10 <.L205>:
    aa10:	40db06b3          	sub	a3,s6,a3
    aa14:	00e86833          	or	a6,a6,a4

0000aa18 <.LVL375>:
    aa18:	410686b3          	sub	a3,a3,a6
    aa1c:	02d12e23          	sw	a3,60(sp)
    aa20:	02b12c23          	sw	a1,56(sp)

0000aa24 <.LVL376>:
    aa24:	02c12a23          	sw	a2,52(sp)

0000aa28 <.LVL377>:
    aa28:	02f12823          	sw	a5,48(sp)

0000aa2c <.LBB182>:
  FP_PACK_SEMIRAW_Q (r, R);
    aa2c:	c8dff06f          	j	a6b8 <.L206>

0000aa30 <.L198>:
  FP_SUB_Q (R, A, B);
    aa30:	00e66633          	or	a2,a2,a4

0000aa34 <.LVL380>:
    aa34:	01166633          	or	a2,a2,a7
    aa38:	00b66633          	or	a2,a2,a1
    aa3c:	f00604e3          	beqz	a2,a944 <.L189>
    aa40:	821ff06f          	j	a260 <.L354>

0000aa44 <.L187>:
    aa44:	03010313          	addi	t1,sp,48
    aa48:	03c10713          	addi	a4,sp,60
    aa4c:	04059e63          	bnez	a1,aaa8 <.L207>
    aa50:	02061e63          	bnez	a2,aa8c <.L208>

0000aa54 <.LVL382>:
    aa54:	03112e23          	sw	a7,60(sp)
    aa58:	02012c23          	sw	zero,56(sp)
    aa5c:	02012a23          	sw	zero,52(sp)
    aa60:	02012823          	sw	zero,48(sp)

0000aa64 <.LBB101>:
    aa64:	00070793          	mv	a5,a4

0000aa68 <.L209>:
    aa68:	0007a703          	lw	a4,0(a5)
    aa6c:	ffc7a683          	lw	a3,-4(a5)
    aa70:	ffc78793          	addi	a5,a5,-4
    aa74:	00371713          	slli	a4,a4,0x3
    aa78:	01d6d693          	srli	a3,a3,0x1d
    aa7c:	00d76733          	or	a4,a4,a3
    aa80:	00e7a223          	sw	a4,4(a5)
    aa84:	fef312e3          	bne	t1,a5,aa68 <.L209>
    aa88:	8bdff06f          	j	a344 <.L352>

0000aa8c <.L208>:
    aa8c:	02812823          	sw	s0,48(sp)
    aa90:	03212a23          	sw	s2,52(sp)
    aa94:	03812c23          	sw	s8,56(sp)
    aa98:	03612e23          	sw	s6,60(sp)

0000aa9c <.LBB184>:
    aa9c:	00098a93          	mv	s5,s3

0000aaa0 <.L358>:
    aaa0:	fff88493          	addi	s1,a7,-1

0000aaa4 <.LVL387>:
    aaa4:	9d8ff06f          	j	9c7c <.L11>

0000aaa8 <.L207>:
    aaa8:	00061c63          	bnez	a2,aac0 <.L210>

0000aaac <.LVL389>:
    aaac:	02f12823          	sw	a5,48(sp)
    aab0:	03012a23          	sw	a6,52(sp)
    aab4:	02a12c23          	sw	a0,56(sp)
    aab8:	02d12e23          	sw	a3,60(sp)
    aabc:	fe5ff06f          	j	aaa0 <.L358>

0000aac0 <.L210>:
    aac0:	03112e23          	sw	a7,60(sp)
    aac4:	02012c23          	sw	zero,56(sp)
    aac8:	02012a23          	sw	zero,52(sp)
    aacc:	02012823          	sw	zero,48(sp)

0000aad0 <.LBB102>:
    aad0:	00070793          	mv	a5,a4

0000aad4 <.L211>:
    aad4:	0007a703          	lw	a4,0(a5)
    aad8:	ffc7a683          	lw	a3,-4(a5)
    aadc:	ffc78793          	addi	a5,a5,-4
    aae0:	00371713          	slli	a4,a4,0x3
    aae4:	01d6d693          	srli	a3,a3,0x1d
    aae8:	00d76733          	or	a4,a4,a3
    aaec:	00e7a223          	sw	a4,4(a5)
    aaf0:	fef312e3          	bne	t1,a5,aad4 <.L211>
    aaf4:	851ff06f          	j	a344 <.L352>

0000aaf8 <.L186>:
    aaf8:	41280733          	sub	a4,a6,s2
    aafc:	40878633          	sub	a2,a5,s0

0000ab00 <.LVL394>:
    ab00:	00e835b3          	sltu	a1,a6,a4

0000ab04 <.LVL395>:
    ab04:	00c7b333          	sltu	t1,a5,a2
    ab08:	40670733          	sub	a4,a4,t1

0000ab0c <.LVL396>:
    ab0c:	00058893          	mv	a7,a1

0000ab10 <.LVL397>:
    ab10:	41850333          	sub	t1,a0,s8
    ab14:	01853f33          	sltu	t5,a0,s8
    ab18:	00c7fa63          	bgeu	a5,a2,ab2c <.L216>
    ab1c:	01281863          	bne	a6,s2,ab2c <.L216>

0000ab20 <.LVL398>:
    ab20:	fff30893          	addi	a7,t1,-1 # 7ffff <_ebss+0x701af>

0000ab24 <.L217>:
    ab24:	00133e13          	seqz	t3,t1
    ab28:	0100006f          	j	ab38 <.L218>

0000ab2c <.L216>:
    ab2c:	411308b3          	sub	a7,t1,a7

0000ab30 <.LVL401>:
    ab30:	00000e13          	li	t3,0
    ab34:	fe0598e3          	bnez	a1,ab24 <.L217>

0000ab38 <.L218>:
    ab38:	01ee6e33          	or	t3,t3,t5

0000ab3c <.LVL403>:
    ab3c:	416685b3          	sub	a1,a3,s6
    ab40:	41c585b3          	sub	a1,a1,t3

0000ab44 <.LBE103>:
    ab44:	00080e37          	lui	t3,0x80

0000ab48 <.LBB104>:
    ab48:	02b12e23          	sw	a1,60(sp)
    ab4c:	03112c23          	sw	a7,56(sp)
    ab50:	02e12a23          	sw	a4,52(sp)
    ab54:	02c12823          	sw	a2,48(sp)

0000ab58 <.LBE104>:
    ab58:	01c5fe33          	and	t3,a1,t3
    ab5c:	140e0863          	beqz	t3,acac <.L219>

0000ab60 <.LBB105>:
    ab60:	41090733          	sub	a4,s2,a6

0000ab64 <.LVL406>:
    ab64:	40f407b3          	sub	a5,s0,a5

0000ab68 <.LVL407>:
    ab68:	00e938b3          	sltu	a7,s2,a4

0000ab6c <.LVL408>:
    ab6c:	00f43633          	sltu	a2,s0,a5

0000ab70 <.LVL409>:
    ab70:	40c70633          	sub	a2,a4,a2
    ab74:	00088e13          	mv	t3,a7

0000ab78 <.LVL410>:
    ab78:	40ac05b3          	sub	a1,s8,a0
    ab7c:	00ac3733          	sltu	a4,s8,a0
    ab80:	00f47a63          	bgeu	s0,a5,ab94 <.L224>
    ab84:	01281863          	bne	a6,s2,ab94 <.L224>

0000ab88 <.LVL411>:
    ab88:	fff58593          	addi	a1,a1,-1

0000ab8c <.L225>:
    ab8c:	00133e93          	seqz	t4,t1
    ab90:	00c0006f          	j	ab9c <.L226>

0000ab94 <.L224>:
    ab94:	41c585b3          	sub	a1,a1,t3

0000ab98 <.LVL414>:
    ab98:	fe089ae3          	bnez	a7,ab8c <.L225>

0000ab9c <.L226>:
    ab9c:	40db06b3          	sub	a3,s6,a3
    aba0:	00eeeeb3          	or	t4,t4,a4

0000aba4 <.LVL416>:
    aba4:	41d68733          	sub	a4,a3,t4
    aba8:	02e12e23          	sw	a4,60(sp)
    abac:	02b12c23          	sw	a1,56(sp)

0000abb0 <.LVL417>:
    abb0:	02c12a23          	sw	a2,52(sp)

0000abb4 <.LVL418>:
    abb4:	02f12823          	sw	a5,48(sp)

0000abb8 <.LBE105>:
    abb8:	00098a93          	mv	s5,s3

0000abbc <.L227>:
    abbc:	03c12503          	lw	a0,60(sp)
    abc0:	10050063          	beqz	a0,acc0 <.L228>
    abc4:	cecf70ef          	jal	ra,20b0 <__clzsi2>

0000abc8 <.L229>:
    abc8:	ff450513          	addi	a0,a0,-12

0000abcc <.LBB62>:
    abcc:	02000713          	li	a4,32
    abd0:	01f57813          	andi	a6,a0,31
    abd4:	02e547b3          	div	a5,a0,a4

0000abd8 <.LVL423>:
    abd8:	12080063          	beqz	a6,acf8 <.L232>
    abdc:	03010313          	addi	t1,sp,48
    abe0:	02e566b3          	rem	a3,a0,a4

0000abe4 <.LVL424>:
    abe4:	40d70633          	sub	a2,a4,a3
    abe8:	ffc00693          	li	a3,-4

0000abec <.LVL425>:
    abec:	02d786b3          	mul	a3,a5,a3
    abf0:	00c68713          	addi	a4,a3,12
    abf4:	00e30733          	add	a4,t1,a4
    abf8:	40d006b3          	neg	a3,a3

0000abfc <.L233>:
    abfc:	12e31663          	bne	t1,a4,ad28 <.L236>
    ac00:	03012683          	lw	a3,48(sp)
    ac04:	fff78713          	addi	a4,a5,-1

0000ac08 <.LVL426>:
    ac08:	00279793          	slli	a5,a5,0x2

0000ac0c <.LVL427>:
    ac0c:	04078793          	addi	a5,a5,64
    ac10:	002787b3          	add	a5,a5,sp
    ac14:	010696b3          	sll	a3,a3,a6
    ac18:	fed7a823          	sw	a3,-16(a5)

0000ac1c <.L237>:
    ac1c:	00170713          	addi	a4,a4,1
    ac20:	03010793          	addi	a5,sp,48
    ac24:	00271713          	slli	a4,a4,0x2
    ac28:	00800693          	li	a3,8
    ac2c:	00078893          	mv	a7,a5
    ac30:	00d76a63          	bltu	a4,a3,ac44 <.L238>
    ac34:	02012823          	sw	zero,48(sp)
    ac38:	0007a223          	sw	zero,4(a5)
    ac3c:	ff870713          	addi	a4,a4,-8
    ac40:	03810793          	addi	a5,sp,56

0000ac44 <.L238>:
    ac44:	00400693          	li	a3,4
    ac48:	00d76463          	bltu	a4,a3,ac50 <.L239>
    ac4c:	0007a023          	sw	zero,0(a5)

0000ac50 <.L239>:
    ac50:	1c954863          	blt	a0,s1,ae20 <.L240>
    ac54:	40950533          	sub	a0,a0,s1

0000ac58 <.LVL429>:
    ac58:	00150513          	addi	a0,a0,1

0000ac5c <.LBB58>:
    ac5c:	40555713          	srai	a4,a0,0x5

0000ac60 <.LVL431>:
    ac60:	01f57793          	andi	a5,a0,31

0000ac64 <.LVL432>:
    ac64:	00088593          	mv	a1,a7
    ac68:	00088613          	mv	a2,a7
    ac6c:	00000313          	li	t1,0
    ac70:	00000693          	li	a3,0

0000ac74 <.L241>:
    ac74:	0ce69c63          	bne	a3,a4,ad4c <.L242>
    ac78:	00300693          	li	a3,3

0000ac7c <.LVL434>:
    ac7c:	40e686b3          	sub	a3,a3,a4
    ac80:	00271613          	slli	a2,a4,0x2
    ac84:	0c079e63          	bnez	a5,ad60 <.L243>

0000ac88 <.L244>:
    ac88:	00c58533          	add	a0,a1,a2
    ac8c:	00052503          	lw	a0,0(a0)
    ac90:	00178793          	addi	a5,a5,1

0000ac94 <.LVL436>:
    ac94:	00458593          	addi	a1,a1,4
    ac98:	fea5ae23          	sw	a0,-4(a1)

0000ac9c <.LVL437>:
    ac9c:	fef6d6e3          	bge	a3,a5,ac88 <.L244>
    aca0:	00400793          	li	a5,4

0000aca4 <.LVL438>:
    aca4:	40e78733          	sub	a4,a5,a4

0000aca8 <.LVL439>:
    aca8:	1040006f          	j	adac <.L248>

0000acac <.L219>:
    acac:	00e66633          	or	a2,a2,a4

0000acb0 <.LVL441>:
    acb0:	01166633          	or	a2,a2,a7
    acb4:	00b66633          	or	a2,a2,a1
    acb8:	c80606e3          	beqz	a2,a944 <.L189>
    acbc:	f01ff06f          	j	abbc <.L227>

0000acc0 <.L228>:
    acc0:	03812503          	lw	a0,56(sp)
    acc4:	00050863          	beqz	a0,acd4 <.L230>
    acc8:	be8f70ef          	jal	ra,20b0 <__clzsi2>

0000accc <.LVL443>:
    accc:	02050513          	addi	a0,a0,32
    acd0:	ef9ff06f          	j	abc8 <.L229>

0000acd4 <.L230>:
    acd4:	03412503          	lw	a0,52(sp)
    acd8:	00050863          	beqz	a0,ace8 <.L231>
    acdc:	bd4f70ef          	jal	ra,20b0 <__clzsi2>

0000ace0 <.LVL446>:
    ace0:	04050513          	addi	a0,a0,64
    ace4:	ee5ff06f          	j	abc8 <.L229>

0000ace8 <.L231>:
    ace8:	03012503          	lw	a0,48(sp)
    acec:	bc4f70ef          	jal	ra,20b0 <__clzsi2>

0000acf0 <.LVL449>:
    acf0:	06050513          	addi	a0,a0,96
    acf4:	ed5ff06f          	j	abc8 <.L229>

0000acf8 <.L232>:
    acf8:	ffc00613          	li	a2,-4
    acfc:	02c78633          	mul	a2,a5,a2
    ad00:	03c10713          	addi	a4,sp,60

0000ad04 <.LBB64>:
    ad04:	00300693          	li	a3,3

0000ad08 <.L234>:
    ad08:	00c705b3          	add	a1,a4,a2
    ad0c:	0005a583          	lw	a1,0(a1)
    ad10:	fff68693          	addi	a3,a3,-1

0000ad14 <.LVL453>:
    ad14:	ffc70713          	addi	a4,a4,-4
    ad18:	00b72223          	sw	a1,4(a4)

0000ad1c <.LVL454>:
    ad1c:	fef6d6e3          	bge	a3,a5,ad08 <.L234>
    ad20:	fff78713          	addi	a4,a5,-1
    ad24:	ef9ff06f          	j	ac1c <.L237>

0000ad28 <.L236>:
    ad28:	00072583          	lw	a1,0(a4)
    ad2c:	ffc72883          	lw	a7,-4(a4)
    ad30:	00d70e33          	add	t3,a4,a3
    ad34:	010595b3          	sll	a1,a1,a6
    ad38:	00c8d8b3          	srl	a7,a7,a2
    ad3c:	0115e5b3          	or	a1,a1,a7
    ad40:	00be2023          	sw	a1,0(t3) # 80000 <_ebss+0x701b0>
    ad44:	ffc70713          	addi	a4,a4,-4
    ad48:	eb5ff06f          	j	abfc <.L233>

0000ad4c <.L242>:
    ad4c:	00062503          	lw	a0,0(a2)
    ad50:	00168693          	addi	a3,a3,1

0000ad54 <.LVL457>:
    ad54:	00460613          	addi	a2,a2,4
    ad58:	00a36333          	or	t1,t1,a0

0000ad5c <.LVL458>:
    ad5c:	f19ff06f          	j	ac74 <.L241>

0000ad60 <.L243>:
    ad60:	04060593          	addi	a1,a2,64
    ad64:	002585b3          	add	a1,a1,sp
    ad68:	ff05a583          	lw	a1,-16(a1)
    ad6c:	02000813          	li	a6,32
    ad70:	40f80833          	sub	a6,a6,a5
    ad74:	010595b3          	sll	a1,a1,a6
    ad78:	00b36333          	or	t1,t1,a1

0000ad7c <.LVL460>:
    ad7c:	00000e13          	li	t3,0
    ad80:	00c885b3          	add	a1,a7,a2
    ad84:	40c00633          	neg	a2,a2

0000ad88 <.L246>:
    ad88:	06de4863          	blt	t3,a3,adf8 <.L247>
    ad8c:	00400613          	li	a2,4
    ad90:	40e60733          	sub	a4,a2,a4

0000ad94 <.LVL462>:
    ad94:	03c12603          	lw	a2,60(sp)
    ad98:	00269693          	slli	a3,a3,0x2

0000ad9c <.LVL463>:
    ad9c:	04068693          	addi	a3,a3,64
    ada0:	002686b3          	add	a3,a3,sp
    ada4:	00f657b3          	srl	a5,a2,a5

0000ada8 <.LVL464>:
    ada8:	fef6a823          	sw	a5,-16(a3)

0000adac <.L248>:
    adac:	00400693          	li	a3,4
    adb0:	40e686b3          	sub	a3,a3,a4
    adb4:	00271713          	slli	a4,a4,0x2
    adb8:	00e887b3          	add	a5,a7,a4
    adbc:	00269713          	slli	a4,a3,0x2
    adc0:	00800693          	li	a3,8
    adc4:	00d76a63          	bltu	a4,a3,add8 <.L249>
    adc8:	0007a023          	sw	zero,0(a5)
    adcc:	0007a223          	sw	zero,4(a5)
    add0:	ff870713          	addi	a4,a4,-8
    add4:	00878793          	addi	a5,a5,8

0000add8 <.L249>:
    add8:	00400693          	li	a3,4
    addc:	00d76463          	bltu	a4,a3,ade4 <.L250>
    ade0:	0007a023          	sw	zero,0(a5)

0000ade4 <.L250>:
    ade4:	03012703          	lw	a4,48(sp)

0000ade8 <.LBB60>:
    ade8:	006037b3          	snez	a5,t1

0000adec <.LBE60>:
    adec:	00f767b3          	or	a5,a4,a5
    adf0:	02f12823          	sw	a5,48(sp)
    adf4:	c6cff06f          	j	a260 <.L354>

0000adf8 <.L247>:
    adf8:	0005a503          	lw	a0,0(a1)
    adfc:	0045ae83          	lw	t4,4(a1)
    ae00:	00c58f33          	add	t5,a1,a2
    ae04:	00f55533          	srl	a0,a0,a5
    ae08:	010e9eb3          	sll	t4,t4,a6
    ae0c:	01d56533          	or	a0,a0,t4
    ae10:	00af2023          	sw	a0,0(t5)

0000ae14 <.LVL468>:
    ae14:	001e0e13          	addi	t3,t3,1

0000ae18 <.LVL469>:
    ae18:	00458593          	addi	a1,a1,4
    ae1c:	f6dff06f          	j	ad88 <.L246>

0000ae20 <.L240>:
    ae20:	03c12783          	lw	a5,60(sp)
    ae24:	fff80737          	lui	a4,0xfff80
    ae28:	fff70713          	addi	a4,a4,-1 # fff7ffff <_ebss+0xfff701af>
    ae2c:	00e7f7b3          	and	a5,a5,a4
    ae30:	40a484b3          	sub	s1,s1,a0
    ae34:	02f12e23          	sw	a5,60(sp)

0000ae38 <.LBB189>:
  FP_PACK_SEMIRAW_Q (r, R);
    ae38:	e45fe06f          	j	9c7c <.L11>

0000ae3c <.L257>:
    ae3c:	02012e23          	sw	zero,60(sp)
    ae40:	02012c23          	sw	zero,56(sp)
    ae44:	02012a23          	sw	zero,52(sp)
    ae48:	02012823          	sw	zero,48(sp)
    ae4c:	eb5fe06f          	j	9d00 <.L256>

0000ae50 <.L24>:
  FP_SUB_Q (R, A, B);
    ae50:	07400713          	li	a4,116
    ae54:	00c74463          	blt	a4,a2,ae5c <.L26>
    ae58:	fa9fe06f          	j	9e00 <.L261>

0000ae5c <.L26>:
    ae5c:	02012623          	sw	zero,44(sp)
    ae60:	02012423          	sw	zero,40(sp)
    ae64:	02012223          	sw	zero,36(sp)
    ae68:	00100713          	li	a4,1
    ae6c:	884ff06f          	j	9ef0 <.L37>

0000ae70 <.L62>:
    ae70:	07400793          	li	a5,116
    ae74:	a2c7d463          	bge	a5,a2,a09c <.L262>

0000ae78 <.L64>:
    ae78:	00012e23          	sw	zero,28(sp)
    ae7c:	00012c23          	sw	zero,24(sp)
    ae80:	00012a23          	sw	zero,20(sp)
    ae84:	00100793          	li	a5,1
    ae88:	b08ff06f          	j	a190 <.L76>

0000ae8c <.L164>:
    ae8c:	07400793          	li	a5,116
    ae90:	8d07dce3          	bge	a5,a6,a768 <.L264>

0000ae94 <.L166>:
    ae94:	00012e23          	sw	zero,28(sp)
    ae98:	00012c23          	sw	zero,24(sp)
    ae9c:	00012a23          	sw	zero,20(sp)
    aea0:	00100713          	li	a4,1
    aea4:	9b9ff06f          	j	a85c <.L178>

0000aea8 <__fixunstfsi>:
#include "soft-fp.h"
#include "quad.h"

USItype
__fixunstfsi (TFtype a)
{
    aea8:	00052783          	lw	a5,0(a0)
    aeac:	00452603          	lw	a2,4(a0)
    aeb0:	00c52703          	lw	a4,12(a0)
    aeb4:	00852683          	lw	a3,8(a0)
    aeb8:	fe010113          	addi	sp,sp,-32

0000aebc <.LBB3>:
  FP_DECL_EX;
  FP_DECL_Q (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    aebc:	00f12023          	sw	a5,0(sp)
    aec0:	00c12223          	sw	a2,4(sp)
    aec4:	00f12823          	sw	a5,16(sp)
    aec8:	00171613          	slli	a2,a4,0x1

0000aecc <.LBE3>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    aecc:	000047b7          	lui	a5,0x4

0000aed0 <.LBB4>:
  FP_UNPACK_RAW_Q (A, a);
    aed0:	00d12423          	sw	a3,8(sp)
    aed4:	00e12623          	sw	a4,12(sp)
    aed8:	00d12c23          	sw	a3,24(sp)
    aedc:	01165613          	srli	a2,a2,0x11

0000aee0 <.LBE4>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    aee0:	ffe78513          	addi	a0,a5,-2 # 3ffe <.L6+0xa>
    aee4:	0ac55463          	bge	a0,a2,af8c <.L7>
    aee8:	01f75593          	srli	a1,a4,0x1f
    aeec:	00000513          	li	a0,0
    aef0:	04059c63          	bnez	a1,af48 <.L1>
    aef4:	01e78593          	addi	a1,a5,30
    aef8:	fff00513          	li	a0,-1
    aefc:	04c5c663          	blt	a1,a2,af48 <.L1>

0000af00 <.LBB10>:
  FP_UNPACK_RAW_Q (A, a);
    af00:	01071713          	slli	a4,a4,0x10

0000af04 <.LBB11>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    af04:	000105b7          	lui	a1,0x10

0000af08 <.LBB12>:
  FP_UNPACK_RAW_Q (A, a);
    af08:	01075713          	srli	a4,a4,0x10

0000af0c <.LBB13>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    af0c:	06f78793          	addi	a5,a5,111

0000af10 <.LBE6>:
    af10:	00b76733          	or	a4,a4,a1

0000af14 <.LBB7>:
    af14:	40c787b3          	sub	a5,a5,a2
    af18:	4057d613          	srai	a2,a5,0x5

0000af1c <.LVL4>:
    af1c:	02000593          	li	a1,32
    af20:	01f7f793          	andi	a5,a5,31

0000af24 <.LBE7>:
    af24:	00e12e23          	sw	a4,28(sp)

0000af28 <.LBB8>:
    af28:	40f585b3          	sub	a1,a1,a5

0000af2c <.LVL6>:
    af2c:	04079863          	bnez	a5,af7c <.L3>

0000af30 <.LVL7>:
    af30:	00261613          	slli	a2,a2,0x2

0000af34 <.LVL8>:
    af34:	02060793          	addi	a5,a2,32

0000af38 <.LVL9>:
    af38:	00278633          	add	a2,a5,sp
    af3c:	ff062783          	lw	a5,-16(a2)
    af40:	00f12823          	sw	a5,16(sp)

0000af44 <.L4>:
    af44:	01012503          	lw	a0,16(sp)

0000af48 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    af48:	02010113          	addi	sp,sp,32

0000af4c <.LVL12>:
    af4c:	00008067          	ret

0000af50 <.L6>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    af50:	00f6d6b3          	srl	a3,a3,a5
    af54:	00b715b3          	sll	a1,a4,a1

0000af58 <.LVL14>:
    af58:	00b6e6b3          	or	a3,a3,a1
    af5c:	00d12823          	sw	a3,16(sp)

0000af60 <.LVL15>:
    af60:	00100693          	li	a3,1

0000af64 <.L5>:
    af64:	00269693          	slli	a3,a3,0x2

0000af68 <.LVL17>:
    af68:	02068693          	addi	a3,a3,32
    af6c:	002686b3          	add	a3,a3,sp
    af70:	00f75733          	srl	a4,a4,a5
    af74:	fee6a823          	sw	a4,-16(a3)
    af78:	fcdff06f          	j	af44 <.L4>

0000af7c <.L3>:
    af7c:	00200513          	li	a0,2
    af80:	fca608e3          	beq	a2,a0,af50 <.L6>
    af84:	00000693          	li	a3,0
    af88:	fddff06f          	j	af64 <.L5>

0000af8c <.L7>:
    af8c:	00000513          	li	a0,0
    af90:	fb9ff06f          	j	af48 <.L1>

0000af94 <__floatunsitf>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__floatunsitf (USItype i)
{
    af94:	fd010113          	addi	sp,sp,-48
    af98:	02912223          	sw	s1,36(sp)
    af9c:	02112623          	sw	ra,44(sp)
    afa0:	02812423          	sw	s0,40(sp)
    afa4:	00050493          	mv	s1,a0

0000afa8 <.LBB13>:
  FP_DECL_Q (A);
  TFtype a;

  FP_FROM_INT_Q (A, i, SI_BITS, USItype);
    afa8:	10058463          	beqz	a1,b0b0 <.L2>

0000afac <.LBB3>:
    afac:	00058513          	mv	a0,a1
    afb0:	00058413          	mv	s0,a1

0000afb4 <.LBB5>:
    afb4:	8fcf70ef          	jal	ra,20b0 <__clzsi2>

0000afb8 <.LBE5>:
    afb8:	05150793          	addi	a5,a0,81

0000afbc <.LBB6>:
    afbc:	00004637          	lui	a2,0x4
    afc0:	01e60613          	addi	a2,a2,30 # 401e <.L5+0xa>

0000afc4 <.LBB7>:
    afc4:	4057d713          	srai	a4,a5,0x5

0000afc8 <.LBE7>:
    afc8:	00812823          	sw	s0,16(sp)
    afcc:	00012a23          	sw	zero,20(sp)
    afd0:	00012c23          	sw	zero,24(sp)
    afd4:	00012e23          	sw	zero,28(sp)

0000afd8 <.LBB8>:
    afd8:	01f7f793          	andi	a5,a5,31

0000afdc <.LBB9>:
    afdc:	40a60633          	sub	a2,a2,a0

0000afe0 <.LBB10>:
    afe0:	02078c63          	beqz	a5,b018 <.L3>

0000afe4 <.LVL5>:
    afe4:	00200693          	li	a3,2
    afe8:	0cd71063          	bne	a4,a3,b0a8 <.L8>
    afec:	02000693          	li	a3,32
    aff0:	40f686b3          	sub	a3,a3,a5

0000aff4 <.LVL6>:
    aff4:	00d456b3          	srl	a3,s0,a3

0000aff8 <.LVL7>:
    aff8:	00d12e23          	sw	a3,28(sp)

0000affc <.L4>:
    affc:	fff70693          	addi	a3,a4,-1

0000b000 <.LVL9>:
    b000:	00271713          	slli	a4,a4,0x2
    b004:	02070713          	addi	a4,a4,32
    b008:	00270733          	add	a4,a4,sp
    b00c:	00f41433          	sll	s0,s0,a5

0000b010 <.LVL10>:
    b010:	fe872823          	sw	s0,-16(a4)
    b014:	0340006f          	j	b048 <.L5>

0000b018 <.L3>:
    b018:	00300793          	li	a5,3

0000b01c <.LVL12>:
    b01c:	40e787b3          	sub	a5,a5,a4
    b020:	00279793          	slli	a5,a5,0x2
    b024:	02078793          	addi	a5,a5,32
    b028:	002787b3          	add	a5,a5,sp
    b02c:	ff07a783          	lw	a5,-16(a5)
    b030:	00200693          	li	a3,2
    b034:	00f12e23          	sw	a5,28(sp)

0000b038 <.LVL13>:
    b038:	00200793          	li	a5,2
    b03c:	00f71663          	bne	a4,a5,b048 <.L5>
    b040:	00812c23          	sw	s0,24(sp)

0000b044 <.LVL14>:
    b044:	00100693          	li	a3,1

0000b048 <.L5>:
    b048:	00269693          	slli	a3,a3,0x2
    b04c:	00012823          	sw	zero,16(sp)

0000b050 <.LVL16>:
    b050:	00012a23          	sw	zero,20(sp)
    b054:	ffc68693          	addi	a3,a3,-4
    b058:	00400793          	li	a5,4
    b05c:	00f6e463          	bltu	a3,a5,b064 <.L7>
    b060:	00012c23          	sw	zero,24(sp)

0000b064 <.L7>:
  FP_PACK_RAW_Q (a, A);
    b064:	01c12783          	lw	a5,28(sp)
    b068:	00c11723          	sh	a2,14(sp)

0000b06c <.LBE14>:

  return a;
}
    b06c:	02c12083          	lw	ra,44(sp)

0000b070 <.LBB15>:
  FP_PACK_RAW_Q (a, A);
    b070:	00f11623          	sh	a5,12(sp)

0000b074 <.LBE15>:
  return a;
    b074:	01012783          	lw	a5,16(sp)
}
    b078:	02812403          	lw	s0,40(sp)
    b07c:	00048513          	mv	a0,s1
  return a;
    b080:	00f4a023          	sw	a5,0(s1)
    b084:	01412783          	lw	a5,20(sp)
    b088:	00f4a223          	sw	a5,4(s1)
    b08c:	01812783          	lw	a5,24(sp)
    b090:	00f4a423          	sw	a5,8(s1)
    b094:	00c12783          	lw	a5,12(sp)
    b098:	00f4a623          	sw	a5,12(s1)
}
    b09c:	02412483          	lw	s1,36(sp)
    b0a0:	03010113          	addi	sp,sp,48

0000b0a4 <.LVL20>:
    b0a4:	00008067          	ret

0000b0a8 <.L8>:
  FP_FROM_INT_Q (A, i, SI_BITS, USItype);
    b0a8:	00300713          	li	a4,3

0000b0ac <.LVL22>:
    b0ac:	f51ff06f          	j	affc <.L4>

0000b0b0 <.L2>:
    b0b0:	00012e23          	sw	zero,28(sp)
    b0b4:	00012c23          	sw	zero,24(sp)
    b0b8:	00012a23          	sw	zero,20(sp)
    b0bc:	00012823          	sw	zero,16(sp)
    b0c0:	00000613          	li	a2,0
    b0c4:	fa1ff06f          	j	b064 <.L7>

0000b0c8 <__extenddftf2>:
  FP_DECL_D (A);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    b0c8:	01465713          	srli	a4,a2,0x14
    b0cc:	00c61793          	slli	a5,a2,0xc
    b0d0:	7ff77713          	andi	a4,a4,2047

0000b0d4 <.LBE2>:
{
    b0d4:	fd010113          	addi	sp,sp,-48

0000b0d8 <.LBB3>:
  FP_UNPACK_RAW_D (A, a);
    b0d8:	00c7d793          	srli	a5,a5,0xc

0000b0dc <.LBE3>:
#if _FP_W_TYPE_SIZE < 64
  FP_EXTEND (Q, D, 4, 2, R, A);
    b0dc:	00170693          	addi	a3,a4,1
{
    b0e0:	02812423          	sw	s0,40(sp)
    b0e4:	02912223          	sw	s1,36(sp)
    b0e8:	03212023          	sw	s2,32(sp)
    b0ec:	02112623          	sw	ra,44(sp)
  FP_EXTEND (Q, D, 4, 2, R, A);
    b0f0:	00b12823          	sw	a1,16(sp)
    b0f4:	00f12a23          	sw	a5,20(sp)
    b0f8:	00012e23          	sw	zero,28(sp)
    b0fc:	00012c23          	sw	zero,24(sp)
    b100:	7fe6f693          	andi	a3,a3,2046
{
    b104:	00050913          	mv	s2,a0
    b108:	00058413          	mv	s0,a1

0000b10c <.LBB4>:
  FP_UNPACK_RAW_D (A, a);
    b10c:	01f65493          	srli	s1,a2,0x1f

0000b110 <.LBE4>:
  FP_EXTEND (Q, D, 4, 2, R, A);
    b110:	08068263          	beqz	a3,b194 <.L2>
    b114:	000046b7          	lui	a3,0x4
    b118:	c0068693          	addi	a3,a3,-1024 # 3c00 <.L1>
    b11c:	00d70733          	add	a4,a4,a3

0000b120 <.LBB5>:
    b120:	0047d693          	srli	a3,a5,0x4
    b124:	00d12e23          	sw	a3,28(sp)

0000b128 <.LVL4>:
    b128:	01c79793          	slli	a5,a5,0x1c

0000b12c <.LVL5>:
    b12c:	0045d693          	srli	a3,a1,0x4
    b130:	00d7e7b3          	or	a5,a5,a3
    b134:	01c59413          	slli	s0,a1,0x1c
    b138:	00f12c23          	sw	a5,24(sp)

0000b13c <.LVL6>:
    b13c:	00812a23          	sw	s0,20(sp)

0000b140 <.LVL7>:
    b140:	00012823          	sw	zero,16(sp)

0000b144 <.L3>:
#else
  FP_EXTEND (Q, D, 2, 1, R, A);
#endif
  FP_PACK_RAW_Q (r, R);
    b144:	01c12783          	lw	a5,28(sp)
    b148:	00f49493          	slli	s1,s1,0xf

0000b14c <.LVL9>:
    b14c:	00e4e4b3          	or	s1,s1,a4
    b150:	00f11623          	sh	a5,12(sp)

0000b154 <.LBE6>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    b154:	01012783          	lw	a5,16(sp)

0000b158 <.LBB7>:
  FP_PACK_RAW_Q (r, R);
    b158:	00911723          	sh	s1,14(sp)

0000b15c <.LBE7>:
}
    b15c:	02c12083          	lw	ra,44(sp)
  return r;
    b160:	00f92023          	sw	a5,0(s2)
    b164:	01412783          	lw	a5,20(sp)

0000b168 <.LVL11>:
}
    b168:	02812403          	lw	s0,40(sp)
    b16c:	02412483          	lw	s1,36(sp)
  return r;
    b170:	00f92223          	sw	a5,4(s2)
    b174:	01812783          	lw	a5,24(sp)
}
    b178:	00090513          	mv	a0,s2
  return r;
    b17c:	00f92423          	sw	a5,8(s2)
    b180:	00c12783          	lw	a5,12(sp)
    b184:	00f92623          	sw	a5,12(s2)
}
    b188:	02012903          	lw	s2,32(sp)
    b18c:	03010113          	addi	sp,sp,48

0000b190 <.LVL13>:
    b190:	00008067          	ret

0000b194 <.L2>:
  FP_EXTEND (Q, D, 4, 2, R, A);
    b194:	00b7e533          	or	a0,a5,a1
    b198:	10071063          	bnez	a4,b298 <.L4>
    b19c:	fa0504e3          	beqz	a0,b144 <.L3>

0000b1a0 <.LBB8>:
    b1a0:	04078e63          	beqz	a5,b1fc <.L5>
    b1a4:	00078513          	mv	a0,a5
    b1a8:	f09f60ef          	jal	ra,20b0 <__clzsi2>

0000b1ac <.L6>:
    b1ac:	03150693          	addi	a3,a0,49
    b1b0:	4056d793          	srai	a5,a3,0x5

0000b1b4 <.LVL17>:
    b1b4:	01f6f693          	andi	a3,a3,31

0000b1b8 <.LVL18>:
    b1b8:	04068863          	beqz	a3,b208 <.L7>
    b1bc:	ffc00613          	li	a2,-4
    b1c0:	02c78633          	mul	a2,a5,a2
    b1c4:	02000813          	li	a6,32
    b1c8:	01010313          	addi	t1,sp,16
    b1cc:	40d80833          	sub	a6,a6,a3

0000b1d0 <.LVL19>:
    b1d0:	00c60713          	addi	a4,a2,12
    b1d4:	00e30733          	add	a4,t1,a4
    b1d8:	40c00633          	neg	a2,a2

0000b1dc <.L8>:
    b1dc:	08e31c63          	bne	t1,a4,b274 <.L11>
    b1e0:	fff78713          	addi	a4,a5,-1

0000b1e4 <.LVL20>:
    b1e4:	00279793          	slli	a5,a5,0x2

0000b1e8 <.LVL21>:
    b1e8:	02078793          	addi	a5,a5,32
    b1ec:	002787b3          	add	a5,a5,sp
    b1f0:	00d416b3          	sll	a3,s0,a3

0000b1f4 <.LVL22>:
    b1f4:	fed7a823          	sw	a3,-16(a5)
    b1f8:	03c0006f          	j	b234 <.L10>

0000b1fc <.L5>:
    b1fc:	eb5f60ef          	jal	ra,20b0 <__clzsi2>

0000b200 <.LVL24>:
    b200:	02050513          	addi	a0,a0,32
    b204:	fa9ff06f          	j	b1ac <.L6>

0000b208 <.L7>:
    b208:	ffc00613          	li	a2,-4
    b20c:	02c78633          	mul	a2,a5,a2
    b210:	01c10713          	addi	a4,sp,28

0000b214 <.LBB10>:
    b214:	00300693          	li	a3,3

0000b218 <.L9>:
    b218:	00c705b3          	add	a1,a4,a2
    b21c:	0005a583          	lw	a1,0(a1) # 10000 <_ebss+0x1b0>
    b220:	fff68693          	addi	a3,a3,-1

0000b224 <.LVL28>:
    b224:	ffc70713          	addi	a4,a4,-4
    b228:	00b72223          	sw	a1,4(a4)

0000b22c <.LVL29>:
    b22c:	fef6d6e3          	bge	a3,a5,b218 <.L9>
    b230:	fff78713          	addi	a4,a5,-1

0000b234 <.L10>:
    b234:	00170793          	addi	a5,a4,1
    b238:	00279793          	slli	a5,a5,0x2
    b23c:	00800693          	li	a3,8
    b240:	01010713          	addi	a4,sp,16
    b244:	00d7ea63          	bltu	a5,a3,b258 <.L12>
    b248:	00012823          	sw	zero,16(sp)
    b24c:	00072223          	sw	zero,4(a4)
    b250:	ff878793          	addi	a5,a5,-8
    b254:	01810713          	addi	a4,sp,24

0000b258 <.L12>:
    b258:	00400693          	li	a3,4
    b25c:	00d7e463          	bltu	a5,a3,b264 <.L13>
    b260:	00072023          	sw	zero,0(a4)

0000b264 <.L13>:
    b264:	00004737          	lui	a4,0x4
    b268:	c0c70713          	addi	a4,a4,-1012 # 3c0c <.L1+0xc>
    b26c:	40a70733          	sub	a4,a4,a0

0000b270 <.LVL31>:
    b270:	ed5ff06f          	j	b144 <.L3>

0000b274 <.L11>:
    b274:	00072583          	lw	a1,0(a4)
    b278:	ffc72883          	lw	a7,-4(a4)
    b27c:	00c70e33          	add	t3,a4,a2
    b280:	00d595b3          	sll	a1,a1,a3
    b284:	0108d8b3          	srl	a7,a7,a6
    b288:	0115e5b3          	or	a1,a1,a7
    b28c:	00be2023          	sw	a1,0(t3)
    b290:	ffc70713          	addi	a4,a4,-4
    b294:	f49ff06f          	j	b1dc <.L8>

0000b298 <.L4>:
    b298:	02050863          	beqz	a0,b2c8 <.L14>

0000b29c <.LBB12>:
    b29c:	01c79713          	slli	a4,a5,0x1c

0000b2a0 <.LVL35>:
    b2a0:	0045d693          	srli	a3,a1,0x4
    b2a4:	00d76733          	or	a4,a4,a3
    b2a8:	00e12c23          	sw	a4,24(sp)

0000b2ac <.LVL36>:
    b2ac:	0047d793          	srli	a5,a5,0x4

0000b2b0 <.LBE12>:
    b2b0:	00008737          	lui	a4,0x8

0000b2b4 <.LBB13>:
    b2b4:	01c59413          	slli	s0,a1,0x1c

0000b2b8 <.LBE13>:
    b2b8:	00e7e7b3          	or	a5,a5,a4

0000b2bc <.LBB14>:
    b2bc:	00812a23          	sw	s0,20(sp)

0000b2c0 <.LVL39>:
    b2c0:	00012823          	sw	zero,16(sp)

0000b2c4 <.LBE14>:
    b2c4:	00f12e23          	sw	a5,28(sp)

0000b2c8 <.L14>:
    b2c8:	00008737          	lui	a4,0x8
    b2cc:	fff70713          	addi	a4,a4,-1 # 7fff <.LVL163+0x7>
    b2d0:	e75ff06f          	j	b144 <.L3>

0000b2d4 <__trunctfdf2>:
#include "double.h"
#include "quad.h"

DFtype
__trunctfdf2 (TFtype a)
{
    b2d4:	00c52583          	lw	a1,12(a0)
    b2d8:	00852783          	lw	a5,8(a0)
    b2dc:	00052683          	lw	a3,0(a0)
    b2e0:	fe010113          	addi	sp,sp,-32
    b2e4:	00452703          	lw	a4,4(a0)

0000b2e8 <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_Q (A, a);
    b2e8:	00f12423          	sw	a5,8(sp)
    b2ec:	00f12c23          	sw	a5,24(sp)
    b2f0:	01059793          	slli	a5,a1,0x10
    b2f4:	0107d793          	srli	a5,a5,0x10
    b2f8:	00d12023          	sw	a3,0(sp)
    b2fc:	00d12823          	sw	a3,16(sp)
    b300:	01010613          	addi	a2,sp,16
    b304:	00159693          	slli	a3,a1,0x1
    b308:	00b12623          	sw	a1,12(sp)
    b30c:	00f12e23          	sw	a5,28(sp)
    b310:	00e12223          	sw	a4,4(sp)
    b314:	00e12a23          	sw	a4,20(sp)
    b318:	0116d693          	srli	a3,a3,0x11

0000b31c <.LVL1>:
    b31c:	01f5d593          	srli	a1,a1,0x1f

0000b320 <.LBB4>:
    b320:	01c10793          	addi	a5,sp,28
    b324:	00060893          	mv	a7,a2

0000b328 <.L2>:
    b328:	0007a703          	lw	a4,0(a5)
    b32c:	ffc7a503          	lw	a0,-4(a5)
    b330:	ffc78793          	addi	a5,a5,-4
    b334:	00371713          	slli	a4,a4,0x3
    b338:	01d55513          	srli	a0,a0,0x1d
    b33c:	00a76733          	or	a4,a4,a0
    b340:	00e7a223          	sw	a4,4(a5)
    b344:	fef612e3          	bne	a2,a5,b328 <.L2>

0000b348 <.LVL4>:
    b348:	01012503          	lw	a0,16(sp)

0000b34c <.LBE4>:
#if _FP_W_TYPE_SIZE < 64
  FP_TRUNC (D, Q, 2, 4, R, A);
    b34c:	00008737          	lui	a4,0x8
    b350:	00168793          	addi	a5,a3,1

0000b354 <.LBB5>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    b354:	00351513          	slli	a0,a0,0x3

0000b358 <.LBE5>:
  FP_TRUNC (D, Q, 2, 4, R, A);
    b358:	ffe70713          	addi	a4,a4,-2 # 7ffe <.LVL163+0x6>

0000b35c <.LBB6>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    b35c:	00a12823          	sw	a0,16(sp)

0000b360 <.LBE6>:
  FP_TRUNC (D, Q, 2, 4, R, A);
    b360:	00e7f7b3          	and	a5,a5,a4
    b364:	22078063          	beqz	a5,b584 <.L3>
    b368:	ffffc7b7          	lui	a5,0xffffc
    b36c:	40078793          	addi	a5,a5,1024 # ffffc400 <_ebss+0xfffec5b0>
    b370:	00f686b3          	add	a3,a3,a5

0000b374 <.LVL6>:
    b374:	7fe00793          	li	a5,2046
    b378:	28d7cc63          	blt	a5,a3,b610 <.L21>
    b37c:	0cd05863          	blez	a3,b44c <.L5>

0000b380 <.LBB7>:
    b380:	01812603          	lw	a2,24(sp)
    b384:	01c12783          	lw	a5,28(sp)
    b388:	01412703          	lw	a4,20(sp)

0000b38c <.LVL8>:
    b38c:	01c65813          	srli	a6,a2,0x1c
    b390:	00479793          	slli	a5,a5,0x4
    b394:	0107e7b3          	or	a5,a5,a6
    b398:	00f12a23          	sw	a5,20(sp)

0000b39c <.LBB9>:
    b39c:	00471793          	slli	a5,a4,0x4
    b3a0:	00a7e7b3          	or	a5,a5,a0

0000b3a4 <.LVL10>:
    b3a4:	01c75713          	srli	a4,a4,0x1c

0000b3a8 <.LVL11>:
    b3a8:	00461613          	slli	a2,a2,0x4
    b3ac:	00f037b3          	snez	a5,a5

0000b3b0 <.LVL12>:
    b3b0:	00c76733          	or	a4,a4,a2

0000b3b4 <.LBE9>:
    b3b4:	00e7e7b3          	or	a5,a5,a4

0000b3b8 <.L6>:
    b3b8:	01412703          	lw	a4,20(sp)

0000b3bc <.L17>:
#else
  FP_TRUNC (D, Q, 1, 2, R, A);
#endif
  FP_PACK_SEMIRAW_D (r, R);
    b3bc:	0077f613          	andi	a2,a5,7
    b3c0:	02060063          	beqz	a2,b3e0 <.L18>

0000b3c4 <.LVL15>:
    b3c4:	00f7f613          	andi	a2,a5,15
    b3c8:	00400513          	li	a0,4
    b3cc:	00a60a63          	beq	a2,a0,b3e0 <.L18>

0000b3d0 <.LBB12>:
    b3d0:	00478613          	addi	a2,a5,4
    b3d4:	00f63533          	sltu	a0,a2,a5
    b3d8:	00a70733          	add	a4,a4,a0
    b3dc:	00060793          	mv	a5,a2

0000b3e0 <.L18>:
    b3e0:	00800637          	lui	a2,0x800
    b3e4:	00c77633          	and	a2,a4,a2
    b3e8:	1e060a63          	beqz	a2,b5dc <.L7>
    b3ec:	ff800537          	lui	a0,0xff800
    b3f0:	fff50513          	addi	a0,a0,-1 # ff7fffff <_ebss+0xff7f01af>
    b3f4:	00168693          	addi	a3,a3,1
    b3f8:	7ff00813          	li	a6,2047
    b3fc:	00a77533          	and	a0,a4,a0

0000b400 <.LVL17>:
    b400:	00000613          	li	a2,0
    b404:	00000713          	li	a4,0
    b408:	01068a63          	beq	a3,a6,b41c <.L4>
    b40c:	0037d793          	srli	a5,a5,0x3

0000b410 <.LVL18>:
    b410:	01d51613          	slli	a2,a0,0x1d
    b414:	00f66633          	or	a2,a2,a5

0000b418 <.LVL19>:
    b418:	00355713          	srli	a4,a0,0x3

0000b41c <.L4>:
    b41c:	7ff007b7          	lui	a5,0x7ff00
    b420:	01469693          	slli	a3,a3,0x14
    b424:	00c71713          	slli	a4,a4,0xc

0000b428 <.LVL21>:
    b428:	00f6f6b3          	and	a3,a3,a5
    b42c:	00c75713          	srli	a4,a4,0xc
    b430:	01f59593          	slli	a1,a1,0x1f

0000b434 <.LVL22>:
    b434:	00e6e6b3          	or	a3,a3,a4
    b438:	00b6e7b3          	or	a5,a3,a1

0000b43c <.LBE20>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    b43c:	00060513          	mv	a0,a2
    b440:	00078593          	mv	a1,a5
    b444:	02010113          	addi	sp,sp,32

0000b448 <.LVL24>:
    b448:	00008067          	ret

0000b44c <.L5>:
  FP_TRUNC (D, Q, 2, 4, R, A);
    b44c:	fcc00793          	li	a5,-52
    b450:	18f6c063          	blt	a3,a5,b5d0 <.L22>
    b454:	01c12783          	lw	a5,28(sp)
    b458:	00080737          	lui	a4,0x80

0000b45c <.LBB21>:
    b45c:	00060813          	mv	a6,a2

0000b460 <.LBE21>:
    b460:	00f76eb3          	or	t4,a4,a5

0000b464 <.LBB23>:
    b464:	03d00793          	li	a5,61
    b468:	40d787b3          	sub	a5,a5,a3
    b46c:	4057d693          	srai	a3,a5,0x5

0000b470 <.LVL26>:
    b470:	01f7f713          	andi	a4,a5,31

0000b474 <.LBE23>:
    b474:	01d12e23          	sw	t4,28(sp)

0000b478 <.LBB24>:
    b478:	00000513          	li	a0,0
    b47c:	00000793          	li	a5,0

0000b480 <.L8>:
    b480:	00082303          	lw	t1,0(a6)
    b484:	00150513          	addi	a0,a0,1

0000b488 <.LVL29>:
    b488:	00480813          	addi	a6,a6,4
    b48c:	0067e7b3          	or	a5,a5,t1

0000b490 <.LVL30>:
    b490:	fea698e3          	bne	a3,a0,b480 <.L8>
    b494:	00300513          	li	a0,3

0000b498 <.LVL31>:
    b498:	40d50533          	sub	a0,a0,a3
    b49c:	00269813          	slli	a6,a3,0x2
    b4a0:	02071463          	bnez	a4,b4c8 <.L9>

0000b4a4 <.L10>:
    b4a4:	01088333          	add	t1,a7,a6
    b4a8:	00032303          	lw	t1,0(t1)
    b4ac:	00170713          	addi	a4,a4,1 # 80001 <_ebss+0x701b1>

0000b4b0 <.LVL33>:
    b4b0:	00488893          	addi	a7,a7,4
    b4b4:	fe68ae23          	sw	t1,-4(a7)

0000b4b8 <.LVL34>:
    b4b8:	fee556e3          	bge	a0,a4,b4a4 <.L10>
    b4bc:	00400713          	li	a4,4

0000b4c0 <.LVL35>:
    b4c0:	40d706b3          	sub	a3,a4,a3

0000b4c4 <.LVL36>:
    b4c4:	04c0006f          	j	b510 <.L14>

0000b4c8 <.L9>:
    b4c8:	02080893          	addi	a7,a6,32
    b4cc:	002888b3          	add	a7,a7,sp
    b4d0:	ff08a883          	lw	a7,-16(a7)
    b4d4:	02000e13          	li	t3,32
    b4d8:	40ee0e33          	sub	t3,t3,a4
    b4dc:	01c898b3          	sll	a7,a7,t3
    b4e0:	0117e7b3          	or	a5,a5,a7

0000b4e4 <.LVL38>:
    b4e4:	00000f13          	li	t5,0
    b4e8:	010608b3          	add	a7,a2,a6
    b4ec:	41000833          	neg	a6,a6

0000b4f0 <.L12>:
    b4f0:	06af4663          	blt	t5,a0,b55c <.L13>
    b4f4:	00251513          	slli	a0,a0,0x2
    b4f8:	02050513          	addi	a0,a0,32
    b4fc:	00400813          	li	a6,4
    b500:	00250533          	add	a0,a0,sp
    b504:	00eed733          	srl	a4,t4,a4

0000b508 <.LVL40>:
    b508:	40d806b3          	sub	a3,a6,a3

0000b50c <.LVL41>:
    b50c:	fee52823          	sw	a4,-16(a0)

0000b510 <.L14>:
    b510:	00400513          	li	a0,4
    b514:	40d50533          	sub	a0,a0,a3
    b518:	00269693          	slli	a3,a3,0x2

0000b51c <.LVL43>:
    b51c:	00d60733          	add	a4,a2,a3
    b520:	00251693          	slli	a3,a0,0x2
    b524:	00800613          	li	a2,8
    b528:	00c6ea63          	bltu	a3,a2,b53c <.L15>
    b52c:	00072023          	sw	zero,0(a4)
    b530:	00072223          	sw	zero,4(a4)
    b534:	ff868693          	addi	a3,a3,-8
    b538:	00870713          	addi	a4,a4,8

0000b53c <.L15>:
    b53c:	00400613          	li	a2,4
    b540:	00c6e463          	bltu	a3,a2,b548 <.L16>
    b544:	00072023          	sw	zero,0(a4)

0000b548 <.L16>:
    b548:	01012703          	lw	a4,16(sp)

0000b54c <.LBB25>:
    b54c:	00f037b3          	snez	a5,a5

0000b550 <.LBE25>:
    b550:	00000693          	li	a3,0

0000b554 <.LBB29>:
    b554:	00e7e7b3          	or	a5,a5,a4
    b558:	e61ff06f          	j	b3b8 <.L6>

0000b55c <.L13>:
    b55c:	0008a303          	lw	t1,0(a7)
    b560:	0048af83          	lw	t6,4(a7)
    b564:	010882b3          	add	t0,a7,a6
    b568:	00e35333          	srl	t1,t1,a4
    b56c:	01cf9fb3          	sll	t6,t6,t3
    b570:	01f36333          	or	t1,t1,t6
    b574:	0062a023          	sw	t1,0(t0) # 10000 <_ebss+0x1b0>

0000b578 <.LVL47>:
    b578:	001f0f13          	addi	t5,t5,1

0000b57c <.LVL48>:
    b57c:	00488893          	addi	a7,a7,4
    b580:	f71ff06f          	j	b4f0 <.L12>

0000b584 <.L3>:
    b584:	08068863          	beqz	a3,b614 <.L23>

0000b588 <.LBB10>:
    b588:	01412783          	lw	a5,20(sp)
    b58c:	01812703          	lw	a4,24(sp)
    b590:	01c12683          	lw	a3,28(sp)

0000b594 <.LBE10>:
    b594:	00f76633          	or	a2,a4,a5
    b598:	00d66633          	or	a2,a2,a3
    b59c:	00a66633          	or	a2,a2,a0
    b5a0:	08060063          	beqz	a2,b620 <.L24>

0000b5a4 <.LBB31>:
    b5a4:	00471613          	slli	a2,a4,0x4
    b5a8:	00469693          	slli	a3,a3,0x4

0000b5ac <.LVL52>:
    b5ac:	01c7d793          	srli	a5,a5,0x1c

0000b5b0 <.LVL53>:
    b5b0:	01c75713          	srli	a4,a4,0x1c

0000b5b4 <.LVL54>:
    b5b4:	00d76733          	or	a4,a4,a3

0000b5b8 <.LVL55>:
    b5b8:	00c7e7b3          	or	a5,a5,a2

0000b5bc <.LBE32>:
    b5bc:	004006b7          	lui	a3,0x400
    b5c0:	00d76733          	or	a4,a4,a3

0000b5c4 <.LVL57>:
    b5c4:	ff87f793          	andi	a5,a5,-8

0000b5c8 <.LVL58>:
    b5c8:	7ff00693          	li	a3,2047
    b5cc:	df1ff06f          	j	b3bc <.L17>

0000b5d0 <.L22>:
    b5d0:	00000693          	li	a3,0

0000b5d4 <.LBB15>:
  FP_PACK_SEMIRAW_D (r, R);
    b5d4:	00500793          	li	a5,5
    b5d8:	00000713          	li	a4,0

0000b5dc <.L7>:
    b5dc:	0037d793          	srli	a5,a5,0x3

0000b5e0 <.LVL62>:
    b5e0:	01d71613          	slli	a2,a4,0x1d
    b5e4:	00f66633          	or	a2,a2,a5

0000b5e8 <.LVL63>:
    b5e8:	7ff00793          	li	a5,2047
    b5ec:	00375713          	srli	a4,a4,0x3
    b5f0:	e2f696e3          	bne	a3,a5,b41c <.L4>

0000b5f4 <.LVL65>:
    b5f4:	00e66633          	or	a2,a2,a4
    b5f8:	00000713          	li	a4,0
    b5fc:	e20600e3          	beqz	a2,b41c <.L4>
    b600:	00080737          	lui	a4,0x80
    b604:	00000613          	li	a2,0
    b608:	00000593          	li	a1,0

0000b60c <.LVL66>:
    b60c:	e11ff06f          	j	b41c <.L4>

0000b610 <.L21>:
    b610:	7ff00693          	li	a3,2047

0000b614 <.L23>:
    b614:	00000713          	li	a4,0
    b618:	00000613          	li	a2,0
    b61c:	e01ff06f          	j	b41c <.L4>

0000b620 <.L24>:
    b620:	00000713          	li	a4,0

0000b624 <.LBE34>:
    b624:	7ff00693          	li	a3,2047
    b628:	df5ff06f          	j	b41c <.L4>

0000b62c <main>:
    b62c:	f6010113          	addi	sp,sp,-160
    b630:	09512223          	sw	s5,132(sp)
    b634:	05e10a93          	addi	s5,sp,94
    b638:	08812c23          	sw	s0,152(sp)
    b63c:	00058613          	mv	a2,a1
    b640:	00058413          	mv	s0,a1
    b644:	00a12623          	sw	a0,12(sp)
    b648:	00c10593          	addi	a1,sp,12
    b64c:	000a8513          	mv	a0,s5
    b650:	08112e23          	sw	ra,156(sp)
    b654:	08912a23          	sw	s1,148(sp)
    b658:	09212823          	sw	s2,144(sp)
    b65c:	09312623          	sw	s3,140(sp)
    b660:	09412423          	sw	s4,136(sp)
    b664:	09612023          	sw	s6,128(sp)
    b668:	07712e23          	sw	s7,124(sp)
    b66c:	07812c23          	sw	s8,120(sp)
    b670:	07912a23          	sw	s9,116(sp)
    b674:	07a12823          	sw	s10,112(sp)
    b678:	07b12623          	sw	s11,108(sp)
    b67c:	b35f40ef          	jal	ra,1b0 <portable_init>
    b680:	00c12583          	lw	a1,12(sp)
    b684:	00040613          	mv	a2,s0
    b688:	00100513          	li	a0,1
    b68c:	ec5f50ef          	jal	ra,1550 <get_seed_args>
    b690:	00c12583          	lw	a1,12(sp)
    b694:	00a11e23          	sh	a0,28(sp)
    b698:	00040613          	mv	a2,s0
    b69c:	00200513          	li	a0,2
    b6a0:	eb1f50ef          	jal	ra,1550 <get_seed_args>
    b6a4:	00c12583          	lw	a1,12(sp)
    b6a8:	00a11f23          	sh	a0,30(sp)
    b6ac:	00040613          	mv	a2,s0
    b6b0:	00300513          	li	a0,3
    b6b4:	e9df50ef          	jal	ra,1550 <get_seed_args>
    b6b8:	00c12583          	lw	a1,12(sp)
    b6bc:	02a11023          	sh	a0,32(sp)
    b6c0:	00040613          	mv	a2,s0
    b6c4:	00400513          	li	a0,4
    b6c8:	e89f50ef          	jal	ra,1550 <get_seed_args>
    b6cc:	00c12583          	lw	a1,12(sp)
    b6d0:	02a12c23          	sw	a0,56(sp)
    b6d4:	00040613          	mv	a2,s0
    b6d8:	00500513          	li	a0,5
    b6dc:	e75f50ef          	jal	ra,1550 <get_seed_args>
    b6e0:	00051463          	bnez	a0,b6e8 <.L7>
    b6e4:	00700513          	li	a0,7

0000b6e8 <.L7>:
    b6e8:	01c12783          	lw	a5,28(sp)
    b6ec:	02a12e23          	sw	a0,60(sp)
    b6f0:	00079a63          	bnez	a5,b704 <.L8>
    b6f4:	02011703          	lh	a4,32(sp)
    b6f8:	02071863          	bnez	a4,b728 <.L10>
    b6fc:	06600713          	li	a4,102
    b700:	02e11023          	sh	a4,32(sp)

0000b704 <.L8>:
    b704:	00100713          	li	a4,1
    b708:	02e79063          	bne	a5,a4,b728 <.L10>
    b70c:	02011783          	lh	a5,32(sp)
    b710:	00079c63          	bnez	a5,b728 <.L10>
    b714:	341537b7          	lui	a5,0x34153
    b718:	41578793          	addi	a5,a5,1045 # 34153415 <_ebss+0x341435c5>
    b71c:	00f12e23          	sw	a5,28(sp)
    b720:	06600793          	li	a5,102
    b724:	02f11023          	sh	a5,32(sp)

0000b728 <.L10>:
    b728:	00c12583          	lw	a1,12(sp)
    b72c:	00040613          	mv	a2,s0
    b730:	00700513          	li	a0,7
    b734:	e1df50ef          	jal	ra,1550 <get_seed_args>
    b738:	01051513          	slli	a0,a0,0x10
    b73c:	41055513          	srai	a0,a0,0x10
    b740:	00051463          	bnez	a0,b748 <.L12>
    b744:	7d000513          	li	a0,2000

0000b748 <.L12>:
    b748:	02a12a23          	sw	a0,52(sp)
    b74c:	9d5f40ef          	jal	ra,120 <portable_malloc>
    b750:	03c12783          	lw	a5,60(sp)
    b754:	02a12223          	sw	a0,36(sp)
    b758:	04011e23          	sh	zero,92(sp)
    b75c:	0027f693          	andi	a3,a5,2
    b760:	0017f713          	andi	a4,a5,1
    b764:	00068463          	beqz	a3,b76c <.L13>
    b768:	00170713          	addi	a4,a4,1 # 80001 <_ebss+0x701b1>

0000b76c <.L13>:
    b76c:	0047f693          	andi	a3,a5,4
    b770:	00068863          	beqz	a3,b780 <.L14>
    b774:	00170713          	addi	a4,a4,1
    b778:	01071713          	slli	a4,a4,0x10
    b77c:	01075713          	srli	a4,a4,0x10

0000b780 <.L14>:
    b780:	03412583          	lw	a1,52(sp)
    b784:	01c10613          	addi	a2,sp,28
    b788:	00000693          	li	a3,0
    b78c:	02e5d5b3          	divu	a1,a1,a4
    b790:	00060493          	mv	s1,a2
    b794:	00000713          	li	a4,0
    b798:	00100313          	li	t1,1
    b79c:	00300893          	li	a7,3
    b7a0:	02b12a23          	sw	a1,52(sp)

0000b7a4 <.L16>:
    b7a4:	00d31833          	sll	a6,t1,a3
    b7a8:	00f87833          	and	a6,a6,a5
    b7ac:	00080e63          	beqz	a6,b7c8 <.L15>
    b7b0:	02b70833          	mul	a6,a4,a1
    b7b4:	00170713          	addi	a4,a4,1
    b7b8:	01071713          	slli	a4,a4,0x10
    b7bc:	01075713          	srli	a4,a4,0x10
    b7c0:	01050833          	add	a6,a0,a6
    b7c4:	01062623          	sw	a6,12(a2) # 80000c <_ebss+0x7f01bc>

0000b7c8 <.L15>:
    b7c8:	00168693          	addi	a3,a3,1 # 400001 <_ebss+0x3f01b1>
    b7cc:	00460613          	addi	a2,a2,4
    b7d0:	fd169ae3          	bne	a3,a7,b7a4 <.L16>
    b7d4:	0017f793          	andi	a5,a5,1
    b7d8:	00078c63          	beqz	a5,b7f0 <.L56>
    b7dc:	01c11603          	lh	a2,28(sp)
    b7e0:	02812583          	lw	a1,40(sp)
    b7e4:	03412503          	lw	a0,52(sp)
    b7e8:	fe5f40ef          	jal	ra,7cc <core_list_init>
    b7ec:	04a12023          	sw	a0,64(sp)

0000b7f0 <.L56>:
    b7f0:	03c12783          	lw	a5,60(sp)
    b7f4:	0027f793          	andi	a5,a5,2
    b7f8:	02078263          	beqz	a5,b81c <.L18>
    b7fc:	01e11783          	lh	a5,30(sp)
    b800:	01c11603          	lh	a2,28(sp)
    b804:	02c12583          	lw	a1,44(sp)
    b808:	03412503          	lw	a0,52(sp)
    b80c:	01079793          	slli	a5,a5,0x10
    b810:	04410693          	addi	a3,sp,68
    b814:	00c7e633          	or	a2,a5,a2
    b818:	9e4f50ef          	jal	ra,9fc <core_init_matrix>

0000b81c <.L18>:
    b81c:	03c12783          	lw	a5,60(sp)
    b820:	0047f793          	andi	a5,a5,4
    b824:	00078a63          	beqz	a5,b838 <.L19>
    b828:	03012603          	lw	a2,48(sp)
    b82c:	01c11583          	lh	a1,28(sp)
    b830:	03412503          	lw	a0,52(sp)
    b834:	f48f50ef          	jal	ra,f7c <core_init_state>

0000b838 <.L19>:
    b838:	03812783          	lw	a5,56(sp)
    b83c:	06079663          	bnez	a5,b8a8 <.L20>
    b840:	00100793          	li	a5,1
    b844:	02f12c23          	sw	a5,56(sp)
    b848:	00002797          	auipc	a5,0x2
    b84c:	16878793          	addi	a5,a5,360 # d9b0 <.LC0>
    b850:	0007ab03          	lw	s6,0(a5)
    b854:	0047ab83          	lw	s7,4(a5)
    b858:	00000913          	li	s2,0
    b85c:	00000413          	li	s0,0
    b860:	00a00a13          	li	s4,10

0000b864 <.L21>:
    b864:	000b0613          	mv	a2,s6
    b868:	000b8693          	mv	a3,s7
    b86c:	00090513          	mv	a0,s2
    b870:	00040593          	mv	a1,s0
    b874:	03812983          	lw	s3,56(sp)
    b878:	d88f60ef          	jal	ra,1e00 <__ledf2>
    b87c:	30054063          	bltz	a0,bb7c <.L22>
    b880:	00090513          	mv	a0,s2
    b884:	00040593          	mv	a1,s0
    b888:	e88f60ef          	jal	ra,1f10 <__fixunsdfsi>
    b88c:	00051463          	bnez	a0,b894 <.L23>
    b890:	00100513          	li	a0,1

0000b894 <.L23>:
    b894:	00a00793          	li	a5,10
    b898:	02a7d7b3          	divu	a5,a5,a0
    b89c:	00178793          	addi	a5,a5,1
    b8a0:	033787b3          	mul	a5,a5,s3
    b8a4:	02f12c23          	sw	a5,56(sp)

0000b8a8 <.L20>:
    b8a8:	881f40ef          	jal	ra,128 <start_time>
    b8ac:	00048513          	mv	a0,s1
    b8b0:	8c4f50ef          	jal	ra,974 <iterate>
    b8b4:	885f40ef          	jal	ra,138 <stop_time>
    b8b8:	891f40ef          	jal	ra,148 <get_time>
    b8bc:	00a12423          	sw	a0,8(sp)
    b8c0:	01c11503          	lh	a0,28(sp)
    b8c4:	00000593          	li	a1,0
    b8c8:	00000997          	auipc	s3,0x0
    b8cc:	6149a983          	lw	s3,1556(s3) # bedc <.LLST21+0x2a>
    b8d0:	d45f50ef          	jal	ra,1614 <crc16>
    b8d4:	00050593          	mv	a1,a0
    b8d8:	01e11503          	lh	a0,30(sp)
    b8dc:	d39f50ef          	jal	ra,1614 <crc16>
    b8e0:	00050593          	mv	a1,a0
    b8e4:	02011503          	lh	a0,32(sp)
    b8e8:	d2df50ef          	jal	ra,1614 <crc16>
    b8ec:	00050593          	mv	a1,a0
    b8f0:	03411503          	lh	a0,52(sp)
    b8f4:	d21f50ef          	jal	ra,1614 <crc16>
    b8f8:	000087b7          	lui	a5,0x8
    b8fc:	b0578793          	addi	a5,a5,-1275 # 7b05 <.L3+0x5>
    b900:	00050493          	mv	s1,a0
    b904:	40f50063          	beq	a0,a5,bd04 <.L24>
    b908:	2aa7e063          	bltu	a5,a0,bba8 <.L25>
    b90c:	000027b7          	lui	a5,0x2
    b910:	8f278793          	addi	a5,a5,-1806 # 18f2 <.LVL71+0x2>
    b914:	40f50c63          	beq	a0,a5,bd2c <.L26>
    b918:	000057b7          	lui	a5,0x5
    b91c:	eaf78793          	addi	a5,a5,-337 # 4eaf <__GI_config_read+0x33>
    b920:	3ef50c63          	beq	a0,a5,bd18 <.L27>

0000b924 <.L89>:
    b924:	fff00a13          	li	s4,-1
    b928:	fff00b13          	li	s6,-1

0000b92c <.L28>:
    b92c:	cf5f50ef          	jal	ra,1620 <check_data_types>
    b930:	03412583          	lw	a1,52(sp)
    b934:	01650433          	add	s0,a0,s6
    b938:	00002517          	auipc	a0,0x2
    b93c:	d2450513          	addi	a0,a0,-732 # d65c <.LC9>
    b940:	81df60ef          	jal	ra,215c <__GI_printf>
    b944:	00812583          	lw	a1,8(sp)
    b948:	00002517          	auipc	a0,0x2
    b94c:	d2c50513          	addi	a0,a0,-724 # d674 <.LC10>
    b950:	01041413          	slli	s0,s0,0x10
    b954:	809f60ef          	jal	ra,215c <__GI_printf>
    b958:	00812503          	lw	a0,8(sp)
    b95c:	01045413          	srli	s0,s0,0x10
    b960:	825f40ef          	jal	ra,184 <time_in_secs>
    b964:	00050613          	mv	a2,a0
    b968:	00058693          	mv	a3,a1
    b96c:	00002517          	auipc	a0,0x2
    b970:	d2050513          	addi	a0,a0,-736 # d68c <.LC11>
    b974:	fe8f60ef          	jal	ra,215c <__GI_printf>
    b978:	00812503          	lw	a0,8(sp)
    b97c:	809f40ef          	jal	ra,184 <time_in_secs>
    b980:	00000613          	li	a2,0
    b984:	00000693          	li	a3,0
    b988:	b68f60ef          	jal	ra,1cf0 <__gedf2>
    b98c:	04a05663          	blez	a0,b9d8 <.L37>
    b990:	0009a783          	lw	a5,0(s3)
    b994:	03812503          	lw	a0,56(sp)
    b998:	02f50533          	mul	a0,a0,a5
    b99c:	e94f60ef          	jal	ra,2030 <__floatunsidf>
    b9a0:	00050b93          	mv	s7,a0
    b9a4:	00812503          	lw	a0,8(sp)
    b9a8:	00058b13          	mv	s6,a1
    b9ac:	fd8f40ef          	jal	ra,184 <time_in_secs>
    b9b0:	00050613          	mv	a2,a0
    b9b4:	00058693          	mv	a3,a1
    b9b8:	000b8513          	mv	a0,s7
    b9bc:	000b0593          	mv	a1,s6
    b9c0:	c69f50ef          	jal	ra,1628 <__divdf3>
    b9c4:	00050613          	mv	a2,a0
    b9c8:	00058693          	mv	a3,a1
    b9cc:	00002517          	auipc	a0,0x2
    b9d0:	cd850513          	addi	a0,a0,-808 # d6a4 <.LC12>
    b9d4:	f88f60ef          	jal	ra,215c <__GI_printf>

0000b9d8 <.L37>:
    b9d8:	00812503          	lw	a0,8(sp)
    b9dc:	fa8f40ef          	jal	ra,184 <time_in_secs>
    b9e0:	00002797          	auipc	a5,0x2
    b9e4:	fd878793          	addi	a5,a5,-40 # d9b8 <.LC13>
    b9e8:	0007a603          	lw	a2,0(a5)
    b9ec:	0047a683          	lw	a3,4(a5)
    b9f0:	c10f60ef          	jal	ra,1e00 <__ledf2>
    b9f4:	34054663          	bltz	a0,bd40 <.L39>

0000b9f8 <.L90>:
    b9f8:	0009a783          	lw	a5,0(s3)
    b9fc:	03812583          	lw	a1,56(sp)
    ba00:	00002517          	auipc	a0,0x2
    ba04:	cfc50513          	addi	a0,a0,-772 # d6fc <.LC15>
    ba08:	01041413          	slli	s0,s0,0x10
    ba0c:	02f585b3          	mul	a1,a1,a5
    ba10:	41045413          	srai	s0,s0,0x10
    ba14:	f48f60ef          	jal	ra,215c <__GI_printf>
    ba18:	00002597          	auipc	a1,0x2
    ba1c:	cfc58593          	addi	a1,a1,-772 # d714 <.LC16>
    ba20:	00002517          	auipc	a0,0x2
    ba24:	d0050513          	addi	a0,a0,-768 # d720 <.LC17>
    ba28:	f34f60ef          	jal	ra,215c <__GI_printf>
    ba2c:	00002597          	auipc	a1,0x2
    ba30:	d0c58593          	addi	a1,a1,-756 # d738 <.LC18>
    ba34:	00002517          	auipc	a0,0x2
    ba38:	d7450513          	addi	a0,a0,-652 # d7a8 <.LC19>
    ba3c:	f20f60ef          	jal	ra,215c <__GI_printf>
    ba40:	00002597          	auipc	a1,0x2
    ba44:	d8058593          	addi	a1,a1,-640 # d7c0 <.LC20>
    ba48:	00002517          	auipc	a0,0x2
    ba4c:	dc850513          	addi	a0,a0,-568 # d810 <.LC21>
    ba50:	f0cf60ef          	jal	ra,215c <__GI_printf>
    ba54:	00048593          	mv	a1,s1
    ba58:	00002517          	auipc	a0,0x2
    ba5c:	dd050513          	addi	a0,a0,-560 # d828 <.LC22>
    ba60:	efcf60ef          	jal	ra,215c <__GI_printf>
    ba64:	03c12783          	lw	a5,60(sp)
    ba68:	0017f793          	andi	a5,a5,1
    ba6c:	30079e63          	bnez	a5,bd88 <.L57>

0000ba70 <.L45>:
    ba70:	03c12783          	lw	a5,60(sp)
    ba74:	0027f793          	andi	a5,a5,2
    ba78:	34079c63          	bnez	a5,bdd0 <.L58>

0000ba7c <.L43>:
    ba7c:	03c12783          	lw	a5,60(sp)
    ba80:	0047f793          	andi	a5,a5,4
    ba84:	38079a63          	bnez	a5,be18 <.L59>

0000ba88 <.L47>:
    ba88:	00000493          	li	s1,0
    ba8c:	04400b13          	li	s6,68
    ba90:	00002b97          	auipc	s7,0x2
    ba94:	e08b8b93          	addi	s7,s7,-504 # d898 <.LC26>

0000ba98 <.L49>:
    ba98:	0009a783          	lw	a5,0(s3)
    ba9c:	38f4e863          	bltu	s1,a5,be2c <.L51>
    baa0:	3a041c63          	bnez	s0,be58 <.L52>
    baa4:	00002517          	auipc	a0,0x2
    baa8:	e1050513          	addi	a0,a0,-496 # d8b4 <.LC27>
    baac:	e50f60ef          	jal	ra,20fc <puts>
    bab0:	00300793          	li	a5,3
    bab4:	06fa1c63          	bne	s4,a5,bb2c <.L53>
    bab8:	0009a783          	lw	a5,0(s3)
    babc:	03812503          	lw	a0,56(sp)
    bac0:	02f50533          	mul	a0,a0,a5
    bac4:	d6cf60ef          	jal	ra,2030 <__floatunsidf>
    bac8:	00050493          	mv	s1,a0
    bacc:	00812503          	lw	a0,8(sp)
    bad0:	00058413          	mv	s0,a1
    bad4:	eb0f40ef          	jal	ra,184 <time_in_secs>
    bad8:	00050613          	mv	a2,a0
    badc:	00058693          	mv	a3,a1
    bae0:	00048513          	mv	a0,s1
    bae4:	00040593          	mv	a1,s0
    bae8:	b41f50ef          	jal	ra,1628 <__divdf3>
    baec:	00050613          	mv	a2,a0
    baf0:	00058693          	mv	a3,a1
    baf4:	00002797          	auipc	a5,0x2
    baf8:	c4478793          	addi	a5,a5,-956 # d738 <.LC18>
    bafc:	00002717          	auipc	a4,0x2
    bb00:	c1870713          	addi	a4,a4,-1000 # d714 <.LC16>
    bb04:	00002517          	auipc	a0,0x2
    bb08:	dfc50513          	addi	a0,a0,-516 # d900 <.LC28>
    bb0c:	e50f60ef          	jal	ra,215c <__GI_printf>
    bb10:	00002597          	auipc	a1,0x2
    bb14:	17c5a583          	lw	a1,380(a1) # dc8c <mem_name+0x4>
    bb18:	00002517          	auipc	a0,0x2
    bb1c:	e0450513          	addi	a0,a0,-508 # d91c <.LC29>
    bb20:	e3cf60ef          	jal	ra,215c <__GI_printf>
    bb24:	00a00513          	li	a0,10
    bb28:	a31f70ef          	jal	ra,3558 <putchar>

0000bb2c <.L53>:
    bb2c:	02412503          	lw	a0,36(sp)
    bb30:	df4f40ef          	jal	ra,124 <portable_free>
    bb34:	000a8513          	mv	a0,s5
    bb38:	e84f40ef          	jal	ra,1bc <portable_fini>
    bb3c:	09c12083          	lw	ra,156(sp)
    bb40:	09812403          	lw	s0,152(sp)
    bb44:	09412483          	lw	s1,148(sp)
    bb48:	09012903          	lw	s2,144(sp)
    bb4c:	08c12983          	lw	s3,140(sp)
    bb50:	08812a03          	lw	s4,136(sp)
    bb54:	08412a83          	lw	s5,132(sp)
    bb58:	08012b03          	lw	s6,128(sp)
    bb5c:	07c12b83          	lw	s7,124(sp)
    bb60:	07812c03          	lw	s8,120(sp)
    bb64:	07412c83          	lw	s9,116(sp)
    bb68:	07012d03          	lw	s10,112(sp)
    bb6c:	06c12d83          	lw	s11,108(sp)
    bb70:	00000513          	li	a0,0
    bb74:	0a010113          	addi	sp,sp,160
    bb78:	00008067          	ret

0000bb7c <.L22>:
    bb7c:	034989b3          	mul	s3,s3,s4
    bb80:	03312c23          	sw	s3,56(sp)
    bb84:	da4f40ef          	jal	ra,128 <start_time>
    bb88:	00048513          	mv	a0,s1
    bb8c:	de9f40ef          	jal	ra,974 <iterate>
    bb90:	da8f40ef          	jal	ra,138 <stop_time>
    bb94:	db4f40ef          	jal	ra,148 <get_time>
    bb98:	decf40ef          	jal	ra,184 <time_in_secs>
    bb9c:	00050913          	mv	s2,a0
    bba0:	00058413          	mv	s0,a1
    bba4:	cc1ff06f          	j	b864 <.L21>

0000bba8 <.L25>:
    bba8:	000097b7          	lui	a5,0x9
    bbac:	a0278793          	addi	a5,a5,-1534 # 8a02 <.LBE5+0xe>
    bbb0:	02f50263          	beq	a0,a5,bbd4 <.L29>
    bbb4:	0000f7b7          	lui	a5,0xf
    bbb8:	9f578793          	addi	a5,a5,-1547 # e9f5 <_fixed_buffers+0xc41>
    bbbc:	d6f514e3          	bne	a0,a5,b924 <.L89>
    bbc0:	00002517          	auipc	a0,0x2
    bbc4:	9b050513          	addi	a0,a0,-1616 # d570 <.LC4>
    bbc8:	d34f60ef          	jal	ra,20fc <puts>
    bbcc:	00300a13          	li	s4,3
    bbd0:	0140006f          	j	bbe4 <.L31>

0000bbd4 <.L29>:
    bbd4:	00002517          	auipc	a0,0x2
    bbd8:	91450513          	addi	a0,a0,-1772 # d4e8 <.LC1>
    bbdc:	d20f60ef          	jal	ra,20fc <puts>
    bbe0:	00000a13          	li	s4,0

0000bbe4 <.L31>:
    bbe4:	001a1793          	slli	a5,s4,0x1
    bbe8:	00000b97          	auipc	s7,0x0
    bbec:	338b8b93          	addi	s7,s7,824 # bf20 <list_known_crc>
    bbf0:	00000b13          	li	s6,0
    bbf4:	00000413          	li	s0,0
    bbf8:	04400c13          	li	s8,68
    bbfc:	00fb8bb3          	add	s7,s7,a5
    bc00:	00002c97          	auipc	s9,0x2
    bc04:	9c8c8c93          	addi	s9,s9,-1592 # d5c8 <.LC6>
    bc08:	00002d17          	auipc	s10,0x2
    bc0c:	9f0d0d13          	addi	s10,s10,-1552 # d5f8 <.LC7>
    bc10:	00002d97          	auipc	s11,0x2
    bc14:	a1cd8d93          	addi	s11,s11,-1508 # d62c <.LC8>

0000bc18 <.L32>:
    bc18:	0009a783          	lw	a5,0(s3)
    bc1c:	d0f478e3          	bgeu	s0,a5,b92c <.L28>
    bc20:	038407b3          	mul	a5,s0,s8
    bc24:	06078793          	addi	a5,a5,96
    bc28:	00278933          	add	s2,a5,sp
    bc2c:	fdc92703          	lw	a4,-36(s2)
    bc30:	fe091e23          	sh	zero,-4(s2)
    bc34:	00177713          	andi	a4,a4,1
    bc38:	02070463          	beqz	a4,bc60 <.L33>
    bc3c:	ff695603          	lhu	a2,-10(s2)
    bc40:	000bd683          	lhu	a3,0(s7)
    bc44:	00d60e63          	beq	a2,a3,bc60 <.L33>
    bc48:	00040593          	mv	a1,s0
    bc4c:	000c8513          	mv	a0,s9
    bc50:	d0cf60ef          	jal	ra,215c <__GI_printf>
    bc54:	ffc95703          	lhu	a4,-4(s2)
    bc58:	00170713          	addi	a4,a4,1
    bc5c:	fee91e23          	sh	a4,-4(s2)

0000bc60 <.L33>:
    bc60:	038407b3          	mul	a5,s0,s8
    bc64:	06078793          	addi	a5,a5,96
    bc68:	00278933          	add	s2,a5,sp
    bc6c:	fdc92703          	lw	a4,-36(s2)
    bc70:	00277713          	andi	a4,a4,2
    bc74:	02070463          	beqz	a4,bc9c <.L34>
    bc78:	ff895603          	lhu	a2,-8(s2)
    bc7c:	00cbd683          	lhu	a3,12(s7)
    bc80:	00d60e63          	beq	a2,a3,bc9c <.L34>
    bc84:	00040593          	mv	a1,s0
    bc88:	000d0513          	mv	a0,s10
    bc8c:	cd0f60ef          	jal	ra,215c <__GI_printf>
    bc90:	ffc95703          	lhu	a4,-4(s2)
    bc94:	00170713          	addi	a4,a4,1
    bc98:	fee91e23          	sh	a4,-4(s2)

0000bc9c <.L34>:
    bc9c:	038407b3          	mul	a5,s0,s8
    bca0:	06078793          	addi	a5,a5,96
    bca4:	00278933          	add	s2,a5,sp
    bca8:	fdc92703          	lw	a4,-36(s2)
    bcac:	00477713          	andi	a4,a4,4
    bcb0:	02070463          	beqz	a4,bcd8 <.L35>
    bcb4:	ffa95603          	lhu	a2,-6(s2)
    bcb8:	018bd683          	lhu	a3,24(s7)
    bcbc:	00d60e63          	beq	a2,a3,bcd8 <.L35>
    bcc0:	00040593          	mv	a1,s0
    bcc4:	000d8513          	mv	a0,s11
    bcc8:	c94f60ef          	jal	ra,215c <__GI_printf>
    bccc:	ffc95703          	lhu	a4,-4(s2)
    bcd0:	00170713          	addi	a4,a4,1
    bcd4:	fee91e23          	sh	a4,-4(s2)

0000bcd8 <.L35>:
    bcd8:	038407b3          	mul	a5,s0,s8
    bcdc:	00140413          	addi	s0,s0,1
    bce0:	01041413          	slli	s0,s0,0x10
    bce4:	01045413          	srli	s0,s0,0x10
    bce8:	06078793          	addi	a5,a5,96
    bcec:	002787b3          	add	a5,a5,sp
    bcf0:	ffc7d783          	lhu	a5,-4(a5)
    bcf4:	016787b3          	add	a5,a5,s6
    bcf8:	01079b13          	slli	s6,a5,0x10
    bcfc:	410b5b13          	srai	s6,s6,0x10
    bd00:	f19ff06f          	j	bc18 <.L32>

0000bd04 <.L24>:
    bd04:	00002517          	auipc	a0,0x2
    bd08:	81050513          	addi	a0,a0,-2032 # d514 <.LC2>
    bd0c:	bf0f60ef          	jal	ra,20fc <puts>
    bd10:	00100a13          	li	s4,1
    bd14:	ed1ff06f          	j	bbe4 <.L31>

0000bd18 <.L27>:
    bd18:	00002517          	auipc	a0,0x2
    bd1c:	82850513          	addi	a0,a0,-2008 # d540 <.LC3>
    bd20:	bdcf60ef          	jal	ra,20fc <puts>
    bd24:	00200a13          	li	s4,2
    bd28:	ebdff06f          	j	bbe4 <.L31>

0000bd2c <.L26>:
    bd2c:	00002517          	auipc	a0,0x2
    bd30:	87050513          	addi	a0,a0,-1936 # d59c <.LC5>
    bd34:	bc8f60ef          	jal	ra,20fc <puts>
    bd38:	00400a13          	li	s4,4
    bd3c:	ea9ff06f          	j	bbe4 <.L31>

0000bd40 <.L39>:
    bd40:	00002517          	auipc	a0,0x2
    bd44:	97c50513          	addi	a0,a0,-1668 # d6bc <.LC14>
    bd48:	bb4f60ef          	jal	ra,20fc <puts>
    bd4c:	00140413          	addi	s0,s0,1
    bd50:	ca9ff06f          	j	b9f8 <.L90>

0000bd54 <.L44>:
    bd54:	036487b3          	mul	a5,s1,s6
    bd58:	00048593          	mv	a1,s1
    bd5c:	00148493          	addi	s1,s1,1
    bd60:	000b8513          	mv	a0,s7
    bd64:	01049493          	slli	s1,s1,0x10
    bd68:	0104d493          	srli	s1,s1,0x10
    bd6c:	06078793          	addi	a5,a5,96
    bd70:	002787b3          	add	a5,a5,sp
    bd74:	ff67d603          	lhu	a2,-10(a5)
    bd78:	be4f60ef          	jal	ra,215c <__GI_printf>

0000bd7c <.L41>:
    bd7c:	0009a783          	lw	a5,0(s3)
    bd80:	fcf4eae3          	bltu	s1,a5,bd54 <.L44>
    bd84:	cedff06f          	j	ba70 <.L45>

0000bd88 <.L57>:
    bd88:	00000493          	li	s1,0
    bd8c:	04400b13          	li	s6,68
    bd90:	00002b97          	auipc	s7,0x2
    bd94:	ab4b8b93          	addi	s7,s7,-1356 # d844 <.LC23>
    bd98:	fe5ff06f          	j	bd7c <.L41>

0000bd9c <.L48>:
    bd9c:	036487b3          	mul	a5,s1,s6
    bda0:	00048593          	mv	a1,s1
    bda4:	00148493          	addi	s1,s1,1
    bda8:	000b8513          	mv	a0,s7
    bdac:	01049493          	slli	s1,s1,0x10
    bdb0:	0104d493          	srli	s1,s1,0x10
    bdb4:	06078793          	addi	a5,a5,96
    bdb8:	002787b3          	add	a5,a5,sp
    bdbc:	ff87d603          	lhu	a2,-8(a5)
    bdc0:	b9cf60ef          	jal	ra,215c <__GI_printf>

0000bdc4 <.L42>:
    bdc4:	0009a783          	lw	a5,0(s3)
    bdc8:	fcf4eae3          	bltu	s1,a5,bd9c <.L48>
    bdcc:	cb1ff06f          	j	ba7c <.L43>

0000bdd0 <.L58>:
    bdd0:	00000493          	li	s1,0
    bdd4:	04400b13          	li	s6,68
    bdd8:	00002b97          	auipc	s7,0x2
    bddc:	a88b8b93          	addi	s7,s7,-1400 # d860 <.LC24>
    bde0:	fe5ff06f          	j	bdc4 <.L42>

0000bde4 <.L50>:
    bde4:	036487b3          	mul	a5,s1,s6
    bde8:	00048593          	mv	a1,s1
    bdec:	00148493          	addi	s1,s1,1
    bdf0:	000b8513          	mv	a0,s7
    bdf4:	01049493          	slli	s1,s1,0x10
    bdf8:	0104d493          	srli	s1,s1,0x10
    bdfc:	06078793          	addi	a5,a5,96
    be00:	002787b3          	add	a5,a5,sp
    be04:	ffa7d603          	lhu	a2,-6(a5)
    be08:	b54f60ef          	jal	ra,215c <__GI_printf>

0000be0c <.L46>:
    be0c:	0009a783          	lw	a5,0(s3)
    be10:	fcf4eae3          	bltu	s1,a5,bde4 <.L50>
    be14:	c75ff06f          	j	ba88 <.L47>

0000be18 <.L59>:
    be18:	00000493          	li	s1,0
    be1c:	04400b13          	li	s6,68
    be20:	00002b97          	auipc	s7,0x2
    be24:	a5cb8b93          	addi	s7,s7,-1444 # d87c <.LC25>
    be28:	fe5ff06f          	j	be0c <.L46>

0000be2c <.L51>:
    be2c:	036487b3          	mul	a5,s1,s6
    be30:	00048593          	mv	a1,s1
    be34:	00148493          	addi	s1,s1,1
    be38:	000b8513          	mv	a0,s7
    be3c:	01049493          	slli	s1,s1,0x10
    be40:	0104d493          	srli	s1,s1,0x10
    be44:	06078793          	addi	a5,a5,96
    be48:	002787b3          	add	a5,a5,sp
    be4c:	ff47d603          	lhu	a2,-12(a5)
    be50:	b0cf60ef          	jal	ra,215c <__GI_printf>
    be54:	c45ff06f          	j	ba98 <.L49>

0000be58 <.L52>:
    be58:	00002517          	auipc	a0,0x2
    be5c:	acc50513          	addi	a0,a0,-1332 # d924 <.LC30>
    be60:	00805663          	blez	s0,be6c <.L91>
    be64:	00002517          	auipc	a0,0x2
    be68:	b2450513          	addi	a0,a0,-1244 # d988 <.LC31>

0000be6c <.L91>:
    be6c:	a90f60ef          	jal	ra,20fc <puts>
    be70:	cbdff06f          	j	bb2c <.L53>
