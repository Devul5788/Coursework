
hello_linux.gdb:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start-0x4>:
       0:	0000                	.2byte	0x0
	...

00000004 <_start>:
       4:	02c000ef          	jal	ra,30 <.Lload_gp>
       8:	00050793          	mv	a5,a0
       c:	00007517          	auipc	a0,0x7
      10:	38850513          	addi	a0,a0,904 # 7394 <main>
      14:	00012583          	lw	a1,0(sp)
      18:	00410613          	addi	a2,sp,4
      1c:	ff017113          	andi	sp,sp,-16
      20:	00000693          	li	a3,0
      24:	00000713          	li	a4,0
      28:	00010813          	mv	a6,sp
      2c:	3610106f          	j	1b8c <__uClibc_main>

00000030 <.Lload_gp>:
      30:	00008197          	auipc	gp,0x8
      34:	c1018193          	addi	gp,gp,-1008 # 7c40 <__global_pointer$>
      38:	00008067          	ret

0000003c <deregister_tm_clones>:
      3c:	00008517          	auipc	a0,0x8
      40:	74050513          	addi	a0,a0,1856 # 877c <__TMC_END__>
      44:	00008797          	auipc	a5,0x8
      48:	73878793          	addi	a5,a5,1848 # 877c <__TMC_END__>
      4c:	00a78a63          	beq	a5,a0,60 <.L1>
      50:	00007797          	auipc	a5,0x7
      54:	3a47a783          	lw	a5,932(a5) # 73f4 <_GLOBAL_OFFSET_TABLE_+0x2c>
      58:	00078463          	beqz	a5,60 <.L1>
      5c:	00078067          	jr	a5

00000060 <.L1>:
      60:	00008067          	ret

00000064 <register_tm_clones>:
      64:	00008517          	auipc	a0,0x8
      68:	71850513          	addi	a0,a0,1816 # 877c <__TMC_END__>
      6c:	00008597          	auipc	a1,0x8
      70:	71058593          	addi	a1,a1,1808 # 877c <__TMC_END__>
      74:	40a585b3          	sub	a1,a1,a0
      78:	4025d593          	srai	a1,a1,0x2
      7c:	00200793          	li	a5,2
      80:	02f5c5b3          	div	a1,a1,a5
      84:	00058a63          	beqz	a1,98 <.L6>
      88:	00007797          	auipc	a5,0x7
      8c:	3607a783          	lw	a5,864(a5) # 73e8 <_GLOBAL_OFFSET_TABLE_+0x20>
      90:	00078463          	beqz	a5,98 <.L6>
      94:	00078067          	jr	a5

00000098 <.L6>:
      98:	00008067          	ret

0000009c <__do_global_dtors_aux>:
      9c:	ff010113          	addi	sp,sp,-16
      a0:	00812423          	sw	s0,8(sp)
      a4:	00008417          	auipc	s0,0x8
      a8:	6dc40413          	addi	s0,s0,1756 # 8780 <completed.1>
      ac:	00044783          	lbu	a5,0(s0)
      b0:	00112623          	sw	ra,12(sp)
      b4:	02079463          	bnez	a5,dc <.L14>
      b8:	f85ff0ef          	jal	ra,3c <deregister_tm_clones>
      bc:	00007797          	auipc	a5,0x7
      c0:	3287a783          	lw	a5,808(a5) # 73e4 <_GLOBAL_OFFSET_TABLE_+0x1c>
      c4:	00078863          	beqz	a5,d4 <.L16>
      c8:	00008517          	auipc	a0,0x8
      cc:	6b450513          	addi	a0,a0,1716 # 877c <__TMC_END__>
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
      ec:	00007797          	auipc	a5,0x7
      f0:	3247a783          	lw	a5,804(a5) # 7410 <_GLOBAL_OFFSET_TABLE_+0x48>
      f4:	02078463          	beqz	a5,11c <.L27>
      f8:	ff010113          	addi	sp,sp,-16
      fc:	00112623          	sw	ra,12(sp)
     100:	00008597          	auipc	a1,0x8
     104:	68458593          	addi	a1,a1,1668 # 8784 <object.0>
     108:	00008517          	auipc	a0,0x8
     10c:	67450513          	addi	a0,a0,1652 # 877c <__TMC_END__>
     110:	000780e7          	jalr	a5
     114:	00c12083          	lw	ra,12(sp)
     118:	01010113          	addi	sp,sp,16

0000011c <.L27>:
     11c:	f49ff06f          	j	64 <register_tm_clones>

00000120 <__GI_printf>:
     120:	fc010113          	addi	sp,sp,-64
     124:	02b12223          	sw	a1,36(sp)
     128:	02c12423          	sw	a2,40(sp)
     12c:	02f12a23          	sw	a5,52(sp)
     130:	02d12623          	sw	a3,44(sp)
     134:	02e12823          	sw	a4,48(sp)
     138:	03012c23          	sw	a6,56(sp)
     13c:	03112e23          	sw	a7,60(sp)
     140:	00007797          	auipc	a5,0x7
     144:	28c7a783          	lw	a5,652(a5) # 73cc <_GLOBAL_OFFSET_TABLE_+0x4>
     148:	00050593          	mv	a1,a0
     14c:	0007a503          	lw	a0,0(a5)
     150:	02410613          	addi	a2,sp,36
     154:	00112e23          	sw	ra,28(sp)
     158:	00c12623          	sw	a2,12(sp)
     15c:	134000ef          	jal	ra,290 <__GI_vfprintf>
     160:	01c12083          	lw	ra,28(sp)
     164:	04010113          	addi	sp,sp,64
     168:	00008067          	ret

0000016c <_stdio_term>:
     16c:	ff010113          	addi	sp,sp,-16
     170:	00007797          	auipc	a5,0x7
     174:	2707a783          	lw	a5,624(a5) # 73e0 <_GLOBAL_OFFSET_TABLE_+0x18>
     178:	00812423          	sw	s0,8(sp)
     17c:	0007a403          	lw	s0,0(a5)
     180:	00912223          	sw	s1,4(sp)
     184:	00112623          	sw	ra,12(sp)
     188:	ffe00493          	li	s1,-2

0000018c <.L2>:
     18c:	00041c63          	bnez	s0,1a4 <.L5>
     190:	00c12083          	lw	ra,12(sp)
     194:	00812403          	lw	s0,8(sp)
     198:	00412483          	lw	s1,4(sp)
     19c:	01010113          	addi	sp,sp,16
     1a0:	00008067          	ret

000001a4 <.L5>:
     1a4:	00045783          	lhu	a5,0(s0)
     1a8:	0407f793          	andi	a5,a5,64
     1ac:	00078663          	beqz	a5,1b8 <.L3>
     1b0:	00040513          	mv	a0,s0
     1b4:	098000ef          	jal	ra,24c <__stdio_wcommit>

000001b8 <.L3>:
     1b8:	00442783          	lw	a5,4(s0)
     1bc:	00979a63          	bne	a5,s1,1d0 <.L4>
     1c0:	03442783          	lw	a5,52(s0)
     1c4:	00078663          	beqz	a5,1d0 <.L4>
     1c8:	02442503          	lw	a0,36(s0)
     1cc:	000780e7          	jalr	a5

000001d0 <.L4>:
     1d0:	02042403          	lw	s0,32(s0)
     1d4:	fb9ff06f          	j	18c <.L2>

000001d8 <_stdio_init>:
     1d8:	ff010113          	addi	sp,sp,-16
     1dc:	00812423          	sw	s0,8(sp)
     1e0:	00000513          	li	a0,0
     1e4:	00007417          	auipc	s0,0x7
     1e8:	1f042403          	lw	s0,496(s0) # 73d4 <_GLOBAL_OFFSET_TABLE_+0xc>
     1ec:	00912223          	sw	s1,4(sp)
     1f0:	00112623          	sw	ra,12(sp)
     1f4:	00042483          	lw	s1,0(s0)
     1f8:	021010ef          	jal	ra,1a18 <__GI_isatty>
     1fc:	00051c63          	bnez	a0,214 <.L14>
     200:	00008717          	auipc	a4,0x8
     204:	4d470713          	addi	a4,a4,1236 # 86d4 <_stdio_streams>
     208:	00075783          	lhu	a5,0(a4)
     20c:	1007c793          	xori	a5,a5,256
     210:	00f71023          	sh	a5,0(a4)

00000214 <.L14>:
     214:	00100513          	li	a0,1
     218:	001010ef          	jal	ra,1a18 <__GI_isatty>
     21c:	00051c63          	bnez	a0,234 <.L15>
     220:	00008717          	auipc	a4,0x8
     224:	4b470713          	addi	a4,a4,1204 # 86d4 <_stdio_streams>
     228:	02475783          	lhu	a5,36(a4)
     22c:	1007c793          	xori	a5,a5,256
     230:	02f71223          	sh	a5,36(a4)

00000234 <.L15>:
     234:	00942023          	sw	s1,0(s0)
     238:	00c12083          	lw	ra,12(sp)
     23c:	00812403          	lw	s0,8(sp)
     240:	00412483          	lw	s1,4(sp)
     244:	01010113          	addi	sp,sp,16
     248:	00008067          	ret

0000024c <__stdio_wcommit>:
     24c:	00852583          	lw	a1,8(a0)
     250:	01052783          	lw	a5,16(a0)
     254:	ff010113          	addi	sp,sp,-16
     258:	00812423          	sw	s0,8(sp)
     25c:	00112623          	sw	ra,12(sp)
     260:	00050413          	mv	s0,a0
     264:	40b78633          	sub	a2,a5,a1
     268:	00b78663          	beq	a5,a1,274 <.L2>
     26c:	00b52823          	sw	a1,16(a0)
     270:	3a1010ef          	jal	ra,1e10 <__stdio_WRITE>

00000274 <.L2>:
     274:	01042503          	lw	a0,16(s0)
     278:	00842783          	lw	a5,8(s0)
     27c:	00c12083          	lw	ra,12(sp)
     280:	00812403          	lw	s0,8(sp)
     284:	40f50533          	sub	a0,a0,a5
     288:	01010113          	addi	sp,sp,16
     28c:	00008067          	ret

00000290 <__GI_vfprintf>:
     290:	00055783          	lhu	a5,0(a0)
     294:	fe010113          	addi	sp,sp,-32
     298:	00812c23          	sw	s0,24(sp)
     29c:	00112e23          	sw	ra,28(sp)
     2a0:	0407f793          	andi	a5,a5,64
     2a4:	00050413          	mv	s0,a0
     2a8:	00078c63          	beqz	a5,2c0 <.L2>

000002ac <.L3>:
     2ac:	00040513          	mv	a0,s0
     2b0:	01812403          	lw	s0,24(sp)
     2b4:	01c12083          	lw	ra,28(sp)
     2b8:	02010113          	addi	sp,sp,32
     2bc:	1580006f          	j	414 <_vfprintf_internal>

000002c0 <.L2>:
     2c0:	00c12623          	sw	a2,12(sp)
     2c4:	00b12423          	sw	a1,8(sp)
     2c8:	5f5010ef          	jal	ra,20bc <__stdio_trans2w>
     2cc:	00812583          	lw	a1,8(sp)
     2d0:	00c12603          	lw	a2,12(sp)
     2d4:	fc050ce3          	beqz	a0,2ac <.L3>
     2d8:	01c12083          	lw	ra,28(sp)
     2dc:	01812403          	lw	s0,24(sp)
     2e0:	fff00513          	li	a0,-1
     2e4:	02010113          	addi	sp,sp,32
     2e8:	00008067          	ret

000002ec <_charpad>:
     2ec:	fd010113          	addi	sp,sp,-48
     2f0:	02812423          	sw	s0,40(sp)
     2f4:	02912223          	sw	s1,36(sp)
     2f8:	03212023          	sw	s2,32(sp)
     2fc:	01312e23          	sw	s3,28(sp)
     300:	02112623          	sw	ra,44(sp)
     304:	00050913          	mv	s2,a0
     308:	00060493          	mv	s1,a2
     30c:	00b10623          	sb	a1,12(sp)
     310:	00060413          	mv	s0,a2
     314:	00c10993          	addi	s3,sp,12

00000318 <.L2>:
     318:	00040e63          	beqz	s0,334 <.L3>
     31c:	00090613          	mv	a2,s2
     320:	00100593          	li	a1,1
     324:	00098513          	mv	a0,s3
     328:	445010ef          	jal	ra,1f6c <__stdio_fwrite>
     32c:	00100793          	li	a5,1
     330:	02f50263          	beq	a0,a5,354 <.L4>

00000334 <.L3>:
     334:	40848533          	sub	a0,s1,s0
     338:	02c12083          	lw	ra,44(sp)
     33c:	02812403          	lw	s0,40(sp)
     340:	02412483          	lw	s1,36(sp)
     344:	02012903          	lw	s2,32(sp)
     348:	01c12983          	lw	s3,28(sp)
     34c:	03010113          	addi	sp,sp,48
     350:	00008067          	ret

00000354 <.L4>:
     354:	fff40413          	addi	s0,s0,-1
     358:	fc1ff06f          	j	318 <.L2>

0000035c <_fp_out_narrow>:
     35c:	fe010113          	addi	sp,sp,-32
     360:	00912a23          	sw	s1,20(sp)
     364:	01312623          	sw	s3,12(sp)
     368:	01412423          	sw	s4,8(sp)
     36c:	00112e23          	sw	ra,28(sp)
     370:	00812c23          	sw	s0,24(sp)
     374:	01212823          	sw	s2,16(sp)
     378:	01512223          	sw	s5,4(sp)
     37c:	0805f793          	andi	a5,a1,128
     380:	00050a13          	mv	s4,a0
     384:	00060493          	mv	s1,a2
     388:	00068993          	mv	s3,a3
     38c:	06078e63          	beqz	a5,408 <.L13>
     390:	00068513          	mv	a0,a3
     394:	00058a93          	mv	s5,a1
     398:	3e8010ef          	jal	ra,1780 <__GI_strlen>
     39c:	40a484b3          	sub	s1,s1,a0
     3a0:	00050913          	mv	s2,a0
     3a4:	00000413          	li	s0,0
     3a8:	00905e63          	blez	s1,3c4 <.L10>
     3ac:	00048613          	mv	a2,s1
     3b0:	07faf593          	andi	a1,s5,127
     3b4:	000a0513          	mv	a0,s4
     3b8:	f35ff0ef          	jal	ra,2ec <_charpad>
     3bc:	00050413          	mv	s0,a0
     3c0:	02a49063          	bne	s1,a0,3e0 <.L9>

000003c4 <.L10>:
     3c4:	00000513          	li	a0,0
     3c8:	01205a63          	blez	s2,3dc <.L12>
     3cc:	000a0613          	mv	a2,s4
     3d0:	00090593          	mv	a1,s2
     3d4:	00098513          	mv	a0,s3
     3d8:	395010ef          	jal	ra,1f6c <__stdio_fwrite>

000003dc <.L12>:
     3dc:	00a40433          	add	s0,s0,a0

000003e0 <.L9>:
     3e0:	01c12083          	lw	ra,28(sp)
     3e4:	00040513          	mv	a0,s0
     3e8:	01812403          	lw	s0,24(sp)
     3ec:	01412483          	lw	s1,20(sp)
     3f0:	01012903          	lw	s2,16(sp)
     3f4:	00c12983          	lw	s3,12(sp)
     3f8:	00812a03          	lw	s4,8(sp)
     3fc:	00412a83          	lw	s5,4(sp)
     400:	02010113          	addi	sp,sp,32
     404:	00008067          	ret

00000408 <.L13>:
     408:	00060913          	mv	s2,a2
     40c:	00000413          	li	s0,0
     410:	fb5ff06f          	j	3c4 <.L10>

00000414 <_vfprintf_internal>:
     414:	e2010113          	addi	sp,sp,-480
     418:	0c010793          	addi	a5,sp,192
     41c:	00a12023          	sw	a0,0(sp)
     420:	00078513          	mv	a0,a5
     424:	1c812c23          	sw	s0,472(sp)
     428:	1c912a23          	sw	s1,468(sp)
     42c:	1c112e23          	sw	ra,476(sp)
     430:	1d212823          	sw	s2,464(sp)
     434:	1d312623          	sw	s3,460(sp)
     438:	1d412423          	sw	s4,456(sp)
     43c:	1d512223          	sw	s5,452(sp)
     440:	1d612023          	sw	s6,448(sp)
     444:	1b712e23          	sw	s7,444(sp)
     448:	1b812c23          	sw	s8,440(sp)
     44c:	1b912a23          	sw	s9,436(sp)
     450:	1ba12823          	sw	s10,432(sp)
     454:	1bb12623          	sw	s11,428(sp)
     458:	00058413          	mv	s0,a1
     45c:	00060493          	mv	s1,a2
     460:	00f12223          	sw	a5,4(sp)
     464:	6d4000ef          	jal	ra,b38 <_ppfs_init>
     468:	06055663          	bgez	a0,4d4 <.L18>
     46c:	0c012403          	lw	s0,192(sp)
     470:	00040513          	mv	a0,s0
     474:	30c010ef          	jal	ra,1780 <__GI_strlen>
     478:	00050593          	mv	a1,a0
     47c:	04051463          	bnez	a0,4c4 <.L19>

00000480 <.L84>:
     480:	fff00c93          	li	s9,-1

00000484 <.L17>:
     484:	1dc12083          	lw	ra,476(sp)
     488:	1d812403          	lw	s0,472(sp)
     48c:	1d412483          	lw	s1,468(sp)
     490:	1d012903          	lw	s2,464(sp)
     494:	1cc12983          	lw	s3,460(sp)
     498:	1c812a03          	lw	s4,456(sp)
     49c:	1c412a83          	lw	s5,452(sp)
     4a0:	1c012b03          	lw	s6,448(sp)
     4a4:	1bc12b83          	lw	s7,444(sp)
     4a8:	1b812c03          	lw	s8,440(sp)
     4ac:	1b012d03          	lw	s10,432(sp)
     4b0:	1ac12d83          	lw	s11,428(sp)
     4b4:	000c8513          	mv	a0,s9
     4b8:	1b412c83          	lw	s9,436(sp)
     4bc:	1e010113          	addi	sp,sp,480
     4c0:	00008067          	ret

000004c4 <.L19>:
     4c4:	00012603          	lw	a2,0(sp)
     4c8:	00040513          	mv	a0,s0
     4cc:	2a1010ef          	jal	ra,1f6c <__stdio_fwrite>
     4d0:	fb1ff06f          	j	480 <.L84>

000004d4 <.L18>:
     4d4:	00412503          	lw	a0,4(sp)
     4d8:	00048593          	mv	a1,s1
     4dc:	00001a37          	lui	s4,0x1
     4e0:	73c000ef          	jal	ra,c1c <_ppfs_prepargs>
     4e4:	40000ab7          	lui	s5,0x40000
     4e8:	10000b37          	lui	s6,0x10000
     4ec:	00040513          	mv	a0,s0
     4f0:	00000c93          	li	s9,0
     4f4:	11010b93          	addi	s7,sp,272
     4f8:	800a0c13          	addi	s8,s4,-2048 # 800 <.L81+0x20>
     4fc:	fffa8a93          	addi	s5,s5,-1 # 3fffffff <.LLST3+0x3fff57a4>
     500:	fffb0b13          	addi	s6,s6,-1 # fffffff <.LLST3+0xfff57a4>

00000504 <.L22>:
     504:	00044783          	lbu	a5,0(s0)
     508:	60078a63          	beqz	a5,b1c <.L23>
     50c:	02500713          	li	a4,37
     510:	0ce79063          	bne	a5,a4,5d0 <.L24>
     514:	02a40463          	beq	s0,a0,53c <.L86>

00000518 <.L85>:
     518:	40a404b3          	sub	s1,s0,a0
     51c:	f69052e3          	blez	s1,480 <.L84>
     520:	00012603          	lw	a2,0(sp)
     524:	00048593          	mv	a1,s1
     528:	245010ef          	jal	ra,1f6c <__stdio_fwrite>
     52c:	f4951ae3          	bne	a0,s1,480 <.L84>
     530:	00044783          	lbu	a5,0(s0)
     534:	00ac8cb3          	add	s9,s9,a0
     538:	f40786e3          	beqz	a5,484 <.L17>

0000053c <.L86>:
     53c:	00144703          	lbu	a4,1(s0)
     540:	02500793          	li	a5,37
     544:	00140513          	addi	a0,s0,1
     548:	00240413          	addi	s0,s0,2
     54c:	faf70ce3          	beq	a4,a5,504 <.L22>
     550:	0ca12023          	sw	a0,192(sp)
     554:	00412503          	lw	a0,4(sp)
     558:	105000ef          	jal	ra,e5c <_ppfs_parsespec>
     55c:	00412503          	lw	a0,4(sp)
     560:	708000ef          	jal	ra,c68 <_ppfs_setargs>
     564:	0d812703          	lw	a4,216(sp)
     568:	0e614583          	lbu	a1,230(sp)
     56c:	000b8793          	mv	a5,s7
     570:	00e05863          	blez	a4,580 <.L29>
     574:	016587b3          	add	a5,a1,s6
     578:	00479793          	slli	a5,a5,0x4
     57c:	00fb87b3          	add	a5,s7,a5

00000580 <.L29>:
     580:	0dc12803          	lw	a6,220(sp)
     584:	02c10693          	addi	a3,sp,44
     588:	00000713          	li	a4,0
     58c:	00068613          	mv	a2,a3

00000590 <.L30>:
     590:	00471513          	slli	a0,a4,0x4
     594:	00a78533          	add	a0,a5,a0
     598:	05074063          	blt	a4,a6,5d8 <.L31>
     59c:	0e012783          	lw	a5,224(sp)
     5a0:	04079463          	bnez	a5,5e8 <.L32>
     5a4:	0d012583          	lw	a1,208(sp)
     5a8:	f00a0793          	addi	a5,s4,-256
     5ac:	000c8613          	mv	a2,s9
     5b0:	00f5f5b3          	and	a1,a1,a5
     5b4:	02c12783          	lw	a5,44(sp)
     5b8:	41fcd693          	srai	a3,s9,0x1f
     5bc:	0007a503          	lw	a0,0(a5)
     5c0:	44d010ef          	jal	ra,220c <_store_inttype>

000005c4 <.L33>:
     5c4:	0c012403          	lw	s0,192(sp)
     5c8:	00040513          	mv	a0,s0
     5cc:	f39ff06f          	j	504 <.L22>

000005d0 <.L24>:
     5d0:	00140413          	addi	s0,s0,1
     5d4:	f31ff06f          	j	504 <.L22>

000005d8 <.L31>:
     5d8:	00a6a023          	sw	a0,0(a3)
     5dc:	00170713          	addi	a4,a4,1
     5e0:	00468693          	addi	a3,a3,4
     5e4:	fadff06f          	j	590 <.L30>

000005e8 <.L32>:
     5e8:	00700713          	li	a4,7
     5ec:	34f76463          	bltu	a4,a5,934 <.L34>
     5f0:	00008717          	auipc	a4,0x8
     5f4:	05470713          	addi	a4,a4,84 # 8644 <spec_base.1>
     5f8:	00f70733          	add	a4,a4,a5
     5fc:	fff74683          	lbu	a3,-1(a4)
     600:	00a00613          	li	a2,10
     604:	05700713          	li	a4,87
     608:	02c69063          	bne	a3,a2,628 <.L35>
     60c:	0d012603          	lw	a2,208(sp)
     610:	02067513          	andi	a0,a2,32
     614:	00050463          	beqz	a0,61c <.L36>
     618:	02c00713          	li	a4,44

0000061c <.L36>:
     61c:	04067613          	andi	a2,a2,64
     620:	00060463          	beqz	a2,628 <.L35>
     624:	08076713          	ori	a4,a4,128

00000628 <.L35>:
     628:	00500513          	li	a0,5
     62c:	0c412603          	lw	a2,196(sp)
     630:	0ef56463          	bltu	a0,a5,718 <.L37>
     634:	00300513          	li	a0,3
     638:	10a78063          	beq	a5,a0,738 <.L38>
     63c:	00100513          	li	a0,1
     640:	0ea78063          	beq	a5,a0,720 <.L39>

00000644 <.L130>:
     644:	02000913          	li	s2,32
     648:	00065463          	bgez	a2,650 <.L41>
     64c:	0d414903          	lbu	s2,212(sp)

00000650 <.L41>:
     650:	015585b3          	add	a1,a1,s5
     654:	00259593          	slli	a1,a1,0x2
     658:	19058793          	addi	a5,a1,400
     65c:	01010613          	addi	a2,sp,16
     660:	00c785b3          	add	a1,a5,a2
     664:	f485a503          	lw	a0,-184(a1)
     668:	f00a0793          	addi	a5,s4,-256
     66c:	00b00d13          	li	s10,11
     670:	00f57533          	and	a0,a0,a5

00000674 <.L42>:
     674:	02c12583          	lw	a1,44(sp)
     678:	00068613          	mv	a2,a3
     67c:	00e12623          	sw	a4,12(sp)
     680:	00d12423          	sw	a3,8(sp)
     684:	30d010ef          	jal	ra,2190 <_load_inttype>
     688:	00c12703          	lw	a4,12(sp)
     68c:	00812683          	lw	a3,8(sp)
     690:	0bf10493          	addi	s1,sp,191
     694:	00058613          	mv	a2,a1
     698:	00050593          	mv	a1,a0
     69c:	00048513          	mv	a0,s1
     6a0:	3a9010ef          	jal	ra,2248 <_uintmaxtostr>
     6a4:	0e012703          	lw	a4,224(sp)
     6a8:	00500793          	li	a5,5
     6ac:	00050d93          	mv	s11,a0
     6b0:	02e7f263          	bgeu	a5,a4,6d4 <.L43>
     6b4:	00054603          	lbu	a2,0(a0)
     6b8:	02d00693          	li	a3,45
     6bc:	0d012783          	lw	a5,208(sp)
     6c0:	08d61663          	bne	a2,a3,74c <.L44>
     6c4:	0027e793          	ori	a5,a5,2
     6c8:	0cf12823          	sw	a5,208(sp)
     6cc:	00150d93          	addi	s11,a0,1
     6d0:	00200d13          	li	s10,2

000006d4 <.L43>:
     6d4:	0c412403          	lw	s0,196(sp)
     6d8:	41b484b3          	sub	s1,s1,s11
     6dc:	00045463          	bgez	s0,6e4 <.L45>
     6e0:	00100413          	li	s0,1

000006e4 <.L45>:
     6e4:	0d012683          	lw	a3,208(sp)
     6e8:	000dc783          	lbu	a5,0(s11)
     6ec:	0106f693          	andi	a3,a3,16
     6f0:	1c068c63          	beqz	a3,8c8 <.L46>
     6f4:	00200693          	li	a3,2
     6f8:	06e6ea63          	bltu	a3,a4,76c <.L47>
     6fc:	03000693          	li	a3,48
     700:	1cd78c63          	beq	a5,a3,8d8 <.L48>
     704:	00040793          	mv	a5,s0
     708:	4084fe63          	bgeu	s1,s0,b24 <.L97>
     70c:	40940433          	sub	s0,s0,s1

00000710 <.L49>:
     710:	00600d13          	li	s10,6
     714:	1680006f          	j	87c <.L136>

00000718 <.L37>:
     718:	40d006b3          	neg	a3,a3
     71c:	f29ff06f          	j	644 <.L130>

00000720 <.L39>:
     720:	02000913          	li	s2,32
     724:	00065463          	bgez	a2,72c <.L134>
     728:	0d414903          	lbu	s2,212(sp)

0000072c <.L134>:
     72c:	00600d13          	li	s10,6
     730:	40000513          	li	a0,1024
     734:	f41ff06f          	j	674 <.L42>

00000738 <.L38>:
     738:	02000913          	li	s2,32
     73c:	00065463          	bgez	a2,744 <.L133>
     740:	0d414903          	lbu	s2,212(sp)

00000744 <.L133>:
     744:	03700713          	li	a4,55
     748:	f09ff06f          	j	650 <.L41>

0000074c <.L44>:
     74c:	0027f693          	andi	a3,a5,2
     750:	00069a63          	bnez	a3,764 <.L95>
     754:	0017f793          	andi	a5,a5,1
     758:	f6078ee3          	beqz	a5,6d4 <.L43>
     75c:	00400d13          	li	s10,4
     760:	f75ff06f          	j	6d4 <.L43>

00000764 <.L95>:
     764:	00000d13          	li	s10,0
     768:	f6dff06f          	j	6d4 <.L43>

0000076c <.L47>:
     76c:	00300693          	li	a3,3
     770:	0cd71e63          	bne	a4,a3,84c <.L50>
     774:	03000713          	li	a4,48
     778:	0ce79063          	bne	a5,a4,838 <.L51>

0000077c <.L61>:
     77c:	00b00d13          	li	s10,11
     780:	34040c63          	beqz	s0,ad8 <.L111>

00000784 <.L87>:
     784:	00040793          	mv	a5,s0
     788:	3884f663          	bgeu	s1,s0,b14 <.L106>
     78c:	40940433          	sub	s0,s0,s1
     790:	00b00d13          	li	s10,11

00000794 <.L52>:
     794:	0c812683          	lw	a3,200(sp)
     798:	00000993          	li	s3,0
     79c:	00d7f463          	bgeu	a5,a3,7a4 <.L79>
     7a0:	40f689b3          	sub	s3,a3,a5

000007a4 <.L79>:
     7a4:	00fc87b3          	add	a5,s9,a5
     7a8:	01378cb3          	add	s9,a5,s3
     7ac:	03000793          	li	a5,48
     7b0:	00f91663          	bne	s2,a5,7bc <.L80>
     7b4:	01340433          	add	s0,s0,s3
     7b8:	00000993          	li	s3,0

000007bc <.L80>:
     7bc:	0d012783          	lw	a5,208(sp)
     7c0:	0087f793          	andi	a5,a5,8
     7c4:	00079e63          	bnez	a5,7e0 <.L81>
     7c8:	00012503          	lw	a0,0(sp)
     7cc:	00098613          	mv	a2,s3
     7d0:	02000593          	li	a1,32
     7d4:	b19ff0ef          	jal	ra,2ec <_charpad>
     7d8:	caa994e3          	bne	s3,a0,480 <.L84>
     7dc:	00000993          	li	s3,0

000007e0 <.L81>:
     7e0:	00012583          	lw	a1,0(sp)
     7e4:	00007517          	auipc	a0,0x7
     7e8:	c5c50513          	addi	a0,a0,-932 # 7440 <prefix.0>
     7ec:	01a50533          	add	a0,a0,s10
     7f0:	345000ef          	jal	ra,1334 <__GI_fputs>
     7f4:	00012503          	lw	a0,0(sp)
     7f8:	00040613          	mv	a2,s0
     7fc:	03000593          	li	a1,48
     800:	aedff0ef          	jal	ra,2ec <_charpad>
     804:	c6a41ee3          	bne	s0,a0,480 <.L84>
     808:	00048c63          	beqz	s1,820 <.L82>
     80c:	00012603          	lw	a2,0(sp)
     810:	00048593          	mv	a1,s1
     814:	000d8513          	mv	a0,s11
     818:	754010ef          	jal	ra,1f6c <__stdio_fwrite>
     81c:	c69512e3          	bne	a0,s1,480 <.L84>

00000820 <.L82>:
     820:	00012503          	lw	a0,0(sp)
     824:	00098613          	mv	a2,s3
     828:	02000593          	li	a1,32
     82c:	ac1ff0ef          	jal	ra,2ec <_charpad>
     830:	d8a98ae3          	beq	s3,a0,5c4 <.L33>
     834:	c4dff06f          	j	480 <.L84>

00000838 <.L51>:
     838:	00040793          	mv	a5,s0
     83c:	2a84fe63          	bgeu	s1,s0,af8 <.L100>
     840:	40940433          	sub	s0,s0,s1

00000844 <.L143>:
     844:	00900d13          	li	s10,9
     848:	0340006f          	j	87c <.L136>

0000084c <.L50>:
     84c:	00400693          	li	a3,4
     850:	04d71c63          	bne	a4,a3,8a8 <.L55>
     854:	03000713          	li	a4,48
     858:	0284f863          	bgeu	s1,s0,888 <.L56>
     85c:	0ce79063          	bne	a5,a4,91c <.L57>
     860:	00500793          	li	a5,5
     864:	f3a7c0e3          	blt	a5,s10,784 <.L87>
     868:	00040793          	mv	a5,s0

0000086c <.L135>:
     86c:	40940433          	sub	s0,s0,s1

00000870 <.L59>:
     870:	00500693          	li	a3,5
     874:	00100713          	li	a4,1
     878:	01a6d463          	bge	a3,s10,880 <.L53>

0000087c <.L136>:
     87c:	00200713          	li	a4,2

00000880 <.L53>:
     880:	00e787b3          	add	a5,a5,a4
     884:	f11ff06f          	j	794 <.L52>

00000888 <.L56>:
     888:	00148413          	addi	s0,s1,1
     88c:	08e79863          	bne	a5,a4,91c <.L57>
     890:	00500793          	li	a5,5
     894:	29a7ce63          	blt	a5,s10,b30 <.L102>
     898:	24048a63          	beqz	s1,aec <.L103>

0000089c <.L108>:
     89c:	00048793          	mv	a5,s1
     8a0:	00000413          	li	s0,0
     8a4:	fcdff06f          	j	870 <.L59>

000008a8 <.L55>:
     8a8:	03000713          	li	a4,48
     8ac:	06e79863          	bne	a5,a4,91c <.L57>
     8b0:	00500793          	li	a5,5
     8b4:	eda7c4e3          	blt	a5,s10,77c <.L61>

000008b8 <.L62>:
     8b8:	20040c63          	beqz	s0,ad0 <.L64>
     8bc:	00040793          	mv	a5,s0
     8c0:	fa84e6e3          	bltu	s1,s0,86c <.L135>
     8c4:	fd9ff06f          	j	89c <.L108>

000008c8 <.L46>:
     8c8:	03000693          	li	a3,48
     8cc:	04d79863          	bne	a5,a3,91c <.L57>
     8d0:	00500793          	li	a5,5
     8d4:	03a7d463          	bge	a5,s10,8fc <.L63>

000008d8 <.L48>:
     8d8:	00100793          	li	a5,1
     8dc:	eaf710e3          	bne	a4,a5,77c <.L61>
     8e0:	00008d97          	auipc	s11,0x8
     8e4:	d54d8d93          	addi	s11,s11,-684 # 8634 <.LC0>
     8e8:	00b00d13          	li	s10,11
     8ec:	00500493          	li	s1,5
     8f0:	00000413          	li	s0,0
     8f4:	00500793          	li	a5,5
     8f8:	e9dff06f          	j	794 <.L52>

000008fc <.L63>:
     8fc:	00100793          	li	a5,1
     900:	faf71ce3          	bne	a4,a5,8b8 <.L62>
     904:	00500793          	li	a5,5
     908:	00000413          	li	s0,0
     90c:	00500493          	li	s1,5
     910:	00008d97          	auipc	s11,0x8
     914:	d24d8d93          	addi	s11,s11,-732 # 8634 <.LC0>
     918:	f69ff06f          	j	880 <.L53>

0000091c <.L57>:
     91c:	1c84f463          	bgeu	s1,s0,ae4 <.L109>
     920:	40940433          	sub	s0,s0,s1

00000924 <.L65>:
     924:	00b00713          	li	a4,11
     928:	009407b3          	add	a5,s0,s1
     92c:	f4ed12e3          	bne	s10,a4,870 <.L59>
     930:	e65ff06f          	j	794 <.L52>

00000934 <.L34>:
     934:	00f00713          	li	a4,15
     938:	08f76063          	bltu	a4,a5,9b8 <.L66>
     93c:	0d012703          	lw	a4,208(sp)
     940:	02c12783          	lw	a5,44(sp)
     944:	01010413          	addi	s0,sp,16
     948:	01877733          	and	a4,a4,s8
     94c:	04070463          	beqz	a4,994 <.L67>
     950:	0007a603          	lw	a2,0(a5)
     954:	0047a683          	lw	a3,4(a5)
     958:	0087a703          	lw	a4,8(a5)
     95c:	00c7a783          	lw	a5,12(a5)

00000960 <.L68>:
     960:	00012503          	lw	a0,0(sp)
     964:	00c12823          	sw	a2,16(sp)
     968:	00d12a23          	sw	a3,20(sp)
     96c:	0c410613          	addi	a2,sp,196
     970:	00000697          	auipc	a3,0x0
     974:	9ec68693          	addi	a3,a3,-1556 # 35c <_fp_out_narrow>
     978:	00040593          	mv	a1,s0
     97c:	00e12c23          	sw	a4,24(sp)
     980:	00f12e23          	sw	a5,28(sp)
     984:	185010ef          	jal	ra,2308 <_fpmaxtostr>

00000988 <.L142>:
     988:	ae054ce3          	bltz	a0,480 <.L84>
     98c:	00ac8cb3          	add	s9,s9,a0
     990:	c35ff06f          	j	5c4 <.L33>

00000994 <.L67>:
     994:	0047a603          	lw	a2,4(a5)
     998:	0007a583          	lw	a1,0(a5)
     99c:	00040513          	mv	a0,s0
     9a0:	444060ef          	jal	ra,6de4 <__extenddftf2>
     9a4:	01012603          	lw	a2,16(sp)
     9a8:	01412683          	lw	a3,20(sp)
     9ac:	01812703          	lw	a4,24(sp)
     9b0:	01c12783          	lw	a5,28(sp)
     9b4:	fadff06f          	j	960 <.L68>

000009b8 <.L66>:
     9b8:	01100713          	li	a4,17
     9bc:	acf772e3          	bgeu	a4,a5,480 <.L84>
     9c0:	01300713          	li	a4,19
     9c4:	08f76a63          	bltu	a4,a5,a58 <.L70>
     9c8:	02c12683          	lw	a3,44(sp)
     9cc:	0006a403          	lw	s0,0(a3)
     9d0:	06e79263          	bne	a5,a4,a34 <.L71>
     9d4:	0c412703          	lw	a4,196(sp)
     9d8:	02040c63          	beqz	s0,a10 <.L72>
     9dc:	00040d93          	mv	s11,s0

000009e0 <.L73>:
     9e0:	0c412783          	lw	a5,196(sp)
     9e4:	fff00593          	li	a1,-1
     9e8:	0007c463          	bltz	a5,9f0 <.L74>
     9ec:	00078593          	mv	a1,a5

000009f0 <.L74>:
     9f0:	000d8513          	mv	a0,s11
     9f4:	621000ef          	jal	ra,1814 <__GI_strnlen>
     9f8:	00050793          	mv	a5,a0
     9fc:	00050493          	mv	s1,a0
     a00:	02000913          	li	s2,32

00000a04 <.L137>:
     a04:	00b00d13          	li	s10,11
     a08:	00000413          	li	s0,0
     a0c:	d89ff06f          	j	794 <.L52>

00000a10 <.L72>:
     a10:	00500793          	li	a5,5
     a14:	00008d97          	auipc	s11,0x8
     a18:	c28d8d93          	addi	s11,s11,-984 # 863c <.LC1>
     a1c:	02000913          	li	s2,32
     a20:	00b00d13          	li	s10,11
     a24:	0ae7fa63          	bgeu	a5,a4,ad8 <.L111>
     a28:	00600493          	li	s1,6
     a2c:	00600793          	li	a5,6
     a30:	d65ff06f          	j	794 <.L52>

00000a34 <.L71>:
     a34:	04810023          	sb	s0,64(sp)
     a38:	040100a3          	sb	zero,65(sp)
     a3c:	04010d93          	addi	s11,sp,64
     a40:	02000913          	li	s2,32
     a44:	00b00d13          	li	s10,11
     a48:	00100493          	li	s1,1
     a4c:	00000413          	li	s0,0
     a50:	00100793          	li	a5,1
     a54:	d41ff06f          	j	794 <.L52>

00000a58 <.L70>:
     a58:	01400713          	li	a4,20
     a5c:	02e79263          	bne	a5,a4,a80 <.L75>
     a60:	00007797          	auipc	a5,0x7
     a64:	9747a783          	lw	a5,-1676(a5) # 73d4 <_GLOBAL_OFFSET_TABLE_+0xc>
     a68:	0007a503          	lw	a0,0(a5)
     a6c:	08000613          	li	a2,128
     a70:	04010593          	addi	a1,sp,64
     a74:	65d000ef          	jal	ra,18d0 <__GI___glibc_strerror_r>
     a78:	00050d93          	mv	s11,a0
     a7c:	f65ff06f          	j	9e0 <.L73>

00000a80 <.L75>:
     a80:	0cc12583          	lw	a1,204(sp)
     a84:	00008717          	auipc	a4,0x8
     a88:	cd472703          	lw	a4,-812(a4) # 8758 <_custom_printf_spec>
     a8c:	00a70693          	addi	a3,a4,10
     a90:	00070793          	mv	a5,a4

00000a94 <.L78>:
     a94:	0007c503          	lbu	a0,0(a5)
     a98:	02b51663          	bne	a0,a1,ac4 <.L76>
     a9c:	40e787b3          	sub	a5,a5,a4
     aa0:	00279793          	slli	a5,a5,0x2
     aa4:	0000a717          	auipc	a4,0xa
     aa8:	d5070713          	addi	a4,a4,-688 # a7f4 <_custom_printf_handler>
     aac:	00f707b3          	add	a5,a4,a5
     ab0:	0007a783          	lw	a5,0(a5)
     ab4:	00012503          	lw	a0,0(sp)
     ab8:	0c410593          	addi	a1,sp,196
     abc:	000780e7          	jalr	a5
     ac0:	ec9ff06f          	j	988 <.L142>

00000ac4 <.L76>:
     ac4:	00178793          	addi	a5,a5,1
     ac8:	fcd796e3          	bne	a5,a3,a94 <.L78>
     acc:	9b5ff06f          	j	480 <.L84>

00000ad0 <.L64>:
     ad0:	00b00793          	li	a5,11
     ad4:	02fd1863          	bne	s10,a5,b04 <.L112>

00000ad8 <.L111>:
     ad8:	00000493          	li	s1,0
     adc:	00000793          	li	a5,0
     ae0:	cb5ff06f          	j	794 <.L52>

00000ae4 <.L109>:
     ae4:	00000413          	li	s0,0
     ae8:	e3dff06f          	j	924 <.L65>

00000aec <.L103>:
     aec:	00100793          	li	a5,1
     af0:	00100413          	li	s0,1
     af4:	d7dff06f          	j	870 <.L59>

00000af8 <.L100>:
     af8:	00048793          	mv	a5,s1
     afc:	00000413          	li	s0,0
     b00:	d45ff06f          	j	844 <.L143>

00000b04 <.L112>:
     b04:	00000793          	li	a5,0
     b08:	00000493          	li	s1,0
     b0c:	00100713          	li	a4,1
     b10:	d71ff06f          	j	880 <.L53>

00000b14 <.L106>:
     b14:	00048793          	mv	a5,s1
     b18:	eedff06f          	j	a04 <.L137>

00000b1c <.L23>:
     b1c:	9ea41ee3          	bne	s0,a0,518 <.L85>
     b20:	965ff06f          	j	484 <.L17>

00000b24 <.L97>:
     b24:	00048793          	mv	a5,s1
     b28:	00000413          	li	s0,0
     b2c:	be5ff06f          	j	710 <.L49>

00000b30 <.L102>:
     b30:	00100413          	li	s0,1
     b34:	c51ff06f          	j	784 <.L87>

00000b38 <_ppfs_init>:
     b38:	fe010113          	addi	sp,sp,-32
     b3c:	00912a23          	sw	s1,20(sp)
     b40:	0e000613          	li	a2,224
     b44:	00058493          	mv	s1,a1
     b48:	00000593          	li	a1,0
     b4c:	00812c23          	sw	s0,24(sp)
     b50:	01212823          	sw	s2,16(sp)
     b54:	00050413          	mv	s0,a0
     b58:	00112e23          	sw	ra,28(sp)
     b5c:	01312623          	sw	s3,12(sp)
     b60:	379000ef          	jal	ra,16d8 <__GI_memset>
     b64:	01842783          	lw	a5,24(s0)
     b68:	02840913          	addi	s2,s0,40
     b6c:	00942023          	sw	s1,0(s0)
     b70:	fff78793          	addi	a5,a5,-1
     b74:	00f42c23          	sw	a5,24(s0)
     b78:	04c40713          	addi	a4,s0,76
     b7c:	00090793          	mv	a5,s2
     b80:	00800693          	li	a3,8

00000b84 <.L2>:
     b84:	00478793          	addi	a5,a5,4
     b88:	fed7ae23          	sw	a3,-4(a5)
     b8c:	fee79ce3          	bne	a5,a4,b84 <.L2>
     b90:	00048793          	mv	a5,s1
     b94:	02500993          	li	s3,37

00000b98 <.L3>:
     b98:	0007c703          	lbu	a4,0(a5)
     b9c:	02071063          	bnez	a4,bbc <.L8>
     ba0:	01842783          	lw	a5,24(s0)
     ba4:	00942023          	sw	s1,0(s0)
     ba8:	00800713          	li	a4,8

00000bac <.L9>:
     bac:	fff78793          	addi	a5,a5,-1
     bb0:	0407de63          	bgez	a5,c0c <.L11>
     bb4:	00000513          	li	a0,0
     bb8:	0280006f          	j	be0 <.L1>

00000bbc <.L8>:
     bbc:	0017c683          	lbu	a3,1(a5)
     bc0:	05371263          	bne	a4,s3,c04 <.L4>
     bc4:	00178793          	addi	a5,a5,1
     bc8:	03368e63          	beq	a3,s3,c04 <.L4>
     bcc:	00f42023          	sw	a5,0(s0)
     bd0:	00040513          	mv	a0,s0
     bd4:	288000ef          	jal	ra,e5c <_ppfs_parsespec>
     bd8:	02055263          	bgez	a0,bfc <.L5>

00000bdc <.L10>:
     bdc:	fff00513          	li	a0,-1

00000be0 <.L1>:
     be0:	01c12083          	lw	ra,28(sp)
     be4:	01812403          	lw	s0,24(sp)
     be8:	01412483          	lw	s1,20(sp)
     bec:	01012903          	lw	s2,16(sp)
     bf0:	00c12983          	lw	s3,12(sp)
     bf4:	02010113          	addi	sp,sp,32
     bf8:	00008067          	ret

00000bfc <.L5>:
     bfc:	00042783          	lw	a5,0(s0)
     c00:	f99ff06f          	j	b98 <.L3>

00000c04 <.L4>:
     c04:	00178793          	addi	a5,a5,1
     c08:	f91ff06f          	j	b98 <.L3>

00000c0c <.L11>:
     c0c:	00092683          	lw	a3,0(s2)
     c10:	fce686e3          	beq	a3,a4,bdc <.L10>
     c14:	00490913          	addi	s2,s2,4
     c18:	f95ff06f          	j	bac <.L9>

00000c1c <_ppfs_prepargs>:
     c1c:	ff010113          	addi	sp,sp,-16
     c20:	00912223          	sw	s1,4(sp)
     c24:	01852483          	lw	s1,24(a0)
     c28:	00112623          	sw	ra,12(sp)
     c2c:	00812423          	sw	s0,8(sp)
     c30:	04b52623          	sw	a1,76(a0)
     c34:	02905063          	blez	s1,c54 <.L1>
     c38:	00050413          	mv	s0,a0
     c3c:	00952e23          	sw	s1,28(a0)
     c40:	00052c23          	sw	zero,24(a0)
     c44:	00052223          	sw	zero,4(a0)
     c48:	00052423          	sw	zero,8(a0)
     c4c:	01c000ef          	jal	ra,c68 <_ppfs_setargs>
     c50:	00942c23          	sw	s1,24(s0)

00000c54 <.L1>:
     c54:	00c12083          	lw	ra,12(sp)
     c58:	00812403          	lw	s0,8(sp)
     c5c:	00412483          	lw	s1,4(sp)
     c60:	01010113          	addi	sp,sp,16
     c64:	00008067          	ret

00000c68 <_ppfs_setargs>:
     c68:	01852603          	lw	a2,24(a0)
     c6c:	00852783          	lw	a5,8(a0)
     c70:	00452683          	lw	a3,4(a0)
     c74:	05050713          	addi	a4,a0,80
     c78:	14061663          	bnez	a2,dc4 <.L2>
     c7c:	ff010113          	addi	sp,sp,-16
     c80:	00812623          	sw	s0,12(sp)
     c84:	00912423          	sw	s1,8(sp)
     c88:	800005b7          	lui	a1,0x80000
     c8c:	00b79e63          	bne	a5,a1,ca8 <.L3>
     c90:	04c52783          	lw	a5,76(a0)
     c94:	00478593          	addi	a1,a5,4
     c98:	0007a783          	lw	a5,0(a5)
     c9c:	04b52623          	sw	a1,76(a0)
     ca0:	04f52823          	sw	a5,80(a0)
     ca4:	00f52423          	sw	a5,8(a0)

00000ca8 <.L3>:
     ca8:	800007b7          	lui	a5,0x80000
     cac:	00f69e63          	bne	a3,a5,cc8 <.L4>
     cb0:	04c52783          	lw	a5,76(a0)
     cb4:	00478693          	addi	a3,a5,4 # 80000004 <.LLST3+0x7fff57a9>
     cb8:	0007a783          	lw	a5,0(a5)
     cbc:	04d52623          	sw	a3,76(a0)
     cc0:	04f52823          	sw	a5,80(a0)
     cc4:	00f52223          	sw	a5,4(a0)

00000cc8 <.L4>:
     cc8:	01c52f03          	lw	t5,28(a0)
     ccc:	000017b7          	lui	a5,0x1
     cd0:	02850893          	addi	a7,a0,40
     cd4:	00800e13          	li	t3,8
     cd8:	80078f93          	addi	t6,a5,-2048 # 800 <.L81+0x20>
     cdc:	80778813          	addi	a6,a5,-2041
     ce0:	00200e93          	li	t4,2
     ce4:	00700413          	li	s0,7

00000ce8 <.L5>:
     ce8:	03e64e63          	blt	a2,t5,d24 <.L17>
     cec:	00852783          	lw	a5,8(a0)
     cf0:	0207d263          	bgez	a5,d14 <.L1>
     cf4:	40f007b3          	neg	a5,a5
     cf8:	00f52423          	sw	a5,8(a0)
     cfc:	01052783          	lw	a5,16(a0)
     d00:	ffe7f793          	andi	a5,a5,-2
     d04:	0087e793          	ori	a5,a5,8
     d08:	00f52823          	sw	a5,16(a0)
     d0c:	02000793          	li	a5,32
     d10:	00f52a23          	sw	a5,20(a0)

00000d14 <.L1>:
     d14:	00c12403          	lw	s0,12(sp)
     d18:	00812483          	lw	s1,8(sp)
     d1c:	01010113          	addi	sp,sp,16
     d20:	00008067          	ret

00000d24 <.L17>:
     d24:	0008a683          	lw	a3,0(a7)
     d28:	00160613          	addi	a2,a2,1
     d2c:	05c68863          	beq	a3,t3,d7c <.L6>
     d30:	04c52783          	lw	a5,76(a0)
     d34:	04de4863          	blt	t3,a3,d84 <.L7>
     d38:	01d68463          	beq	a3,t4,d40 <.L10>
     d3c:	00decc63          	blt	t4,a3,d54 <.L9>

00000d40 <.L10>:
     d40:	00478693          	addi	a3,a5,4
     d44:	04d52623          	sw	a3,76(a0)
     d48:	0007a783          	lw	a5,0(a5)
     d4c:	00f72023          	sw	a5,0(a4)
     d50:	0280006f          	j	d78 <.L16>

00000d54 <.L9>:
     d54:	fe8696e3          	bne	a3,s0,d40 <.L10>

00000d58 <.L12>:
     d58:	00778793          	addi	a5,a5,7
     d5c:	ff87f793          	andi	a5,a5,-8
     d60:	00878693          	addi	a3,a5,8
     d64:	04d52623          	sw	a3,76(a0)
     d68:	0007a303          	lw	t1,0(a5)
     d6c:	0047a383          	lw	t2,4(a5)
     d70:	00672023          	sw	t1,0(a4)
     d74:	00772223          	sw	t2,4(a4)

00000d78 <.L16>:
     d78:	01070713          	addi	a4,a4,16

00000d7c <.L6>:
     d7c:	00488893          	addi	a7,a7,4
     d80:	f69ff06f          	j	ce8 <.L5>

00000d84 <.L7>:
     d84:	80068593          	addi	a1,a3,-2048
     d88:	fc0588e3          	beqz	a1,d58 <.L12>
     d8c:	fadfdae3          	bge	t6,a3,d40 <.L10>
     d90:	fb0698e3          	bne	a3,a6,d40 <.L10>
     d94:	00478693          	addi	a3,a5,4
     d98:	04d52623          	sw	a3,76(a0)
     d9c:	0007a783          	lw	a5,0(a5)
     da0:	0007a303          	lw	t1,0(a5)
     da4:	0047a583          	lw	a1,4(a5)
     da8:	0087a683          	lw	a3,8(a5)
     dac:	00c7a783          	lw	a5,12(a5)
     db0:	00672023          	sw	t1,0(a4)
     db4:	00b72223          	sw	a1,4(a4)
     db8:	00d72423          	sw	a3,8(a4)
     dbc:	00f72623          	sw	a5,12(a4)
     dc0:	fb9ff06f          	j	d78 <.L16>

00000dc4 <.L2>:
     dc4:	80000637          	lui	a2,0x80000
     dc8:	00c79c63          	bne	a5,a2,de0 <.L19>
     dcc:	02454783          	lbu	a5,36(a0)
     dd0:	00479793          	slli	a5,a5,0x4
     dd4:	00f707b3          	add	a5,a4,a5
     dd8:	ff07a783          	lw	a5,-16(a5)
     ddc:	00f52423          	sw	a5,8(a0)

00000de0 <.L19>:
     de0:	800007b7          	lui	a5,0x80000
     de4:	00f69c63          	bne	a3,a5,dfc <.L26>
     de8:	02554783          	lbu	a5,37(a0)
     dec:	00479793          	slli	a5,a5,0x4
     df0:	00f70733          	add	a4,a4,a5
     df4:	ff072783          	lw	a5,-16(a4)
     df8:	00f52223          	sw	a5,4(a0)

00000dfc <.L26>:
     dfc:	00852783          	lw	a5,8(a0)
     e00:	0207d463          	bgez	a5,e28 <.L28>
     e04:	40f007b3          	neg	a5,a5
     e08:	00f52423          	sw	a5,8(a0)
     e0c:	01052783          	lw	a5,16(a0)
     e10:	ffe7f793          	andi	a5,a5,-2
     e14:	0087e793          	ori	a5,a5,8
     e18:	00f52823          	sw	a5,16(a0)
     e1c:	02000793          	li	a5,32
     e20:	00f52a23          	sw	a5,20(a0)
     e24:	00008067          	ret

00000e28 <.L28>:
     e28:	00008067          	ret

00000e2c <_promoted_size>:
     e2c:	82418793          	addi	a5,gp,-2012 # 7464 <type_sizes>
     e30:	00006717          	auipc	a4,0x6
     e34:	61c70713          	addi	a4,a4,1564 # 744c <type_codes>

00000e38 <.L3>:
     e38:	ffe79683          	lh	a3,-2(a5) # 7ffffffe <.LLST3+0x7fff57a3>
     e3c:	ffe78793          	addi	a5,a5,-2
     e40:	00a68463          	beq	a3,a0,e48 <.L2>
     e44:	fee79ae3          	bne	a5,a4,e38 <.L3>

00000e48 <.L2>:
     e48:	40e787b3          	sub	a5,a5,a4
     e4c:	4017d793          	srai	a5,a5,0x1
     e50:	00f70733          	add	a4,a4,a5
     e54:	01874503          	lbu	a0,24(a4)
     e58:	00008067          	ret

00000e5c <_ppfs_parsespec>:
     e5c:	f9010113          	addi	sp,sp,-112
     e60:	00800793          	li	a5,8
     e64:	0cccd8b7          	lui	a7,0xcccd
     e68:	80000337          	lui	t1,0x80000
     e6c:	00052703          	lw	a4,0(a0)
     e70:	06912223          	sw	s1,100(sp)
     e74:	07212023          	sw	s2,96(sp)
     e78:	05312e23          	sw	s3,92(sp)
     e7c:	05412c23          	sw	s4,88(sp)
     e80:	01852983          	lw	s3,24(a0)
     e84:	05512a23          	sw	s5,84(sp)
     e88:	00050493          	mv	s1,a0
     e8c:	ccb88f93          	addi	t6,a7,-821 # ccccccb <.LLST3+0xccc2470>
     e90:	06112623          	sw	ra,108(sp)
     e94:	06812423          	sw	s0,104(sp)
     e98:	05612823          	sw	s6,80(sp)
     e9c:	05712623          	sw	s7,76(sp)
     ea0:	05812423          	sw	s8,72(sp)
     ea4:	05912223          	sw	s9,68(sp)
     ea8:	05a12023          	sw	s10,64(sp)
     eac:	03b12e23          	sw	s11,60(sp)
     eb0:	00012423          	sw	zero,8(sp)
     eb4:	00012623          	sw	zero,12(sp)
     eb8:	00f12a23          	sw	a5,20(sp)
     ebc:	00f12c23          	sw	a5,24(sp)
     ec0:	00008f17          	auipc	t5,0x8
     ec4:	8a8f2f03          	lw	t5,-1880(t5) # 8768 <__GI___ctype_b>
     ec8:	00000593          	li	a1,0
     ecc:	00000693          	li	a3,0
     ed0:	00000813          	li	a6,0
     ed4:	02a00513          	li	a0,42
     ed8:	00a00293          	li	t0,10
     edc:	ccc88893          	addi	a7,a7,-820
     ee0:	fff34313          	not	t1,t1
     ee4:	03700393          	li	t2,55
     ee8:	02500e13          	li	t3,37
     eec:	02e00913          	li	s2,46
     ef0:	02400e93          	li	t4,36
     ef4:	03000a13          	li	s4,48
     ef8:	06d00a93          	li	s5,109

00000efc <.L6>:
     efc:	00074783          	lbu	a5,0(a4)
     f00:	00070413          	mv	s0,a4
     f04:	00a79c63          	bne	a5,a0,f1c <.L7>
     f08:	00259793          	slli	a5,a1,0x2
     f0c:	03010613          	addi	a2,sp,48
     f10:	40f607b3          	sub	a5,a2,a5
     f14:	fe07a223          	sw	zero,-28(a5)
     f18:	00170413          	addi	s0,a4,1

00000f1c <.L7>:
     f1c:	00000793          	li	a5,0

00000f20 <.L8>:
     f20:	00044603          	lbu	a2,0(s0)
     f24:	00161b13          	slli	s6,a2,0x1
     f28:	016f0b33          	add	s6,t5,s6
     f2c:	000b5b03          	lhu	s6,0(s6)
     f30:	008b7b13          	andi	s6,s6,8
     f34:	040b1e63          	bnez	s6,f90 <.L11>
     f38:	fff74b03          	lbu	s6,-1(a4)
     f3c:	17cb1263          	bne	s6,t3,10a0 <.L12>
     f40:	0dd61c63          	bne	a2,t4,1018 <.L13>
     f44:	0af05663          	blez	a5,ff0 <.L14>
     f48:	00140713          	addi	a4,s0,1
     f4c:	06099663          	bnez	s3,fb8 <.L15>

00000f50 <.L19>:
     f50:	fff00513          	li	a0,-1

00000f54 <.L5>:
     f54:	06c12083          	lw	ra,108(sp)
     f58:	06812403          	lw	s0,104(sp)
     f5c:	06412483          	lw	s1,100(sp)
     f60:	06012903          	lw	s2,96(sp)
     f64:	05c12983          	lw	s3,92(sp)
     f68:	05812a03          	lw	s4,88(sp)
     f6c:	05412a83          	lw	s5,84(sp)
     f70:	05012b03          	lw	s6,80(sp)
     f74:	04c12b83          	lw	s7,76(sp)
     f78:	04812c03          	lw	s8,72(sp)
     f7c:	04412c83          	lw	s9,68(sp)
     f80:	04012d03          	lw	s10,64(sp)
     f84:	03c12d83          	lw	s11,60(sp)
     f88:	07010113          	addi	sp,sp,112
     f8c:	00008067          	ret

00000f90 <.L11>:
     f90:	00ffd663          	bge	t6,a5,f9c <.L9>
     f94:	01179e63          	bne	a5,a7,fb0 <.L54>
     f98:	00c3ec63          	bltu	t2,a2,fb0 <.L54>

00000f9c <.L9>:
     f9c:	025787b3          	mul	a5,a5,t0
     fa0:	fd060613          	addi	a2,a2,-48 # 7fffffd0 <.LLST3+0x7fff5775>
     fa4:	00f607b3          	add	a5,a2,a5

00000fa8 <.L10>:
     fa8:	00140413          	addi	s0,s0,1
     fac:	f75ff06f          	j	f20 <.L8>

00000fb0 <.L54>:
     fb0:	00030793          	mv	a5,t1
     fb4:	ff5ff06f          	j	fa8 <.L10>

00000fb8 <.L15>:
     fb8:	00f12823          	sw	a5,16(sp)
     fbc:	00f9d463          	bge	s3,a5,fc4 <.L18>
     fc0:	00078993          	mv	s3,a5

00000fc4 <.L18>:
     fc4:	00070413          	mv	s0,a4

00000fc8 <.L25>:
     fc8:	00044b03          	lbu	s6,0(s0)
     fcc:	00100793          	li	a5,1
     fd0:	00007717          	auipc	a4,0x7
     fd4:	69470713          	addi	a4,a4,1684 # 8664 <spec_flags.5>

00000fd8 <.L26>:
     fd8:	00074603          	lbu	a2,0(a4)
     fdc:	00170713          	addi	a4,a4,1
     fe0:	09661c63          	bne	a2,s6,1078 <.L24>
     fe4:	00140413          	addi	s0,s0,1
     fe8:	00f6e6b3          	or	a3,a3,a5
     fec:	fddff06f          	j	fc8 <.L25>

00000ff0 <.L14>:
     ff0:	f73040e3          	bgtz	s3,f50 <.L19>

00000ff4 <.L20>:
     ff4:	00074603          	lbu	a2,0(a4)
     ff8:	06877c63          	bgeu	a4,s0,1070 <.L56>
     ffc:	07460a63          	beq	a2,s4,1070 <.L56>
    1000:	00000993          	li	s3,0
    1004:	04a61663          	bne	a2,a0,1050 <.L22>

00001008 <.L23>:
    1008:	00170713          	addi	a4,a4,1
    100c:	f4e412e3          	bne	s0,a4,f50 <.L19>
    1010:	00000993          	li	s3,0
    1014:	0380006f          	j	104c <.L74>

00001018 <.L13>:
    1018:	fd305ee3          	blez	s3,ff4 <.L20>
    101c:	f3561ae3          	bne	a2,s5,f50 <.L19>
    1020:	00074703          	lbu	a4,0(a4)
    1024:	02a71663          	bne	a4,a0,1050 <.L22>

00001028 <.L21>:
    1028:	00044703          	lbu	a4,0(s0)
    102c:	00140613          	addi	a2,s0,1
    1030:	f3d710e3          	bne	a4,t4,f50 <.L19>
    1034:	f0f05ee3          	blez	a5,f50 <.L19>
    1038:	03010413          	addi	s0,sp,48
    103c:	00259713          	slli	a4,a1,0x2
    1040:	40e40733          	sub	a4,s0,a4
    1044:	fcf72c23          	sw	a5,-40(a4)
    1048:	00060413          	mv	s0,a2

0000104c <.L74>:
    104c:	800007b7          	lui	a5,0x80000

00001050 <.L22>:
    1050:	00044b03          	lbu	s6,0(s0)
    1054:	06059263          	bnez	a1,10b8 <.L28>
    1058:	052b1c63          	bne	s6,s2,10b0 <.L57>
    105c:	00140413          	addi	s0,s0,1
    1060:	00078813          	mv	a6,a5
    1064:	fff00593          	li	a1,-1

00001068 <.L27>:
    1068:	00040713          	mv	a4,s0
    106c:	e91ff06f          	j	efc <.L6>

00001070 <.L56>:
    1070:	00000993          	li	s3,0
    1074:	f51ff06f          	j	fc4 <.L18>

00001078 <.L24>:
    1078:	00074603          	lbu	a2,0(a4)
    107c:	00179793          	slli	a5,a5,0x1
    1080:	f4061ce3          	bnez	a2,fd8 <.L26>
    1084:	4016d793          	srai	a5,a3,0x1
    1088:	0057f793          	andi	a5,a5,5
    108c:	fff7c793          	not	a5,a5
    1090:	00f6f6b3          	and	a3,a3,a5
    1094:	fff44783          	lbu	a5,-1(s0)
    1098:	fdc798e3          	bne	a5,t3,1068 <.L27>
    109c:	00000793          	li	a5,0

000010a0 <.L12>:
    10a0:	00074603          	lbu	a2,0(a4)
    10a4:	faa616e3          	bne	a2,a0,1050 <.L22>
    10a8:	f60980e3          	beqz	s3,1008 <.L23>
    10ac:	f7dff06f          	j	1028 <.L21>

000010b0 <.L57>:
    10b0:	00078813          	mv	a6,a5
    10b4:	fff00793          	li	a5,-1

000010b8 <.L28>:
    10b8:	83018713          	addi	a4,gp,-2000 # 7470 <qual_chars.4>
    10bc:	00070613          	mv	a2,a4

000010c0 <.L31>:
    10c0:	00074583          	lbu	a1,0(a4)
    10c4:	1b659863          	bne	a1,s6,1274 <.L29>
    10c8:	00140413          	addi	s0,s0,1

000010cc <.L30>:
    10cc:	40c70633          	sub	a2,a4,a2
    10d0:	00100513          	li	a0,1
    10d4:	00044583          	lbu	a1,0(s0)
    10d8:	00c54a63          	blt	a0,a2,10ec <.L32>
    10dc:	00074603          	lbu	a2,0(a4)
    10e0:	00b61663          	bne	a2,a1,10ec <.L32>
    10e4:	00970713          	addi	a4,a4,9
    10e8:	00140413          	addi	s0,s0,1

000010ec <.L32>:
    10ec:	00974603          	lbu	a2,9(a4)
    10f0:	00044583          	lbu	a1,0(s0)
    10f4:	00861613          	slli	a2,a2,0x8
    10f8:	e4058ce3          	beqz	a1,f50 <.L19>
    10fc:	00007717          	auipc	a4,0x7
    1100:	55070713          	addi	a4,a4,1360 # 864c <spec_chars.3>
    1104:	00070893          	mv	a7,a4

00001108 <.L37>:
    1108:	00074503          	lbu	a0,0(a4)
    110c:	16b51c63          	bne	a0,a1,1284 <.L33>
    1110:	41170733          	sub	a4,a4,a7
    1114:	01100593          	li	a1,17
    1118:	00e5d863          	bge	a1,a4,1128 <.L34>
    111c:	40067593          	andi	a1,a2,1024
    1120:	00058463          	beqz	a1,1128 <.L34>
    1124:	ffe70713          	addi	a4,a4,-2

00001128 <.L34>:
    1128:	84418513          	addi	a0,gp,-1980 # 7484 <spec_ranges.2>
    112c:	02e4a023          	sw	a4,32(s1)
    1130:	00050893          	mv	a7,a0

00001134 <.L35>:
    1134:	00050593          	mv	a1,a0
    1138:	0005c303          	lbu	t1,0(a1) # 80000000 <.LLST3+0x7fff57a5>
    113c:	00150513          	addi	a0,a0,1
    1140:	fee34ae3          	blt	t1,a4,1134 <.L35>
    1144:	411585b3          	sub	a1,a1,a7
    1148:	00006717          	auipc	a4,0x6
    114c:	30470713          	addi	a4,a4,772 # 744c <type_codes>
    1150:	00159593          	slli	a1,a1,0x1
    1154:	00b705b3          	add	a1,a4,a1
    1158:	04459703          	lh	a4,68(a1)
    115c:	05459583          	lh	a1,84(a1)
    1160:	00c76733          	or	a4,a4,a2
    1164:	00b77733          	and	a4,a4,a1
    1168:	00e12e23          	sw	a4,28(sp)
    116c:	00007717          	auipc	a4,0x7
    1170:	4e070713          	addi	a4,a4,1248 # 864c <spec_chars.3>

00001174 <.L36>:
    1174:	00044583          	lbu	a1,0(s0)
    1178:	00f4a223          	sw	a5,4(s1)
    117c:	0104a423          	sw	a6,8(s1)
    1180:	00b4a623          	sw	a1,12(s1)
    1184:	0046f793          	andi	a5,a3,4
    1188:	03000593          	li	a1,48
    118c:	00079463          	bnez	a5,1194 <.L38>
    1190:	02000593          	li	a1,32

00001194 <.L38>:
    1194:	000017b7          	lui	a5,0x1
    1198:	f0078793          	addi	a5,a5,-256 # f00 <.L6+0x4>
    119c:	00f67633          	and	a2,a2,a5
    11a0:	ffb6f693          	andi	a3,a3,-5
    11a4:	00100793          	li	a5,1
    11a8:	00c6e6b3          	or	a3,a3,a2
    11ac:	00b4aa23          	sw	a1,20(s1)
    11b0:	00d4a823          	sw	a3,16(s1)
    11b4:	00f4ae23          	sw	a5,28(s1)
    11b8:	00074783          	lbu	a5,0(a4)
    11bc:	00079e63          	bnez	a5,11d8 <.L41>
    11c0:	00044703          	lbu	a4,0(s0)
    11c4:	06d00793          	li	a5,109
    11c8:	0cf71663          	bne	a4,a5,1294 <.L40>
    11cc:	01400793          	li	a5,20
    11d0:	02f4a023          	sw	a5,32(s1)
    11d4:	0004ae23          	sw	zero,28(s1)

000011d8 <.L41>:
    11d8:	13305e63          	blez	s3,1314 <.L44>
    11dc:	01410b93          	addi	s7,sp,20
    11e0:	00810b13          	addi	s6,sp,8
    11e4:	00000a13          	li	s4,0
    11e8:	00200d13          	li	s10,2
    11ec:	00900d93          	li	s11,9
    11f0:	00800c93          	li	s9,8

000011f4 <.L50>:
    11f4:	114d4863          	blt	s10,s4,1304 <.L45>
    11f8:	000b2783          	lw	a5,0(s6)
    11fc:	01448733          	add	a4,s1,s4
    1200:	02f70223          	sb	a5,36(a4)
    1204:	0ff7f793          	zext.b	a5,a5

00001208 <.L46>:
    1208:	00f9d663          	bge	s3,a5,1214 <.L47>
    120c:	d4fdc2e3          	blt	s11,a5,f50 <.L19>
    1210:	00078993          	mv	s3,a5

00001214 <.L47>:
    1214:	000baa83          	lw	s5,0(s7)
    1218:	039a8863          	beq	s5,s9,1248 <.L48>
    121c:	00279793          	slli	a5,a5,0x2
    1220:	00f48933          	add	s2,s1,a5
    1224:	02492503          	lw	a0,36(s2)
    1228:	01950e63          	beq	a0,s9,1244 <.L49>
    122c:	01550c63          	beq	a0,s5,1244 <.L49>
    1230:	bfdff0ef          	jal	ra,e2c <_promoted_size>
    1234:	00050c13          	mv	s8,a0
    1238:	000a8513          	mv	a0,s5
    123c:	bf1ff0ef          	jal	ra,e2c <_promoted_size>
    1240:	01854463          	blt	a0,s8,1248 <.L48>

00001244 <.L49>:
    1244:	03592223          	sw	s5,36(s2)

00001248 <.L48>:
    1248:	01c4a783          	lw	a5,28(s1)
    124c:	001a0713          	addi	a4,s4,1
    1250:	004b8b93          	addi	s7,s7,4
    1254:	004b0b13          	addi	s6,s6,4
    1258:	0b47d263          	bge	a5,s4,12fc <.L59>

0000125c <.L51>:
    125c:	01c4a503          	lw	a0,28(s1)
    1260:	00140413          	addi	s0,s0,1
    1264:	0134ac23          	sw	s3,24(s1)
    1268:	0084a023          	sw	s0,0(s1)
    126c:	00250513          	addi	a0,a0,2
    1270:	ce5ff06f          	j	f54 <.L5>

00001274 <.L29>:
    1274:	00174583          	lbu	a1,1(a4)
    1278:	00170713          	addi	a4,a4,1
    127c:	e40592e3          	bnez	a1,10c0 <.L31>
    1280:	e4dff06f          	j	10cc <.L30>

00001284 <.L33>:
    1284:	00174503          	lbu	a0,1(a4)
    1288:	00170713          	addi	a4,a4,1
    128c:	e6051ee3          	bnez	a0,1108 <.L37>
    1290:	ee5ff06f          	j	1174 <.L36>

00001294 <.L40>:
    1294:	01500793          	li	a5,21
    1298:	02f4a023          	sw	a5,32(s1)
    129c:	00044603          	lbu	a2,0(s0)
    12a0:	00007717          	auipc	a4,0x7
    12a4:	4b872703          	lw	a4,1208(a4) # 8758 <_custom_printf_spec>
    12a8:	00a70693          	addi	a3,a4,10
    12ac:	00070793          	mv	a5,a4

000012b0 <.L43>:
    12b0:	0007c583          	lbu	a1,0(a5)
    12b4:	02c59e63          	bne	a1,a2,12f0 <.L42>
    12b8:	40e787b3          	sub	a5,a5,a4
    12bc:	00279793          	slli	a5,a5,0x2
    12c0:	00009717          	auipc	a4,0x9
    12c4:	50c70713          	addi	a4,a4,1292 # a7cc <_custom_printf_arginfo>
    12c8:	00f707b3          	add	a5,a4,a5
    12cc:	0007a783          	lw	a5,0(a5)
    12d0:	01c10613          	addi	a2,sp,28
    12d4:	00500593          	li	a1,5
    12d8:	00448513          	addi	a0,s1,4
    12dc:	000780e7          	jalr	a5
    12e0:	00a4ae23          	sw	a0,28(s1)
    12e4:	00500793          	li	a5,5
    12e8:	eea7d8e3          	bge	a5,a0,11d8 <.L41>
    12ec:	c65ff06f          	j	f50 <.L19>

000012f0 <.L42>:
    12f0:	00178793          	addi	a5,a5,1
    12f4:	faf69ee3          	bne	a3,a5,12b0 <.L43>
    12f8:	c59ff06f          	j	f50 <.L19>

000012fc <.L59>:
    12fc:	00070a13          	mv	s4,a4
    1300:	ef5ff06f          	j	11f4 <.L50>

00001304 <.L45>:
    1304:	01012703          	lw	a4,16(sp)
    1308:	ffea0793          	addi	a5,s4,-2
    130c:	00e787b3          	add	a5,a5,a4
    1310:	ef9ff06f          	j	1208 <.L46>

00001314 <.L44>:
    1314:	01c4a603          	lw	a2,28(s1)
    1318:	00100793          	li	a5,1
    131c:	02f48323          	sb	a5,38(s1)
    1320:	00261613          	slli	a2,a2,0x2
    1324:	01c10593          	addi	a1,sp,28
    1328:	02848513          	addi	a0,s1,40
    132c:	104000ef          	jal	ra,1430 <__GI_memcpy>
    1330:	f2dff06f          	j	125c <.L51>

00001334 <__GI_fputs>:
    1334:	fe010113          	addi	sp,sp,-32
    1338:	00812c23          	sw	s0,24(sp)
    133c:	00912a23          	sw	s1,20(sp)
    1340:	00112e23          	sw	ra,28(sp)
    1344:	00050493          	mv	s1,a0
    1348:	00b12623          	sw	a1,12(sp)
    134c:	434000ef          	jal	ra,1780 <__GI_strlen>
    1350:	00c12683          	lw	a3,12(sp)
    1354:	00050413          	mv	s0,a0
    1358:	00050613          	mv	a2,a0
    135c:	00100593          	li	a1,1
    1360:	00048513          	mv	a0,s1
    1364:	020000ef          	jal	ra,1384 <__GI_fwrite>
    1368:	00850463          	beq	a0,s0,1370 <.L1>
    136c:	fff00513          	li	a0,-1

00001370 <.L1>:
    1370:	01c12083          	lw	ra,28(sp)
    1374:	01812403          	lw	s0,24(sp)
    1378:	01412483          	lw	s1,20(sp)
    137c:	02010113          	addi	sp,sp,32
    1380:	00008067          	ret

00001384 <__GI_fwrite>:
    1384:	0006d783          	lhu	a5,0(a3)
    1388:	fe010113          	addi	sp,sp,-32
    138c:	00812c23          	sw	s0,24(sp)
    1390:	00912a23          	sw	s1,20(sp)
    1394:	01212823          	sw	s2,16(sp)
    1398:	01312623          	sw	s3,12(sp)
    139c:	00112e23          	sw	ra,28(sp)
    13a0:	0407f793          	andi	a5,a5,64
    13a4:	00050993          	mv	s3,a0
    13a8:	00058493          	mv	s1,a1
    13ac:	00060913          	mv	s2,a2
    13b0:	00068413          	mv	s0,a3
    13b4:	02078463          	beqz	a5,13dc <.L2>

000013b8 <.L5>:
    13b8:	02049a63          	bnez	s1,13ec <.L3>

000013bc <.L10>:
    13bc:	00000513          	li	a0,0

000013c0 <.L1>:
    13c0:	01c12083          	lw	ra,28(sp)
    13c4:	01812403          	lw	s0,24(sp)
    13c8:	01412483          	lw	s1,20(sp)
    13cc:	01012903          	lw	s2,16(sp)
    13d0:	00c12983          	lw	s3,12(sp)
    13d4:	02010113          	addi	sp,sp,32
    13d8:	00008067          	ret

000013dc <.L2>:
    13dc:	00068513          	mv	a0,a3
    13e0:	4dd000ef          	jal	ra,20bc <__stdio_trans2w>
    13e4:	fc050ae3          	beqz	a0,13b8 <.L5>
    13e8:	fd5ff06f          	j	13bc <.L10>

000013ec <.L3>:
    13ec:	fc0908e3          	beqz	s2,13bc <.L10>
    13f0:	0324b7b3          	mulhu	a5,s1,s2
    13f4:	00079e63          	bnez	a5,1410 <.L9>
    13f8:	032485b3          	mul	a1,s1,s2
    13fc:	00040613          	mv	a2,s0
    1400:	00098513          	mv	a0,s3
    1404:	369000ef          	jal	ra,1f6c <__stdio_fwrite>
    1408:	02955533          	divu	a0,a0,s1
    140c:	fb5ff06f          	j	13c0 <.L1>

00001410 <.L9>:
    1410:	00045783          	lhu	a5,0(s0)
    1414:	01600713          	li	a4,22
    1418:	0087e793          	ori	a5,a5,8
    141c:	00f41023          	sh	a5,0(s0)
    1420:	00006797          	auipc	a5,0x6
    1424:	fb47a783          	lw	a5,-76(a5) # 73d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    1428:	00e7a023          	sw	a4,0(a5)
    142c:	f91ff06f          	j	13bc <.L10>

00001430 <__GI_memcpy>:
    1430:	00f00713          	li	a4,15
    1434:	00050693          	mv	a3,a0
    1438:	00058793          	mv	a5,a1
    143c:	16c77a63          	bgeu	a4,a2,15b0 <.L2>
    1440:	40a007b3          	neg	a5,a0
    1444:	0037f793          	andi	a5,a5,3
    1448:	40f60633          	sub	a2,a2,a5
    144c:	00000713          	li	a4,0

00001450 <.L3>:
    1450:	04e79463          	bne	a5,a4,1498 <.L4>
    1454:	00f585b3          	add	a1,a1,a5
    1458:	00f508b3          	add	a7,a0,a5
    145c:	0035fe13          	andi	t3,a1,3
    1460:	00088793          	mv	a5,a7
    1464:	00265713          	srli	a4,a2,0x2
    1468:	140e1a63          	bnez	t3,15bc <.L5>
    146c:	00777693          	andi	a3,a4,7
    1470:	fff68693          	addi	a3,a3,-1
    1474:	00600313          	li	t1,6
    1478:	0005a803          	lw	a6,0(a1)
    147c:	0ed36863          	bltu	t1,a3,156c <.L6>
    1480:	87018313          	addi	t1,gp,-1936 # 74b0 <.L8>
    1484:	00269693          	slli	a3,a3,0x2
    1488:	006686b3          	add	a3,a3,t1
    148c:	0006a683          	lw	a3,0(a3)
    1490:	006686b3          	add	a3,a3,t1
    1494:	00068067          	jr	a3

00001498 <.L4>:
    1498:	00e586b3          	add	a3,a1,a4
    149c:	0006c803          	lbu	a6,0(a3)
    14a0:	00e506b3          	add	a3,a0,a4
    14a4:	00170713          	addi	a4,a4,1
    14a8:	01068023          	sb	a6,0(a3)
    14ac:	fa5ff06f          	j	1450 <.L3>

000014b0 <.L13>:
    14b0:	fe858693          	addi	a3,a1,-24
    14b4:	fe488793          	addi	a5,a7,-28
    14b8:	00670713          	addi	a4,a4,6

000014bc <.L15>:
    14bc:	01c6a303          	lw	t1,28(a3)
    14c0:	ff870713          	addi	a4,a4,-8
    14c4:	0107ae23          	sw	a6,28(a5)
    14c8:	02078813          	addi	a6,a5,32
    14cc:	0c070863          	beqz	a4,159c <.L23>
    14d0:	00080793          	mv	a5,a6
    14d4:	02068693          	addi	a3,a3,32
    14d8:	00030813          	mv	a6,t1
    14dc:	0b00006f          	j	158c <.L22>

000014e0 <.L12>:
    14e0:	fec58693          	addi	a3,a1,-20
    14e4:	fe888793          	addi	a5,a7,-24
    14e8:	00570713          	addi	a4,a4,5

000014ec <.L16>:
    14ec:	0186a303          	lw	t1,24(a3)
    14f0:	0107ac23          	sw	a6,24(a5)
    14f4:	00030813          	mv	a6,t1
    14f8:	fc5ff06f          	j	14bc <.L15>

000014fc <.L11>:
    14fc:	ff058693          	addi	a3,a1,-16
    1500:	fec88793          	addi	a5,a7,-20
    1504:	00470713          	addi	a4,a4,4

00001508 <.L17>:
    1508:	0146a303          	lw	t1,20(a3)
    150c:	0107aa23          	sw	a6,20(a5)
    1510:	00030813          	mv	a6,t1
    1514:	fd9ff06f          	j	14ec <.L16>

00001518 <.L10>:
    1518:	ff458693          	addi	a3,a1,-12
    151c:	ff088793          	addi	a5,a7,-16
    1520:	00370713          	addi	a4,a4,3

00001524 <.L18>:
    1524:	0106a303          	lw	t1,16(a3)
    1528:	0107a823          	sw	a6,16(a5)
    152c:	00030813          	mv	a6,t1
    1530:	fd9ff06f          	j	1508 <.L17>

00001534 <.L9>:
    1534:	ff858693          	addi	a3,a1,-8
    1538:	ff488793          	addi	a5,a7,-12
    153c:	00270713          	addi	a4,a4,2

00001540 <.L19>:
    1540:	00c6a303          	lw	t1,12(a3)
    1544:	0107a623          	sw	a6,12(a5)
    1548:	00030813          	mv	a6,t1
    154c:	fd9ff06f          	j	1524 <.L18>

00001550 <.L7>:
    1550:	ffc58693          	addi	a3,a1,-4
    1554:	ff888793          	addi	a5,a7,-8
    1558:	00170713          	addi	a4,a4,1

0000155c <.L20>:
    155c:	0086a303          	lw	t1,8(a3)
    1560:	0107a423          	sw	a6,8(a5)
    1564:	00030813          	mv	a6,t1
    1568:	fd9ff06f          	j	1540 <.L19>

0000156c <.L6>:
    156c:	00058693          	mv	a3,a1
    1570:	ffc88793          	addi	a5,a7,-4

00001574 <.L21>:
    1574:	0046a303          	lw	t1,4(a3)
    1578:	0107a223          	sw	a6,4(a5)
    157c:	00030813          	mv	a6,t1
    1580:	fddff06f          	j	155c <.L20>

00001584 <.L14>:
    1584:	00458693          	addi	a3,a1,4
    1588:	fff70713          	addi	a4,a4,-1

0000158c <.L22>:
    158c:	0006a303          	lw	t1,0(a3)
    1590:	0107a023          	sw	a6,0(a5)
    1594:	00030813          	mv	a6,t1
    1598:	fddff06f          	j	1574 <.L21>

0000159c <.L23>:
    159c:	0267a023          	sw	t1,32(a5)

000015a0 <.L24>:
    15a0:	ffc67693          	andi	a3,a2,-4
    15a4:	00b687b3          	add	a5,a3,a1
    15a8:	00367613          	andi	a2,a2,3
    15ac:	011686b3          	add	a3,a3,a7

000015b0 <.L2>:
    15b0:	00000713          	li	a4,0

000015b4 <.L34>:
    15b4:	10e61663          	bne	a2,a4,16c0 <.L35>
    15b8:	00008067          	ret

000015bc <.L5>:
    15bc:	ffc5fe93          	andi	t4,a1,-4
    15c0:	003e1e13          	slli	t3,t3,0x3
    15c4:	02000f93          	li	t6,32
    15c8:	00377f13          	andi	t5,a4,3
    15cc:	00200293          	li	t0,2
    15d0:	000ea683          	lw	a3,0(t4)
    15d4:	004ea803          	lw	a6,4(t4)
    15d8:	41cf8fb3          	sub	t6,t6,t3
    15dc:	004e8313          	addi	t1,t4,4
    15e0:	025f0e63          	beq	t5,t0,161c <.L25>
    15e4:	00300293          	li	t0,3
    15e8:	065f0a63          	beq	t5,t0,165c <.L26>
    15ec:	00100293          	li	t0,1
    15f0:	085f1c63          	bne	t5,t0,1688 <.L36>
    15f4:	008e8313          	addi	t1,t4,8
    15f8:	fff70713          	addi	a4,a4,-1

000015fc <.L32>:
    15fc:	00032e83          	lw	t4,0(t1) # 80000000 <.LLST3+0x7fff57a5>
    1600:	01f81f33          	sll	t5,a6,t6
    1604:	01c6d6b3          	srl	a3,a3,t3
    1608:	01e6e6b3          	or	a3,a3,t5
    160c:	00d7a023          	sw	a3,0(a5)
    1610:	00080693          	mv	a3,a6
    1614:	000e8813          	mv	a6,t4
    1618:	0740006f          	j	168c <.L31>

0000161c <.L25>:
    161c:	ffce8313          	addi	t1,t4,-4
    1620:	ff488793          	addi	a5,a7,-12
    1624:	00270713          	addi	a4,a4,2

00001628 <.L29>:
    1628:	01c6d6b3          	srl	a3,a3,t3
    162c:	01f81f33          	sll	t5,a6,t6
    1630:	01e6e6b3          	or	a3,a3,t5
    1634:	00c32e83          	lw	t4,12(t1)
    1638:	ffc70713          	addi	a4,a4,-4
    163c:	00d7a623          	sw	a3,12(a5)
    1640:	01078693          	addi	a3,a5,16
    1644:	06070463          	beqz	a4,16ac <.L33>
    1648:	00068793          	mv	a5,a3
    164c:	01030313          	addi	t1,t1,16
    1650:	00080693          	mv	a3,a6
    1654:	000e8813          	mv	a6,t4
    1658:	fa5ff06f          	j	15fc <.L32>

0000165c <.L26>:
    165c:	000e8313          	mv	t1,t4
    1660:	ff888793          	addi	a5,a7,-8
    1664:	00170713          	addi	a4,a4,1

00001668 <.L30>:
    1668:	00832e83          	lw	t4,8(t1)
    166c:	01f81f33          	sll	t5,a6,t6
    1670:	01c6d6b3          	srl	a3,a3,t3
    1674:	01e6e6b3          	or	a3,a3,t5
    1678:	00d7a423          	sw	a3,8(a5)
    167c:	00080693          	mv	a3,a6
    1680:	000e8813          	mv	a6,t4
    1684:	fa5ff06f          	j	1628 <.L29>

00001688 <.L36>:
    1688:	ffc88793          	addi	a5,a7,-4

0000168c <.L31>:
    168c:	00432e83          	lw	t4,4(t1)
    1690:	01f81f33          	sll	t5,a6,t6
    1694:	01c6d6b3          	srl	a3,a3,t3
    1698:	01e6e6b3          	or	a3,a3,t5
    169c:	00d7a223          	sw	a3,4(a5)
    16a0:	00080693          	mv	a3,a6
    16a4:	000e8813          	mv	a6,t4
    16a8:	fc1ff06f          	j	1668 <.L30>

000016ac <.L33>:
    16ac:	01c85833          	srl	a6,a6,t3
    16b0:	01fe9eb3          	sll	t4,t4,t6
    16b4:	01d86833          	or	a6,a6,t4
    16b8:	0107a823          	sw	a6,16(a5)
    16bc:	ee5ff06f          	j	15a0 <.L24>

000016c0 <.L35>:
    16c0:	00e785b3          	add	a1,a5,a4
    16c4:	0005c803          	lbu	a6,0(a1)
    16c8:	00e685b3          	add	a1,a3,a4
    16cc:	00170713          	addi	a4,a4,1
    16d0:	01058023          	sb	a6,0(a1)
    16d4:	ee1ff06f          	j	15b4 <.L34>

000016d8 <__GI_memset>:
    16d8:	00700713          	li	a4,7
    16dc:	00050793          	mv	a5,a0
    16e0:	04c77463          	bgeu	a4,a2,1728 <.L2>
    16e4:	010106b7          	lui	a3,0x1010
    16e8:	0ff5f713          	zext.b	a4,a1
    16ec:	10168693          	addi	a3,a3,257 # 1010101 <.LLST3+0x10058a6>
    16f0:	02d70733          	mul	a4,a4,a3
    16f4:	0ff5f813          	zext.b	a6,a1

000016f8 <.L3>:
    16f8:	0037f693          	andi	a3,a5,3
    16fc:	02069c63          	bnez	a3,1734 <.L4>
    1700:	00c50633          	add	a2,a0,a2
    1704:	40f60633          	sub	a2,a2,a5
    1708:	fe067813          	andi	a6,a2,-32
    170c:	00f80833          	add	a6,a6,a5
    1710:	00080693          	mv	a3,a6

00001714 <.L5>:
    1714:	03079663          	bne	a5,a6,1740 <.L6>
    1718:	01c67813          	andi	a6,a2,28
    171c:	00f807b3          	add	a5,a6,a5

00001720 <.L7>:
    1720:	04f69463          	bne	a3,a5,1768 <.L8>
    1724:	00367613          	andi	a2,a2,3

00001728 <.L2>:
    1728:	00c78633          	add	a2,a5,a2

0000172c <.L9>:
    172c:	04c79463          	bne	a5,a2,1774 <.L10>
    1730:	00008067          	ret

00001734 <.L4>:
    1734:	01078023          	sb	a6,0(a5)
    1738:	00178793          	addi	a5,a5,1
    173c:	fbdff06f          	j	16f8 <.L3>

00001740 <.L6>:
    1740:	00e7a023          	sw	a4,0(a5)
    1744:	00e7a223          	sw	a4,4(a5)
    1748:	00e7a423          	sw	a4,8(a5)
    174c:	00e7a623          	sw	a4,12(a5)
    1750:	00e7a823          	sw	a4,16(a5)
    1754:	00e7aa23          	sw	a4,20(a5)
    1758:	00e7ac23          	sw	a4,24(a5)
    175c:	00e7ae23          	sw	a4,28(a5)
    1760:	02078793          	addi	a5,a5,32
    1764:	fb1ff06f          	j	1714 <.L5>

00001768 <.L8>:
    1768:	00e6a023          	sw	a4,0(a3)
    176c:	00468693          	addi	a3,a3,4
    1770:	fb1ff06f          	j	1720 <.L7>

00001774 <.L10>:
    1774:	00b78023          	sb	a1,0(a5)
    1778:	00178793          	addi	a5,a5,1
    177c:	fb1ff06f          	j	172c <.L9>

00001780 <__GI_strlen>:
    1780:	00050793          	mv	a5,a0

00001784 <.L2>:
    1784:	0037f713          	andi	a4,a5,3
    1788:	04071263          	bnez	a4,17cc <.L5>
    178c:	feff0637          	lui	a2,0xfeff0
    1790:	808085b7          	lui	a1,0x80808
    1794:	eff60613          	addi	a2,a2,-257 # fefefeff <.LLST3+0xfefe56a4>
    1798:	08058593          	addi	a1,a1,128 # 80808080 <.LLST3+0x807fd825>

0000179c <.L6>:
    179c:	0007a683          	lw	a3,0(a5)
    17a0:	00478713          	addi	a4,a5,4
    17a4:	00c686b3          	add	a3,a3,a2
    17a8:	00b6f6b3          	and	a3,a3,a1
    17ac:	02068c63          	beqz	a3,17e4 <.L7>
    17b0:	ffc74683          	lbu	a3,-4(a4)
    17b4:	02068063          	beqz	a3,17d4 <.L14>
    17b8:	ffd74683          	lbu	a3,-3(a4)
    17bc:	02069863          	bnez	a3,17ec <.L9>
    17c0:	40a787b3          	sub	a5,a5,a0
    17c4:	00178513          	addi	a0,a5,1
    17c8:	00008067          	ret

000017cc <.L5>:
    17cc:	0007c703          	lbu	a4,0(a5)
    17d0:	00071663          	bnez	a4,17dc <.L3>

000017d4 <.L14>:
    17d4:	40a78533          	sub	a0,a5,a0
    17d8:	00008067          	ret

000017dc <.L3>:
    17dc:	00178793          	addi	a5,a5,1
    17e0:	fa5ff06f          	j	1784 <.L2>

000017e4 <.L7>:
    17e4:	00070793          	mv	a5,a4
    17e8:	fb5ff06f          	j	179c <.L6>

000017ec <.L9>:
    17ec:	ffe74683          	lbu	a3,-2(a4)
    17f0:	00069863          	bnez	a3,1800 <.L10>
    17f4:	40a787b3          	sub	a5,a5,a0
    17f8:	00278513          	addi	a0,a5,2
    17fc:	00008067          	ret

00001800 <.L10>:
    1800:	fff74683          	lbu	a3,-1(a4)
    1804:	fe0690e3          	bnez	a3,17e4 <.L7>
    1808:	40a787b3          	sub	a5,a5,a0
    180c:	00378513          	addi	a0,a5,3
    1810:	00008067          	ret

00001814 <__GI_strnlen>:
    1814:	00050713          	mv	a4,a0
    1818:	00058513          	mv	a0,a1
    181c:	06058a63          	beqz	a1,1890 <.L2>
    1820:	00b705b3          	add	a1,a4,a1
    1824:	00e5f463          	bgeu	a1,a4,182c <.L3>
    1828:	fff00593          	li	a1,-1

0000182c <.L3>:
    182c:	00070793          	mv	a5,a4

00001830 <.L4>:
    1830:	0037f693          	andi	a3,a5,3
    1834:	04069463          	bnez	a3,187c <.L7>
    1838:	feff0537          	lui	a0,0xfeff0
    183c:	80808837          	lui	a6,0x80808
    1840:	00078693          	mv	a3,a5
    1844:	eff50513          	addi	a0,a0,-257 # fefefeff <.LLST3+0xfefe56a4>
    1848:	08080813          	addi	a6,a6,128 # 80808080 <.LLST3+0x807fd825>

0000184c <.L8>:
    184c:	02b6fc63          	bgeu	a3,a1,1884 <.L10>
    1850:	0006a783          	lw	a5,0(a3)
    1854:	00468613          	addi	a2,a3,4
    1858:	00a787b3          	add	a5,a5,a0
    185c:	0107f7b3          	and	a5,a5,a6
    1860:	04078e63          	beqz	a5,18bc <.L17>
    1864:	ffc64783          	lbu	a5,-4(a2)
    1868:	06078063          	beqz	a5,18c8 <.L16>
    186c:	ffd64783          	lbu	a5,-3(a2)
    1870:	02079663          	bnez	a5,189c <.L11>
    1874:	00168793          	addi	a5,a3,1
    1878:	00c0006f          	j	1884 <.L10>

0000187c <.L7>:
    187c:	0007c683          	lbu	a3,0(a5)
    1880:	00069a63          	bnez	a3,1894 <.L5>

00001884 <.L10>:
    1884:	00b7f463          	bgeu	a5,a1,188c <.L14>
    1888:	00078593          	mv	a1,a5

0000188c <.L14>:
    188c:	40e58533          	sub	a0,a1,a4

00001890 <.L2>:
    1890:	00008067          	ret

00001894 <.L5>:
    1894:	00178793          	addi	a5,a5,1
    1898:	f99ff06f          	j	1830 <.L4>

0000189c <.L11>:
    189c:	ffe64783          	lbu	a5,-2(a2)
    18a0:	00079663          	bnez	a5,18ac <.L12>
    18a4:	00268793          	addi	a5,a3,2
    18a8:	fddff06f          	j	1884 <.L10>

000018ac <.L12>:
    18ac:	fff64783          	lbu	a5,-1(a2)
    18b0:	00079663          	bnez	a5,18bc <.L17>
    18b4:	00368793          	addi	a5,a3,3
    18b8:	fcdff06f          	j	1884 <.L10>

000018bc <.L17>:
    18bc:	00058793          	mv	a5,a1
    18c0:	00060693          	mv	a3,a2
    18c4:	f89ff06f          	j	184c <.L8>

000018c8 <.L16>:
    18c8:	00068793          	mv	a5,a3
    18cc:	fb9ff06f          	j	1884 <.L10>

000018d0 <__GI___glibc_strerror_r>:
    18d0:	ff010113          	addi	sp,sp,-16
    18d4:	00812423          	sw	s0,8(sp)
    18d8:	00112623          	sw	ra,12(sp)
    18dc:	00058413          	mv	s0,a1
    18e0:	018000ef          	jal	ra,18f8 <__GI___xpg_strerror_r>
    18e4:	00c12083          	lw	ra,12(sp)
    18e8:	00040513          	mv	a0,s0
    18ec:	00812403          	lw	s0,8(sp)
    18f0:	01010113          	addi	sp,sp,16
    18f4:	00008067          	ret

000018f8 <__GI___xpg_strerror_r>:
    18f8:	fa010113          	addi	sp,sp,-96
    18fc:	04812c23          	sw	s0,88(sp)
    1900:	05312623          	sw	s3,76(sp)
    1904:	04112e23          	sw	ra,92(sp)
    1908:	04912a23          	sw	s1,84(sp)
    190c:	05212823          	sw	s2,80(sp)
    1910:	05412423          	sw	s4,72(sp)
    1914:	07c00793          	li	a5,124
    1918:	00058413          	mv	s0,a1
    191c:	00060993          	mv	s3,a2
    1920:	0aa7f063          	bgeu	a5,a0,19c0 <.L13>

00001924 <.L3>:
    1924:	00050593          	mv	a1,a0
    1928:	41f55613          	srai	a2,a0,0x1f
    192c:	00000713          	li	a4,0
    1930:	ff600693          	li	a3,-10
    1934:	03d10513          	addi	a0,sp,61
    1938:	111000ef          	jal	ra,2248 <_uintmaxtostr>
    193c:	ff250493          	addi	s1,a0,-14
    1940:	00e00613          	li	a2,14
    1944:	00007597          	auipc	a1,0x7
    1948:	d2858593          	addi	a1,a1,-728 # 866c <unknown.0>
    194c:	00048513          	mv	a0,s1
    1950:	ae1ff0ef          	jal	ra,1430 <__GI_memcpy>
    1954:	01600913          	li	s2,22
    1958:	01c0006f          	j	1974 <.L6>

0000195c <.L5>:
    195c:	00079463          	bnez	a5,1964 <.L4>
    1960:	fff90913          	addi	s2,s2,-1

00001964 <.L4>:
    1964:	00148493          	addi	s1,s1,1

00001968 <.L2>:
    1968:	0004c783          	lbu	a5,0(s1)
    196c:	fe0918e3          	bnez	s2,195c <.L5>
    1970:	fa078ae3          	beqz	a5,1924 <.L3>

00001974 <.L6>:
    1974:	00048513          	mv	a0,s1
    1978:	e09ff0ef          	jal	ra,1780 <__GI_strlen>
    197c:	00050a13          	mv	s4,a0
    1980:	00150613          	addi	a2,a0,1
    1984:	04041663          	bnez	s0,19d0 <.L7>
    1988:	08060263          	beqz	a2,1a0c <.L9>

0000198c <.L8>:
    198c:	02200913          	li	s2,34

00001990 <.L11>:
    1990:	00006797          	auipc	a5,0x6
    1994:	a447a783          	lw	a5,-1468(a5) # 73d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    1998:	0127a023          	sw	s2,0(a5)

0000199c <.L1>:
    199c:	05c12083          	lw	ra,92(sp)
    19a0:	05812403          	lw	s0,88(sp)
    19a4:	05412483          	lw	s1,84(sp)
    19a8:	04c12983          	lw	s3,76(sp)
    19ac:	04812a03          	lw	s4,72(sp)
    19b0:	00090513          	mv	a0,s2
    19b4:	05012903          	lw	s2,80(sp)
    19b8:	06010113          	addi	sp,sp,96
    19bc:	00008067          	ret

000019c0 <.L13>:
    19c0:	00050913          	mv	s2,a0
    19c4:	00006497          	auipc	s1,0x6
    19c8:	b0848493          	addi	s1,s1,-1272 # 74cc <_string_syserrmsgs>
    19cc:	f9dff06f          	j	1968 <.L2>

000019d0 <.L7>:
    19d0:	02c9f263          	bgeu	s3,a2,19f4 <.L10>
    19d4:	fa098ce3          	beqz	s3,198c <.L8>
    19d8:	00040513          	mv	a0,s0
    19dc:	00098613          	mv	a2,s3
    19e0:	00048593          	mv	a1,s1
    19e4:	01340433          	add	s0,s0,s3
    19e8:	a49ff0ef          	jal	ra,1430 <__GI_memcpy>
    19ec:	fe040fa3          	sb	zero,-1(s0)
    19f0:	f9dff06f          	j	198c <.L8>

000019f4 <.L10>:
    19f4:	00060c63          	beqz	a2,1a0c <.L9>
    19f8:	00040513          	mv	a0,s0
    19fc:	00048593          	mv	a1,s1
    1a00:	01440433          	add	s0,s0,s4
    1a04:	a2dff0ef          	jal	ra,1430 <__GI_memcpy>
    1a08:	00040023          	sb	zero,0(s0)

00001a0c <.L9>:
    1a0c:	f80908e3          	beqz	s2,199c <.L1>
    1a10:	01600913          	li	s2,22
    1a14:	f7dff06f          	j	1990 <.L11>

00001a18 <__GI_isatty>:
    1a18:	fb010113          	addi	sp,sp,-80
    1a1c:	00410593          	addi	a1,sp,4
    1a20:	04112623          	sw	ra,76(sp)
    1a24:	014000ef          	jal	ra,1a38 <__GI_tcgetattr>
    1a28:	04c12083          	lw	ra,76(sp)
    1a2c:	00153513          	seqz	a0,a0
    1a30:	05010113          	addi	sp,sp,80
    1a34:	00008067          	ret

00001a38 <__GI_tcgetattr>:
    1a38:	fc010113          	addi	sp,sp,-64
    1a3c:	02812c23          	sw	s0,56(sp)
    1a40:	00058413          	mv	s0,a1
    1a44:	000055b7          	lui	a1,0x5
    1a48:	00c10613          	addi	a2,sp,12
    1a4c:	40158593          	addi	a1,a1,1025 # 5401 <.L35+0xd>
    1a50:	02912a23          	sw	s1,52(sp)
    1a54:	02112e23          	sw	ra,60(sp)
    1a58:	350000ef          	jal	ra,1da8 <__GI_ioctl>
    1a5c:	00050493          	mv	s1,a0
    1a60:	04051463          	bnez	a0,1aa8 <.L1>
    1a64:	00c12783          	lw	a5,12(sp)
    1a68:	01300613          	li	a2,19
    1a6c:	01d10593          	addi	a1,sp,29
    1a70:	00f42023          	sw	a5,0(s0)
    1a74:	01012783          	lw	a5,16(sp)
    1a78:	01140513          	addi	a0,s0,17
    1a7c:	00f42223          	sw	a5,4(s0)
    1a80:	01412783          	lw	a5,20(sp)
    1a84:	00f42423          	sw	a5,8(s0)
    1a88:	01812783          	lw	a5,24(sp)
    1a8c:	00f42623          	sw	a5,12(s0)
    1a90:	01c14783          	lbu	a5,28(sp)
    1a94:	00f40823          	sb	a5,16(s0)
    1a98:	5a8010ef          	jal	ra,3040 <__GI_mempcpy>
    1a9c:	00d00613          	li	a2,13
    1aa0:	00000593          	li	a1,0
    1aa4:	c35ff0ef          	jal	ra,16d8 <__GI_memset>

00001aa8 <.L1>:
    1aa8:	03c12083          	lw	ra,60(sp)
    1aac:	03812403          	lw	s0,56(sp)
    1ab0:	00048513          	mv	a0,s1
    1ab4:	03412483          	lw	s1,52(sp)
    1ab8:	04010113          	addi	sp,sp,64
    1abc:	00008067          	ret

00001ac0 <__uClibc_init>:
    1ac0:	00009797          	auipc	a5,0x9
    1ac4:	ce878793          	addi	a5,a5,-792 # a7a8 <__pagesize>
    1ac8:	0007a703          	lw	a4,0(a5)
    1acc:	02071063          	bnez	a4,1aec <.L1>
    1ad0:	00002737          	lui	a4,0x2
    1ad4:	00e7a023          	sw	a4,0(a5)
    1ad8:	00006717          	auipc	a4,0x6
    1adc:	93472703          	lw	a4,-1740(a4) # 740c <_GLOBAL_OFFSET_TABLE_+0x44>
    1ae0:	00070793          	mv	a5,a4
    1ae4:	00078463          	beqz	a5,1aec <.L1>
    1ae8:	00070067          	jr	a4

00001aec <.L1>:
    1aec:	00008067          	ret

00001af0 <__uClibc_fini>:
    1af0:	ff010113          	addi	sp,sp,-16
    1af4:	00812423          	sw	s0,8(sp)
    1af8:	00912223          	sw	s1,4(sp)
    1afc:	00007417          	auipc	s0,0x7
    1b00:	c8040413          	addi	s0,s0,-896 # 877c <__TMC_END__>
    1b04:	00007497          	auipc	s1,0x7
    1b08:	c7448493          	addi	s1,s1,-908 # 8778 <__do_global_dtors_aux_fini_array_entry>
    1b0c:	40940433          	sub	s0,s0,s1
    1b10:	40245413          	srai	s0,s0,0x2
    1b14:	01212023          	sw	s2,0(sp)
    1b18:	00112623          	sw	ra,12(sp)
    1b1c:	fff40413          	addi	s0,s0,-1
    1b20:	fff00913          	li	s2,-1

00001b24 <.L9>:
    1b24:	03241c63          	bne	s0,s2,1b5c <.L10>
    1b28:	00009417          	auipc	s0,0x9
    1b2c:	c8040413          	addi	s0,s0,-896 # a7a8 <__pagesize>
    1b30:	00442783          	lw	a5,4(s0)
    1b34:	00078463          	beqz	a5,1b3c <.L11>
    1b38:	000780e7          	jalr	a5

00001b3c <.L11>:
    1b3c:	00842783          	lw	a5,8(s0)
    1b40:	02078a63          	beqz	a5,1b74 <.L8>
    1b44:	00812403          	lw	s0,8(sp)
    1b48:	00c12083          	lw	ra,12(sp)
    1b4c:	00412483          	lw	s1,4(sp)
    1b50:	00012903          	lw	s2,0(sp)
    1b54:	01010113          	addi	sp,sp,16
    1b58:	00078067          	jr	a5

00001b5c <.L10>:
    1b5c:	00241793          	slli	a5,s0,0x2
    1b60:	00f487b3          	add	a5,s1,a5
    1b64:	0007a783          	lw	a5,0(a5)
    1b68:	fff40413          	addi	s0,s0,-1
    1b6c:	000780e7          	jalr	a5
    1b70:	fb5ff06f          	j	1b24 <.L9>

00001b74 <.L8>:
    1b74:	00c12083          	lw	ra,12(sp)
    1b78:	00812403          	lw	s0,8(sp)
    1b7c:	00412483          	lw	s1,4(sp)
    1b80:	00012903          	lw	s2,0(sp)
    1b84:	01010113          	addi	sp,sp,16
    1b88:	00008067          	ret

00001b8c <__uClibc_main>:
    1b8c:	f5010113          	addi	sp,sp,-176
    1b90:	0a812423          	sw	s0,168(sp)
    1b94:	0b212023          	sw	s2,160(sp)
    1b98:	09312e23          	sw	s3,156(sp)
    1b9c:	09412c23          	sw	s4,152(sp)
    1ba0:	09512a23          	sw	s5,148(sp)
    1ba4:	09612823          	sw	s6,144(sp)
    1ba8:	09712623          	sw	s7,140(sp)
    1bac:	0a112623          	sw	ra,172(sp)
    1bb0:	0a912223          	sw	s1,164(sp)
    1bb4:	09812423          	sw	s8,136(sp)
    1bb8:	09912223          	sw	s9,132(sp)
    1bbc:	09a12023          	sw	s10,128(sp)
    1bc0:	00070a93          	mv	s5,a4
    1bc4:	00009b17          	auipc	s6,0x9
    1bc8:	be4b0b13          	addi	s6,s6,-1052 # a7a8 <__pagesize>
    1bcc:	00006717          	auipc	a4,0x6
    1bd0:	80472703          	lw	a4,-2044(a4) # 73d0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1bd4:	01072023          	sw	a6,0(a4)
    1bd8:	00fb2423          	sw	a5,8(s6)
    1bdc:	00158793          	addi	a5,a1,1
    1be0:	00068993          	mv	s3,a3
    1be4:	00279793          	slli	a5,a5,0x2
    1be8:	00062683          	lw	a3,0(a2)
    1bec:	00f60733          	add	a4,a2,a5
    1bf0:	00005b97          	auipc	s7,0x5
    1bf4:	7e8bab83          	lw	s7,2024(s7) # 73d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    1bf8:	00eba023          	sw	a4,0(s7)
    1bfc:	00050a13          	mv	s4,a0
    1c00:	00058913          	mv	s2,a1
    1c04:	00060413          	mv	s0,a2
    1c08:	00d71863          	bne	a4,a3,1c18 <.L18>
    1c0c:	ffc78793          	addi	a5,a5,-4
    1c10:	00f607b3          	add	a5,a2,a5
    1c14:	00fba023          	sw	a5,0(s7)

00001c18 <.L18>:
    1c18:	00810c93          	addi	s9,sp,8
    1c1c:	07800613          	li	a2,120
    1c20:	00000593          	li	a1,0
    1c24:	000c8513          	mv	a0,s9
    1c28:	ab1ff0ef          	jal	ra,16d8 <__GI_memset>
    1c2c:	000bac03          	lw	s8,0(s7)

00001c30 <.L19>:
    1c30:	000c2783          	lw	a5,0(s8)
    1c34:	004c0c13          	addi	s8,s8,4
    1c38:	fe079ce3          	bnez	a5,1c30 <.L19>
    1c3c:	00e00d13          	li	s10,14

00001c40 <.L20>:
    1c40:	000c2483          	lw	s1,0(s8)
    1c44:	0c049a63          	bnez	s1,1d18 <.L22>
    1c48:	000c8513          	mv	a0,s9
    1c4c:	120000ef          	jal	ra,1d6c <_dl_aux_init>
    1c50:	e71ff0ef          	jal	ra,1ac0 <__uClibc_init>
    1c54:	00042783          	lw	a5,0(s0)
    1c58:	00007717          	auipc	a4,0x7
    1c5c:	b0f72223          	sw	a5,-1276(a4) # 875c <__uclibc_progname>
    1c60:	02078a63          	beqz	a5,1c94 <.L23>
    1c64:	00005717          	auipc	a4,0x5
    1c68:	7b472703          	lw	a4,1972(a4) # 7418 <_GLOBAL_OFFSET_TABLE_+0x50>
    1c6c:	00f72023          	sw	a5,0(a4)
    1c70:	00042503          	lw	a0,0(s0)
    1c74:	02f00593          	li	a1,47
    1c78:	4cc010ef          	jal	ra,3144 <__GI_strrchr>
    1c7c:	00005797          	auipc	a5,0x5
    1c80:	7707a783          	lw	a5,1904(a5) # 73ec <_GLOBAL_OFFSET_TABLE_+0x24>
    1c84:	00a7a023          	sw	a0,0(a5)
    1c88:	0a050863          	beqz	a0,1d38 <.L24>
    1c8c:	00150513          	addi	a0,a0,1
    1c90:	00a7a023          	sw	a0,0(a5)

00001c94 <.L23>:
    1c94:	015b2223          	sw	s5,4(s6)
    1c98:	00007a97          	auipc	s5,0x7
    1c9c:	ad8a8a93          	addi	s5,s5,-1320 # 8770 <__preinit_array_start>
    1ca0:	00007b17          	auipc	s6,0x7
    1ca4:	ad4b0b13          	addi	s6,s6,-1324 # 8774 <__frame_dummy_init_array_entry>
    1ca8:	415b0b33          	sub	s6,s6,s5
    1cac:	402b5b13          	srai	s6,s6,0x2
    1cb0:	00000c13          	li	s8,0

00001cb4 <.L25>:
    1cb4:	096c1863          	bne	s8,s6,1d44 <.L26>
    1cb8:	00098463          	beqz	s3,1cc0 <.L27>
    1cbc:	000980e7          	jalr	s3

00001cc0 <.L27>:
    1cc0:	00007997          	auipc	s3,0x7
    1cc4:	ab498993          	addi	s3,s3,-1356 # 8774 <__frame_dummy_init_array_entry>
    1cc8:	00007a97          	auipc	s5,0x7
    1ccc:	ab0a8a93          	addi	s5,s5,-1360 # 8778 <__do_global_dtors_aux_fini_array_entry>
    1cd0:	413a8ab3          	sub	s5,s5,s3
    1cd4:	402ada93          	srai	s5,s5,0x2

00001cd8 <.L28>:
    1cd8:	09549063          	bne	s1,s5,1d58 <.L29>
    1cdc:	00005797          	auipc	a5,0x5
    1ce0:	72c7a783          	lw	a5,1836(a5) # 7408 <_GLOBAL_OFFSET_TABLE_+0x40>
    1ce4:	00078663          	beqz	a5,1cf0 <.L30>
    1ce8:	110000ef          	jal	ra,1df8 <__errno_location>
    1cec:	00052023          	sw	zero,0(a0)

00001cf0 <.L30>:
    1cf0:	00005797          	auipc	a5,0x5
    1cf4:	7087a783          	lw	a5,1800(a5) # 73f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    1cf8:	00078663          	beqz	a5,1d04 <.L31>
    1cfc:	108000ef          	jal	ra,1e04 <__h_errno_location>
    1d00:	00052023          	sw	zero,0(a0)

00001d04 <.L31>:
    1d04:	000ba603          	lw	a2,0(s7)
    1d08:	00040593          	mv	a1,s0
    1d0c:	00090513          	mv	a0,s2
    1d10:	000a00e7          	jalr	s4
    1d14:	49c010ef          	jal	ra,31b0 <__GI_exit>

00001d18 <.L22>:
    1d18:	009d6c63          	bltu	s10,s1,1d30 <.L21>
    1d1c:	00349513          	slli	a0,s1,0x3
    1d20:	00800613          	li	a2,8
    1d24:	000c0593          	mv	a1,s8
    1d28:	00ac8533          	add	a0,s9,a0
    1d2c:	f04ff0ef          	jal	ra,1430 <__GI_memcpy>

00001d30 <.L21>:
    1d30:	008c0c13          	addi	s8,s8,8
    1d34:	f0dff06f          	j	1c40 <.L20>

00001d38 <.L24>:
    1d38:	00042703          	lw	a4,0(s0)
    1d3c:	00e7a023          	sw	a4,0(a5)
    1d40:	f55ff06f          	j	1c94 <.L23>

00001d44 <.L26>:
    1d44:	000aa783          	lw	a5,0(s5)
    1d48:	001c0c13          	addi	s8,s8,1
    1d4c:	004a8a93          	addi	s5,s5,4
    1d50:	000780e7          	jalr	a5
    1d54:	f61ff06f          	j	1cb4 <.L25>

00001d58 <.L29>:
    1d58:	0009a783          	lw	a5,0(s3)
    1d5c:	00148493          	addi	s1,s1,1
    1d60:	00498993          	addi	s3,s3,4
    1d64:	000780e7          	jalr	a5
    1d68:	f71ff06f          	j	1cd8 <.L28>

00001d6c <_dl_aux_init>:
    1d6c:	01c52703          	lw	a4,28(a0)
    1d70:	00005797          	auipc	a5,0x5
    1d74:	6807a783          	lw	a5,1664(a5) # 73f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    1d78:	00e7a023          	sw	a4,0(a5)
    1d7c:	02c52703          	lw	a4,44(a0)
    1d80:	00005797          	auipc	a5,0x5
    1d84:	6847a783          	lw	a5,1668(a5) # 7404 <_GLOBAL_OFFSET_TABLE_+0x3c>
    1d88:	00e7a023          	sw	a4,0(a5)
    1d8c:	03452783          	lw	a5,52(a0)
    1d90:	00079463          	bnez	a5,1d98 <.L2>
    1d94:	000027b7          	lui	a5,0x2

00001d98 <.L2>:
    1d98:	00005717          	auipc	a4,0x5
    1d9c:	67c72703          	lw	a4,1660(a4) # 7414 <_GLOBAL_OFFSET_TABLE_+0x4c>
    1da0:	00f72023          	sw	a5,0(a4)
    1da4:	00008067          	ret

00001da8 <__GI_ioctl>:
    1da8:	fd010113          	addi	sp,sp,-48
    1dac:	02f12223          	sw	a5,36(sp)
    1db0:	01810793          	addi	a5,sp,24
    1db4:	03112623          	sw	a7,44(sp)
    1db8:	00c12c23          	sw	a2,24(sp)
    1dbc:	00d12e23          	sw	a3,28(sp)
    1dc0:	02e12023          	sw	a4,32(sp)
    1dc4:	03012423          	sw	a6,40(sp)
    1dc8:	00f12623          	sw	a5,12(sp)
    1dcc:	01d00893          	li	a7,29
    1dd0:	00000073          	ecall
    1dd4:	fffff7b7          	lui	a5,0xfffff
    1dd8:	00a7fc63          	bgeu	a5,a0,1df0 <.L1>
    1ddc:	40a00533          	neg	a0,a0
    1de0:	00005797          	auipc	a5,0x5
    1de4:	5f47a783          	lw	a5,1524(a5) # 73d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    1de8:	00a7a023          	sw	a0,0(a5)
    1dec:	fff00513          	li	a0,-1

00001df0 <.L1>:
    1df0:	03010113          	addi	sp,sp,48
    1df4:	00008067          	ret

00001df8 <__errno_location>:
    1df8:	00005517          	auipc	a0,0x5
    1dfc:	5dc52503          	lw	a0,1500(a0) # 73d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    1e00:	00008067          	ret

00001e04 <__h_errno_location>:
    1e04:	00005517          	auipc	a0,0x5
    1e08:	5d852503          	lw	a0,1496(a0) # 73dc <_GLOBAL_OFFSET_TABLE_+0x14>
    1e0c:	00008067          	ret

00001e10 <__stdio_WRITE>:
    1e10:	fd010113          	addi	sp,sp,-48
    1e14:	01412c23          	sw	s4,24(sp)
    1e18:	80000a37          	lui	s4,0x80000
    1e1c:	02812423          	sw	s0,40(sp)
    1e20:	02912223          	sw	s1,36(sp)
    1e24:	03212023          	sw	s2,32(sp)
    1e28:	01312e23          	sw	s3,28(sp)
    1e2c:	01512a23          	sw	s5,20(sp)
    1e30:	01612823          	sw	s6,16(sp)
    1e34:	01712623          	sw	s7,12(sp)
    1e38:	02112623          	sw	ra,44(sp)
    1e3c:	00050493          	mv	s1,a0
    1e40:	00058413          	mv	s0,a1
    1e44:	00060993          	mv	s3,a2
    1e48:	00060913          	mv	s2,a2
    1e4c:	fffa4a13          	not	s4,s4
    1e50:	ffe00b13          	li	s6,-2
    1e54:	00005a97          	auipc	s5,0x5
    1e58:	580aaa83          	lw	s5,1408(s5) # 73d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    1e5c:	00b00b93          	li	s7,11

00001e60 <.L2>:
    1e60:	04090a63          	beqz	s2,1eb4 <.L10>
    1e64:	000a0613          	mv	a2,s4
    1e68:	00094463          	bltz	s2,1e70 <.L3>
    1e6c:	00090613          	mv	a2,s2

00001e70 <.L3>:
    1e70:	0044a503          	lw	a0,4(s1)
    1e74:	09651a63          	bne	a0,s6,1f08 <.L4>
    1e78:	02c4a783          	lw	a5,44(s1)
    1e7c:	06079463          	bnez	a5,1ee4 <.L5>
    1e80:	01600793          	li	a5,22
    1e84:	00faa023          	sw	a5,0(s5)

00001e88 <.L6>:
    1e88:	0004d783          	lhu	a5,0(s1)
    1e8c:	00400713          	li	a4,4
    1e90:	0087e793          	ori	a5,a5,8
    1e94:	00f49023          	sh	a5,0(s1)
    1e98:	00005797          	auipc	a5,0x5
    1e9c:	53c7a783          	lw	a5,1340(a5) # 73d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    1ea0:	0007a783          	lw	a5,0(a5)
    1ea4:	06e78863          	beq	a5,a4,1f14 <.L9>
    1ea8:	00b00713          	li	a4,11
    1eac:	06e78463          	beq	a5,a4,1f14 <.L9>

00001eb0 <.L11>:
    1eb0:	412989b3          	sub	s3,s3,s2

00001eb4 <.L10>:
    1eb4:	02c12083          	lw	ra,44(sp)
    1eb8:	02812403          	lw	s0,40(sp)
    1ebc:	02412483          	lw	s1,36(sp)
    1ec0:	02012903          	lw	s2,32(sp)
    1ec4:	01812a03          	lw	s4,24(sp)
    1ec8:	01412a83          	lw	s5,20(sp)
    1ecc:	01012b03          	lw	s6,16(sp)
    1ed0:	00c12b83          	lw	s7,12(sp)
    1ed4:	00098513          	mv	a0,s3
    1ed8:	01c12983          	lw	s3,28(sp)
    1edc:	03010113          	addi	sp,sp,48
    1ee0:	00008067          	ret

00001ee4 <.L5>:
    1ee4:	0244a503          	lw	a0,36(s1)
    1ee8:	017aa023          	sw	s7,0(s5)
    1eec:	00040593          	mv	a1,s0
    1ef0:	000780e7          	jalr	a5
    1ef4:	f8050ae3          	beqz	a0,1e88 <.L6>

00001ef8 <.L7>:
    1ef8:	f80548e3          	bltz	a0,1e88 <.L6>
    1efc:	40a90933          	sub	s2,s2,a0
    1f00:	00a40433          	add	s0,s0,a0
    1f04:	f5dff06f          	j	1e60 <.L2>

00001f08 <.L4>:
    1f08:	00040593          	mv	a1,s0
    1f0c:	314010ef          	jal	ra,3220 <__GI_write>
    1f10:	fe9ff06f          	j	1ef8 <.L7>

00001f14 <.L9>:
    1f14:	0084a783          	lw	a5,8(s1)
    1f18:	00c4a683          	lw	a3,12(s1)
    1f1c:	40f68733          	sub	a4,a3,a5
    1f20:	f8f688e3          	beq	a3,a5,1eb0 <.L11>
    1f24:	00e97463          	bgeu	s2,a4,1f2c <.L12>
    1f28:	00090713          	mv	a4,s2

00001f2c <.L12>:
    1f2c:	00a00613          	li	a2,10
    1f30:	00e40733          	add	a4,s0,a4

00001f34 <.L15>:
    1f34:	00044683          	lbu	a3,0(s0)
    1f38:	00d78023          	sb	a3,0(a5)
    1f3c:	00c69863          	bne	a3,a2,1f4c <.L13>
    1f40:	0004d683          	lhu	a3,0(s1)
    1f44:	1006f693          	andi	a3,a3,256
    1f48:	00069863          	bnez	a3,1f58 <.L14>

00001f4c <.L13>:
    1f4c:	00140413          	addi	s0,s0,1
    1f50:	00178793          	addi	a5,a5,1
    1f54:	fee410e3          	bne	s0,a4,1f34 <.L15>

00001f58 <.L14>:
    1f58:	0084a703          	lw	a4,8(s1)
    1f5c:	00f4a823          	sw	a5,16(s1)
    1f60:	40e787b3          	sub	a5,a5,a4
    1f64:	40f90933          	sub	s2,s2,a5
    1f68:	f49ff06f          	j	1eb0 <.L11>

00001f6c <__stdio_fwrite>:
    1f6c:	00065783          	lhu	a5,0(a2)
    1f70:	fe010113          	addi	sp,sp,-32
    1f74:	00812c23          	sw	s0,24(sp)
    1f78:	00912a23          	sw	s1,20(sp)
    1f7c:	01212823          	sw	s2,16(sp)
    1f80:	00112e23          	sw	ra,28(sp)
    1f84:	01312623          	sw	s3,12(sp)
    1f88:	2007f793          	andi	a5,a5,512
    1f8c:	00050913          	mv	s2,a0
    1f90:	00058413          	mv	s0,a1
    1f94:	00060493          	mv	s1,a2
    1f98:	02078663          	beqz	a5,1fc4 <.L2>

00001f9c <.L11>:
    1f9c:	00040613          	mv	a2,s0
    1fa0:	01812403          	lw	s0,24(sp)
    1fa4:	01c12083          	lw	ra,28(sp)
    1fa8:	00c12983          	lw	s3,12(sp)
    1fac:	00090593          	mv	a1,s2
    1fb0:	00048513          	mv	a0,s1
    1fb4:	01012903          	lw	s2,16(sp)
    1fb8:	01412483          	lw	s1,20(sp)
    1fbc:	02010113          	addi	sp,sp,32
    1fc0:	e51ff06f          	j	1e10 <__stdio_WRITE>

00001fc4 <.L2>:
    1fc4:	01062503          	lw	a0,16(a2)
    1fc8:	00c62783          	lw	a5,12(a2)
    1fcc:	00462683          	lw	a3,4(a2)
    1fd0:	ffd00713          	li	a4,-3
    1fd4:	40a787b3          	sub	a5,a5,a0
    1fd8:	04e69463          	bne	a3,a4,2020 <.L3>
    1fdc:	00058993          	mv	s3,a1
    1fe0:	00b7f463          	bgeu	a5,a1,1fe8 <.L4>
    1fe4:	00078993          	mv	s3,a5

00001fe8 <.L4>:
    1fe8:	00098613          	mv	a2,s3
    1fec:	00090593          	mv	a1,s2
    1ff0:	c40ff0ef          	jal	ra,1430 <__GI_memcpy>
    1ff4:	0104a783          	lw	a5,16(s1)
    1ff8:	013787b3          	add	a5,a5,s3

00001ffc <.L25>:
    1ffc:	00f4a823          	sw	a5,16(s1)

00002000 <.L5>:
    2000:	01c12083          	lw	ra,28(sp)
    2004:	00040513          	mv	a0,s0
    2008:	01812403          	lw	s0,24(sp)
    200c:	01412483          	lw	s1,20(sp)
    2010:	01012903          	lw	s2,16(sp)
    2014:	00c12983          	lw	s3,12(sp)
    2018:	02010113          	addi	sp,sp,32
    201c:	00008067          	ret

00002020 <.L3>:
    2020:	08b7e063          	bltu	a5,a1,20a0 <.L6>
    2024:	00058613          	mv	a2,a1
    2028:	00090593          	mv	a1,s2
    202c:	c04ff0ef          	jal	ra,1430 <__GI_memcpy>
    2030:	0104a783          	lw	a5,16(s1)
    2034:	008787b3          	add	a5,a5,s0
    2038:	00f4a823          	sw	a5,16(s1)
    203c:	0004d783          	lhu	a5,0(s1)
    2040:	1007f793          	andi	a5,a5,256
    2044:	fa078ee3          	beqz	a5,2000 <.L5>
    2048:	00040613          	mv	a2,s0
    204c:	00a00593          	li	a1,10
    2050:	00090513          	mv	a0,s2
    2054:	020010ef          	jal	ra,3074 <__GI_memrchr>
    2058:	fa0504e3          	beqz	a0,2000 <.L5>
    205c:	00048513          	mv	a0,s1
    2060:	9ecfe0ef          	jal	ra,24c <__stdio_wcommit>
    2064:	f8050ee3          	beqz	a0,2000 <.L5>
    2068:	00040613          	mv	a2,s0
    206c:	00857463          	bgeu	a0,s0,2074 <.L10>
    2070:	00050613          	mv	a2,a0

00002074 <.L10>:
    2074:	40c40533          	sub	a0,s0,a2
    2078:	00a00593          	li	a1,10
    207c:	00a90533          	add	a0,s2,a0
    2080:	6f9000ef          	jal	ra,2f78 <__GI_memchr>
    2084:	f6050ee3          	beqz	a0,2000 <.L5>
    2088:	0104a783          	lw	a5,16(s1)
    208c:	00890933          	add	s2,s2,s0
    2090:	40a90533          	sub	a0,s2,a0
    2094:	40a40433          	sub	s0,s0,a0
    2098:	40a787b3          	sub	a5,a5,a0
    209c:	f61ff06f          	j	1ffc <.L25>

000020a0 <.L6>:
    20a0:	00862783          	lw	a5,8(a2)
    20a4:	eea78ce3          	beq	a5,a0,1f9c <.L11>
    20a8:	00060513          	mv	a0,a2
    20ac:	9a0fe0ef          	jal	ra,24c <__stdio_wcommit>
    20b0:	ee0506e3          	beqz	a0,1f9c <.L11>
    20b4:	00000413          	li	s0,0
    20b8:	f49ff06f          	j	2000 <.L5>

000020bc <__stdio_trans2w>:
    20bc:	00055603          	lhu	a2,0(a0)
    20c0:	ff010113          	addi	sp,sp,-16
    20c4:	00812423          	sw	s0,8(sp)
    20c8:	00112623          	sw	ra,12(sp)
    20cc:	02067793          	andi	a5,a2,32
    20d0:	00050413          	mv	s0,a0
    20d4:	02078a63          	beqz	a5,2108 <.L2>
    20d8:	00005797          	auipc	a5,0x5
    20dc:	2fc7a783          	lw	a5,764(a5) # 73d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    20e0:	00900713          	li	a4,9
    20e4:	00e7a023          	sw	a4,0(a5)

000020e8 <.L3>:
    20e8:	00045783          	lhu	a5,0(s0)
    20ec:	fff00513          	li	a0,-1
    20f0:	0087e793          	ori	a5,a5,8
    20f4:	00f41023          	sh	a5,0(s0)

000020f8 <.L1>:
    20f8:	00c12083          	lw	ra,12(sp)
    20fc:	00812403          	lw	s0,8(sp)
    2100:	01010113          	addi	sp,sp,16
    2104:	00008067          	ret

00002108 <.L2>:
    2108:	00367793          	andi	a5,a2,3
    210c:	02078463          	beqz	a5,2134 <.L5>
    2110:	00467793          	andi	a5,a2,4
    2114:	02078e63          	beqz	a5,2150 <.L6>

00002118 <.L8>:
    2118:	00045783          	lhu	a5,0(s0)
    211c:	ffc7f793          	andi	a5,a5,-4
    2120:	00f41023          	sh	a5,0(s0)
    2124:	00842783          	lw	a5,8(s0)
    2128:	00f42c23          	sw	a5,24(s0)
    212c:	00f42823          	sw	a5,16(s0)
    2130:	00f42a23          	sw	a5,20(s0)

00002134 <.L5>:
    2134:	00045783          	lhu	a5,0(s0)
    2138:	0407e713          	ori	a4,a5,64
    213c:	00e41023          	sh	a4,0(s0)
    2140:	3007f793          	andi	a5,a5,768
    2144:	04078063          	beqz	a5,2184 <.L10>

00002148 <.L11>:
    2148:	00000513          	li	a0,0
    214c:	fadff06f          	j	20f8 <.L1>

00002150 <.L6>:
    2150:	01452703          	lw	a4,20(a0)
    2154:	01052783          	lw	a5,16(a0)
    2158:	00f71663          	bne	a4,a5,2164 <.L7>
    215c:	00267793          	andi	a5,a2,2
    2160:	fa078ce3          	beqz	a5,2118 <.L8>

00002164 <.L7>:
    2164:	40067613          	andi	a2,a2,1024
    2168:	00c03633          	snez	a2,a2
    216c:	00160613          	addi	a2,a2,1
    2170:	00000593          	li	a1,0
    2174:	00040513          	mv	a0,s0
    2178:	0d0010ef          	jal	ra,3248 <__GI_fseek>
    217c:	f8050ee3          	beqz	a0,2118 <.L8>
    2180:	f69ff06f          	j	20e8 <.L3>

00002184 <.L10>:
    2184:	00c42783          	lw	a5,12(s0)
    2188:	00f42e23          	sw	a5,28(s0)
    218c:	fbdff06f          	j	2148 <.L11>

00002190 <_load_inttype>:
    2190:	00001737          	lui	a4,0x1
    2194:	80070713          	addi	a4,a4,-2048 # 800 <.L81+0x20>
    2198:	00050793          	mv	a5,a0
    219c:	00e57733          	and	a4,a0,a4
    21a0:	0005a503          	lw	a0,0(a1)
    21a4:	02064c63          	bltz	a2,21dc <.L2>
    21a8:	00070663          	beqz	a4,21b4 <.L3>

000021ac <.L10>:
    21ac:	0045a583          	lw	a1,4(a1)
    21b0:	00008067          	ret

000021b4 <.L3>:
    21b4:	10000713          	li	a4,256
    21b8:	00e79863          	bne	a5,a4,21c8 <.L5>
    21bc:	0ff57513          	zext.b	a0,a0

000021c0 <.L6>:
    21c0:	00000593          	li	a1,0
    21c4:	00008067          	ret

000021c8 <.L5>:
    21c8:	20000713          	li	a4,512
    21cc:	fee79ae3          	bne	a5,a4,21c0 <.L6>
    21d0:	01051513          	slli	a0,a0,0x10
    21d4:	01055513          	srli	a0,a0,0x10
    21d8:	fe9ff06f          	j	21c0 <.L6>

000021dc <.L2>:
    21dc:	fc0718e3          	bnez	a4,21ac <.L10>
    21e0:	10000713          	li	a4,256
    21e4:	00e79a63          	bne	a5,a4,21f8 <.L8>
    21e8:	01851513          	slli	a0,a0,0x18
    21ec:	41855513          	srai	a0,a0,0x18

000021f0 <.L9>:
    21f0:	41f55593          	srai	a1,a0,0x1f
    21f4:	00008067          	ret

000021f8 <.L8>:
    21f8:	20000713          	li	a4,512
    21fc:	fee79ae3          	bne	a5,a4,21f0 <.L9>
    2200:	01051513          	slli	a0,a0,0x10
    2204:	41055513          	srai	a0,a0,0x10
    2208:	fe9ff06f          	j	21f0 <.L9>

0000220c <_store_inttype>:
    220c:	10000793          	li	a5,256
    2210:	00f59663          	bne	a1,a5,221c <.L2>
    2214:	00c50023          	sb	a2,0(a0)
    2218:	00008067          	ret

0000221c <.L2>:
    221c:	80058793          	addi	a5,a1,-2048
    2220:	00079863          	bnez	a5,2230 <.L4>
    2224:	00c52023          	sw	a2,0(a0)
    2228:	00d52223          	sw	a3,4(a0)
    222c:	00008067          	ret

00002230 <.L4>:
    2230:	20000793          	li	a5,512
    2234:	00f59663          	bne	a1,a5,2240 <.L5>
    2238:	00c51023          	sh	a2,0(a0)
    223c:	00008067          	ret

00002240 <.L5>:
    2240:	00c52023          	sw	a2,0(a0)
    2244:	00008067          	ret

00002248 <_uintmaxtostr>:
    2248:	00050893          	mv	a7,a0
    224c:	00000e13          	li	t3,0
    2250:	0206d063          	bgez	a3,2270 <.L2>
    2254:	40d006b3          	neg	a3,a3
    2258:	00065c63          	bgez	a2,2270 <.L2>
    225c:	00b037b3          	snez	a5,a1
    2260:	40c00633          	neg	a2,a2
    2264:	40f60633          	sub	a2,a2,a5
    2268:	40b005b3          	neg	a1,a1
    226c:	00100e13          	li	t3,1

00002270 <.L2>:
    2270:	fff00813          	li	a6,-1
    2274:	02d85333          	divu	t1,a6,a3
    2278:	00088023          	sb	zero,0(a7)
    227c:	02d87833          	remu	a6,a6,a3
    2280:	00180813          	addi	a6,a6,1
    2284:	01069663          	bne	a3,a6,2290 <.L4>
    2288:	00130313          	addi	t1,t1,1
    228c:	00000813          	li	a6,0

00002290 <.L4>:
    2290:	00900e93          	li	t4,9

00002294 <.L8>:
    2294:	02d5f533          	remu	a0,a1,a3
    2298:	02d5d5b3          	divu	a1,a1,a3
    229c:	02060463          	beqz	a2,22c4 <.L5>
    22a0:	02d677b3          	remu	a5,a2,a3
    22a4:	02f80f33          	mul	t5,a6,a5
    22a8:	02f307b3          	mul	a5,t1,a5
    22ac:	00af0533          	add	a0,t5,a0
    22b0:	00b785b3          	add	a1,a5,a1
    22b4:	02d557b3          	divu	a5,a0,a3
    22b8:	02d65633          	divu	a2,a2,a3
    22bc:	00f585b3          	add	a1,a1,a5
    22c0:	02d57533          	remu	a0,a0,a3

000022c4 <.L5>:
    22c4:	0ff57793          	zext.b	a5,a0
    22c8:	02aeec63          	bltu	t4,a0,2300 <.L6>
    22cc:	03078793          	addi	a5,a5,48

000022d0 <.L19>:
    22d0:	0ff7f793          	zext.b	a5,a5
    22d4:	fef88fa3          	sb	a5,-1(a7)
    22d8:	00b667b3          	or	a5,a2,a1
    22dc:	fff88513          	addi	a0,a7,-1
    22e0:	00079c63          	bnez	a5,22f8 <.L12>
    22e4:	000e0863          	beqz	t3,22f4 <.L1>
    22e8:	02d00793          	li	a5,45
    22ec:	fef50fa3          	sb	a5,-1(a0)
    22f0:	ffe88513          	addi	a0,a7,-2

000022f4 <.L1>:
    22f4:	00008067          	ret

000022f8 <.L12>:
    22f8:	00050893          	mv	a7,a0
    22fc:	f99ff06f          	j	2294 <.L8>

00002300 <.L6>:
    2300:	00e787b3          	add	a5,a5,a4
    2304:	fcdff06f          	j	22d0 <.L19>

00002308 <_fpmaxtostr>:
    2308:	e7010113          	addi	sp,sp,-400
    230c:	00462783          	lw	a5,4(a2)
    2310:	18812423          	sw	s0,392(sp)
    2314:	00864403          	lbu	s0,8(a2)
    2318:	02f12c23          	sw	a5,56(sp)
    231c:	06500793          	li	a5,101
    2320:	18912223          	sw	s1,388(sp)
    2324:	19212023          	sw	s2,384(sp)
    2328:	17312e23          	sw	s3,380(sp)
    232c:	17412c23          	sw	s4,376(sp)
    2330:	17512a23          	sw	s5,372(sp)
    2334:	17612823          	sw	s6,368(sp)
    2338:	17912223          	sw	s9,356(sp)
    233c:	0af10c23          	sb	a5,184(sp)
    2340:	18112623          	sw	ra,396(sp)
    2344:	17712623          	sw	s7,364(sp)
    2348:	17812423          	sw	s8,360(sp)
    234c:	17a12023          	sw	s10,352(sp)
    2350:	15b12e23          	sw	s11,348(sp)
    2354:	04a12823          	sw	a0,80(sp)
    2358:	04d12a23          	sw	a3,84(sp)
    235c:	02046c93          	ori	s9,s0,32
    2360:	06100793          	li	a5,97
    2364:	0005aa03          	lw	s4,0(a1)
    2368:	0045aa83          	lw	s5,4(a1)
    236c:	0085ab03          	lw	s6,8(a1)
    2370:	00c5a903          	lw	s2,12(a1)
    2374:	00062483          	lw	s1,0(a2)
    2378:	00060993          	mv	s3,a2
    237c:	1cfc9e63          	bne	s9,a5,2558 <.L2>
    2380:	07000793          	li	a5,112
    2384:	0af10c23          	sb	a5,184(sp)
    2388:	1e04c063          	bltz	s1,2568 <.L78>

0000238c <.L4>:
    238c:	02012423          	sw	zero,40(sp)

00002390 <.L3>:
    2390:	00c9a783          	lw	a5,12(s3)
    2394:	0a010823          	sb	zero,176(sp)
    2398:	0027f713          	andi	a4,a5,2
    239c:	1c070e63          	beqz	a4,2578 <.L5>
    23a0:	02b00793          	li	a5,43

000023a4 <.L131>:
    23a4:	0af10823          	sb	a5,176(sp)

000023a8 <.L6>:
    23a8:	0a010c13          	addi	s8,sp,160
    23ac:	09010b93          	addi	s7,sp,144
    23b0:	000b8593          	mv	a1,s7
    23b4:	000c0513          	mv	a0,s8
    23b8:	0a0108a3          	sb	zero,177(sp)
    23bc:	10012223          	sw	zero,260(sp)
    23c0:	0b412023          	sw	s4,160(sp)
    23c4:	0b512223          	sw	s5,164(sp)
    23c8:	0b612423          	sw	s6,168(sp)
    23cc:	0b212623          	sw	s2,172(sp)
    23d0:	09412823          	sw	s4,144(sp)
    23d4:	09512a23          	sw	s5,148(sp)
    23d8:	09612c23          	sw	s6,152(sp)
    23dc:	09212e23          	sw	s2,156(sp)
    23e0:	739010ef          	jal	ra,4318 <__eqtf2>
    23e4:	1a050263          	beqz	a0,2588 <.L126>
    23e8:	00800793          	li	a5,8
    23ec:	10f12223          	sw	a5,260(sp)

000023f0 <.L9>:
    23f0:	02000793          	li	a5,32
    23f4:	00f9a823          	sw	a5,16(s3)
    23f8:	07000793          	li	a5,112
    23fc:	0ef12e23          	sw	a5,252(sp)
    2400:	00300793          	li	a5,3
    2404:	10f12023          	sw	a5,256(sp)
    2408:	06000793          	li	a5,96
    240c:	0087e863          	bltu	a5,s0,241c <.L18>
    2410:	10412783          	lw	a5,260(sp)
    2414:	00478793          	addi	a5,a5,4
    2418:	10f12223          	sw	a5,260(sp)

0000241c <.L18>:
    241c:	10412783          	lw	a5,260(sp)
    2420:	00006717          	auipc	a4,0x6
    2424:	0b070713          	addi	a4,a4,176 # 84d0 <fmt>
    2428:	00040513          	mv	a0,s0
    242c:	00e787b3          	add	a5,a5,a4
    2430:	10f12223          	sw	a5,260(sp)
    2434:	10810913          	addi	s2,sp,264

00002438 <.L19>:
    2438:	10010793          	addi	a5,sp,256

0000243c <.L69>:
    243c:	0007a703          	lw	a4,0(a5)
    2440:	03812683          	lw	a3,56(sp)
    2444:	00c78793          	addi	a5,a5,12
    2448:	40e68733          	sub	a4,a3,a4
    244c:	02e12c23          	sw	a4,56(sp)
    2450:	ff27e6e3          	bltu	a5,s2,243c <.L69>
    2454:	0a000793          	li	a5,160
    2458:	0ef12823          	sw	a5,240(sp)
    245c:	0b014783          	lbu	a5,176(sp)
    2460:	0b010713          	addi	a4,sp,176
    2464:	02056513          	ori	a0,a0,32
    2468:	00f037b3          	snez	a5,a5
    246c:	0ef12a23          	sw	a5,244(sp)
    2470:	0ee12c23          	sw	a4,248(sp)
    2474:	0ff57513          	zext.b	a0,a0
    2478:	06100693          	li	a3,97
    247c:	02d51a63          	bne	a0,a3,24b0 <.L70>
    2480:	0fc12603          	lw	a2,252(sp)
    2484:	00f00693          	li	a3,15
    2488:	02c6d463          	bge	a3,a2,24b0 <.L70>
    248c:	00f70733          	add	a4,a4,a5
    2490:	03000693          	li	a3,48
    2494:	00d70023          	sb	a3,0(a4)
    2498:	0b814683          	lbu	a3,184(sp)
    249c:	00278793          	addi	a5,a5,2
    24a0:	00070123          	sb	zero,2(a4)
    24a4:	00868693          	addi	a3,a3,8
    24a8:	00d700a3          	sb	a3,1(a4)
    24ac:	0ef12a23          	sw	a5,244(sp)

000024b0 <.L70>:
    24b0:	03812703          	lw	a4,56(sp)
    24b4:	40f707b3          	sub	a5,a4,a5
    24b8:	02f05663          	blez	a5,24e4 <.L73>
    24bc:	00c9a703          	lw	a4,12(s3)
    24c0:	00877713          	andi	a4,a4,8
    24c4:	280700e3          	beqz	a4,2f44 <.L72>
    24c8:	00f92223          	sw	a5,4(s2)
    24cc:	0a000713          	li	a4,160
    24d0:	00006797          	auipc	a5,0x6
    24d4:	00378793          	addi	a5,a5,3 # 84d3 <fmt+0x3>
    24d8:	00e92023          	sw	a4,0(s2)
    24dc:	00f92423          	sw	a5,8(s2)
    24e0:	00c90913          	addi	s2,s2,12

000024e4 <.L73>:
    24e4:	0f010413          	addi	s0,sp,240
    24e8:	00000493          	li	s1,0

000024ec <.L76>:
    24ec:	00442983          	lw	s3,4(s0)
    24f0:	00842683          	lw	a3,8(s0)
    24f4:	00042583          	lw	a1,0(s0)
    24f8:	05012503          	lw	a0,80(sp)
    24fc:	05412783          	lw	a5,84(sp)
    2500:	00098613          	mv	a2,s3
    2504:	000780e7          	jalr	a5
    2508:	273514e3          	bne	a0,s3,2f70 <.L98>
    250c:	00c40413          	addi	s0,s0,12
    2510:	00a484b3          	add	s1,s1,a0
    2514:	fd246ce3          	bltu	s0,s2,24ec <.L76>

00002518 <.L1>:
    2518:	18c12083          	lw	ra,396(sp)
    251c:	18812403          	lw	s0,392(sp)
    2520:	18012903          	lw	s2,384(sp)
    2524:	17c12983          	lw	s3,380(sp)
    2528:	17812a03          	lw	s4,376(sp)
    252c:	17412a83          	lw	s5,372(sp)
    2530:	17012b03          	lw	s6,368(sp)
    2534:	16c12b83          	lw	s7,364(sp)
    2538:	16812c03          	lw	s8,360(sp)
    253c:	16412c83          	lw	s9,356(sp)
    2540:	16012d03          	lw	s10,352(sp)
    2544:	15c12d83          	lw	s11,348(sp)
    2548:	00048513          	mv	a0,s1
    254c:	18412483          	lw	s1,388(sp)
    2550:	19010113          	addi	sp,sp,400
    2554:	00008067          	ret

00002558 <.L2>:
    2558:	e204dae3          	bgez	s1,238c <.L4>
    255c:	02012423          	sw	zero,40(sp)
    2560:	00600493          	li	s1,6
    2564:	e2dff06f          	j	2390 <.L3>

00002568 <.L78>:
    2568:	00100793          	li	a5,1
    256c:	02f12423          	sw	a5,40(sp)
    2570:	01d00493          	li	s1,29
    2574:	e1dff06f          	j	2390 <.L3>

00002578 <.L5>:
    2578:	0017f793          	andi	a5,a5,1
    257c:	e20786e3          	beqz	a5,23a8 <.L6>
    2580:	02000793          	li	a5,32
    2584:	e21ff06f          	j	23a4 <.L131>

00002588 <.L126>:
    2588:	000b8593          	mv	a1,s7
    258c:	000c0513          	mv	a0,s8
    2590:	0b412023          	sw	s4,160(sp)
    2594:	0b512223          	sw	s5,164(sp)
    2598:	0b612423          	sw	s6,168(sp)
    259c:	0b212623          	sw	s2,172(sp)
    25a0:	08012823          	sw	zero,144(sp)
    25a4:	08012a23          	sw	zero,148(sp)
    25a8:	08012c23          	sw	zero,152(sp)
    25ac:	08012e23          	sw	zero,156(sp)
    25b0:	569010ef          	jal	ra,4318 <__eqtf2>
    25b4:	24051c63          	bnez	a0,280c <.L127>
    25b8:	000c0513          	mv	a0,s8
    25bc:	235040ef          	jal	ra,6ff0 <__trunctfdf2>
    25c0:	00b50663          	beq	a0,a1,25cc <.L12>
    25c4:	02d00793          	li	a5,45
    25c8:	0af10823          	sb	a5,176(sp)

000025cc <.L12>:
    25cc:	02400793          	li	a5,36
    25d0:	02f12823          	sw	a5,48(sp)
    25d4:	00900793          	li	a5,9
    25d8:	00006617          	auipc	a2,0x6
    25dc:	0c860613          	addi	a2,a2,200 # 86a0 <.LC2>
    25e0:	02f12623          	sw	a5,44(sp)
    25e4:	00a00793          	li	a5,10
    25e8:	00f12623          	sw	a5,12(sp)
    25ec:	00062783          	lw	a5,0(a2)
    25f0:	000a0c93          	mv	s9,s4
    25f4:	000a8d13          	mv	s10,s5
    25f8:	00f12c23          	sw	a5,24(sp)
    25fc:	00462783          	lw	a5,4(a2)
    2600:	000b0d93          	mv	s11,s6
    2604:	00090b93          	mv	s7,s2
    2608:	00f12e23          	sw	a5,28(sp)
    260c:	00862783          	lw	a5,8(a2)
    2610:	fff00c13          	li	s8,-1
    2614:	02f12023          	sw	a5,32(sp)
    2618:	00c62783          	lw	a5,12(a2)
    261c:	02f12223          	sw	a5,36(sp)

00002620 <.L13>:
    2620:	0a010793          	addi	a5,sp,160
    2624:	00f12823          	sw	a5,16(sp)
    2628:	09010793          	addi	a5,sp,144
    262c:	00f12a23          	sw	a5,20(sp)
    2630:	08010793          	addi	a5,sp,128
    2634:	00400913          	li	s2,4
    2638:	0ca10a13          	addi	s4,sp,202
    263c:	02f12a23          	sw	a5,52(sp)
    2640:	07010b13          	addi	s6,sp,112

00002644 <.L29>:
    2644:	01012503          	lw	a0,16(sp)
    2648:	0b912023          	sw	s9,160(sp)
    264c:	0ba12223          	sw	s10,164(sp)
    2650:	0bb12423          	sw	s11,168(sp)
    2654:	0b712623          	sw	s7,172(sp)
    2658:	56c040ef          	jal	ra,6bc4 <__fixunstfsi>
    265c:	00050593          	mv	a1,a0
    2660:	00050a93          	mv	s5,a0
    2664:	01012503          	lw	a0,16(sp)
    2668:	648040ef          	jal	ra,6cb0 <__floatunsitf>
    266c:	0a012703          	lw	a4,160(sp)
    2670:	03412583          	lw	a1,52(sp)
    2674:	01412503          	lw	a0,20(sp)
    2678:	06e12823          	sw	a4,112(sp)
    267c:	0a412703          	lw	a4,164(sp)
    2680:	000b0613          	mv	a2,s6
    2684:	09912023          	sw	s9,128(sp)
    2688:	06e12a23          	sw	a4,116(sp)
    268c:	0a812703          	lw	a4,168(sp)
    2690:	09a12223          	sw	s10,132(sp)
    2694:	09b12423          	sw	s11,136(sp)
    2698:	06e12c23          	sw	a4,120(sp)
    269c:	0ac12703          	lw	a4,172(sp)
    26a0:	09712623          	sw	s7,140(sp)
    26a4:	06e12e23          	sw	a4,124(sp)
    26a8:	064030ef          	jal	ra,570c <__subtf3>
    26ac:	01812783          	lw	a5,24(sp)
    26b0:	03412603          	lw	a2,52(sp)
    26b4:	01012503          	lw	a0,16(sp)
    26b8:	08f12023          	sw	a5,128(sp)
    26bc:	01c12783          	lw	a5,28(sp)
    26c0:	01412583          	lw	a1,20(sp)
    26c4:	08f12223          	sw	a5,132(sp)
    26c8:	02012783          	lw	a5,32(sp)
    26cc:	08f12423          	sw	a5,136(sp)
    26d0:	02412783          	lw	a5,36(sp)
    26d4:	08f12623          	sw	a5,140(sp)
    26d8:	7dd010ef          	jal	ra,46b4 <__multf3>
    26dc:	02c12783          	lw	a5,44(sp)
    26e0:	0a012c83          	lw	s9,160(sp)
    26e4:	0a412d03          	lw	s10,164(sp)
    26e8:	0a812d83          	lw	s11,168(sp)
    26ec:	0ac12b83          	lw	s7,172(sp)
    26f0:	00fa0a33          	add	s4,s4,a5
    26f4:	000a0613          	mv	a2,s4
    26f8:	40fa0533          	sub	a0,s4,a5

000026fc <.L28>:
    26fc:	00c12783          	lw	a5,12(sp)
    2700:	fff60613          	addi	a2,a2,-1
    2704:	02faf5b3          	remu	a1,s5,a5
    2708:	03058593          	addi	a1,a1,48
    270c:	00b60023          	sb	a1,0(a2)
    2710:	02fadab3          	divu	s5,s5,a5
    2714:	fec514e3          	bne	a0,a2,26fc <.L28>
    2718:	fff90913          	addi	s2,s2,-1
    271c:	f20914e3          	bnez	s2,2644 <.L29>
    2720:	06000713          	li	a4,96
    2724:	00876c63          	bltu	a4,s0,273c <.L30>
    2728:	0b814703          	lbu	a4,184(sp)
    272c:	02040413          	addi	s0,s0,32
    2730:	0ff47413          	zext.b	s0,s0
    2734:	fe070713          	addi	a4,a4,-32
    2738:	0ae10c23          	sb	a4,184(sp)

0000273c <.L30>:
    273c:	06700713          	li	a4,103
    2740:	0c910913          	addi	s2,sp,201
    2744:	4ee41e63          	bne	s0,a4,2c40 <.L31>
    2748:	54048863          	beqz	s1,2c98 <.L32>
    274c:	fff48493          	addi	s1,s1,-1

00002750 <.L81>:
    2750:	00048693          	mv	a3,s1

00002754 <.L33>:
    2754:	03012783          	lw	a5,48(sp)
    2758:	00003737          	lui	a4,0x3
    275c:	0ce11423          	sh	a4,200(sp)
    2760:	50f6ca63          	blt	a3,a5,2c74 <.L34>
    2764:	00178613          	addi	a2,a5,1
    2768:	00c90633          	add	a2,s2,a2
    276c:	00000593          	li	a1,0

00002770 <.L35>:
    2770:	00c12783          	lw	a5,12(sp)
    2774:	03000513          	li	a0,48
    2778:	02f78b93          	addi	s7,a5,47

0000277c <.L120>:
    277c:	fff64703          	lbu	a4,-1(a2)
    2780:	fff60613          	addi	a2,a2,-1
    2784:	00b70733          	add	a4,a4,a1
    2788:	0ff77713          	zext.b	a4,a4
    278c:	00e60023          	sb	a4,0(a2)
    2790:	fea706e3          	beq	a4,a0,277c <.L120>
    2794:	feebe4e3          	bltu	s7,a4,277c <.L120>
    2798:	02046713          	ori	a4,s0,32
    279c:	06100593          	li	a1,97
    27a0:	52b71463          	bne	a4,a1,2cc8 <.L37>
    27a4:	0b814583          	lbu	a1,184(sp)
    27a8:	00060513          	mv	a0,a2
    27ac:	03900813          	li	a6,57
    27b0:	fb758593          	addi	a1,a1,-73
    27b4:	0ff5f593          	zext.b	a1,a1

000027b8 <.L38>:
    27b8:	00054703          	lbu	a4,0(a0)
    27bc:	4e071663          	bnez	a4,2ca8 <.L40>
    27c0:	4ec96e63          	bltu	s2,a2,2cbc <.L41>

000027c4 <.L43>:
    27c4:	001c0c13          	addi	s8,s8,1
    27c8:	00090613          	mv	a2,s2
    27cc:	00090713          	mv	a4,s2

000027d0 <.L42>:
    27d0:	000600a3          	sb	zero,1(a2)
    27d4:	06700593          	li	a1,103
    27d8:	4eb41c63          	bne	s0,a1,2cd0 <.L44>
    27dc:	ffc00593          	li	a1,-4
    27e0:	5ebc4c63          	blt	s8,a1,2dd8 <.L83>
    27e4:	5f86ca63          	blt	a3,s8,2dd8 <.L83>
    27e8:	418684b3          	sub	s1,a3,s8

000027ec <.L46>:
    27ec:	000c0693          	mv	a3,s8
    27f0:	000c5a63          	bgez	s8,2804 <.L136>
    27f4:	03000693          	li	a3,48
    27f8:	fed70fa3          	sb	a3,-1(a4) # 2fff <.L10+0x2f>
    27fc:	000c0693          	mv	a3,s8
    2800:	fff70713          	addi	a4,a4,-1

00002804 <.L136>:
    2804:	06600513          	li	a0,102
    2808:	4d80006f          	j	2ce0 <.L45>

0000280c <.L127>:
    280c:	000b8593          	mv	a1,s7
    2810:	000c0513          	mv	a0,s8
    2814:	0b412023          	sw	s4,160(sp)
    2818:	0b512223          	sw	s5,164(sp)
    281c:	0b612423          	sw	s6,168(sp)
    2820:	0b212623          	sw	s2,172(sp)
    2824:	08012823          	sw	zero,144(sp)
    2828:	08012a23          	sw	zero,148(sp)
    282c:	08012c23          	sw	zero,152(sp)
    2830:	08012e23          	sw	zero,156(sp)
    2834:	51d010ef          	jal	ra,4550 <__letf2>
    2838:	00055a63          	bgez	a0,284c <.L14>
    283c:	02d00793          	li	a5,45
    2840:	0af10823          	sb	a5,176(sp)
    2844:	800007b7          	lui	a5,0x80000
    2848:	0127c933          	xor	s2,a5,s2

0000284c <.L14>:
    284c:	00006797          	auipc	a5,0x6
    2850:	e7478793          	addi	a5,a5,-396 # 86c0 <.LC4>
    2854:	0007a603          	lw	a2,0(a5)
    2858:	0047a683          	lw	a3,4(a5)
    285c:	0087a703          	lw	a4,8(a5)
    2860:	00c7a783          	lw	a5,12(a5)
    2864:	08010d13          	addi	s10,sp,128
    2868:	08c12023          	sw	a2,128(sp)
    286c:	000b8593          	mv	a1,s7
    2870:	000c0513          	mv	a0,s8
    2874:	000d0613          	mv	a2,s10
    2878:	08f12623          	sw	a5,140(sp)
    287c:	09412823          	sw	s4,144(sp)
    2880:	09512a23          	sw	s5,148(sp)
    2884:	09612c23          	sw	s6,152(sp)
    2888:	09212e23          	sw	s2,156(sp)
    288c:	08d12223          	sw	a3,132(sp)
    2890:	08e12423          	sw	a4,136(sp)
    2894:	621010ef          	jal	ra,46b4 <__multf3>
    2898:	0a012783          	lw	a5,160(sp)
    289c:	000d0593          	mv	a1,s10
    28a0:	000b8513          	mv	a0,s7
    28a4:	08f12823          	sw	a5,144(sp)
    28a8:	0a412783          	lw	a5,164(sp)
    28ac:	09412023          	sw	s4,128(sp)
    28b0:	09512223          	sw	s5,132(sp)
    28b4:	08f12a23          	sw	a5,148(sp)
    28b8:	0a812783          	lw	a5,168(sp)
    28bc:	09612423          	sw	s6,136(sp)
    28c0:	09212623          	sw	s2,140(sp)
    28c4:	08f12c23          	sw	a5,152(sp)
    28c8:	0ac12783          	lw	a5,172(sp)
    28cc:	08f12e23          	sw	a5,156(sp)
    28d0:	249010ef          	jal	ra,4318 <__eqtf2>
    28d4:	b0050ee3          	beqz	a0,23f0 <.L9>
    28d8:	06100793          	li	a5,97
    28dc:	28fc9e63          	bne	s9,a5,2b78 <.L79>
    28e0:	01d00793          	li	a5,29
    28e4:	02f12823          	sw	a5,48(sp)
    28e8:	00800793          	li	a5,8
    28ec:	00006717          	auipc	a4,0x6
    28f0:	d9470713          	addi	a4,a4,-620 # 8680 <.LC0>
    28f4:	02f12623          	sw	a5,44(sp)
    28f8:	01000793          	li	a5,16
    28fc:	00f12623          	sw	a5,12(sp)
    2900:	00072783          	lw	a5,0(a4)
    2904:	00700c13          	li	s8,7
    2908:	6f018313          	addi	t1,gp,1776 # 8330 <exp16_table>
    290c:	00f12c23          	sw	a5,24(sp)
    2910:	00472783          	lw	a5,4(a4)
    2914:	00f12e23          	sw	a5,28(sp)
    2918:	00872783          	lw	a5,8(a4)
    291c:	02f12023          	sw	a5,32(sp)
    2920:	00c72783          	lw	a5,12(a4)
    2924:	00006717          	auipc	a4,0x6
    2928:	d6c70713          	addi	a4,a4,-660 # 8690 <.LC1>
    292c:	02f12223          	sw	a5,36(sp)

00002930 <.L132>:
    2930:	00072783          	lw	a5,0(a4)
    2934:	0c030e13          	addi	t3,t1,192
    2938:	000a0c93          	mv	s9,s4
    293c:	02f12e23          	sw	a5,60(sp)
    2940:	00472783          	lw	a5,4(a4)
    2944:	000a8d13          	mv	s10,s5
    2948:	000b0d93          	mv	s11,s6
    294c:	04f12023          	sw	a5,64(sp)
    2950:	00872783          	lw	a5,8(a4)
    2954:	00090b93          	mv	s7,s2
    2958:	04f12223          	sw	a5,68(sp)
    295c:	00c72783          	lw	a5,12(a4)
    2960:	04f12423          	sw	a5,72(sp)
    2964:	000017b7          	lui	a5,0x1
    2968:	02f12a23          	sw	a5,52(sp)
    296c:	0a010793          	addi	a5,sp,160
    2970:	00f12823          	sw	a5,16(sp)
    2974:	09010793          	addi	a5,sp,144
    2978:	00f12a23          	sw	a5,20(sp)
    297c:	08010793          	addi	a5,sp,128
    2980:	04f12623          	sw	a5,76(sp)

00002984 <.L26>:
    2984:	03c12783          	lw	a5,60(sp)
    2988:	000e2f83          	lw	t6,0(t3)
    298c:	004e2f03          	lw	t5,4(t3)
    2990:	008e2e83          	lw	t4,8(t3)
    2994:	00ce2603          	lw	a2,12(t3)
    2998:	08f12823          	sw	a5,144(sp)
    299c:	04012783          	lw	a5,64(sp)
    29a0:	01412583          	lw	a1,20(sp)
    29a4:	01012503          	lw	a0,16(sp)
    29a8:	08f12a23          	sw	a5,148(sp)
    29ac:	04412783          	lw	a5,68(sp)
    29b0:	06612623          	sw	t1,108(sp)
    29b4:	07f12423          	sw	t6,104(sp)
    29b8:	08f12c23          	sw	a5,152(sp)
    29bc:	04812783          	lw	a5,72(sp)
    29c0:	07e12223          	sw	t5,100(sp)
    29c4:	07d12023          	sw	t4,96(sp)
    29c8:	05c12e23          	sw	t3,92(sp)
    29cc:	04c12c23          	sw	a2,88(sp)
    29d0:	0b412023          	sw	s4,160(sp)
    29d4:	0b512223          	sw	s5,164(sp)
    29d8:	0b612423          	sw	s6,168(sp)
    29dc:	0b212623          	sw	s2,172(sp)
    29e0:	08f12e23          	sw	a5,156(sp)
    29e4:	36d010ef          	jal	ra,4550 <__letf2>
    29e8:	05812603          	lw	a2,88(sp)
    29ec:	06812f83          	lw	t6,104(sp)
    29f0:	06c12303          	lw	t1,108(sp)
    29f4:	05c12e03          	lw	t3,92(sp)
    29f8:	06012e83          	lw	t4,96(sp)
    29fc:	06412f03          	lw	t5,100(sp)
    2a00:	08c12623          	sw	a2,140(sp)
    2a04:	07c12623          	sw	t3,108(sp)
    2a08:	06612423          	sw	t1,104(sp)
    2a0c:	09912823          	sw	s9,144(sp)
    2a10:	09a12a23          	sw	s10,148(sp)
    2a14:	09b12c23          	sw	s11,152(sp)
    2a18:	09712e23          	sw	s7,156(sp)
    2a1c:	09f12023          	sw	t6,128(sp)
    2a20:	09e12223          	sw	t5,132(sp)
    2a24:	09d12423          	sw	t4,136(sp)
    2a28:	04c12603          	lw	a2,76(sp)
    2a2c:	01412583          	lw	a1,20(sp)
    2a30:	1a055263          	bgez	a0,2bd4 <.L129>
    2a34:	01012503          	lw	a0,16(sp)
    2a38:	47d010ef          	jal	ra,46b4 <__multf3>
    2a3c:	01812783          	lw	a5,24(sp)
    2a40:	0a012f83          	lw	t6,160(sp)
    2a44:	0a412f03          	lw	t5,164(sp)
    2a48:	08f12823          	sw	a5,144(sp)
    2a4c:	01c12783          	lw	a5,28(sp)
    2a50:	0a812e83          	lw	t4,168(sp)
    2a54:	0ac12603          	lw	a2,172(sp)
    2a58:	08f12a23          	sw	a5,148(sp)
    2a5c:	02012783          	lw	a5,32(sp)
    2a60:	01412583          	lw	a1,20(sp)
    2a64:	01012503          	lw	a0,16(sp)
    2a68:	08f12c23          	sw	a5,152(sp)
    2a6c:	02412783          	lw	a5,36(sp)
    2a70:	07f12223          	sw	t6,100(sp)
    2a74:	07e12023          	sw	t5,96(sp)
    2a78:	05d12e23          	sw	t4,92(sp)
    2a7c:	04c12c23          	sw	a2,88(sp)
    2a80:	08f12e23          	sw	a5,156(sp)
    2a84:	2cd010ef          	jal	ra,4550 <__letf2>
    2a88:	06812303          	lw	t1,104(sp)
    2a8c:	06c12e03          	lw	t3,108(sp)
    2a90:	02055663          	bgez	a0,2abc <.L23>
    2a94:	03412783          	lw	a5,52(sp)
    2a98:	40fc0c33          	sub	s8,s8,a5

00002a9c <.L133>:
    2a9c:	06412f83          	lw	t6,100(sp)
    2aa0:	06012f03          	lw	t5,96(sp)
    2aa4:	05c12e83          	lw	t4,92(sp)
    2aa8:	05812603          	lw	a2,88(sp)
    2aac:	000f8c93          	mv	s9,t6
    2ab0:	000f0d13          	mv	s10,t5
    2ab4:	000e8d93          	mv	s11,t4
    2ab8:	00060b93          	mv	s7,a2

00002abc <.L23>:
    2abc:	03412783          	lw	a5,52(sp)
    2ac0:	ff0e0613          	addi	a2,t3,-16
    2ac4:	4017d793          	srai	a5,a5,0x1
    2ac8:	02f12a23          	sw	a5,52(sp)
    2acc:	11c31063          	bne	t1,t3,2bcc <.L80>
    2ad0:	01812783          	lw	a5,24(sp)
    2ad4:	0a010913          	addi	s2,sp,160
    2ad8:	09010593          	addi	a1,sp,144
    2adc:	08f12823          	sw	a5,144(sp)
    2ae0:	01c12783          	lw	a5,28(sp)
    2ae4:	00090513          	mv	a0,s2
    2ae8:	00612a23          	sw	t1,20(sp)
    2aec:	08f12a23          	sw	a5,148(sp)
    2af0:	02012783          	lw	a5,32(sp)
    2af4:	0b912023          	sw	s9,160(sp)
    2af8:	0ba12223          	sw	s10,164(sp)
    2afc:	08f12c23          	sw	a5,152(sp)
    2b00:	02412783          	lw	a5,36(sp)
    2b04:	0bb12423          	sw	s11,168(sp)
    2b08:	0b712623          	sw	s7,172(sp)
    2b0c:	08f12e23          	sw	a5,156(sp)
    2b10:	00b12823          	sw	a1,16(sp)
    2b14:	0d9010ef          	jal	ra,43ec <__getf2>
    2b18:	b00544e3          	bltz	a0,2620 <.L13>
    2b1c:	01412303          	lw	t1,20(sp)
    2b20:	09912823          	sw	s9,144(sp)
    2b24:	09a12a23          	sw	s10,148(sp)
    2b28:	09b12c23          	sw	s11,152(sp)
    2b2c:	09712e23          	sw	s7,156(sp)
    2b30:	00032703          	lw	a4,0(t1)
    2b34:	01012583          	lw	a1,16(sp)
    2b38:	08010613          	addi	a2,sp,128
    2b3c:	08e12023          	sw	a4,128(sp)
    2b40:	00432703          	lw	a4,4(t1)
    2b44:	00090513          	mv	a0,s2
    2b48:	001c0c13          	addi	s8,s8,1
    2b4c:	08e12223          	sw	a4,132(sp)
    2b50:	00832703          	lw	a4,8(t1)
    2b54:	08e12423          	sw	a4,136(sp)
    2b58:	00c32703          	lw	a4,12(t1)
    2b5c:	08e12623          	sw	a4,140(sp)
    2b60:	1b9000ef          	jal	ra,3518 <__divtf3>
    2b64:	0a012c83          	lw	s9,160(sp)
    2b68:	0a412d03          	lw	s10,164(sp)
    2b6c:	0a812d83          	lw	s11,168(sp)
    2b70:	0ac12b83          	lw	s7,172(sp)
    2b74:	aadff06f          	j	2620 <.L13>

00002b78 <.L79>:
    2b78:	02400793          	li	a5,36
    2b7c:	02f12823          	sw	a5,48(sp)
    2b80:	00900793          	li	a5,9
    2b84:	00006717          	auipc	a4,0x6
    2b88:	b1c70713          	addi	a4,a4,-1252 # 86a0 <.LC2>
    2b8c:	02f12623          	sw	a5,44(sp)
    2b90:	00a00793          	li	a5,10
    2b94:	00f12623          	sw	a5,12(sp)
    2b98:	00072783          	lw	a5,0(a4)
    2b9c:	00800c13          	li	s8,8
    2ba0:	7c018313          	addi	t1,gp,1984 # 8400 <exp10_table>
    2ba4:	00f12c23          	sw	a5,24(sp)
    2ba8:	00472783          	lw	a5,4(a4)
    2bac:	00f12e23          	sw	a5,28(sp)
    2bb0:	00872783          	lw	a5,8(a4)
    2bb4:	02f12023          	sw	a5,32(sp)
    2bb8:	00c72783          	lw	a5,12(a4)
    2bbc:	00006717          	auipc	a4,0x6
    2bc0:	af470713          	addi	a4,a4,-1292 # 86b0 <.LC3>
    2bc4:	02f12223          	sw	a5,36(sp)
    2bc8:	d69ff06f          	j	2930 <.L132>

00002bcc <.L80>:
    2bcc:	00060e13          	mv	t3,a2
    2bd0:	db5ff06f          	j	2984 <.L26>

00002bd4 <.L129>:
    2bd4:	01012503          	lw	a0,16(sp)
    2bd8:	141000ef          	jal	ra,3518 <__divtf3>
    2bdc:	03c12783          	lw	a5,60(sp)
    2be0:	0a012f83          	lw	t6,160(sp)
    2be4:	0a412f03          	lw	t5,164(sp)
    2be8:	08f12823          	sw	a5,144(sp)
    2bec:	04012783          	lw	a5,64(sp)
    2bf0:	0a812e83          	lw	t4,168(sp)
    2bf4:	0ac12603          	lw	a2,172(sp)
    2bf8:	08f12a23          	sw	a5,148(sp)
    2bfc:	04412783          	lw	a5,68(sp)
    2c00:	01412583          	lw	a1,20(sp)
    2c04:	01012503          	lw	a0,16(sp)
    2c08:	08f12c23          	sw	a5,152(sp)
    2c0c:	04812783          	lw	a5,72(sp)
    2c10:	07f12223          	sw	t6,100(sp)
    2c14:	07e12023          	sw	t5,96(sp)
    2c18:	05d12e23          	sw	t4,92(sp)
    2c1c:	04c12c23          	sw	a2,88(sp)
    2c20:	08f12e23          	sw	a5,156(sp)
    2c24:	7c8010ef          	jal	ra,43ec <__getf2>
    2c28:	06812303          	lw	t1,104(sp)
    2c2c:	06c12e03          	lw	t3,108(sp)
    2c30:	e80546e3          	bltz	a0,2abc <.L23>
    2c34:	03412783          	lw	a5,52(sp)
    2c38:	00fc0c33          	add	s8,s8,a5
    2c3c:	e61ff06f          	j	2a9c <.L133>

00002c40 <.L31>:
    2c40:	06600713          	li	a4,102
    2c44:	b0e416e3          	bne	s0,a4,2750 <.L81>
    2c48:	009c06b3          	add	a3,s8,s1
    2c4c:	fff00713          	li	a4,-1
    2c50:	b0e6d2e3          	bge	a3,a4,2754 <.L33>
    2c54:	02400613          	li	a2,36
    2c58:	03000593          	li	a1,48
    2c5c:	0c810513          	addi	a0,sp,200
    2c60:	a79fe0ef          	jal	ra,16d8 <__GI_memset>
    2c64:	000037b7          	lui	a5,0x3
    2c68:	0cf11423          	sh	a5,200(sp)
    2c6c:	fff00c13          	li	s8,-1
    2c70:	fff00693          	li	a3,-1

00002c74 <.L34>:
    2c74:	00c12783          	lw	a5,12(sp)
    2c78:	00268613          	addi	a2,a3,2
    2c7c:	00c90633          	add	a2,s2,a2
    2c80:	00064583          	lbu	a1,0(a2)
    2c84:	0017d713          	srli	a4,a5,0x1
    2c88:	03070713          	addi	a4,a4,48
    2c8c:	00e5b5b3          	sltu	a1,a1,a4
    2c90:	0015c593          	xori	a1,a1,1
    2c94:	addff06f          	j	2770 <.L35>

00002c98 <.L32>:
    2c98:	00003737          	lui	a4,0x3
    2c9c:	0ce11423          	sh	a4,200(sp)
    2ca0:	00000693          	li	a3,0
    2ca4:	fd1ff06f          	j	2c74 <.L34>

00002ca8 <.L40>:
    2ca8:	00e87663          	bgeu	a6,a4,2cb4 <.L39>
    2cac:	00b70733          	add	a4,a4,a1
    2cb0:	00e50023          	sb	a4,0(a0)

00002cb4 <.L39>:
    2cb4:	fff50513          	addi	a0,a0,-1
    2cb8:	b01ff06f          	j	27b8 <.L38>

00002cbc <.L41>:
    2cbc:	002c1c13          	slli	s8,s8,0x2

00002cc0 <.L134>:
    2cc0:	0ca10713          	addi	a4,sp,202
    2cc4:	b0dff06f          	j	27d0 <.L42>

00002cc8 <.L37>:
    2cc8:	aec97ee3          	bgeu	s2,a2,27c4 <.L43>
    2ccc:	ff5ff06f          	j	2cc0 <.L134>

00002cd0 <.L44>:
    2cd0:	06600693          	li	a3,102
    2cd4:	00040513          	mv	a0,s0
    2cd8:	b0d40ae3          	beq	s0,a3,27ec <.L46>

00002cdc <.L135>:
    2cdc:	00000693          	li	a3,0

00002ce0 <.L45>:
    2ce0:	00100593          	li	a1,1
    2ce4:	10b12023          	sw	a1,256(sp)
    2ce8:	0b410593          	addi	a1,sp,180
    2cec:	10b12223          	sw	a1,260(sp)
    2cf0:	00074583          	lbu	a1,0(a4) # 3000 <.L10+0x30>
    2cf4:	0b000893          	li	a7,176
    2cf8:	0f112e23          	sw	a7,252(sp)
    2cfc:	0ab10a23          	sb	a1,180(sp)
    2d00:	00c9a583          	lw	a1,12(s3)
    2d04:	0a010aa3          	sb	zero,181(sp)
    2d08:	00170813          	addi	a6,a4,1
    2d0c:	0105f593          	andi	a1,a1,16
    2d10:	40e60733          	sub	a4,a2,a4
    2d14:	1406c663          	bltz	a3,2e60 <.L86>
    2d18:	07000613          	li	a2,112
    2d1c:	10c12423          	sw	a2,264(sp)
    2d20:	11012823          	sw	a6,272(sp)
    2d24:	0ee6ca63          	blt	a3,a4,2e18 <.L48>
    2d28:	10e12623          	sw	a4,268(sp)
    2d2c:	40e68733          	sub	a4,a3,a4
    2d30:	0a071863          	bnez	a4,2de0 <.L49>
    2d34:	11410913          	addi	s2,sp,276
    2d38:	16059263          	bnez	a1,2e9c <.L93>
    2d3c:	06700693          	li	a3,103
    2d40:	10d40663          	beq	s0,a3,2e4c <.L140>
    2d44:	06100693          	li	a3,97
    2d48:	14d41863          	bne	s0,a3,2e98 <.L52>

00002d4c <.L58>:
    2d4c:	00000613          	li	a2,0
    2d50:	00000713          	li	a4,0

00002d54 <.L61>:
    2d54:	02812783          	lw	a5,40(sp)
    2d58:	18078e63          	beqz	a5,2ef4 <.L64>

00002d5c <.L65>:
    2d5c:	06600713          	li	a4,102
    2d60:	ece50c63          	beq	a0,a4,2438 <.L19>
    2d64:	06100713          	li	a4,97
    2d68:	0b814803          	lbu	a6,184(sp)
    2d6c:	00300613          	li	a2,3
    2d70:	0ee41463          	bne	s0,a4,2e58 <.L137>

00002d74 <.L63>:
    2d74:	02b00313          	li	t1,43
    2d78:	000c5663          	bgez	s8,2d84 <.L66>
    2d7c:	41800c33          	neg	s8,s8
    2d80:	02d00313          	li	t1,45

00002d84 <.L66>:
    2d84:	0c0103a3          	sb	zero,199(sp)
    2d88:	00200693          	li	a3,2
    2d8c:	0c710713          	addi	a4,sp,199
    2d90:	00a00e13          	li	t3,10

00002d94 <.L67>:
    2d94:	03cc68b3          	rem	a7,s8,t3
    2d98:	00168693          	addi	a3,a3,1
    2d9c:	fff70593          	addi	a1,a4,-1
    2da0:	03088893          	addi	a7,a7,48
    2da4:	ff170fa3          	sb	a7,-1(a4)
    2da8:	03cc4c33          	div	s8,s8,t3
    2dac:	18c6c663          	blt	a3,a2,2f38 <.L97>
    2db0:	180c1663          	bnez	s8,2f3c <.L68>
    2db4:	07000793          	li	a5,112
    2db8:	ffd70713          	addi	a4,a4,-3
    2dbc:	00f92023          	sw	a5,0(s2)
    2dc0:	00d92223          	sw	a3,4(s2)
    2dc4:	00e92423          	sw	a4,8(s2)
    2dc8:	fe658fa3          	sb	t1,-1(a1)
    2dcc:	ff058f23          	sb	a6,-2(a1)
    2dd0:	00c90913          	addi	s2,s2,12
    2dd4:	e64ff06f          	j	2438 <.L19>

00002dd8 <.L83>:
    2dd8:	06700513          	li	a0,103
    2ddc:	f01ff06f          	j	2cdc <.L135>

00002de0 <.L49>:
    2de0:	10e12c23          	sw	a4,280(sp)
    2de4:	00005717          	auipc	a4,0x5
    2de8:	6ef70713          	addi	a4,a4,1775 # 84d3 <fmt+0x3>
    2dec:	11112a23          	sw	a7,276(sp)
    2df0:	10e12e23          	sw	a4,284(sp)
    2df4:	12010913          	addi	s2,sp,288
    2df8:	00059c63          	bnez	a1,2e10 <.L92>
    2dfc:	06700713          	li	a4,103
    2e00:	04e40663          	beq	s0,a4,2e4c <.L140>
    2e04:	06100713          	li	a4,97
    2e08:	f4e402e3          	beq	s0,a4,2d4c <.L58>
    2e0c:	f40480e3          	beqz	s1,2d4c <.L58>

00002e10 <.L92>:
    2e10:	00000713          	li	a4,0
    2e14:	0880006f          	j	2e9c <.L93>

00002e18 <.L48>:
    2e18:	10068c63          	beqz	a3,2f30 <.L91>
    2e1c:	10d12623          	sw	a3,268(sp)
    2e20:	00d80833          	add	a6,a6,a3
    2e24:	40d70733          	sub	a4,a4,a3
    2e28:	11410913          	addi	s2,sp,276
    2e2c:	fff00693          	li	a3,-1

00002e30 <.L47>:
    2e30:	06059863          	bnez	a1,2ea0 <.L50>
    2e34:	06071663          	bnez	a4,2ea0 <.L50>
    2e38:	06700893          	li	a7,103
    2e3c:	00168613          	addi	a2,a3,1
    2e40:	03141463          	bne	s0,a7,2e68 <.L55>
    2e44:	fff00893          	li	a7,-1
    2e48:	03169663          	bne	a3,a7,2e74 <.L56>

00002e4c <.L140>:
    2e4c:	06600713          	li	a4,102
    2e50:	dee50463          	beq	a0,a4,2438 <.L19>
    2e54:	0b814803          	lbu	a6,184(sp)

00002e58 <.L137>:
    2e58:	00400613          	li	a2,4
    2e5c:	f19ff06f          	j	2d74 <.L63>

00002e60 <.L86>:
    2e60:	10810913          	addi	s2,sp,264
    2e64:	fcdff06f          	j	2e30 <.L47>

00002e68 <.L55>:
    2e68:	06100893          	li	a7,97
    2e6c:	0b141a63          	bne	s0,a7,2f20 <.L57>
    2e70:	ec060ee3          	beqz	a2,2d4c <.L58>

00002e74 <.L56>:
    2e74:	fff6c693          	not	a3,a3
    2e78:	00d92223          	sw	a3,4(s2)
    2e7c:	0b000893          	li	a7,176
    2e80:	00005697          	auipc	a3,0x5
    2e84:	65368693          	addi	a3,a3,1619 # 84d3 <fmt+0x3>
    2e88:	01192023          	sw	a7,0(s2)
    2e8c:	00d92423          	sw	a3,8(s2)
    2e90:	00c90913          	addi	s2,s2,12
    2e94:	0340006f          	j	2ec8 <.L59>

00002e98 <.L52>:
    2e98:	ea048ae3          	beqz	s1,2d4c <.L58>

00002e9c <.L93>:
    2e9c:	fff00693          	li	a3,-1

00002ea0 <.L50>:
    2ea0:	07000613          	li	a2,112
    2ea4:	00c92023          	sw	a2,0(s2)
    2ea8:	00100613          	li	a2,1
    2eac:	00c92223          	sw	a2,4(s2)
    2eb0:	00005617          	auipc	a2,0x5
    2eb4:	63060613          	addi	a2,a2,1584 # 84e0 <fmt+0x10>
    2eb8:	00c92423          	sw	a2,8(s2)
    2ebc:	00168613          	addi	a2,a3,1
    2ec0:	00c90913          	addi	s2,s2,12
    2ec4:	fa0618e3          	bnez	a2,2e74 <.L56>

00002ec8 <.L59>:
    2ec8:	00070c63          	beqz	a4,2ee0 <.L60>
    2ecc:	07000693          	li	a3,112
    2ed0:	00d92023          	sw	a3,0(s2)
    2ed4:	00e92223          	sw	a4,4(s2)
    2ed8:	01092423          	sw	a6,8(s2)
    2edc:	00c90913          	addi	s2,s2,12

00002ee0 <.L60>:
    2ee0:	06700693          	li	a3,103
    2ee4:	e6d418e3          	bne	s0,a3,2d54 <.L61>
    2ee8:	f60582e3          	beqz	a1,2e4c <.L140>
    2eec:	02812783          	lw	a5,40(sp)
    2ef0:	f4079ee3          	bnez	a5,2e4c <.L140>

00002ef4 <.L64>:
    2ef4:	40c70633          	sub	a2,a4,a2
    2ef8:	e69652e3          	bge	a2,s1,2d5c <.L65>
    2efc:	0b000713          	li	a4,176
    2f00:	00e92023          	sw	a4,0(s2)
    2f04:	40c48633          	sub	a2,s1,a2
    2f08:	00005717          	auipc	a4,0x5
    2f0c:	5cb70713          	addi	a4,a4,1483 # 84d3 <fmt+0x3>
    2f10:	00c92223          	sw	a2,4(s2)
    2f14:	00e92423          	sw	a4,8(s2)
    2f18:	00c90913          	addi	s2,s2,12
    2f1c:	e41ff06f          	j	2d5c <.L65>

00002f20 <.L57>:
    2f20:	f80490e3          	bnez	s1,2ea0 <.L50>
    2f24:	fff00893          	li	a7,-1
    2f28:	f51696e3          	bne	a3,a7,2e74 <.L56>
    2f2c:	e21ff06f          	j	2d4c <.L58>

00002f30 <.L91>:
    2f30:	10810913          	addi	s2,sp,264
    2f34:	f69ff06f          	j	2e9c <.L93>

00002f38 <.L97>:
    2f38:	00300693          	li	a3,3

00002f3c <.L68>:
    2f3c:	00058713          	mv	a4,a1
    2f40:	e55ff06f          	j	2d94 <.L67>

00002f44 <.L72>:
    2f44:	0109a603          	lw	a2,16(s3)
    2f48:	03000693          	li	a3,48
    2f4c:	0f412703          	lw	a4,244(sp)
    2f50:	00d61a63          	bne	a2,a3,2f64 <.L74>
    2f54:	10012703          	lw	a4,256(sp)
    2f58:	00f707b3          	add	a5,a4,a5
    2f5c:	10f12023          	sw	a5,256(sp)
    2f60:	d84ff06f          	j	24e4 <.L73>

00002f64 <.L74>:
    2f64:	00e787b3          	add	a5,a5,a4
    2f68:	0ef12a23          	sw	a5,244(sp)
    2f6c:	d78ff06f          	j	24e4 <.L73>

00002f70 <.L98>:
    2f70:	fff00493          	li	s1,-1
    2f74:	da4ff06f          	j	2518 <.L1>

00002f78 <__GI_memchr>:
    2f78:	0ff5f793          	zext.b	a5,a1

00002f7c <.L2>:
    2f7c:	00060663          	beqz	a2,2f88 <.L4>
    2f80:	00357713          	andi	a4,a0,3
    2f84:	02071c63          	bnez	a4,2fbc <.L5>

00002f88 <.L4>:
    2f88:	01010737          	lui	a4,0x1010
    2f8c:	0ff5f593          	zext.b	a1,a1
    2f90:	10170713          	addi	a4,a4,257 # 1010101 <.LLST3+0x10058a6>
    2f94:	02e585b3          	mul	a1,a1,a4
    2f98:	7eff0837          	lui	a6,0x7eff0
    2f9c:	00300313          	li	t1,3
    2fa0:	eff80813          	addi	a6,a6,-257 # 7efefeff <.LLST3+0x7efe56a4>
    2fa4:	fff00e13          	li	t3,-1

00002fa8 <.L6>:
    2fa8:	02c36463          	bltu	t1,a2,2fd0 <.L10>
    2fac:	00c50633          	add	a2,a0,a2

00002fb0 <.L11>:
    2fb0:	08c51063          	bne	a0,a2,3030 <.L12>
    2fb4:	00000513          	li	a0,0

00002fb8 <.L1>:
    2fb8:	00008067          	ret

00002fbc <.L5>:
    2fbc:	00054703          	lbu	a4,0(a0)
    2fc0:	fef70ce3          	beq	a4,a5,2fb8 <.L1>
    2fc4:	fff60613          	addi	a2,a2,-1
    2fc8:	00150513          	addi	a0,a0,1
    2fcc:	fb1ff06f          	j	2f7c <.L2>

00002fd0 <.L10>:
    2fd0:	00052883          	lw	a7,0(a0)
    2fd4:	00450713          	addi	a4,a0,4
    2fd8:	0115c8b3          	xor	a7,a1,a7
    2fdc:	010886b3          	add	a3,a7,a6
    2fe0:	0116c6b3          	xor	a3,a3,a7
    2fe4:	0106e6b3          	or	a3,a3,a6
    2fe8:	03c68e63          	beq	a3,t3,3024 <.L7>
    2fec:	ffc74683          	lbu	a3,-4(a4)
    2ff0:	fcf684e3          	beq	a3,a5,2fb8 <.L1>
    2ff4:	ffd74683          	lbu	a3,-3(a4)
    2ff8:	00f69663          	bne	a3,a5,3004 <.L8>
    2ffc:	00150513          	addi	a0,a0,1
    3000:	00008067          	ret

00003004 <.L8>:
    3004:	ffe74683          	lbu	a3,-2(a4)
    3008:	00f69663          	bne	a3,a5,3014 <.L9>
    300c:	00250513          	addi	a0,a0,2
    3010:	00008067          	ret

00003014 <.L9>:
    3014:	fff74683          	lbu	a3,-1(a4)
    3018:	00f69663          	bne	a3,a5,3024 <.L7>
    301c:	00350513          	addi	a0,a0,3
    3020:	00008067          	ret

00003024 <.L7>:
    3024:	ffc60613          	addi	a2,a2,-4
    3028:	00070513          	mv	a0,a4
    302c:	f7dff06f          	j	2fa8 <.L6>

00003030 <.L12>:
    3030:	00054703          	lbu	a4,0(a0)
    3034:	f8f702e3          	beq	a4,a5,2fb8 <.L1>
    3038:	00150513          	addi	a0,a0,1
    303c:	f75ff06f          	j	2fb0 <.L11>

00003040 <__GI_mempcpy>:
    3040:	ff010113          	addi	sp,sp,-16
    3044:	00812423          	sw	s0,8(sp)
    3048:	00912223          	sw	s1,4(sp)
    304c:	00112623          	sw	ra,12(sp)
    3050:	00050493          	mv	s1,a0
    3054:	00060413          	mv	s0,a2
    3058:	bd8fe0ef          	jal	ra,1430 <__GI_memcpy>
    305c:	00848533          	add	a0,s1,s0
    3060:	00c12083          	lw	ra,12(sp)
    3064:	00812403          	lw	s0,8(sp)
    3068:	00412483          	lw	s1,4(sp)
    306c:	01010113          	addi	sp,sp,16
    3070:	00008067          	ret

00003074 <__GI_memrchr>:
    3074:	0ff5f793          	zext.b	a5,a1
    3078:	00c50533          	add	a0,a0,a2

0000307c <.L2>:
    307c:	00060663          	beqz	a2,3088 <.L4>
    3080:	00357713          	andi	a4,a0,3
    3084:	02071e63          	bnez	a4,30c0 <.L5>

00003088 <.L4>:
    3088:	01010737          	lui	a4,0x1010
    308c:	0ff5f593          	zext.b	a1,a1
    3090:	10170713          	addi	a4,a4,257 # 1010101 <.LLST3+0x10058a6>
    3094:	02e585b3          	mul	a1,a1,a4
    3098:	7eff0837          	lui	a6,0x7eff0
    309c:	00050693          	mv	a3,a0
    30a0:	00300313          	li	t1,3
    30a4:	eff80813          	addi	a6,a6,-257 # 7efefeff <.LLST3+0x7efe56a4>
    30a8:	fff00e13          	li	t3,-1

000030ac <.L6>:
    30ac:	02c36463          	bltu	t1,a2,30d4 <.L11>
    30b0:	40c50633          	sub	a2,a0,a2

000030b4 <.L12>:
    30b4:	08c51063          	bne	a0,a2,3134 <.L13>
    30b8:	00000513          	li	a0,0
    30bc:	0840006f          	j	3140 <.L1>

000030c0 <.L5>:
    30c0:	fff54703          	lbu	a4,-1(a0)
    30c4:	fff50513          	addi	a0,a0,-1
    30c8:	06f70c63          	beq	a4,a5,3140 <.L1>
    30cc:	fff60613          	addi	a2,a2,-1
    30d0:	fadff06f          	j	307c <.L2>

000030d4 <.L11>:
    30d4:	ffc52883          	lw	a7,-4(a0)
    30d8:	ffc50513          	addi	a0,a0,-4
    30dc:	0115c8b3          	xor	a7,a1,a7
    30e0:	01088733          	add	a4,a7,a6
    30e4:	01174733          	xor	a4,a4,a7
    30e8:	01076733          	or	a4,a4,a6
    30ec:	03c70e63          	beq	a4,t3,3128 <.L7>
    30f0:	00354703          	lbu	a4,3(a0)
    30f4:	00f71663          	bne	a4,a5,3100 <.L8>
    30f8:	fff68513          	addi	a0,a3,-1
    30fc:	00008067          	ret

00003100 <.L8>:
    3100:	00254703          	lbu	a4,2(a0)
    3104:	00f71663          	bne	a4,a5,3110 <.L9>
    3108:	ffe68513          	addi	a0,a3,-2
    310c:	00008067          	ret

00003110 <.L9>:
    3110:	00154703          	lbu	a4,1(a0)
    3114:	00f71663          	bne	a4,a5,3120 <.L10>
    3118:	ffd68513          	addi	a0,a3,-3
    311c:	00008067          	ret

00003120 <.L10>:
    3120:	00054703          	lbu	a4,0(a0)
    3124:	00f70e63          	beq	a4,a5,3140 <.L1>

00003128 <.L7>:
    3128:	ffc60613          	addi	a2,a2,-4
    312c:	00050693          	mv	a3,a0
    3130:	f7dff06f          	j	30ac <.L6>

00003134 <.L13>:
    3134:	fff54703          	lbu	a4,-1(a0)
    3138:	fff50513          	addi	a0,a0,-1
    313c:	f6f71ce3          	bne	a4,a5,30b4 <.L12>

00003140 <.L1>:
    3140:	00008067          	ret

00003144 <__GI_strrchr>:
    3144:	ff010113          	addi	sp,sp,-16
    3148:	00812423          	sw	s0,8(sp)
    314c:	00112623          	sw	ra,12(sp)
    3150:	00912223          	sw	s1,4(sp)
    3154:	0ff5f413          	zext.b	s0,a1
    3158:	04041663          	bnez	s0,31a4 <.L6>
    315c:	00812403          	lw	s0,8(sp)
    3160:	00c12083          	lw	ra,12(sp)
    3164:	00412483          	lw	s1,4(sp)
    3168:	00000593          	li	a1,0
    316c:	01010113          	addi	sp,sp,16
    3170:	28c0006f          	j	33fc <__GI_strchr>

00003174 <.L3>:
    3174:	00150793          	addi	a5,a0,1
    3178:	00050493          	mv	s1,a0

0000317c <.L2>:
    317c:	00040593          	mv	a1,s0
    3180:	00078513          	mv	a0,a5
    3184:	278000ef          	jal	ra,33fc <__GI_strchr>
    3188:	fe0516e3          	bnez	a0,3174 <.L3>
    318c:	00c12083          	lw	ra,12(sp)
    3190:	00812403          	lw	s0,8(sp)
    3194:	00048513          	mv	a0,s1
    3198:	00412483          	lw	s1,4(sp)
    319c:	01010113          	addi	sp,sp,16
    31a0:	00008067          	ret

000031a4 <.L6>:
    31a4:	00050793          	mv	a5,a0
    31a8:	00000493          	li	s1,0
    31ac:	fd1ff06f          	j	317c <.L2>

000031b0 <__GI_exit>:
    31b0:	ff010113          	addi	sp,sp,-16
    31b4:	00812423          	sw	s0,8(sp)
    31b8:	00007717          	auipc	a4,0x7
    31bc:	60c72703          	lw	a4,1548(a4) # a7c4 <__exit_cleanup>
    31c0:	00112623          	sw	ra,12(sp)
    31c4:	00070793          	mv	a5,a4
    31c8:	00050413          	mv	s0,a0
    31cc:	00078463          	beqz	a5,31d4 <.L2>
    31d0:	000700e7          	jalr	a4

000031d4 <.L2>:
    31d4:	91dfe0ef          	jal	ra,1af0 <__uClibc_fini>
    31d8:	00004717          	auipc	a4,0x4
    31dc:	22872703          	lw	a4,552(a4) # 7400 <_GLOBAL_OFFSET_TABLE_+0x38>
    31e0:	00070793          	mv	a5,a4
    31e4:	00078463          	beqz	a5,31ec <.L3>
    31e8:	000700e7          	jalr	a4

000031ec <.L3>:
    31ec:	00040513          	mv	a0,s0
    31f0:	004000ef          	jal	ra,31f4 <__GI__exit>

000031f4 <__GI__exit>:
    31f4:	00050713          	mv	a4,a0
    31f8:	fffff637          	lui	a2,0xfffff
    31fc:	00004697          	auipc	a3,0x4
    3200:	1d86a683          	lw	a3,472(a3) # 73d4 <_GLOBAL_OFFSET_TABLE_+0xc>

00003204 <.L2>:
    3204:	00070513          	mv	a0,a4
    3208:	05d00893          	li	a7,93
    320c:	00000073          	ecall
    3210:	fea67ae3          	bgeu	a2,a0,3204 <.L2>
    3214:	40a007b3          	neg	a5,a0
    3218:	00f6a023          	sw	a5,0(a3)
    321c:	fe9ff06f          	j	3204 <.L2>

00003220 <__GI_write>:
    3220:	04000893          	li	a7,64
    3224:	00000073          	ecall
    3228:	fffff7b7          	lui	a5,0xfffff
    322c:	00a7fc63          	bgeu	a5,a0,3244 <.L1>
    3230:	40a00533          	neg	a0,a0
    3234:	00004797          	auipc	a5,0x4
    3238:	1a07a783          	lw	a5,416(a5) # 73d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    323c:	00a7a023          	sw	a0,0(a5)
    3240:	fff00513          	li	a0,-1

00003244 <.L1>:
    3244:	00008067          	ret

00003248 <__GI_fseek>:
    3248:	00060693          	mv	a3,a2
    324c:	41f5d613          	srai	a2,a1,0x1f
    3250:	0040006f          	j	3254 <__GI_fseeko64>

00003254 <__GI_fseeko64>:
    3254:	fd010113          	addi	sp,sp,-48
    3258:	02112623          	sw	ra,44(sp)
    325c:	02812423          	sw	s0,40(sp)
    3260:	00b12c23          	sw	a1,24(sp)
    3264:	00c12e23          	sw	a2,28(sp)
    3268:	00200793          	li	a5,2
    326c:	02d7f463          	bgeu	a5,a3,3294 <.L2>
    3270:	00004797          	auipc	a5,0x4
    3274:	1647a783          	lw	a5,356(a5) # 73d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    3278:	01600713          	li	a4,22
    327c:	00e7a023          	sw	a4,0(a5)

00003280 <.L3>:
    3280:	fff00513          	li	a0,-1

00003284 <.L1>:
    3284:	02c12083          	lw	ra,44(sp)
    3288:	02812403          	lw	s0,40(sp)
    328c:	03010113          	addi	sp,sp,48
    3290:	00008067          	ret

00003294 <.L2>:
    3294:	00055783          	lhu	a5,0(a0)
    3298:	00050413          	mv	s0,a0
    329c:	00068613          	mv	a2,a3
    32a0:	0407f793          	andi	a5,a5,64
    32a4:	06079863          	bnez	a5,3314 <.L4>

000032a8 <.L7>:
    32a8:	00100793          	li	a5,1
    32ac:	00f61e63          	bne	a2,a5,32c8 <.L5>
    32b0:	01810593          	addi	a1,sp,24
    32b4:	00040513          	mv	a0,s0
    32b8:	00c12623          	sw	a2,12(sp)
    32bc:	07c000ef          	jal	ra,3338 <__stdio_adjust_position>
    32c0:	00c12603          	lw	a2,12(sp)
    32c4:	fa054ee3          	bltz	a0,3280 <.L3>

000032c8 <.L5>:
    32c8:	00442703          	lw	a4,4(s0)
    32cc:	ffe00793          	li	a5,-2
    32d0:	04f71c63          	bne	a4,a5,3328 <.L20>
    32d4:	03042783          	lw	a5,48(s0)
    32d8:	fa0784e3          	beqz	a5,3280 <.L3>
    32dc:	02442503          	lw	a0,36(s0)
    32e0:	01810593          	addi	a1,sp,24
    32e4:	000780e7          	jalr	a5

000032e8 <.L12>:
    32e8:	f8054ce3          	bltz	a0,3280 <.L3>
    32ec:	00045783          	lhu	a5,0(s0)
    32f0:	00000513          	li	a0,0
    32f4:	fb87f793          	andi	a5,a5,-72
    32f8:	00f41023          	sh	a5,0(s0)
    32fc:	00842783          	lw	a5,8(s0)
    3300:	00f42823          	sw	a5,16(s0)
    3304:	00f42a23          	sw	a5,20(s0)
    3308:	00f42c23          	sw	a5,24(s0)
    330c:	00f42e23          	sw	a5,28(s0)
    3310:	f75ff06f          	j	3284 <.L1>

00003314 <.L4>:
    3314:	00d12623          	sw	a3,12(sp)
    3318:	f35fc0ef          	jal	ra,24c <__stdio_wcommit>
    331c:	00c12603          	lw	a2,12(sp)
    3320:	f80504e3          	beqz	a0,32a8 <.L7>
    3324:	f5dff06f          	j	3280 <.L3>

00003328 <.L20>:
    3328:	01810593          	addi	a1,sp,24
    332c:	00040513          	mv	a0,s0
    3330:	088000ef          	jal	ra,33b8 <__stdio_seek>
    3334:	fb5ff06f          	j	32e8 <.L12>

00003338 <__stdio_adjust_position>:
    3338:	00055783          	lhu	a5,0(a0)
    333c:	00000713          	li	a4,0
    3340:	0037f693          	andi	a3,a5,3
    3344:	00068463          	beqz	a3,334c <.L2>
    3348:	fff68713          	addi	a4,a3,-1

0000334c <.L2>:
    334c:	0407f793          	andi	a5,a5,64
    3350:	06078063          	beqz	a5,33b0 <.L3>
    3354:	00852783          	lw	a5,8(a0)

00003358 <.L4>:
    3358:	01052683          	lw	a3,16(a0)
    335c:	0045a603          	lw	a2,4(a1)
    3360:	40d78533          	sub	a0,a5,a3
    3364:	00e50533          	add	a0,a0,a4
    3368:	0005a703          	lw	a4,0(a1)
    336c:	41f55793          	srai	a5,a0,0x1f
    3370:	40f607b3          	sub	a5,a2,a5
    3374:	40a706b3          	sub	a3,a4,a0
    3378:	00d73833          	sltu	a6,a4,a3
    337c:	410787b3          	sub	a5,a5,a6
    3380:	00d5a023          	sw	a3,0(a1)
    3384:	00f5a223          	sw	a5,4(a1)
    3388:	00f64663          	blt	a2,a5,3394 <.L9>
    338c:	00c79663          	bne	a5,a2,3398 <.L5>
    3390:	00d77463          	bgeu	a4,a3,3398 <.L5>

00003394 <.L9>:
    3394:	40a00533          	neg	a0,a0

00003398 <.L5>:
    3398:	00055a63          	bgez	a0,33ac <.L1>
    339c:	00004797          	auipc	a5,0x4
    33a0:	0387a783          	lw	a5,56(a5) # 73d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    33a4:	04b00713          	li	a4,75
    33a8:	00e7a023          	sw	a4,0(a5)

000033ac <.L1>:
    33ac:	00008067          	ret

000033b0 <.L3>:
    33b0:	01452783          	lw	a5,20(a0)
    33b4:	fa5ff06f          	j	3358 <.L4>

000033b8 <__stdio_seek>:
    33b8:	ff010113          	addi	sp,sp,-16
    33bc:	00812423          	sw	s0,8(sp)
    33c0:	00058413          	mv	s0,a1
    33c4:	00060693          	mv	a3,a2
    33c8:	0005a583          	lw	a1,0(a1)
    33cc:	00442603          	lw	a2,4(s0)
    33d0:	00452503          	lw	a0,4(a0)
    33d4:	00112623          	sw	ra,12(sp)
    33d8:	0e0000ef          	jal	ra,34b8 <__GI_lseek64>
    33dc:	0005c863          	bltz	a1,33ec <.L1>
    33e0:	00a42023          	sw	a0,0(s0)
    33e4:	00b42223          	sw	a1,4(s0)
    33e8:	00000513          	li	a0,0

000033ec <.L1>:
    33ec:	00c12083          	lw	ra,12(sp)
    33f0:	00812403          	lw	s0,8(sp)
    33f4:	01010113          	addi	sp,sp,16
    33f8:	00008067          	ret

000033fc <__GI_strchr>:
    33fc:	0ff5f693          	zext.b	a3,a1

00003400 <.L2>:
    3400:	00357793          	andi	a5,a0,3
    3404:	06079263          	bnez	a5,3468 <.L4>
    3408:	010107b7          	lui	a5,0x1010
    340c:	0ff5f593          	zext.b	a1,a1
    3410:	10178793          	addi	a5,a5,257 # 1010101 <.LLST3+0x10058a6>
    3414:	02f585b3          	mul	a1,a1,a5
    3418:	7eff0637          	lui	a2,0x7eff0
    341c:	eff60613          	addi	a2,a2,-257 # 7efefeff <.LLST3+0x7efe56a4>
    3420:	fff00313          	li	t1,-1

00003424 <.L5>:
    3424:	00052803          	lw	a6,0(a0)
    3428:	00450713          	addi	a4,a0,4
    342c:	0105c8b3          	xor	a7,a1,a6
    3430:	00c807b3          	add	a5,a6,a2
    3434:	0107c7b3          	xor	a5,a5,a6
    3438:	00c88833          	add	a6,a7,a2
    343c:	01184833          	xor	a6,a6,a7
    3440:	0107f7b3          	and	a5,a5,a6
    3444:	00c7e7b3          	or	a5,a5,a2
    3448:	02678a63          	beq	a5,t1,347c <.L6>
    344c:	ffc74783          	lbu	a5,-4(a4)
    3450:	06d78263          	beq	a5,a3,34b4 <.L1>
    3454:	04078e63          	beqz	a5,34b0 <.L13>
    3458:	ffd74783          	lbu	a5,-3(a4)
    345c:	02d79463          	bne	a5,a3,3484 <.L7>
    3460:	00150513          	addi	a0,a0,1
    3464:	00008067          	ret

00003468 <.L4>:
    3468:	00054783          	lbu	a5,0(a0)
    346c:	04d78463          	beq	a5,a3,34b4 <.L1>
    3470:	04078063          	beqz	a5,34b0 <.L13>
    3474:	00150513          	addi	a0,a0,1
    3478:	f89ff06f          	j	3400 <.L2>

0000347c <.L6>:
    347c:	00070513          	mv	a0,a4
    3480:	fa5ff06f          	j	3424 <.L5>

00003484 <.L7>:
    3484:	02078663          	beqz	a5,34b0 <.L13>
    3488:	ffe74783          	lbu	a5,-2(a4)
    348c:	00d79663          	bne	a5,a3,3498 <.L8>
    3490:	00250513          	addi	a0,a0,2
    3494:	00008067          	ret

00003498 <.L8>:
    3498:	00078c63          	beqz	a5,34b0 <.L13>
    349c:	fff74783          	lbu	a5,-1(a4)
    34a0:	00d79663          	bne	a5,a3,34ac <.L9>
    34a4:	00350513          	addi	a0,a0,3
    34a8:	00008067          	ret

000034ac <.L9>:
    34ac:	fc0798e3          	bnez	a5,347c <.L6>

000034b0 <.L13>:
    34b0:	00000513          	li	a0,0

000034b4 <.L1>:
    34b4:	00008067          	ret

000034b8 <__GI_lseek64>:
    34b8:	00058793          	mv	a5,a1
    34bc:	ff010113          	addi	sp,sp,-16
    34c0:	00068713          	mv	a4,a3
    34c4:	00060593          	mv	a1,a2
    34c8:	00810693          	addi	a3,sp,8
    34cc:	00078613          	mv	a2,a5
    34d0:	03e00893          	li	a7,62
    34d4:	00000073          	ecall
    34d8:	fffff7b7          	lui	a5,0xfffff
    34dc:	02a7f263          	bgeu	a5,a0,3500 <.L2>
    34e0:	40a00533          	neg	a0,a0
    34e4:	00004797          	auipc	a5,0x4
    34e8:	ef07a783          	lw	a5,-272(a5) # 73d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    34ec:	00a7a023          	sw	a0,0(a5)
    34f0:	fff00593          	li	a1,-1
    34f4:	fff00513          	li	a0,-1

000034f8 <.L1>:
    34f8:	01010113          	addi	sp,sp,16
    34fc:	00008067          	ret

00003500 <.L2>:
    3500:	41f55593          	srai	a1,a0,0x1f
    3504:	00b567b3          	or	a5,a0,a1
    3508:	fe0798e3          	bnez	a5,34f8 <.L1>
    350c:	00812503          	lw	a0,8(sp)
    3510:	00c12583          	lw	a1,12(sp)
    3514:	fe5ff06f          	j	34f8 <.L1>

00003518 <__divtf3>:
    3518:	f5010113          	addi	sp,sp,-176
    351c:	09312e23          	sw	s3,156(sp)
    3520:	00c5a983          	lw	s3,12(a1)
    3524:	0045a783          	lw	a5,4(a1)
    3528:	0085a683          	lw	a3,8(a1)
    352c:	0a812423          	sw	s0,168(sp)
    3530:	00050413          	mv	s0,a0
    3534:	0005a503          	lw	a0,0(a1)

00003538 <.LBB3>:
    3538:	01099713          	slli	a4,s3,0x10
    353c:	000085b7          	lui	a1,0x8

00003540 <.LBE3>:
    3540:	0a912223          	sw	s1,164(sp)

00003544 <.LBB4>:
    3544:	01075713          	srli	a4,a4,0x10
    3548:	0109d493          	srli	s1,s3,0x10
    354c:	fff58593          	addi	a1,a1,-1 # 7fff <.LLST42+0xf>

00003550 <.LBE4>:
    3550:	0b212023          	sw	s2,160(sp)
    3554:	09412c23          	sw	s4,152(sp)
    3558:	00462903          	lw	s2,4(a2)
    355c:	00c62a03          	lw	s4,12(a2)
    3560:	09512a23          	sw	s5,148(sp)
    3564:	09612823          	sw	s6,144(sp)
    3568:	00862a83          	lw	s5,8(a2)
    356c:	00062b03          	lw	s6,0(a2)

00003570 <.LBB5>:
    3570:	07312623          	sw	s3,108(sp)

00003574 <.LBE5>:
    3574:	0a112623          	sw	ra,172(sp)
    3578:	09712623          	sw	s7,140(sp)
    357c:	09812423          	sw	s8,136(sp)
    3580:	09912223          	sw	s9,132(sp)
    3584:	09a12023          	sw	s10,128(sp)
    3588:	07b12e23          	sw	s11,124(sp)

0000358c <.LBB6>:
    358c:	06a12023          	sw	a0,96(sp)
    3590:	06f12223          	sw	a5,100(sp)
    3594:	06d12423          	sw	a3,104(sp)
    3598:	02a12823          	sw	a0,48(sp)
    359c:	02f12a23          	sw	a5,52(sp)
    35a0:	02d12c23          	sw	a3,56(sp)
    35a4:	02e12e23          	sw	a4,60(sp)
    35a8:	00b4f633          	and	a2,s1,a1

000035ac <.LVL2>:
    35ac:	01f9d993          	srli	s3,s3,0x1f

000035b0 <.LBE6>:
    35b0:	12060263          	beqz	a2,36d4 <.L2>
    35b4:	26b60463          	beq	a2,a1,381c <.L3>
    35b8:	000107b7          	lui	a5,0x10
    35bc:	00f76733          	or	a4,a4,a5
    35c0:	02e12e23          	sw	a4,60(sp)

000035c4 <.LBB7>:
    35c4:	03010593          	addi	a1,sp,48
    35c8:	03c10793          	addi	a5,sp,60

000035cc <.L4>:
    35cc:	0007a703          	lw	a4,0(a5) # 10000 <.LLST3+0x57a5>
    35d0:	ffc7a683          	lw	a3,-4(a5)
    35d4:	ffc78793          	addi	a5,a5,-4
    35d8:	00371713          	slli	a4,a4,0x3
    35dc:	01d6d693          	srli	a3,a3,0x1d
    35e0:	00d76733          	or	a4,a4,a3
    35e4:	00e7a223          	sw	a4,4(a5)
    35e8:	fef592e3          	bne	a1,a5,35cc <.L4>

000035ec <.LVL6>:
    35ec:	03012783          	lw	a5,48(sp)
    35f0:	00379793          	slli	a5,a5,0x3
    35f4:	02f12823          	sw	a5,48(sp)

000035f8 <.LBE7>:
    35f8:	ffffc7b7          	lui	a5,0xffffc
    35fc:	00178793          	addi	a5,a5,1 # ffffc001 <.LLST3+0xffff17a6>
    3600:	00f604b3          	add	s1,a2,a5

00003604 <.L197>:
    3604:	00000b93          	li	s7,0

00003608 <.L5>:
    3608:	010a1513          	slli	a0,s4,0x10
    360c:	00008737          	lui	a4,0x8
    3610:	010a5793          	srli	a5,s4,0x10
    3614:	01055513          	srli	a0,a0,0x10
    3618:	fff70713          	addi	a4,a4,-1 # 7fff <.LLST42+0xf>
    361c:	07412623          	sw	s4,108(sp)
    3620:	07612023          	sw	s6,96(sp)
    3624:	07212223          	sw	s2,100(sp)
    3628:	07512423          	sw	s5,104(sp)
    362c:	05612023          	sw	s6,64(sp)
    3630:	05212223          	sw	s2,68(sp)
    3634:	05512423          	sw	s5,72(sp)
    3638:	04a12623          	sw	a0,76(sp)
    363c:	00e7f7b3          	and	a5,a5,a4

00003640 <.LVL9>:
    3640:	01fa5a13          	srli	s4,s4,0x1f

00003644 <.LBE13>:
    3644:	20078263          	beqz	a5,3848 <.L18>
    3648:	34e78463          	beq	a5,a4,3990 <.L19>
    364c:	00010737          	lui	a4,0x10
    3650:	00e56533          	or	a0,a0,a4
    3654:	04a12623          	sw	a0,76(sp)

00003658 <.LBB14>:
    3658:	04010593          	addi	a1,sp,64
    365c:	04c10713          	addi	a4,sp,76

00003660 <.L20>:
    3660:	00072683          	lw	a3,0(a4) # 10000 <.LLST3+0x57a5>
    3664:	ffc72603          	lw	a2,-4(a4)
    3668:	ffc70713          	addi	a4,a4,-4
    366c:	00369693          	slli	a3,a3,0x3
    3670:	01d65613          	srli	a2,a2,0x1d
    3674:	00c6e6b3          	or	a3,a3,a2
    3678:	00d72223          	sw	a3,4(a4)
    367c:	fee592e3          	bne	a1,a4,3660 <.L20>

00003680 <.LVL13>:
    3680:	04012703          	lw	a4,64(sp)
    3684:	00371713          	slli	a4,a4,0x3
    3688:	04e12023          	sw	a4,64(sp)

0000368c <.LBE14>:
    368c:	ffffc737          	lui	a4,0xffffc
    3690:	00170713          	addi	a4,a4,1 # ffffc001 <.LLST3+0xffff17a6>
    3694:	00e787b3          	add	a5,a5,a4

00003698 <.L198>:
    3698:	00000713          	li	a4,0

0000369c <.L21>:
    369c:	40f48633          	sub	a2,s1,a5
    36a0:	002b9793          	slli	a5,s7,0x2

000036a4 <.LVL16>:
    36a4:	00e7e7b3          	or	a5,a5,a4
    36a8:	fff78793          	addi	a5,a5,-1
    36ac:	00e00693          	li	a3,14
    36b0:	0149c933          	xor	s2,s3,s4

000036b4 <.LVL17>:
    36b4:	30f6e263          	bltu	a3,a5,39b8 <.L34>
    36b8:	00005697          	auipc	a3,0x5
    36bc:	e2c68693          	addi	a3,a3,-468 # 84e4 <.L36>
    36c0:	00279793          	slli	a5,a5,0x2
    36c4:	00d787b3          	add	a5,a5,a3
    36c8:	0007a783          	lw	a5,0(a5)
    36cc:	00d787b3          	add	a5,a5,a3
    36d0:	00078067          	jr	a5

000036d4 <.L2>:
    36d4:	00a7e633          	or	a2,a5,a0

000036d8 <.LVL19>:
    36d8:	00d66633          	or	a2,a2,a3
    36dc:	00e66633          	or	a2,a2,a4
    36e0:	14060e63          	beqz	a2,383c <.L149>

000036e4 <.LBB20>:
    36e4:	04070e63          	beqz	a4,3740 <.L6>
    36e8:	00070513          	mv	a0,a4
    36ec:	45d030ef          	jal	ra,7348 <__clzsi2>

000036f0 <.LBB9>:
    36f0:	ff450693          	addi	a3,a0,-12

000036f4 <.LVL21>:
    36f4:	02000593          	li	a1,32
    36f8:	40d585b3          	sub	a1,a1,a3

000036fc <.LVL22>:
    36fc:	00000793          	li	a5,0

00003700 <.L7>:
    3700:	ffc00613          	li	a2,-4
    3704:	02c78633          	mul	a2,a5,a2
    3708:	03010313          	addi	t1,sp,48
    370c:	00c60713          	addi	a4,a2,12
    3710:	00e30733          	add	a4,t1,a4
    3714:	40c00633          	neg	a2,a2

00003718 <.L12>:
    3718:	0ee31063          	bne	t1,a4,37f8 <.L15>
    371c:	fff78713          	addi	a4,a5,-1

00003720 <.LVL24>:
    3720:	00279793          	slli	a5,a5,0x2
    3724:	03010613          	addi	a2,sp,48
    3728:	04078793          	addi	a5,a5,64
    372c:	00c787b3          	add	a5,a5,a2
    3730:	03012603          	lw	a2,48(sp)
    3734:	00d616b3          	sll	a3,a2,a3

00003738 <.LVL25>:
    3738:	fcd7a023          	sw	a3,-64(a5)
    373c:	07c0006f          	j	37b8 <.L14>

00003740 <.L6>:
    3740:	02068663          	beqz	a3,376c <.L8>
    3744:	00068513          	mv	a0,a3
    3748:	401030ef          	jal	ra,7348 <__clzsi2>

0000374c <.LVL27>:
    374c:	02050513          	addi	a0,a0,32

00003750 <.L9>:
    3750:	ff450693          	addi	a3,a0,-12
    3754:	4056d793          	srai	a5,a3,0x5

00003758 <.LVL29>:
    3758:	01f6f693          	andi	a3,a3,31

0000375c <.LVL30>:
    375c:	02068863          	beqz	a3,378c <.L11>
    3760:	02000593          	li	a1,32
    3764:	40d585b3          	sub	a1,a1,a3

00003768 <.LVL31>:
    3768:	f99ff06f          	j	3700 <.L7>

0000376c <.L8>:
    376c:	00078a63          	beqz	a5,3780 <.L10>
    3770:	00078513          	mv	a0,a5
    3774:	3d5030ef          	jal	ra,7348 <__clzsi2>

00003778 <.LVL33>:
    3778:	04050513          	addi	a0,a0,64
    377c:	fd5ff06f          	j	3750 <.L9>

00003780 <.L10>:
    3780:	3c9030ef          	jal	ra,7348 <__clzsi2>

00003784 <.LVL36>:
    3784:	06050513          	addi	a0,a0,96
    3788:	fc9ff06f          	j	3750 <.L9>

0000378c <.L11>:
    378c:	ffc00613          	li	a2,-4
    3790:	02c78633          	mul	a2,a5,a2
    3794:	03c10713          	addi	a4,sp,60

00003798 <.LBB11>:
    3798:	00300693          	li	a3,3

0000379c <.L13>:
    379c:	00c705b3          	add	a1,a4,a2
    37a0:	0005a583          	lw	a1,0(a1)
    37a4:	fff68693          	addi	a3,a3,-1

000037a8 <.LVL40>:
    37a8:	ffc70713          	addi	a4,a4,-4
    37ac:	00b72223          	sw	a1,4(a4)

000037b0 <.LVL41>:
    37b0:	fef6d6e3          	bge	a3,a5,379c <.L13>
    37b4:	fff78713          	addi	a4,a5,-1

000037b8 <.L14>:
    37b8:	00170793          	addi	a5,a4,1
    37bc:	00279793          	slli	a5,a5,0x2
    37c0:	00800693          	li	a3,8
    37c4:	03010713          	addi	a4,sp,48
    37c8:	00d7ea63          	bltu	a5,a3,37dc <.L16>
    37cc:	02012823          	sw	zero,48(sp)
    37d0:	00072223          	sw	zero,4(a4)
    37d4:	ff878793          	addi	a5,a5,-8
    37d8:	03810713          	addi	a4,sp,56

000037dc <.L16>:
    37dc:	00400693          	li	a3,4
    37e0:	00d7e463          	bltu	a5,a3,37e8 <.L17>
    37e4:	00072023          	sw	zero,0(a4)

000037e8 <.L17>:
    37e8:	ffffc637          	lui	a2,0xffffc
    37ec:	01160613          	addi	a2,a2,17 # ffffc011 <.LLST3+0xffff17b6>
    37f0:	40a604b3          	sub	s1,a2,a0

000037f4 <.LVL43>:
    37f4:	e11ff06f          	j	3604 <.L197>

000037f8 <.L15>:
    37f8:	00072803          	lw	a6,0(a4)
    37fc:	ffc72883          	lw	a7,-4(a4)
    3800:	00c70e33          	add	t3,a4,a2
    3804:	00d81833          	sll	a6,a6,a3
    3808:	00b8d8b3          	srl	a7,a7,a1
    380c:	01186833          	or	a6,a6,a7
    3810:	010e2023          	sw	a6,0(t3)
    3814:	ffc70713          	addi	a4,a4,-4
    3818:	f01ff06f          	j	3718 <.L12>

0000381c <.L3>:
    381c:	00a7e7b3          	or	a5,a5,a0
    3820:	00d7e7b3          	or	a5,a5,a3
    3824:	00e7e7b3          	or	a5,a5,a4

00003828 <.LBB21>:
    3828:	00060493          	mv	s1,a2

0000382c <.LBE21>:
    382c:	00200b93          	li	s7,2
    3830:	dc078ce3          	beqz	a5,3608 <.L5>
    3834:	00300b93          	li	s7,3
    3838:	dd1ff06f          	j	3608 <.L5>

0000383c <.L149>:
    383c:	00000493          	li	s1,0

00003840 <.LBE22>:
    3840:	00100b93          	li	s7,1
    3844:	dc5ff06f          	j	3608 <.L5>

00003848 <.L18>:
    3848:	016967b3          	or	a5,s2,s6

0000384c <.LVL49>:
    384c:	0157e7b3          	or	a5,a5,s5
    3850:	00a7e7b3          	or	a5,a5,a0
    3854:	14078c63          	beqz	a5,39ac <.L151>

00003858 <.LBB23>:
    3858:	04050c63          	beqz	a0,38b0 <.L22>
    385c:	2ed030ef          	jal	ra,7348 <__clzsi2>

00003860 <.LBB16>:
    3860:	ff450693          	addi	a3,a0,-12

00003864 <.LVL51>:
    3864:	02000613          	li	a2,32
    3868:	40d60633          	sub	a2,a2,a3

0000386c <.LVL52>:
    386c:	00000793          	li	a5,0

00003870 <.L23>:
    3870:	ffc00593          	li	a1,-4
    3874:	02b785b3          	mul	a1,a5,a1
    3878:	04010313          	addi	t1,sp,64
    387c:	00c58713          	addi	a4,a1,12
    3880:	00e30733          	add	a4,t1,a4
    3884:	40b005b3          	neg	a1,a1

00003888 <.L28>:
    3888:	0ee31263          	bne	t1,a4,396c <.L31>
    388c:	fff78713          	addi	a4,a5,-1

00003890 <.LVL54>:
    3890:	00279793          	slli	a5,a5,0x2
    3894:	03010613          	addi	a2,sp,48

00003898 <.LVL55>:
    3898:	04078793          	addi	a5,a5,64
    389c:	00c787b3          	add	a5,a5,a2
    38a0:	04012603          	lw	a2,64(sp)
    38a4:	00d616b3          	sll	a3,a2,a3

000038a8 <.LVL56>:
    38a8:	fcd7a823          	sw	a3,-48(a5)
    38ac:	0800006f          	j	392c <.L30>

000038b0 <.L22>:
    38b0:	020a8663          	beqz	s5,38dc <.L24>
    38b4:	000a8513          	mv	a0,s5
    38b8:	291030ef          	jal	ra,7348 <__clzsi2>

000038bc <.LVL58>:
    38bc:	02050513          	addi	a0,a0,32

000038c0 <.L25>:
    38c0:	ff450693          	addi	a3,a0,-12
    38c4:	4056d793          	srai	a5,a3,0x5

000038c8 <.LVL60>:
    38c8:	01f6f693          	andi	a3,a3,31

000038cc <.LVL61>:
    38cc:	02068a63          	beqz	a3,3900 <.L27>
    38d0:	02000613          	li	a2,32
    38d4:	40d60633          	sub	a2,a2,a3

000038d8 <.LVL62>:
    38d8:	f99ff06f          	j	3870 <.L23>

000038dc <.L24>:
    38dc:	00090a63          	beqz	s2,38f0 <.L26>
    38e0:	00090513          	mv	a0,s2
    38e4:	265030ef          	jal	ra,7348 <__clzsi2>

000038e8 <.LVL64>:
    38e8:	04050513          	addi	a0,a0,64
    38ec:	fd5ff06f          	j	38c0 <.L25>

000038f0 <.L26>:
    38f0:	000b0513          	mv	a0,s6
    38f4:	255030ef          	jal	ra,7348 <__clzsi2>

000038f8 <.LVL67>:
    38f8:	06050513          	addi	a0,a0,96
    38fc:	fc5ff06f          	j	38c0 <.L25>

00003900 <.L27>:
    3900:	ffc00613          	li	a2,-4
    3904:	02c78633          	mul	a2,a5,a2
    3908:	04c10713          	addi	a4,sp,76

0000390c <.LBB18>:
    390c:	00300693          	li	a3,3

00003910 <.L29>:
    3910:	00c705b3          	add	a1,a4,a2
    3914:	0005a583          	lw	a1,0(a1)
    3918:	fff68693          	addi	a3,a3,-1

0000391c <.LVL71>:
    391c:	ffc70713          	addi	a4,a4,-4
    3920:	00b72223          	sw	a1,4(a4)

00003924 <.LVL72>:
    3924:	fef6d6e3          	bge	a3,a5,3910 <.L29>
    3928:	fff78713          	addi	a4,a5,-1

0000392c <.L30>:
    392c:	00170793          	addi	a5,a4,1
    3930:	00279793          	slli	a5,a5,0x2
    3934:	00800693          	li	a3,8
    3938:	04010713          	addi	a4,sp,64
    393c:	00d7ea63          	bltu	a5,a3,3950 <.L32>
    3940:	04012023          	sw	zero,64(sp)
    3944:	00072223          	sw	zero,4(a4)
    3948:	ff878793          	addi	a5,a5,-8
    394c:	04810713          	addi	a4,sp,72

00003950 <.L32>:
    3950:	00400693          	li	a3,4
    3954:	00d7e463          	bltu	a5,a3,395c <.L33>
    3958:	00072023          	sw	zero,0(a4)

0000395c <.L33>:
    395c:	ffffc7b7          	lui	a5,0xffffc
    3960:	01178793          	addi	a5,a5,17 # ffffc011 <.LLST3+0xffff17b6>
    3964:	40a787b3          	sub	a5,a5,a0
    3968:	d31ff06f          	j	3698 <.L198>

0000396c <.L31>:
    396c:	00072803          	lw	a6,0(a4)
    3970:	ffc72883          	lw	a7,-4(a4)
    3974:	00b70e33          	add	t3,a4,a1
    3978:	00d81833          	sll	a6,a6,a3
    397c:	00c8d8b3          	srl	a7,a7,a2
    3980:	01186833          	or	a6,a6,a7
    3984:	010e2023          	sw	a6,0(t3)
    3988:	ffc70713          	addi	a4,a4,-4
    398c:	efdff06f          	j	3888 <.L28>

00003990 <.L19>:
    3990:	01696933          	or	s2,s2,s6
    3994:	01596933          	or	s2,s2,s5
    3998:	00a96933          	or	s2,s2,a0
    399c:	00200713          	li	a4,2
    39a0:	ce090ee3          	beqz	s2,369c <.L21>
    39a4:	00300713          	li	a4,3
    39a8:	cf5ff06f          	j	369c <.L21>

000039ac <.L151>:
    39ac:	00000793          	li	a5,0

000039b0 <.LBE24>:
    39b0:	00100713          	li	a4,1

000039b4 <.LVL77>:
    39b4:	ce9ff06f          	j	369c <.L21>

000039b8 <.L34>:
    39b8:	03c12503          	lw	a0,60(sp)
    39bc:	04c12583          	lw	a1,76(sp)
    39c0:	06012623          	sw	zero,108(sp)
    39c4:	06012423          	sw	zero,104(sp)
    39c8:	06012223          	sw	zero,100(sp)
    39cc:	06012023          	sw	zero,96(sp)
    39d0:	03012783          	lw	a5,48(sp)
    39d4:	03412703          	lw	a4,52(sp)

000039d8 <.LVL79>:
    39d8:	04812683          	lw	a3,72(sp)
    39dc:	02a5e463          	bltu	a1,a0,3a04 <.L41>
    39e0:	14b51e63          	bne	a0,a1,3b3c <.L42>
    39e4:	03812583          	lw	a1,56(sp)
    39e8:	00b6ee63          	bltu	a3,a1,3a04 <.L41>
    39ec:	14d59863          	bne	a1,a3,3b3c <.L42>
    39f0:	04412683          	lw	a3,68(sp)
    39f4:	00e6e863          	bltu	a3,a4,3a04 <.L41>
    39f8:	14e69263          	bne	a3,a4,3b3c <.L42>
    39fc:	04012703          	lw	a4,64(sp)
    3a00:	12e7ee63          	bltu	a5,a4,3b3c <.L42>

00003a04 <.L41>:
    3a04:	01f79793          	slli	a5,a5,0x1f
    3a08:	06f12623          	sw	a5,108(sp)

00003a0c <.LBB26>:
    3a0c:	03c10593          	addi	a1,sp,60
    3a10:	03010793          	addi	a5,sp,48

00003a14 <.L43>:
    3a14:	0007a703          	lw	a4,0(a5)
    3a18:	0047a683          	lw	a3,4(a5)
    3a1c:	00478793          	addi	a5,a5,4
    3a20:	00175713          	srli	a4,a4,0x1
    3a24:	01f69693          	slli	a3,a3,0x1f
    3a28:	00d76733          	or	a4,a4,a3
    3a2c:	fee7ae23          	sw	a4,-4(a5)
    3a30:	fef592e3          	bne	a1,a5,3a14 <.L43>

00003a34 <.LVL82>:
    3a34:	03c12783          	lw	a5,60(sp)
    3a38:	0017d793          	srli	a5,a5,0x1
    3a3c:	02f12e23          	sw	a5,60(sp)

00003a40 <.L44>:
    3a40:	04010593          	addi	a1,sp,64
    3a44:	04c10793          	addi	a5,sp,76

00003a48 <.L45>:
    3a48:	0007a703          	lw	a4,0(a5)
    3a4c:	ffc7a683          	lw	a3,-4(a5)
    3a50:	ffc78793          	addi	a5,a5,-4
    3a54:	00c71713          	slli	a4,a4,0xc
    3a58:	0146d693          	srli	a3,a3,0x14
    3a5c:	00d76733          	or	a4,a4,a3
    3a60:	00e7a223          	sw	a4,4(a5)
    3a64:	fef592e3          	bne	a1,a5,3a48 <.L45>

00003a68 <.LBE27>:
    3a68:	04c12283          	lw	t0,76(sp)

00003a6c <.LBB28>:
    3a6c:	04012803          	lw	a6,64(sp)

00003a70 <.LBB29>:
    3a70:	00010f37          	lui	t5,0x10

00003a74 <.LBB30>:
    3a74:	04412883          	lw	a7,68(sp)

00003a78 <.LBB54>:
    3a78:	ffff0f13          	addi	t5,t5,-1 # ffff <.LLST3+0x57a4>

00003a7c <.LBB55>:
    3a7c:	00c81813          	slli	a6,a6,0xc

00003a80 <.LBB56>:
    3a80:	01e2f7b3          	and	a5,t0,t5

00003a84 <.LBB32>:
    3a84:	04812e83          	lw	t4,72(sp)

00003a88 <.LBB58>:
    3a88:	00f12e23          	sw	a5,28(sp)

00003a8c <.LBB33>:
    3a8c:	01085793          	srli	a5,a6,0x10
    3a90:	00f12423          	sw	a5,8(sp)

00003a94 <.LBB34>:
    3a94:	0108d793          	srli	a5,a7,0x10
    3a98:	00f12623          	sw	a5,12(sp)
    3a9c:	01e8f7b3          	and	a5,a7,t5
    3aa0:	00f12a23          	sw	a5,20(sp)

00003aa4 <.LBB35>:
    3aa4:	010ed793          	srli	a5,t4,0x10
    3aa8:	00f12823          	sw	a5,16(sp)
    3aac:	01eef7b3          	and	a5,t4,t5
    3ab0:	00f12c23          	sw	a5,24(sp)
    3ab4:	01e877b3          	and	a5,a6,t5
    3ab8:	02f12023          	sw	a5,32(sp)
    3abc:	03812503          	lw	a0,56(sp)

00003ac0 <.LBB60>:
    3ac0:	410887b3          	sub	a5,a7,a6
    3ac4:	03c12683          	lw	a3,60(sp)
    3ac8:	03412583          	lw	a1,52(sp)
    3acc:	03012703          	lw	a4,48(sp)
    3ad0:	02f12223          	sw	a5,36(sp)
    3ad4:	411e87b3          	sub	a5,t4,a7

00003ad8 <.LBB61>:
    3ad8:	0102dd13          	srli	s10,t0,0x10
    3adc:	05010a13          	addi	s4,sp,80

00003ae0 <.LVL86>:
    3ae0:	06010c13          	addi	s8,sp,96

00003ae4 <.LBE61>:
    3ae4:	00300c93          	li	s9,3

00003ae8 <.LBB62>:
    3ae8:	00010db7          	lui	s11,0x10

00003aec <.LBB63>:
    3aec:	02f12423          	sw	a5,40(sp)

00003af0 <.L116>:
    3af0:	12d29a63          	bne	t0,a3,3c24 <.L46>
    3af4:	fff00793          	li	a5,-1
    3af8:	00fa2623          	sw	a5,12(s4) # 8000000c <.LLST3+0x7fff57b1>
    3afc:	400c8663          	beqz	s9,3f08 <.L117>

00003b00 <.LBB64>:
    3b00:	00cc2483          	lw	s1,12(s8)

00003b04 <.LVL88>:
    3b04:	40e807b3          	sub	a5,a6,a4
    3b08:	00f83e33          	sltu	t3,a6,a5
    3b0c:	40b88333          	sub	t1,a7,a1
    3b10:	009039b3          	snez	s3,s1

00003b14 <.LVL89>:
    3b14:	000e0a93          	mv	s5,t3

00003b18 <.LVL90>:
    3b18:	01c033b3          	snez	t2,t3

00003b1c <.LVL91>:
    3b1c:	0068bfb3          	sltu	t6,a7,t1
    3b20:	02048263          	beqz	s1,3b44 <.L52>
    3b24:	02e81063          	bne	a6,a4,3b44 <.L52>

00003b28 <.LVL92>:
    3b28:	fff30313          	addi	t1,t1,-1

00003b2c <.L53>:
    3b2c:	40b883b3          	sub	t2,a7,a1
    3b30:	0013b393          	seqz	t2,t2
    3b34:	00100a93          	li	s5,1
    3b38:	0180006f          	j	3b50 <.L54>

00003b3c <.L42>:
    3b3c:	fff60613          	addi	a2,a2,-1
    3b40:	f01ff06f          	j	3a40 <.L44>

00003b44 <.L52>:
    3b44:	40730333          	sub	t1,t1,t2

00003b48 <.LVL97>:
    3b48:	00000393          	li	t2,0

00003b4c <.LVL98>:
    3b4c:	fe0e10e3          	bnez	t3,3b2c <.L53>

00003b50 <.L54>:
    3b50:	02412e03          	lw	t3,36(sp)

00003b54 <.LBB67>:
    3b54:	01f3e3b3          	or	t2,t2,t6

00003b58 <.LBB68>:
    3b58:	02812f83          	lw	t6,40(sp)
    3b5c:	00ee0733          	add	a4,t3,a4
    3b60:	009804b3          	add	s1,a6,s1

00003b64 <.LVL101>:
    3b64:	00bf8fb3          	add	t6,t6,a1
    3b68:	01370733          	add	a4,a4,s3

00003b6c <.LVL102>:
    3b6c:	00983e33          	sltu	t3,a6,s1
    3b70:	015f8fb3          	add	t6,t6,s5
    3b74:	00e8bb33          	sltu	s6,a7,a4

00003b78 <.LVL103>:
    3b78:	41c70e33          	sub	t3,a4,t3

00003b7c <.LVL104>:
    3b7c:	01feb5b3          	sltu	a1,t4,t6
    3b80:	00987e63          	bgeu	a6,s1,3b9c <.L55>

00003b84 <.LBB69>:
    3b84:	413787b3          	sub	a5,a5,s3

00003b88 <.LBB70>:
    3b88:	01179a63          	bne	a5,a7,3b9c <.L55>

00003b8c <.LVL106>:
    3b8c:	ffff8f93          	addi	t6,t6,-1

00003b90 <.L56>:
    3b90:	406e8333          	sub	t1,t4,t1

00003b94 <.LVL108>:
    3b94:	00133993          	seqz	s3,t1
    3b98:	0100006f          	j	3ba8 <.L57>

00003b9c <.L55>:
    3b9c:	416f8fb3          	sub	t6,t6,s6

00003ba0 <.LVL110>:
    3ba0:	00000993          	li	s3,0

00003ba4 <.LVL111>:
    3ba4:	fee8e6e3          	bltu	a7,a4,3b90 <.L56>

00003ba8 <.L57>:
    3ba8:	41d687b3          	sub	a5,a3,t4
    3bac:	00a787b3          	add	a5,a5,a0
    3bb0:	007787b3          	add	a5,a5,t2
    3bb4:	00b9e9b3          	or	s3,s3,a1

00003bb8 <.LVL113>:
    3bb8:	413787b3          	sub	a5,a5,s3

00003bbc <.LBE70>:
    3bbc:	04f6f463          	bgeu	a3,a5,3c04 <.L58>
    3bc0:	011e0533          	add	a0,t3,a7
    3bc4:	009804b3          	add	s1,a6,s1

00003bc8 <.LVL114>:
    3bc8:	01c535b3          	sltu	a1,a0,t3

00003bcc <.LBB71>:
    3bcc:	0104be33          	sltu	t3,s1,a6

00003bd0 <.LVL115>:
    3bd0:	01c50e33          	add	t3,a0,t3

00003bd4 <.LBE71>:
    3bd4:	ffe00713          	li	a4,-2

00003bd8 <.LBB72>:
    3bd8:	00ae3533          	sltu	a0,t3,a0

00003bdc <.LBE72>:
    3bdc:	00ea2623          	sw	a4,12(s4)

00003be0 <.LBB73>:
    3be0:	00a5e5b3          	or	a1,a1,a0
    3be4:	01fe8733          	add	a4,t4,t6

00003be8 <.LVL118>:
    3be8:	00b705b3          	add	a1,a4,a1
    3bec:	00058f93          	mv	t6,a1

00003bf0 <.LVL119>:
    3bf0:	01d735b3          	sltu	a1,a4,t4

00003bf4 <.LVL120>:
    3bf4:	00efb733          	sltu	a4,t6,a4

00003bf8 <.LVL121>:
    3bf8:	00e5e5b3          	or	a1,a1,a4

00003bfc <.LVL122>:
    3bfc:	00d786b3          	add	a3,a5,a3
    3c00:	00d587b3          	add	a5,a1,a3

00003c04 <.L58>:
    3c04:	fffc8c93          	addi	s9,s9,-1
    3c08:	ffca0a13          	addi	s4,s4,-4
    3c0c:	ffcc0c13          	addi	s8,s8,-4
    3c10:	000f8513          	mv	a0,t6
    3c14:	000e0593          	mv	a1,t3
    3c18:	00048713          	mv	a4,s1
    3c1c:	00078693          	mv	a3,a5
    3c20:	ed1ff06f          	j	3af0 <.L116>

00003c24 <.L46>:
    3c24:	03a6d333          	divu	t1,a3,s10

00003c28 <.LVL126>:
    3c28:	01c12783          	lw	a5,28(sp)
    3c2c:	01055e13          	srli	t3,a0,0x10
    3c30:	03a6f6b3          	remu	a3,a3,s10

00003c34 <.LVL127>:
    3c34:	00030f93          	mv	t6,t1
    3c38:	026787b3          	mul	a5,a5,t1

00003c3c <.LVL128>:
    3c3c:	01069693          	slli	a3,a3,0x10

00003c40 <.LVL129>:
    3c40:	00de66b3          	or	a3,t3,a3

00003c44 <.LVL130>:
    3c44:	00f6fe63          	bgeu	a3,a5,3c60 <.L69>
    3c48:	00d286b3          	add	a3,t0,a3

00003c4c <.LVL131>:
    3c4c:	fff30f93          	addi	t6,t1,-1

00003c50 <.LVL132>:
    3c50:	0056e863          	bltu	a3,t0,3c60 <.L69>
    3c54:	00f6f663          	bgeu	a3,a5,3c60 <.L69>
    3c58:	ffe30f93          	addi	t6,t1,-2
    3c5c:	005686b3          	add	a3,a3,t0

00003c60 <.L69>:
    3c60:	40f686b3          	sub	a3,a3,a5

00003c64 <.LVL135>:
    3c64:	03a6d333          	divu	t1,a3,s10

00003c68 <.LVL136>:
    3c68:	01c12783          	lw	a5,28(sp)

00003c6c <.LVL137>:
    3c6c:	01e57533          	and	a0,a0,t5
    3c70:	03a6f6b3          	remu	a3,a3,s10

00003c74 <.LVL138>:
    3c74:	026787b3          	mul	a5,a5,t1

00003c78 <.LVL139>:
    3c78:	01069693          	slli	a3,a3,0x10

00003c7c <.LVL140>:
    3c7c:	00d56533          	or	a0,a0,a3

00003c80 <.LVL141>:
    3c80:	00030693          	mv	a3,t1
    3c84:	00f57e63          	bgeu	a0,a5,3ca0 <.L72>
    3c88:	00a28533          	add	a0,t0,a0

00003c8c <.LVL142>:
    3c8c:	fff30693          	addi	a3,t1,-1

00003c90 <.LVL143>:
    3c90:	00556863          	bltu	a0,t0,3ca0 <.L72>
    3c94:	00f57663          	bgeu	a0,a5,3ca0 <.L72>
    3c98:	ffe30693          	addi	a3,t1,-2
    3c9c:	00550533          	add	a0,a0,t0

00003ca0 <.L72>:
    3ca0:	02012303          	lw	t1,32(sp)

00003ca4 <.LBB76>:
    3ca4:	010f9f93          	slli	t6,t6,0x10

00003ca8 <.LVL146>:
    3ca8:	00dfefb3          	or	t6,t6,a3

00003cac <.LBB37>:
    3cac:	010fd393          	srli	t2,t6,0x10
    3cb0:	026384b3          	mul	s1,t2,t1

00003cb4 <.LBB78>:
    3cb4:	40f507b3          	sub	a5,a0,a5

00003cb8 <.LBB38>:
    3cb8:	00812303          	lw	t1,8(sp)
    3cbc:	02012503          	lw	a0,32(sp)
    3cc0:	01eff6b3          	and	a3,t6,t5

00003cc4 <.LBB80>:
    3cc4:	01fa2623          	sw	t6,12(s4)

00003cc8 <.LBB39>:
    3cc8:	02d50533          	mul	a0,a0,a3

00003ccc <.LVL150>:
    3ccc:	02638e33          	mul	t3,t2,t1

00003cd0 <.LVL151>:
    3cd0:	01055993          	srli	s3,a0,0x10
    3cd4:	02d30333          	mul	t1,t1,a3

00003cd8 <.LVL152>:
    3cd8:	00930333          	add	t1,t1,s1

00003cdc <.LVL153>:
    3cdc:	00698333          	add	t1,s3,t1

00003ce0 <.LVL154>:
    3ce0:	00937463          	bgeu	t1,s1,3ce8 <.L75>
    3ce4:	01be0e33          	add	t3,t3,s11

00003ce8 <.L75>:
    3ce8:	01035493          	srli	s1,t1,0x10

00003cec <.LVL156>:
    3cec:	01e37333          	and	t1,t1,t5

00003cf0 <.LVL157>:
    3cf0:	01e57533          	and	a0,a0,t5

00003cf4 <.LVL158>:
    3cf4:	01031313          	slli	t1,t1,0x10
    3cf8:	01c484b3          	add	s1,s1,t3

00003cfc <.LVL159>:
    3cfc:	00a30333          	add	t1,t1,a0

00003d00 <.LBB40>:
    3d00:	00c12e03          	lw	t3,12(sp)

00003d04 <.LVL161>:
    3d04:	01412503          	lw	a0,20(sp)
    3d08:	03c38ab3          	mul	s5,t2,t3
    3d0c:	02d509b3          	mul	s3,a0,a3

00003d10 <.LVL162>:
    3d10:	02de0e33          	mul	t3,t3,a3

00003d14 <.LVL163>:
    3d14:	0109db13          	srli	s6,s3,0x10
    3d18:	02a38533          	mul	a0,t2,a0

00003d1c <.LVL164>:
    3d1c:	00ae0e33          	add	t3,t3,a0

00003d20 <.LVL165>:
    3d20:	01cb0e33          	add	t3,s6,t3

00003d24 <.LVL166>:
    3d24:	00ae7463          	bgeu	t3,a0,3d2c <.L76>
    3d28:	01ba8ab3          	add	s5,s5,s11

00003d2c <.L76>:
    3d2c:	01ee7533          	and	a0,t3,t5
    3d30:	01e9f9b3          	and	s3,s3,t5

00003d34 <.LVL168>:
    3d34:	01051513          	slli	a0,a0,0x10
    3d38:	01350533          	add	a0,a0,s3
    3d3c:	00a48533          	add	a0,s1,a0

00003d40 <.LBB43>:
    3d40:	01812983          	lw	s3,24(sp)

00003d44 <.LBB45>:
    3d44:	009534b3          	sltu	s1,a0,s1

00003d48 <.LBB46>:
    3d48:	010e5e13          	srli	t3,t3,0x10

00003d4c <.LBB47>:
    3d4c:	009e0e33          	add	t3,t3,s1
    3d50:	015e0e33          	add	t3,t3,s5

00003d54 <.LBB48>:
    3d54:	03338ab3          	mul	s5,t2,s3

00003d58 <.LVL173>:
    3d58:	01012983          	lw	s3,16(sp)
    3d5c:	01812483          	lw	s1,24(sp)
    3d60:	033389b3          	mul	s3,t2,s3
    3d64:	01012383          	lw	t2,16(sp)

00003d68 <.LVL174>:
    3d68:	02d484b3          	mul	s1,s1,a3

00003d6c <.LVL175>:
    3d6c:	02d386b3          	mul	a3,t2,a3

00003d70 <.LVL176>:
    3d70:	0104d393          	srli	t2,s1,0x10
    3d74:	015686b3          	add	a3,a3,s5

00003d78 <.LVL177>:
    3d78:	00d386b3          	add	a3,t2,a3

00003d7c <.LVL178>:
    3d7c:	0156f463          	bgeu	a3,s5,3d84 <.L79>
    3d80:	01b989b3          	add	s3,s3,s11

00003d84 <.L79>:
    3d84:	01e6f3b3          	and	t2,a3,t5
    3d88:	01039393          	slli	t2,t2,0x10
    3d8c:	01e4f4b3          	and	s1,s1,t5

00003d90 <.LVL180>:
    3d90:	009383b3          	add	t2,t2,s1
    3d94:	007e03b3          	add	t2,t3,t2

00003d98 <.LBB51>:
    3d98:	0106d693          	srli	a3,a3,0x10

00003d9c <.LBB53>:
    3d9c:	01c3be33          	sltu	t3,t2,t3

00003da0 <.LVL183>:
    3da0:	01c686b3          	add	a3,a3,t3
    3da4:	013686b3          	add	a3,a3,s3

00003da8 <.LBE53>:
    3da8:	00cc2983          	lw	s3,12(s8)

00003dac <.LVL185>:
    3dac:	00d7ee63          	bltu	a5,a3,3dc8 <.L82>
    3db0:	0ef69463          	bne	a3,a5,3e98 <.L83>
    3db4:	0075ea63          	bltu	a1,t2,3dc8 <.L82>
    3db8:	0e759063          	bne	a1,t2,3e98 <.L83>
    3dbc:	00a76663          	bltu	a4,a0,3dc8 <.L82>
    3dc0:	0ca71c63          	bne	a4,a0,3e98 <.L83>
    3dc4:	0c69fa63          	bgeu	s3,t1,3e98 <.L83>

00003dc8 <.L82>:
    3dc8:	ffff8e13          	addi	t3,t6,-1
    3dcc:	01380ab3          	add	s5,a6,s3

00003dd0 <.LVL186>:
    3dd0:	00e88b33          	add	s6,a7,a4

00003dd4 <.LVL187>:
    3dd4:	01ca2623          	sw	t3,12(s4)

00003dd8 <.LBB82>:
    3dd8:	010abe33          	sltu	t3,s5,a6
    3ddc:	01cb04b3          	add	s1,s6,t3
    3de0:	03c12623          	sw	t3,44(sp)
    3de4:	011b3e33          	sltu	t3,s6,a7
    3de8:	0164bb33          	sltu	s6,s1,s6
    3dec:	00be8bb3          	add	s7,t4,a1
    3df0:	016e6e33          	or	t3,t3,s6
    3df4:	01cb8e33          	add	t3,s7,t3
    3df8:	01dbbb33          	sltu	s6,s7,t4
    3dfc:	017e3bb3          	sltu	s7,t3,s7
    3e00:	017b6b33          	or	s6,s6,s7
    3e04:	005b0b33          	add	s6,s6,t0
    3e08:	016787b3          	add	a5,a5,s6

00003e0c <.LVL188>:
    3e0c:	000a8993          	mv	s3,s5

00003e10 <.LVL189>:
    3e10:	00048713          	mv	a4,s1
    3e14:	000e0593          	mv	a1,t3

00003e18 <.LBE82>:
    3e18:	02f2e063          	bltu	t0,a5,3e38 <.L94>
    3e1c:	06f29e63          	bne	t0,a5,3e98 <.L83>
    3e20:	01ceec63          	bltu	t4,t3,3e38 <.L94>
    3e24:	07ce9a63          	bne	t4,t3,3e98 <.L83>
    3e28:	0098e863          	bltu	a7,s1,3e38 <.L94>
    3e2c:	06989663          	bne	a7,s1,3e98 <.L83>
    3e30:	010abb33          	sltu	s6,s5,a6
    3e34:	060b1263          	bnez	s6,3e98 <.L83>

00003e38 <.L94>:
    3e38:	00d7ee63          	bltu	a5,a3,3e54 <.L95>
    3e3c:	04f69e63          	bne	a3,a5,3e98 <.L83>
    3e40:	007e6a63          	bltu	t3,t2,3e54 <.L95>
    3e44:	047e1a63          	bne	t3,t2,3e98 <.L83>
    3e48:	00a4e663          	bltu	s1,a0,3e54 <.L95>
    3e4c:	04a49663          	bne	s1,a0,3e98 <.L83>
    3e50:	046af463          	bgeu	s5,t1,3e98 <.L83>

00003e54 <.L95>:
    3e54:	01580ab3          	add	s5,a6,s5
    3e58:	009884b3          	add	s1,a7,s1

00003e5c <.LBB83>:
    3e5c:	010ab733          	sltu	a4,s5,a6
    3e60:	00e48733          	add	a4,s1,a4
    3e64:	0114b5b3          	sltu	a1,s1,a7
    3e68:	009734b3          	sltu	s1,a4,s1
    3e6c:	01ce8e33          	add	t3,t4,t3
    3e70:	0095e5b3          	or	a1,a1,s1

00003e74 <.LBE83>:
    3e74:	ffef8f93          	addi	t6,t6,-2

00003e78 <.LVL191>:
    3e78:	00be05b3          	add	a1,t3,a1
    3e7c:	01fa2623          	sw	t6,12(s4)

00003e80 <.LBB84>:
    3e80:	01de3fb3          	sltu	t6,t3,t4

00003e84 <.LVL193>:
    3e84:	01c5be33          	sltu	t3,a1,t3
    3e88:	01cfefb3          	or	t6,t6,t3
    3e8c:	005f8fb3          	add	t6,t6,t0
    3e90:	000a8993          	mv	s3,s5

00003e94 <.LVL194>:
    3e94:	01f787b3          	add	a5,a5,t6

00003e98 <.L83>:
    3e98:	40698ab3          	sub	s5,s3,t1
    3e9c:	40a70e33          	sub	t3,a4,a0
    3ea0:	0159bbb3          	sltu	s7,s3,s5
    3ea4:	01c73b33          	sltu	s6,a4,t3
    3ea8:	417e0e33          	sub	t3,t3,s7
    3eac:	40758bb3          	sub	s7,a1,t2
    3eb0:	000a8493          	mv	s1,s5

00003eb4 <.LVL196>:
    3eb4:	000b0f93          	mv	t6,s6

00003eb8 <.LVL197>:
    3eb8:	0175b5b3          	sltu	a1,a1,s7

00003ebc <.LVL198>:
    3ebc:	0159fa63          	bgeu	s3,s5,3ed0 <.L112>
    3ec0:	00a71863          	bne	a4,a0,3ed0 <.L112>

00003ec4 <.LVL199>:
    3ec4:	fffb8f93          	addi	t6,s7,-1

00003ec8 <.L113>:
    3ec8:	001bb713          	seqz	a4,s7
    3ecc:	0100006f          	j	3edc <.L114>

00003ed0 <.L112>:
    3ed0:	41fb8fb3          	sub	t6,s7,t6

00003ed4 <.LVL202>:
    3ed4:	00000713          	li	a4,0

00003ed8 <.LVL203>:
    3ed8:	fe0b18e3          	bnez	s6,3ec8 <.L113>

00003edc <.L114>:
    3edc:	40d787b3          	sub	a5,a5,a3

00003ee0 <.LVL205>:
    3ee0:	00b76733          	or	a4,a4,a1

00003ee4 <.LVL206>:
    3ee4:	40e787b3          	sub	a5,a5,a4

00003ee8 <.LBE85>:
    3ee8:	d00c9ee3          	bnez	s9,3c04 <.L58>
    3eec:	01531863          	bne	t1,s5,3efc <.L115>
    3ef0:	00ae1663          	bne	t3,a0,3efc <.L115>
    3ef4:	01f39463          	bne	t2,t6,3efc <.L115>
    3ef8:	00f68863          	beq	a3,a5,3f08 <.L117>

00003efc <.L115>:
    3efc:	05012783          	lw	a5,80(sp)
    3f00:	0017e793          	ori	a5,a5,1
    3f04:	04f12823          	sw	a5,80(sp)

00003f08 <.L117>:
    3f08:	000047b7          	lui	a5,0x4
    3f0c:	fff78793          	addi	a5,a5,-1 # 3fff <.LVL227+0x3>
    3f10:	00f607b3          	add	a5,a2,a5

00003f14 <.LVL208>:
    3f14:	1cf05263          	blez	a5,40d8 <.L119>
    3f18:	05012703          	lw	a4,80(sp)
    3f1c:	00777693          	andi	a3,a4,7
    3f20:	04068463          	beqz	a3,3f68 <.L120>
    3f24:	00f77693          	andi	a3,a4,15
    3f28:	00400593          	li	a1,4
    3f2c:	02b68e63          	beq	a3,a1,3f68 <.L120>

00003f30 <.LBB87>:
    3f30:	00470713          	addi	a4,a4,4
    3f34:	00473693          	sltiu	a3,a4,4
    3f38:	04e12823          	sw	a4,80(sp)

00003f3c <.LVL209>:
    3f3c:	05412703          	lw	a4,84(sp)

00003f40 <.LVL210>:
    3f40:	00e68733          	add	a4,a3,a4
    3f44:	04e12a23          	sw	a4,84(sp)

00003f48 <.LVL211>:
    3f48:	00d73733          	sltu	a4,a4,a3

00003f4c <.LVL212>:
    3f4c:	05812683          	lw	a3,88(sp)
    3f50:	00e68733          	add	a4,a3,a4

00003f54 <.LVL213>:
    3f54:	04e12c23          	sw	a4,88(sp)

00003f58 <.LVL214>:
    3f58:	00d73733          	sltu	a4,a4,a3

00003f5c <.LVL215>:
    3f5c:	05c12683          	lw	a3,92(sp)
    3f60:	00d70733          	add	a4,a4,a3

00003f64 <.LVL216>:
    3f64:	04e12e23          	sw	a4,92(sp)

00003f68 <.L120>:
    3f68:	05c12703          	lw	a4,92(sp)
    3f6c:	001006b7          	lui	a3,0x100
    3f70:	00d776b3          	and	a3,a4,a3
    3f74:	00068e63          	beqz	a3,3f90 <.L125>
    3f78:	fff007b7          	lui	a5,0xfff00

00003f7c <.LVL218>:
    3f7c:	fff78793          	addi	a5,a5,-1 # ffefffff <.LLST3+0xffef57a4>
    3f80:	00f77733          	and	a4,a4,a5
    3f84:	000047b7          	lui	a5,0x4

00003f88 <.LVL219>:
    3f88:	04e12e23          	sw	a4,92(sp)
    3f8c:	00f607b3          	add	a5,a2,a5

00003f90 <.L125>:
    3f90:	05010713          	addi	a4,sp,80
    3f94:	05c10593          	addi	a1,sp,92

00003f98 <.L126>:
    3f98:	00072683          	lw	a3,0(a4)
    3f9c:	00472603          	lw	a2,4(a4)
    3fa0:	00470713          	addi	a4,a4,4
    3fa4:	0036d693          	srli	a3,a3,0x3
    3fa8:	01d61613          	slli	a2,a2,0x1d
    3fac:	00c6e6b3          	or	a3,a3,a2
    3fb0:	fed72e23          	sw	a3,-4(a4)
    3fb4:	feb712e3          	bne	a4,a1,3f98 <.L126>

00003fb8 <.LBE88>:
    3fb8:	000086b7          	lui	a3,0x8
    3fbc:	ffe68613          	addi	a2,a3,-2 # 7ffe <.LLST42+0xe>

00003fc0 <.LBB89>:
    3fc0:	05c12703          	lw	a4,92(sp)

00003fc4 <.LBE89>:
    3fc4:	0ef64e63          	blt	a2,a5,40c0 <.L127>

00003fc8 <.LBB90>:
    3fc8:	00375713          	srli	a4,a4,0x3
    3fcc:	04e12e23          	sw	a4,92(sp)

00003fd0 <.L128>:
    3fd0:	00f91913          	slli	s2,s2,0xf

00003fd4 <.LVL224>:
    3fd4:	00f96933          	or	s2,s2,a5

00003fd8 <.LBE91>:
    3fd8:	05012783          	lw	a5,80(sp)

00003fdc <.LBB92>:
    3fdc:	05c12703          	lw	a4,92(sp)
    3fe0:	07211723          	sh	s2,110(sp)

00003fe4 <.LBE92>:
    3fe4:	00f42023          	sw	a5,0(s0)
    3fe8:	05412783          	lw	a5,84(sp)

00003fec <.LBB93>:
    3fec:	06e11623          	sh	a4,108(sp)

00003ff0 <.LBE93>:
    3ff0:	0ac12083          	lw	ra,172(sp)
    3ff4:	00f42223          	sw	a5,4(s0)
    3ff8:	05812783          	lw	a5,88(sp)

00003ffc <.LVL227>:
    3ffc:	00040513          	mv	a0,s0
    4000:	0a412483          	lw	s1,164(sp)
    4004:	00f42423          	sw	a5,8(s0)
    4008:	06c12783          	lw	a5,108(sp)
    400c:	0a012903          	lw	s2,160(sp)
    4010:	09c12983          	lw	s3,156(sp)
    4014:	00f42623          	sw	a5,12(s0)
    4018:	0a812403          	lw	s0,168(sp)
    401c:	09812a03          	lw	s4,152(sp)
    4020:	09412a83          	lw	s5,148(sp)
    4024:	09012b03          	lw	s6,144(sp)
    4028:	08c12b83          	lw	s7,140(sp)
    402c:	08812c03          	lw	s8,136(sp)
    4030:	08412c83          	lw	s9,132(sp)
    4034:	08012d03          	lw	s10,128(sp)
    4038:	07c12d83          	lw	s11,124(sp)
    403c:	0b010113          	addi	sp,sp,176

00004040 <.LVL229>:
    4040:	00008067          	ret

00004044 <.L37>:
    4044:	03012783          	lw	a5,48(sp)

00004048 <.LBB94>:
    4048:	00098913          	mv	s2,s3

0000404c <.LBE94>:
    404c:	04f12823          	sw	a5,80(sp)
    4050:	03412783          	lw	a5,52(sp)
    4054:	04f12a23          	sw	a5,84(sp)
    4058:	03812783          	lw	a5,56(sp)
    405c:	04f12c23          	sw	a5,88(sp)
    4060:	03c12783          	lw	a5,60(sp)

00004064 <.L118>:
    4064:	04f12e23          	sw	a5,92(sp)

00004068 <.LVL233>:
    4068:	00100793          	li	a5,1
    406c:	26fb8c63          	beq	s7,a5,42e4 <.L199>
    4070:	e80b8ce3          	beqz	s7,3f08 <.L117>
    4074:	00200793          	li	a5,2
    4078:	28fb9063          	bne	s7,a5,42f8 <.L35>

0000407c <.L39>:
    407c:	000087b7          	lui	a5,0x8
    4080:	04012e23          	sw	zero,92(sp)
    4084:	04012c23          	sw	zero,88(sp)
    4088:	04012a23          	sw	zero,84(sp)
    408c:	04012823          	sw	zero,80(sp)
    4090:	fff78793          	addi	a5,a5,-1 # 7fff <.LLST42+0xf>
    4094:	f3dff06f          	j	3fd0 <.L128>

00004098 <.L38>:
    4098:	04012783          	lw	a5,64(sp)

0000409c <.LBB95>:
    409c:	000a0913          	mv	s2,s4

000040a0 <.LBE95>:
    40a0:	00070b93          	mv	s7,a4

000040a4 <.LVL237>:
    40a4:	04f12823          	sw	a5,80(sp)
    40a8:	04412783          	lw	a5,68(sp)
    40ac:	04f12a23          	sw	a5,84(sp)
    40b0:	04812783          	lw	a5,72(sp)
    40b4:	04f12c23          	sw	a5,88(sp)
    40b8:	04c12783          	lw	a5,76(sp)

000040bc <.LVL238>:
    40bc:	fa9ff06f          	j	4064 <.L118>

000040c0 <.L127>:
    40c0:	04012e23          	sw	zero,92(sp)
    40c4:	04012c23          	sw	zero,88(sp)
    40c8:	04012a23          	sw	zero,84(sp)
    40cc:	04012823          	sw	zero,80(sp)
    40d0:	fff68793          	addi	a5,a3,-1
    40d4:	efdff06f          	j	3fd0 <.L128>

000040d8 <.L119>:
    40d8:	00100693          	li	a3,1
    40dc:	00078863          	beqz	a5,40ec <.L129>
    40e0:	40f686b3          	sub	a3,a3,a5

000040e4 <.LVL241>:
    40e4:	07400793          	li	a5,116
    40e8:	1cd7ce63          	blt	a5,a3,42c4 <.L130>

000040ec <.L129>:
    40ec:	05010513          	addi	a0,sp,80
    40f0:	4056d713          	srai	a4,a3,0x5

000040f4 <.LVL243>:
    40f4:	00050593          	mv	a1,a0
    40f8:	01f6f693          	andi	a3,a3,31

000040fc <.LVL244>:
    40fc:	00000793          	li	a5,0
    4100:	00000613          	li	a2,0

00004104 <.L131>:
    4104:	02e61e63          	bne	a2,a4,4140 <.L132>
    4108:	00300613          	li	a2,3

0000410c <.LVL246>:
    410c:	40e60633          	sub	a2,a2,a4
    4110:	00271593          	slli	a1,a4,0x2
    4114:	04069063          	bnez	a3,4154 <.L133>
    4118:	00050813          	mv	a6,a0

0000411c <.L134>:
    411c:	00b808b3          	add	a7,a6,a1
    4120:	0008a883          	lw	a7,0(a7)
    4124:	00168693          	addi	a3,a3,1

00004128 <.LVL248>:
    4128:	00480813          	addi	a6,a6,4
    412c:	ff182e23          	sw	a7,-4(a6)

00004130 <.LVL249>:
    4130:	fed656e3          	bge	a2,a3,411c <.L134>
    4134:	00400693          	li	a3,4

00004138 <.LVL250>:
    4138:	40e68733          	sub	a4,a3,a4

0000413c <.LVL251>:
    413c:	06c0006f          	j	41a8 <.L138>

00004140 <.L132>:
    4140:	0005a803          	lw	a6,0(a1)
    4144:	00160613          	addi	a2,a2,1

00004148 <.LVL253>:
    4148:	00458593          	addi	a1,a1,4
    414c:	0107e7b3          	or	a5,a5,a6

00004150 <.LVL254>:
    4150:	fb5ff06f          	j	4104 <.L131>

00004154 <.L133>:
    4154:	04058813          	addi	a6,a1,64
    4158:	03010893          	addi	a7,sp,48
    415c:	01180833          	add	a6,a6,a7
    4160:	fe082803          	lw	a6,-32(a6)
    4164:	02000313          	li	t1,32
    4168:	40d30333          	sub	t1,t1,a3
    416c:	00681833          	sll	a6,a6,t1
    4170:	0107e7b3          	or	a5,a5,a6

00004174 <.LVL256>:
    4174:	00000e13          	li	t3,0
    4178:	00b50833          	add	a6,a0,a1
    417c:	40b005b3          	neg	a1,a1

00004180 <.L136>:
    4180:	0ece4263          	blt	t3,a2,4264 <.L137>
    4184:	00400593          	li	a1,4
    4188:	00261613          	slli	a2,a2,0x2
    418c:	40e58733          	sub	a4,a1,a4

00004190 <.LVL258>:
    4190:	04060613          	addi	a2,a2,64
    4194:	03010593          	addi	a1,sp,48
    4198:	00b60633          	add	a2,a2,a1
    419c:	05c12583          	lw	a1,92(sp)
    41a0:	00d5d6b3          	srl	a3,a1,a3

000041a4 <.LVL259>:
    41a4:	fed62023          	sw	a3,-32(a2)

000041a8 <.L138>:
    41a8:	00400693          	li	a3,4
    41ac:	40e686b3          	sub	a3,a3,a4
    41b0:	00269693          	slli	a3,a3,0x2
    41b4:	00271713          	slli	a4,a4,0x2
    41b8:	00800613          	li	a2,8
    41bc:	00e50733          	add	a4,a0,a4
    41c0:	00c6ea63          	bltu	a3,a2,41d4 <.L139>
    41c4:	00072023          	sw	zero,0(a4)
    41c8:	00072223          	sw	zero,4(a4)
    41cc:	ff868693          	addi	a3,a3,-8
    41d0:	00870713          	addi	a4,a4,8

000041d4 <.L139>:
    41d4:	00400613          	li	a2,4
    41d8:	00c6e463          	bltu	a3,a2,41e0 <.L140>
    41dc:	00072023          	sw	zero,0(a4)

000041e0 <.L140>:
    41e0:	05012703          	lw	a4,80(sp)

000041e4 <.LBB99>:
    41e4:	00f037b3          	snez	a5,a5

000041e8 <.LBE99>:
    41e8:	00e7e7b3          	or	a5,a5,a4
    41ec:	04f12823          	sw	a5,80(sp)

000041f0 <.LBE97>:
    41f0:	0077f713          	andi	a4,a5,7
    41f4:	04070463          	beqz	a4,423c <.L141>
    41f8:	00f7f713          	andi	a4,a5,15
    41fc:	00400693          	li	a3,4
    4200:	02d70e63          	beq	a4,a3,423c <.L141>

00004204 <.LBB101>:
    4204:	05412703          	lw	a4,84(sp)
    4208:	00478793          	addi	a5,a5,4
    420c:	04f12823          	sw	a5,80(sp)

00004210 <.LVL262>:
    4210:	0047b793          	sltiu	a5,a5,4

00004214 <.LVL263>:
    4214:	00f707b3          	add	a5,a4,a5
    4218:	04f12a23          	sw	a5,84(sp)

0000421c <.LVL264>:
    421c:	00e7b7b3          	sltu	a5,a5,a4

00004220 <.LVL265>:
    4220:	05812703          	lw	a4,88(sp)
    4224:	00f707b3          	add	a5,a4,a5

00004228 <.LVL266>:
    4228:	04f12c23          	sw	a5,88(sp)

0000422c <.LVL267>:
    422c:	00e7b7b3          	sltu	a5,a5,a4

00004230 <.LVL268>:
    4230:	05c12703          	lw	a4,92(sp)
    4234:	00e787b3          	add	a5,a5,a4

00004238 <.LVL269>:
    4238:	04f12e23          	sw	a5,92(sp)

0000423c <.L141>:
    423c:	05c12703          	lw	a4,92(sp)
    4240:	000807b7          	lui	a5,0x80
    4244:	00e7f7b3          	and	a5,a5,a4
    4248:	04078263          	beqz	a5,428c <.L146>

0000424c <.LVL271>:
    424c:	04012e23          	sw	zero,92(sp)
    4250:	04012c23          	sw	zero,88(sp)
    4254:	04012a23          	sw	zero,84(sp)
    4258:	04012823          	sw	zero,80(sp)
    425c:	00100793          	li	a5,1
    4260:	d71ff06f          	j	3fd0 <.L128>

00004264 <.L137>:
    4264:	00082883          	lw	a7,0(a6)
    4268:	00482e83          	lw	t4,4(a6)
    426c:	00b80f33          	add	t5,a6,a1
    4270:	00d8d8b3          	srl	a7,a7,a3
    4274:	006e9eb3          	sll	t4,t4,t1
    4278:	01d8e8b3          	or	a7,a7,t4
    427c:	011f2023          	sw	a7,0(t5)

00004280 <.LVL273>:
    4280:	001e0e13          	addi	t3,t3,1

00004284 <.LVL274>:
    4284:	00480813          	addi	a6,a6,4
    4288:	ef9ff06f          	j	4180 <.L136>

0000428c <.L146>:
    428c:	00c50693          	addi	a3,a0,12

00004290 <.L147>:
    4290:	00052783          	lw	a5,0(a0)
    4294:	00452703          	lw	a4,4(a0)
    4298:	00450513          	addi	a0,a0,4
    429c:	0037d793          	srli	a5,a5,0x3
    42a0:	01d71713          	slli	a4,a4,0x1d
    42a4:	00e7e7b3          	or	a5,a5,a4
    42a8:	fef52e23          	sw	a5,-4(a0)
    42ac:	fea692e3          	bne	a3,a0,4290 <.L147>

000042b0 <.LVL276>:
    42b0:	05c12783          	lw	a5,92(sp)
    42b4:	0037d793          	srli	a5,a5,0x3
    42b8:	04f12e23          	sw	a5,92(sp)

000042bc <.L148>:
    42bc:	00000793          	li	a5,0
    42c0:	d11ff06f          	j	3fd0 <.L128>

000042c4 <.L130>:
    42c4:	05412703          	lw	a4,84(sp)
    42c8:	05012783          	lw	a5,80(sp)
    42cc:	00e7e7b3          	or	a5,a5,a4
    42d0:	05812703          	lw	a4,88(sp)
    42d4:	00e7e7b3          	or	a5,a5,a4
    42d8:	05c12703          	lw	a4,92(sp)
    42dc:	00e7e7b3          	or	a5,a5,a4
    42e0:	fc078ee3          	beqz	a5,42bc <.L148>

000042e4 <.L199>:
    42e4:	04012e23          	sw	zero,92(sp)
    42e8:	04012c23          	sw	zero,88(sp)
    42ec:	04012a23          	sw	zero,84(sp)

000042f0 <.LBB104>:
    42f0:	04012823          	sw	zero,80(sp)
    42f4:	fc9ff06f          	j	42bc <.L148>

000042f8 <.L35>:
    42f8:	000087b7          	lui	a5,0x8
    42fc:	04f12e23          	sw	a5,92(sp)
    4300:	04012c23          	sw	zero,88(sp)
    4304:	04012a23          	sw	zero,84(sp)
    4308:	04012823          	sw	zero,80(sp)

0000430c <.LVL282>:
    430c:	fff78793          	addi	a5,a5,-1 # 7fff <.LLST42+0xf>
    4310:	00000913          	li	s2,0
    4314:	cbdff06f          	j	3fd0 <.L128>

00004318 <__eqtf2>:
    4318:	00c52703          	lw	a4,12(a0)
    431c:	00c5a603          	lw	a2,12(a1)
    4320:	0005a283          	lw	t0,0(a1)
    4324:	0045af83          	lw	t6,4(a1)
    4328:	0085af03          	lw	t5,8(a1)

0000432c <.LBB3>:
    432c:	000085b7          	lui	a1,0x8
    4330:	01075813          	srli	a6,a4,0x10
    4334:	fff58593          	addi	a1,a1,-1 # 7fff <.LLST42+0xf>
    4338:	01071893          	slli	a7,a4,0x10

0000433c <.LBB4>:
    433c:	01061e93          	slli	t4,a2,0x10
    4340:	01065693          	srli	a3,a2,0x10

00004344 <.LBB5>:
    4344:	00b87833          	and	a6,a6,a1

00004348 <.LBE5>:
    4348:	00052783          	lw	a5,0(a0)

0000434c <.LBB6>:
    434c:	00452e03          	lw	t3,4(a0)

00004350 <.LBB7>:
    4350:	00852303          	lw	t1,8(a0)

00004354 <.LBB8>:
    4354:	ff010113          	addi	sp,sp,-16

00004358 <.LBB9>:
    4358:	0108d893          	srli	a7,a7,0x10

0000435c <.LVL4>:
    435c:	01f75713          	srli	a4,a4,0x1f

00004360 <.LBB10>:
    4360:	010ede93          	srli	t4,t4,0x10

00004364 <.LVL6>:
    4364:	00b6f6b3          	and	a3,a3,a1
    4368:	01f65613          	srli	a2,a2,0x1f

0000436c <.LBE10>:
    436c:	00100513          	li	a0,1
    4370:	00b80863          	beq	a6,a1,4380 <.L2>
    4374:	02b69e63          	bne	a3,a1,43b0 <.L15>

00004378 <.L1>:
    4378:	01010113          	addi	sp,sp,16
    437c:	00008067          	ret

00004380 <.L2>:
    4380:	ff069ce3          	bne	a3,a6,4378 <.L1>
    4384:	01c7e7b3          	or	a5,a5,t3

00004388 <.LVL11>:
    4388:	0067e7b3          	or	a5,a5,t1
    438c:	0117e7b3          	or	a5,a5,a7
    4390:	0057e7b3          	or	a5,a5,t0
    4394:	01f7e7b3          	or	a5,a5,t6
    4398:	01e7e7b3          	or	a5,a5,t5
    439c:	01d7e7b3          	or	a5,a5,t4
    43a0:	fc079ce3          	bnez	a5,4378 <.L1>
    43a4:	40c70733          	sub	a4,a4,a2

000043a8 <.LVL12>:
    43a8:	00e03533          	snez	a0,a4
    43ac:	fcdff06f          	j	4378 <.L1>

000043b0 <.L15>:
    43b0:	00100513          	li	a0,1
    43b4:	fd0692e3          	bne	a3,a6,4378 <.L1>
    43b8:	fc5790e3          	bne	a5,t0,4378 <.L1>
    43bc:	fbfe1ee3          	bne	t3,t6,4378 <.L1>
    43c0:	fbe31ce3          	bne	t1,t5,4378 <.L1>
    43c4:	fbd89ae3          	bne	a7,t4,4378 <.L1>
    43c8:	00c70e63          	beq	a4,a2,43e4 <.L13>
    43cc:	fa0696e3          	bnez	a3,4378 <.L1>
    43d0:	01c7e533          	or	a0,a5,t3
    43d4:	00656533          	or	a0,a0,t1
    43d8:	01156533          	or	a0,a0,a7
    43dc:	00a03533          	snez	a0,a0
    43e0:	f99ff06f          	j	4378 <.L1>

000043e4 <.L13>:
    43e4:	00000513          	li	a0,0
    43e8:	f91ff06f          	j	4378 <.L1>

000043ec <__getf2>:
    43ec:	00052883          	lw	a7,0(a0)

000043f0 <.LBB3>:
    43f0:	00452303          	lw	t1,4(a0)

000043f4 <.LBB4>:
    43f4:	00852e03          	lw	t3,8(a0)

000043f8 <.LBB5>:
    43f8:	00c52503          	lw	a0,12(a0)
    43fc:	00c5a803          	lw	a6,12(a1)

00004400 <.LBB6>:
    4400:	00008737          	lui	a4,0x8
    4404:	01055693          	srli	a3,a0,0x10
    4408:	fff70713          	addi	a4,a4,-1 # 7fff <.LLST42+0xf>
    440c:	01051613          	slli	a2,a0,0x10

00004410 <.LBB7>:
    4410:	01081f13          	slli	t5,a6,0x10

00004414 <.LBE7>:
    4414:	0005a783          	lw	a5,0(a1)
    4418:	0045af83          	lw	t6,4(a1)
    441c:	0085ae83          	lw	t4,8(a1)

00004420 <.LBB8>:
    4420:	00e6f6b3          	and	a3,a3,a4
    4424:	01f55593          	srli	a1,a0,0x1f

00004428 <.LBB9>:
    4428:	01085513          	srli	a0,a6,0x10

0000442c <.LBE9>:
    442c:	ff010113          	addi	sp,sp,-16

00004430 <.LBB10>:
    4430:	01065613          	srli	a2,a2,0x10

00004434 <.LBB11>:
    4434:	010f5f13          	srli	t5,t5,0x10

00004438 <.LVL5>:
    4438:	00e57533          	and	a0,a0,a4

0000443c <.LVL6>:
    443c:	01f85813          	srli	a6,a6,0x1f

00004440 <.LBE11>:
    4440:	04e69663          	bne	a3,a4,448c <.L2>
    4444:	011368b3          	or	a7,t1,a7

00004448 <.LVL8>:
    4448:	01c8e8b3          	or	a7,a7,t3
    444c:	00c8e8b3          	or	a7,a7,a2
    4450:	0e089c63          	bnez	a7,4548 <.L26>
    4454:	00d50a63          	beq	a0,a3,4468 <.L4>

00004458 <.L21>:
    4458:	00100513          	li	a0,1
    445c:	02058463          	beqz	a1,4484 <.L1>
    4460:	fff00513          	li	a0,-1
    4464:	0200006f          	j	4484 <.L1>

00004468 <.L4>:
    4468:	01f7e7b3          	or	a5,a5,t6

0000446c <.LVL11>:
    446c:	01d7e7b3          	or	a5,a5,t4
    4470:	01e7e7b3          	or	a5,a5,t5
    4474:	ffe00513          	li	a0,-2

00004478 <.LVL12>:
    4478:	00079663          	bnez	a5,4484 <.L1>

0000447c <.LBB13>:
    447c:	00000513          	li	a0,0
    4480:	fcb81ce3          	bne	a6,a1,4458 <.L21>

00004484 <.L1>:
    4484:	01010113          	addi	sp,sp,16
    4488:	00008067          	ret

0000448c <.L2>:
    448c:	02e51663          	bne	a0,a4,44b8 <.L10>
    4490:	01f7e733          	or	a4,a5,t6
    4494:	01d76733          	or	a4,a4,t4
    4498:	01e76733          	or	a4,a4,t5
    449c:	0a071663          	bnez	a4,4548 <.L26>

000044a0 <.LBB14>:
    44a0:	02068863          	beqz	a3,44d0 <.L11>

000044a4 <.LVL15>:
    44a4:	fab81ae3          	bne	a6,a1,4458 <.L21>

000044a8 <.L22>:
    44a8:	fff00513          	li	a0,-1
    44ac:	fc058ce3          	beqz	a1,4484 <.L1>
    44b0:	00058513          	mv	a0,a1
    44b4:	fd1ff06f          	j	4484 <.L1>

000044b8 <.L10>:
    44b8:	02068c63          	beqz	a3,44f0 <.L13>

000044bc <.LVL18>:
    44bc:	f8050ee3          	beqz	a0,4458 <.L21>

000044c0 <.L14>:
    44c0:	f8b81ce3          	bne	a6,a1,4458 <.L21>
    44c4:	f8d54ae3          	blt	a0,a3,4458 <.L21>
    44c8:	04a6d863          	bge	a3,a0,4518 <.L18>
    44cc:	fddff06f          	j	44a8 <.L22>

000044d0 <.L11>:
    44d0:	01136733          	or	a4,t1,a7
    44d4:	01c76733          	or	a4,a4,t3
    44d8:	00c76733          	or	a4,a4,a2

000044dc <.L15>:
    44dc:	fe0712e3          	bnez	a4,44c0 <.L14>

000044e0 <.L17>:
    44e0:	fff00513          	li	a0,-1

000044e4 <.LVL22>:
    44e4:	fa0800e3          	beqz	a6,4484 <.L1>
    44e8:	00080513          	mv	a0,a6
    44ec:	f99ff06f          	j	4484 <.L1>

000044f0 <.L13>:
    44f0:	01136733          	or	a4,t1,a7
    44f4:	01c76733          	or	a4,a4,t3
    44f8:	00c76733          	or	a4,a4,a2

000044fc <.LVL24>:
    44fc:	fe0510e3          	bnez	a0,44dc <.L15>
    4500:	01f7e6b3          	or	a3,a5,t6

00004504 <.LVL25>:
    4504:	01d6e6b3          	or	a3,a3,t4
    4508:	01e6e6b3          	or	a3,a3,t5
    450c:	02068a63          	beqz	a3,4540 <.L16>

00004510 <.LVL26>:
    4510:	fc0708e3          	beqz	a4,44e0 <.L17>

00004514 <.LVL27>:
    4514:	f4b812e3          	bne	a6,a1,4458 <.L21>

00004518 <.L18>:
    4518:	f4cf60e3          	bltu	t5,a2,4458 <.L21>
    451c:	f9e616e3          	bne	a2,t5,44a8 <.L22>
    4520:	f3ceece3          	bltu	t4,t3,4458 <.L21>
    4524:	f9de12e3          	bne	t3,t4,44a8 <.L22>
    4528:	f26fe8e3          	bltu	t6,t1,4458 <.L21>
    452c:	f7f31ee3          	bne	t1,t6,44a8 <.L22>
    4530:	f317e4e3          	bltu	a5,a7,4458 <.L21>
    4534:	00000513          	li	a0,0

00004538 <.LVL28>:
    4538:	f6f8e8e3          	bltu	a7,a5,44a8 <.L22>
    453c:	f49ff06f          	j	4484 <.L1>

00004540 <.L16>:
    4540:	f40702e3          	beqz	a4,4484 <.L1>
    4544:	f15ff06f          	j	4458 <.L21>

00004548 <.L26>:
    4548:	ffe00513          	li	a0,-2

0000454c <.LVL31>:
    454c:	f39ff06f          	j	4484 <.L1>

00004550 <__letf2>:
    4550:	00052883          	lw	a7,0(a0)

00004554 <.LBB3>:
    4554:	00452303          	lw	t1,4(a0)

00004558 <.LBB4>:
    4558:	00852e03          	lw	t3,8(a0)

0000455c <.LBB5>:
    455c:	00c52503          	lw	a0,12(a0)
    4560:	00c5a803          	lw	a6,12(a1)

00004564 <.LBB6>:
    4564:	00008737          	lui	a4,0x8
    4568:	01055693          	srli	a3,a0,0x10
    456c:	fff70713          	addi	a4,a4,-1 # 7fff <.LLST42+0xf>
    4570:	01051613          	slli	a2,a0,0x10

00004574 <.LBB7>:
    4574:	01081f13          	slli	t5,a6,0x10

00004578 <.LBE7>:
    4578:	0005a783          	lw	a5,0(a1)
    457c:	0045af83          	lw	t6,4(a1)
    4580:	0085ae83          	lw	t4,8(a1)

00004584 <.LBB8>:
    4584:	00e6f6b3          	and	a3,a3,a4
    4588:	01f55593          	srli	a1,a0,0x1f

0000458c <.LBB9>:
    458c:	01085513          	srli	a0,a6,0x10

00004590 <.LBE9>:
    4590:	ff010113          	addi	sp,sp,-16

00004594 <.LBB10>:
    4594:	01065613          	srli	a2,a2,0x10

00004598 <.LBB11>:
    4598:	010f5f13          	srli	t5,t5,0x10

0000459c <.LVL5>:
    459c:	00e57533          	and	a0,a0,a4

000045a0 <.LVL6>:
    45a0:	01f85813          	srli	a6,a6,0x1f

000045a4 <.LBE11>:
    45a4:	04e69663          	bne	a3,a4,45f0 <.L2>
    45a8:	011368b3          	or	a7,t1,a7

000045ac <.LVL8>:
    45ac:	01c8e8b3          	or	a7,a7,t3
    45b0:	00c8e8b3          	or	a7,a7,a2
    45b4:	0e089c63          	bnez	a7,46ac <.L26>
    45b8:	00d50a63          	beq	a0,a3,45cc <.L4>

000045bc <.L21>:
    45bc:	00100513          	li	a0,1
    45c0:	02058463          	beqz	a1,45e8 <.L1>
    45c4:	fff00513          	li	a0,-1
    45c8:	0200006f          	j	45e8 <.L1>

000045cc <.L4>:
    45cc:	01f7e7b3          	or	a5,a5,t6

000045d0 <.LVL11>:
    45d0:	01d7e7b3          	or	a5,a5,t4
    45d4:	01e7e7b3          	or	a5,a5,t5
    45d8:	00200513          	li	a0,2

000045dc <.LVL12>:
    45dc:	00079663          	bnez	a5,45e8 <.L1>

000045e0 <.LBB13>:
    45e0:	00000513          	li	a0,0
    45e4:	fcb81ce3          	bne	a6,a1,45bc <.L21>

000045e8 <.L1>:
    45e8:	01010113          	addi	sp,sp,16
    45ec:	00008067          	ret

000045f0 <.L2>:
    45f0:	02e51663          	bne	a0,a4,461c <.L10>
    45f4:	01f7e733          	or	a4,a5,t6
    45f8:	01d76733          	or	a4,a4,t4
    45fc:	01e76733          	or	a4,a4,t5
    4600:	0a071663          	bnez	a4,46ac <.L26>

00004604 <.LBB14>:
    4604:	02068863          	beqz	a3,4634 <.L11>

00004608 <.LVL15>:
    4608:	fab81ae3          	bne	a6,a1,45bc <.L21>

0000460c <.L22>:
    460c:	fff00513          	li	a0,-1
    4610:	fc058ce3          	beqz	a1,45e8 <.L1>
    4614:	00058513          	mv	a0,a1
    4618:	fd1ff06f          	j	45e8 <.L1>

0000461c <.L10>:
    461c:	02068c63          	beqz	a3,4654 <.L13>

00004620 <.LVL18>:
    4620:	f8050ee3          	beqz	a0,45bc <.L21>

00004624 <.L14>:
    4624:	f8b81ce3          	bne	a6,a1,45bc <.L21>
    4628:	f8d54ae3          	blt	a0,a3,45bc <.L21>
    462c:	04a6d863          	bge	a3,a0,467c <.L18>
    4630:	fddff06f          	j	460c <.L22>

00004634 <.L11>:
    4634:	01136733          	or	a4,t1,a7
    4638:	01c76733          	or	a4,a4,t3
    463c:	00c76733          	or	a4,a4,a2

00004640 <.L15>:
    4640:	fe0712e3          	bnez	a4,4624 <.L14>

00004644 <.L17>:
    4644:	fff00513          	li	a0,-1

00004648 <.LVL22>:
    4648:	fa0800e3          	beqz	a6,45e8 <.L1>
    464c:	00080513          	mv	a0,a6
    4650:	f99ff06f          	j	45e8 <.L1>

00004654 <.L13>:
    4654:	01136733          	or	a4,t1,a7
    4658:	01c76733          	or	a4,a4,t3
    465c:	00c76733          	or	a4,a4,a2

00004660 <.LVL24>:
    4660:	fe0510e3          	bnez	a0,4640 <.L15>
    4664:	01f7e6b3          	or	a3,a5,t6

00004668 <.LVL25>:
    4668:	01d6e6b3          	or	a3,a3,t4
    466c:	01e6e6b3          	or	a3,a3,t5
    4670:	02068a63          	beqz	a3,46a4 <.L16>

00004674 <.LVL26>:
    4674:	fc0708e3          	beqz	a4,4644 <.L17>

00004678 <.LVL27>:
    4678:	f4b812e3          	bne	a6,a1,45bc <.L21>

0000467c <.L18>:
    467c:	f4cf60e3          	bltu	t5,a2,45bc <.L21>
    4680:	f9e616e3          	bne	a2,t5,460c <.L22>
    4684:	f3ceece3          	bltu	t4,t3,45bc <.L21>
    4688:	f9de12e3          	bne	t3,t4,460c <.L22>
    468c:	f26fe8e3          	bltu	t6,t1,45bc <.L21>
    4690:	f7f31ee3          	bne	t1,t6,460c <.L22>
    4694:	f317e4e3          	bltu	a5,a7,45bc <.L21>
    4698:	00000513          	li	a0,0

0000469c <.LVL28>:
    469c:	f6f8e8e3          	bltu	a7,a5,460c <.L22>
    46a0:	f49ff06f          	j	45e8 <.L1>

000046a4 <.L16>:
    46a4:	f40702e3          	beqz	a4,45e8 <.L1>
    46a8:	f15ff06f          	j	45bc <.L21>

000046ac <.L26>:
    46ac:	00200513          	li	a0,2

000046b0 <.LVL31>:
    46b0:	f39ff06f          	j	45e8 <.L1>

000046b4 <__multf3>:
    46b4:	f5010113          	addi	sp,sp,-176
    46b8:	09312e23          	sw	s3,156(sp)
    46bc:	00c5a983          	lw	s3,12(a1)
    46c0:	0005a783          	lw	a5,0(a1)
    46c4:	0085a683          	lw	a3,8(a1)
    46c8:	0a812423          	sw	s0,168(sp)
    46cc:	00050413          	mv	s0,a0
    46d0:	0045a503          	lw	a0,4(a1)

000046d4 <.LBB3>:
    46d4:	01099713          	slli	a4,s3,0x10

000046d8 <.LBE3>:
    46d8:	0b212023          	sw	s2,160(sp)
    46dc:	09412c23          	sw	s4,152(sp)
    46e0:	00062903          	lw	s2,0(a2)
    46e4:	00c62a03          	lw	s4,12(a2)
    46e8:	09512a23          	sw	s5,148(sp)
    46ec:	09612823          	sw	s6,144(sp)
    46f0:	00862a83          	lw	s5,8(a2)
    46f4:	00462b03          	lw	s6,4(a2)

000046f8 <.LBB4>:
    46f8:	00008637          	lui	a2,0x8

000046fc <.LBE4>:
    46fc:	0a912223          	sw	s1,164(sp)

00004700 <.LBB5>:
    4700:	01075713          	srli	a4,a4,0x10
    4704:	0109d493          	srli	s1,s3,0x10
    4708:	fff60613          	addi	a2,a2,-1 # 7fff <.LLST42+0xf>
    470c:	05312e23          	sw	s3,92(sp)

00004710 <.LBE5>:
    4710:	0a112623          	sw	ra,172(sp)
    4714:	09712623          	sw	s7,140(sp)
    4718:	09812423          	sw	s8,136(sp)
    471c:	09912223          	sw	s9,132(sp)
    4720:	09a12023          	sw	s10,128(sp)
    4724:	07b12e23          	sw	s11,124(sp)

00004728 <.LBB6>:
    4728:	04f12823          	sw	a5,80(sp)
    472c:	04a12a23          	sw	a0,84(sp)
    4730:	04d12c23          	sw	a3,88(sp)
    4734:	02f12023          	sw	a5,32(sp)
    4738:	02a12223          	sw	a0,36(sp)
    473c:	02d12423          	sw	a3,40(sp)
    4740:	02e12623          	sw	a4,44(sp)
    4744:	00c4f4b3          	and	s1,s1,a2

00004748 <.LVL2>:
    4748:	01f9d993          	srli	s3,s3,0x1f

0000474c <.LBE6>:
    474c:	1c0484e3          	beqz	s1,5114 <.L2>
    4750:	30c486e3          	beq	s1,a2,525c <.L3>
    4754:	000107b7          	lui	a5,0x10
    4758:	00f76733          	or	a4,a4,a5
    475c:	02e12623          	sw	a4,44(sp)

00004760 <.LBB7>:
    4760:	02010613          	addi	a2,sp,32
    4764:	02c10793          	addi	a5,sp,44

00004768 <.L4>:
    4768:	0007a703          	lw	a4,0(a5) # 10000 <.LLST3+0x57a5>
    476c:	ffc7a683          	lw	a3,-4(a5)
    4770:	ffc78793          	addi	a5,a5,-4
    4774:	00371713          	slli	a4,a4,0x3
    4778:	01d6d693          	srli	a3,a3,0x1d
    477c:	00d76733          	or	a4,a4,a3
    4780:	00e7a223          	sw	a4,4(a5)
    4784:	fef612e3          	bne	a2,a5,4768 <.L4>

00004788 <.LVL6>:
    4788:	02012783          	lw	a5,32(sp)
    478c:	00379793          	slli	a5,a5,0x3
    4790:	02f12023          	sw	a5,32(sp)

00004794 <.LBE7>:
    4794:	ffffc7b7          	lui	a5,0xffffc
    4798:	00178793          	addi	a5,a5,1 # ffffc001 <.LLST3+0xffff17a6>
    479c:	00f484b3          	add	s1,s1,a5

000047a0 <.L203>:
    47a0:	00000b93          	li	s7,0

000047a4 <.L5>:
    47a4:	010a1513          	slli	a0,s4,0x10
    47a8:	00008737          	lui	a4,0x8
    47ac:	010a5793          	srli	a5,s4,0x10
    47b0:	01055513          	srli	a0,a0,0x10
    47b4:	fff70713          	addi	a4,a4,-1 # 7fff <.LLST42+0xf>
    47b8:	05412e23          	sw	s4,92(sp)
    47bc:	05212823          	sw	s2,80(sp)
    47c0:	05612a23          	sw	s6,84(sp)
    47c4:	05512c23          	sw	s5,88(sp)
    47c8:	03212823          	sw	s2,48(sp)
    47cc:	03612a23          	sw	s6,52(sp)
    47d0:	03512c23          	sw	s5,56(sp)
    47d4:	02a12e23          	sw	a0,60(sp)
    47d8:	00e7f7b3          	and	a5,a5,a4

000047dc <.LVL9>:
    47dc:	01fa5a13          	srli	s4,s4,0x1f

000047e0 <.LBE13>:
    47e0:	2a0782e3          	beqz	a5,5284 <.L18>
    47e4:	3ee784e3          	beq	a5,a4,53cc <.L19>
    47e8:	00010737          	lui	a4,0x10
    47ec:	00e56533          	or	a0,a0,a4
    47f0:	02a12e23          	sw	a0,60(sp)

000047f4 <.LBB14>:
    47f4:	03010593          	addi	a1,sp,48
    47f8:	03c10713          	addi	a4,sp,60

000047fc <.L20>:
    47fc:	00072683          	lw	a3,0(a4) # 10000 <.LLST3+0x57a5>
    4800:	ffc72603          	lw	a2,-4(a4)
    4804:	ffc70713          	addi	a4,a4,-4
    4808:	00369693          	slli	a3,a3,0x3
    480c:	01d65613          	srli	a2,a2,0x1d
    4810:	00c6e6b3          	or	a3,a3,a2
    4814:	00d72223          	sw	a3,4(a4)
    4818:	fee592e3          	bne	a1,a4,47fc <.L20>

0000481c <.LVL13>:
    481c:	03012703          	lw	a4,48(sp)
    4820:	00371713          	slli	a4,a4,0x3
    4824:	02e12823          	sw	a4,48(sp)

00004828 <.LBE14>:
    4828:	ffffc737          	lui	a4,0xffffc
    482c:	00170713          	addi	a4,a4,1 # ffffc001 <.LLST3+0xffff17a6>
    4830:	00e787b3          	add	a5,a5,a4

00004834 <.L204>:
    4834:	00000693          	li	a3,0

00004838 <.L21>:
    4838:	009787b3          	add	a5,a5,s1

0000483c <.LVL16>:
    483c:	00f12623          	sw	a5,12(sp)
    4840:	00178793          	addi	a5,a5,1
    4844:	0149c733          	xor	a4,s3,s4
    4848:	00f12423          	sw	a5,8(sp)
    484c:	002b9793          	slli	a5,s7,0x2
    4850:	00e12223          	sw	a4,4(sp)

00004854 <.LVL17>:
    4854:	00d7e7b3          	or	a5,a5,a3
    4858:	00a00713          	li	a4,10

0000485c <.LVL18>:
    485c:	3cf74ce3          	blt	a4,a5,5434 <.L34>
    4860:	00200713          	li	a4,2
    4864:	38f748e3          	blt	a4,a5,53f4 <.L35>
    4868:	fff78793          	addi	a5,a5,-1
    486c:	00100713          	li	a4,1
    4870:	42f774e3          	bgeu	a4,a5,5498 <.L37>

00004874 <.L36>:
    4874:	02012883          	lw	a7,32(sp)

00004878 <.LVL20>:
    4878:	03012f03          	lw	t5,48(sp)
    487c:	000105b7          	lui	a1,0x10
    4880:	fff58713          	addi	a4,a1,-1 # ffff <.LLST3+0x57a4>
    4884:	0108d993          	srli	s3,a7,0x10

00004888 <.LVL21>:
    4888:	010f5913          	srli	s2,t5,0x10

0000488c <.LVL22>:
    488c:	00e8f8b3          	and	a7,a7,a4

00004890 <.LVL23>:
    4890:	00ef7f33          	and	t5,t5,a4

00004894 <.LVL24>:
    4894:	031f0633          	mul	a2,t5,a7

00004898 <.LVL25>:
    4898:	03e98533          	mul	a0,s3,t5

0000489c <.LVL26>:
    489c:	01065793          	srli	a5,a2,0x10
    48a0:	031906b3          	mul	a3,s2,a7

000048a4 <.LVL27>:
    48a4:	00a686b3          	add	a3,a3,a0

000048a8 <.LVL28>:
    48a8:	00d787b3          	add	a5,a5,a3
    48ac:	03298bb3          	mul	s7,s3,s2

000048b0 <.LVL29>:
    48b0:	00a7f463          	bgeu	a5,a0,48b8 <.L42>
    48b4:	00bb8bb3          	add	s7,s7,a1

000048b8 <.L42>:
    48b8:	03412e83          	lw	t4,52(sp)

000048bc <.LBB24>:
    48bc:	0107d693          	srli	a3,a5,0x10
    48c0:	00e7f7b3          	and	a5,a5,a4

000048c4 <.LVL31>:
    48c4:	00e67633          	and	a2,a2,a4

000048c8 <.LVL32>:
    48c8:	01079793          	slli	a5,a5,0x10
    48cc:	00c787b3          	add	a5,a5,a2

000048d0 <.LBB25>:
    48d0:	010ed393          	srli	t2,t4,0x10
    48d4:	00eefeb3          	and	t4,t4,a4
    48d8:	03d98633          	mul	a2,s3,t4

000048dc <.LBB26>:
    48dc:	00f12823          	sw	a5,16(sp)
    48e0:	04f12823          	sw	a5,80(sp)

000048e4 <.LBB27>:
    48e4:	03138733          	mul	a4,t2,a7
    48e8:	031e87b3          	mul	a5,t4,a7

000048ec <.LVL34>:
    48ec:	00c70733          	add	a4,a4,a2

000048f0 <.LVL35>:
    48f0:	0107d313          	srli	t1,a5,0x10
    48f4:	00e30333          	add	t1,t1,a4
    48f8:	02798b33          	mul	s6,s3,t2

000048fc <.LVL36>:
    48fc:	00c37663          	bgeu	t1,a2,4908 <.L43>
    4900:	00010737          	lui	a4,0x10
    4904:	00eb0b33          	add	s6,s6,a4

00004908 <.L43>:
    4908:	02412803          	lw	a6,36(sp)

0000490c <.LBB29>:
    490c:	00010737          	lui	a4,0x10
    4910:	fff70613          	addi	a2,a4,-1 # ffff <.LLST3+0x57a4>

00004914 <.LVL38>:
    4914:	01035513          	srli	a0,t1,0x10

00004918 <.LVL39>:
    4918:	00c37333          	and	t1,t1,a2

0000491c <.LVL40>:
    491c:	00c7f7b3          	and	a5,a5,a2

00004920 <.LBB30>:
    4920:	01085493          	srli	s1,a6,0x10

00004924 <.LBB31>:
    4924:	01031313          	slli	t1,t1,0x10
    4928:	00c87833          	and	a6,a6,a2
    492c:	00f30333          	add	t1,t1,a5

00004930 <.LBB32>:
    4930:	03e48fb3          	mul	t6,s1,t5
    4934:	006686b3          	add	a3,a3,t1

00004938 <.LBB33>:
    4938:	03e807b3          	mul	a5,a6,t5

0000493c <.LVL44>:
    493c:	03090e33          	mul	t3,s2,a6

00004940 <.LVL45>:
    4940:	0107d613          	srli	a2,a5,0x10
    4944:	01fe0e33          	add	t3,t3,t6

00004948 <.LVL46>:
    4948:	01c60633          	add	a2,a2,t3
    494c:	029905b3          	mul	a1,s2,s1

00004950 <.LVL47>:
    4950:	01f67463          	bgeu	a2,t6,4958 <.L44>
    4954:	00e585b3          	add	a1,a1,a4

00004958 <.L44>:
    4958:	01065a93          	srli	s5,a2,0x10
    495c:	00010737          	lui	a4,0x10
    4960:	00ba8ab3          	add	s5,s5,a1

00004964 <.LVL49>:
    4964:	fff70593          	addi	a1,a4,-1 # ffff <.LLST3+0x57a4>

00004968 <.LVL50>:
    4968:	00b7f7b3          	and	a5,a5,a1

0000496c <.LVL51>:
    496c:	00b67633          	and	a2,a2,a1

00004970 <.LVL52>:
    4970:	01061613          	slli	a2,a2,0x10

00004974 <.LBB34>:
    4974:	030e85b3          	mul	a1,t4,a6

00004978 <.LBB35>:
    4978:	00f60633          	add	a2,a2,a5

0000497c <.LBB36>:
    497c:	03d48fb3          	mul	t6,s1,t4

00004980 <.LVL54>:
    4980:	0105d793          	srli	a5,a1,0x10
    4984:	03038e33          	mul	t3,t2,a6

00004988 <.LVL55>:
    4988:	01fe0e33          	add	t3,t3,t6

0000498c <.LVL56>:
    498c:	01c787b3          	add	a5,a5,t3
    4990:	029382b3          	mul	t0,t2,s1

00004994 <.LVL57>:
    4994:	01f7f463          	bgeu	a5,t6,499c <.L45>
    4998:	00e282b3          	add	t0,t0,a4

0000499c <.L45>:
    499c:	0107d713          	srli	a4,a5,0x10
    49a0:	00570733          	add	a4,a4,t0
    49a4:	00010a37          	lui	s4,0x10

000049a8 <.LVL59>:
    49a8:	00e12a23          	sw	a4,20(sp)

000049ac <.LVL60>:
    49ac:	fffa0713          	addi	a4,s4,-1 # ffff <.LLST3+0x57a4>

000049b0 <.LBB37>:
    49b0:	03812e03          	lw	t3,56(sp)

000049b4 <.LBB38>:
    49b4:	00e7f7b3          	and	a5,a5,a4

000049b8 <.LVL62>:
    49b8:	00e5f5b3          	and	a1,a1,a4

000049bc <.LVL63>:
    49bc:	01079793          	slli	a5,a5,0x10
    49c0:	00b787b3          	add	a5,a5,a1
    49c4:	00f12c23          	sw	a5,24(sp)

000049c8 <.LBB39>:
    49c8:	010e5793          	srli	a5,t3,0x10

000049cc <.LVL65>:
    49cc:	00ee7e33          	and	t3,t3,a4

000049d0 <.LVL66>:
    49d0:	031e05b3          	mul	a1,t3,a7

000049d4 <.LVL67>:
    49d4:	03c98c33          	mul	s8,s3,t3

000049d8 <.LVL68>:
    49d8:	0105d713          	srli	a4,a1,0x10
    49dc:	031782b3          	mul	t0,a5,a7

000049e0 <.LVL69>:
    49e0:	018282b3          	add	t0,t0,s8

000049e4 <.LVL70>:
    49e4:	00570733          	add	a4,a4,t0
    49e8:	02f98fb3          	mul	t6,s3,a5

000049ec <.LVL71>:
    49ec:	01877463          	bgeu	a4,s8,49f4 <.L46>
    49f0:	014f8fb3          	add	t6,t6,s4

000049f4 <.L46>:
    49f4:	01075293          	srli	t0,a4,0x10
    49f8:	01f28fb3          	add	t6,t0,t6

000049fc <.LVL73>:
    49fc:	00010cb7          	lui	s9,0x10
    4a00:	01f12e23          	sw	t6,28(sp)

00004a04 <.LVL74>:
    4a04:	fffc8f93          	addi	t6,s9,-1 # ffff <.LLST3+0x57a4>

00004a08 <.LVL75>:
    4a08:	01f77733          	and	a4,a4,t6

00004a0c <.LVL76>:
    4a0c:	01f5f5b3          	and	a1,a1,t6

00004a10 <.LVL77>:
    4a10:	01071713          	slli	a4,a4,0x10
    4a14:	00b70733          	add	a4,a4,a1

00004a18 <.LBB40>:
    4a18:	02812583          	lw	a1,40(sp)

00004a1c <.LVL79>:
    4a1c:	0105d293          	srli	t0,a1,0x10

00004a20 <.LVL80>:
    4a20:	01f5f5b3          	and	a1,a1,t6

00004a24 <.LVL81>:
    4a24:	03e58fb3          	mul	t6,a1,t5

00004a28 <.LVL82>:
    4a28:	03e28d33          	mul	s10,t0,t5

00004a2c <.LVL83>:
    4a2c:	010fdd93          	srli	s11,t6,0x10
    4a30:	02b90a33          	mul	s4,s2,a1

00004a34 <.LVL84>:
    4a34:	01aa0a33          	add	s4,s4,s10

00004a38 <.LVL85>:
    4a38:	014d8a33          	add	s4,s11,s4
    4a3c:	02590c33          	mul	s8,s2,t0

00004a40 <.LVL86>:
    4a40:	01aa7463          	bgeu	s4,s10,4a48 <.L47>
    4a44:	019c0c33          	add	s8,s8,s9

00004a48 <.L47>:
    4a48:	017686b3          	add	a3,a3,s7
    4a4c:	0066b333          	sltu	t1,a3,t1

00004a50 <.LBB42>:
    4a50:	010a5d13          	srli	s10,s4,0x10

00004a54 <.LBB43>:
    4a54:	00650533          	add	a0,a0,t1

00004a58 <.LBB44>:
    4a58:	00010cb7          	lui	s9,0x10

00004a5c <.LBB45>:
    4a5c:	01650533          	add	a0,a0,s6

00004a60 <.LBB46>:
    4a60:	018d0d33          	add	s10,s10,s8

00004a64 <.LVL91>:
    4a64:	00c68633          	add	a2,a3,a2

00004a68 <.LVL92>:
    4a68:	fffc8c13          	addi	s8,s9,-1 # ffff <.LLST3+0x57a4>

00004a6c <.LVL93>:
    4a6c:	01550ab3          	add	s5,a0,s5

00004a70 <.LVL94>:
    4a70:	018a7a33          	and	s4,s4,s8

00004a74 <.LBB47>:
    4a74:	00d636b3          	sltu	a3,a2,a3
    4a78:	00da86b3          	add	a3,s5,a3

00004a7c <.LBB48>:
    4a7c:	010a1a13          	slli	s4,s4,0x10
    4a80:	018fffb3          	and	t6,t6,s8

00004a84 <.LVL96>:
    4a84:	01fa0fb3          	add	t6,s4,t6

00004a88 <.LBB49>:
    4a88:	00aaba33          	sltu	s4,s5,a0
    4a8c:	0156bab3          	sltu	s5,a3,s5
    4a90:	015a6a33          	or	s4,s4,s5

00004a94 <.LBB51>:
    4a94:	00653533          	sltu	a0,a0,t1

00004a98 <.LBB52>:
    4a98:	00aa0533          	add	a0,s4,a0
    4a9c:	01812303          	lw	t1,24(sp)

00004aa0 <.LVL99>:
    4aa0:	01412a03          	lw	s4,20(sp)
    4aa4:	04c12a23          	sw	a2,84(sp)

00004aa8 <.LBB53>:
    4aa8:	00668333          	add	t1,a3,t1

00004aac <.LVL101>:
    4aac:	01450ab3          	add	s5,a0,s4

00004ab0 <.LVL102>:
    4ab0:	01c12a03          	lw	s4,28(sp)
    4ab4:	00d336b3          	sltu	a3,t1,a3

00004ab8 <.LVL103>:
    4ab8:	00da86b3          	add	a3,s5,a3

00004abc <.LBB54>:
    4abc:	00e30733          	add	a4,t1,a4

00004ac0 <.LVL105>:
    4ac0:	01468b33          	add	s6,a3,s4

00004ac4 <.LVL106>:
    4ac4:	00673333          	sltu	t1,a4,t1

00004ac8 <.LVL107>:
    4ac8:	006b0333          	add	t1,s6,t1

00004acc <.LVL108>:
    4acc:	01f70fb3          	add	t6,a4,t6

00004ad0 <.LVL109>:
    4ad0:	01a30d33          	add	s10,t1,s10

00004ad4 <.LBB55>:
    4ad4:	00efb733          	sltu	a4,t6,a4

00004ad8 <.LBB56>:
    4ad8:	00aab533          	sltu	a0,s5,a0

00004adc <.LVL111>:
    4adc:	00ed0733          	add	a4,s10,a4
    4ae0:	0156bab3          	sltu	s5,a3,s5

00004ae4 <.LBB57>:
    4ae4:	00db36b3          	sltu	a3,s6,a3

00004ae8 <.LVL113>:
    4ae8:	01633b33          	sltu	s6,t1,s6

00004aec <.LVL114>:
    4aec:	0166e6b3          	or	a3,a3,s6

00004af0 <.LBB58>:
    4af0:	006d3a33          	sltu	s4,s10,t1

00004af4 <.LBB59>:
    4af4:	01556ab3          	or	s5,a0,s5

00004af8 <.LBB60>:
    4af8:	01a73d33          	sltu	s10,a4,s10

00004afc <.LBB61>:
    4afc:	00da8ab3          	add	s5,s5,a3

00004b00 <.LBB62>:
    4b00:	01aa6a33          	or	s4,s4,s10
    4b04:	015a0a33          	add	s4,s4,s5

00004b08 <.LBB63>:
    4b08:	03c12a83          	lw	s5,60(sp)

00004b0c <.LBB64>:
    4b0c:	05f12c23          	sw	t6,88(sp)

00004b10 <.LBB65>:
    4b10:	010adb13          	srli	s6,s5,0x10

00004b14 <.LVL118>:
    4b14:	018afab3          	and	s5,s5,s8

00004b18 <.LVL119>:
    4b18:	031a86b3          	mul	a3,s5,a7

00004b1c <.LVL120>:
    4b1c:	03598533          	mul	a0,s3,s5

00004b20 <.LVL121>:
    4b20:	031b08b3          	mul	a7,s6,a7

00004b24 <.LVL122>:
    4b24:	00a88333          	add	t1,a7,a0
    4b28:	0106d893          	srli	a7,a3,0x10

00004b2c <.LVL123>:
    4b2c:	006888b3          	add	a7,a7,t1
    4b30:	036989b3          	mul	s3,s3,s6

00004b34 <.LVL124>:
    4b34:	00a8f463          	bgeu	a7,a0,4b3c <.L72>
    4b38:	019989b3          	add	s3,s3,s9

00004b3c <.L72>:
    4b3c:	02c12b83          	lw	s7,44(sp)

00004b40 <.LBB67>:
    4b40:	0108d513          	srli	a0,a7,0x10

00004b44 <.LVL127>:
    4b44:	01350533          	add	a0,a0,s3
    4b48:	00010c37          	lui	s8,0x10
    4b4c:	00a12a23          	sw	a0,20(sp)

00004b50 <.LVL128>:
    4b50:	fffc0513          	addi	a0,s8,-1 # ffff <.LLST3+0x57a4>

00004b54 <.LBB68>:
    4b54:	010bd993          	srli	s3,s7,0x10

00004b58 <.LVL130>:
    4b58:	00abfbb3          	and	s7,s7,a0

00004b5c <.LBB69>:
    4b5c:	00a6f6b3          	and	a3,a3,a0

00004b60 <.LVL131>:
    4b60:	00a8f8b3          	and	a7,a7,a0

00004b64 <.LBB70>:
    4b64:	03390333          	mul	t1,s2,s3

00004b68 <.LBB71>:
    4b68:	01089893          	slli	a7,a7,0x10
    4b6c:	00d888b3          	add	a7,a7,a3

00004b70 <.LBB72>:
    4b70:	03eb8533          	mul	a0,s7,t5

00004b74 <.LVL135>:
    4b74:	03790933          	mul	s2,s2,s7

00004b78 <.LVL136>:
    4b78:	01055693          	srli	a3,a0,0x10
    4b7c:	03e98f33          	mul	t5,s3,t5

00004b80 <.LVL137>:
    4b80:	01e90933          	add	s2,s2,t5

00004b84 <.LVL138>:
    4b84:	012686b3          	add	a3,a3,s2

00004b88 <.LVL139>:
    4b88:	01e6f463          	bgeu	a3,t5,4b90 <.L73>
    4b8c:	01830333          	add	t1,t1,s8

00004b90 <.L73>:
    4b90:	0106df13          	srli	t5,a3,0x10

00004b94 <.LVL141>:
    4b94:	006f0333          	add	t1,t5,t1

00004b98 <.LVL142>:
    4b98:	00010cb7          	lui	s9,0x10

00004b9c <.LVL143>:
    4b9c:	00612c23          	sw	t1,24(sp)

00004ba0 <.LVL144>:
    4ba0:	fffc8313          	addi	t1,s9,-1 # ffff <.LLST3+0x57a4>

00004ba4 <.LVL145>:
    4ba4:	00657533          	and	a0,a0,t1

00004ba8 <.LVL146>:
    4ba8:	0066f6b3          	and	a3,a3,t1

00004bac <.LBB73>:
    4bac:	03c48f33          	mul	t5,s1,t3

00004bb0 <.LBB74>:
    4bb0:	01069693          	slli	a3,a3,0x10
    4bb4:	00a686b3          	add	a3,a3,a0

00004bb8 <.LBB75>:
    4bb8:	03c80333          	mul	t1,a6,t3

00004bbc <.LVL149>:
    4bbc:	03078933          	mul	s2,a5,a6

00004bc0 <.LVL150>:
    4bc0:	01035513          	srli	a0,t1,0x10
    4bc4:	01e90933          	add	s2,s2,t5

00004bc8 <.LVL151>:
    4bc8:	01250533          	add	a0,a0,s2
    4bcc:	02f48c33          	mul	s8,s1,a5

00004bd0 <.LVL152>:
    4bd0:	01e57463          	bgeu	a0,t5,4bd8 <.L74>
    4bd4:	019c0c33          	add	s8,s8,s9

00004bd8 <.L74>:
    4bd8:	00010d37          	lui	s10,0x10
    4bdc:	fffd0f13          	addi	t5,s10,-1 # ffff <.LLST3+0x57a4>
    4be0:	01055913          	srli	s2,a0,0x10
    4be4:	01e57533          	and	a0,a0,t5

00004be8 <.LVL154>:
    4be8:	01e37333          	and	t1,t1,t5

00004bec <.LVL155>:
    4bec:	01051513          	slli	a0,a0,0x10
    4bf0:	01890933          	add	s2,s2,s8

00004bf4 <.LBB76>:
    4bf4:	02b38f33          	mul	t5,t2,a1

00004bf8 <.LBB77>:
    4bf8:	00650533          	add	a0,a0,t1

00004bfc <.LBB78>:
    4bfc:	03d28c33          	mul	s8,t0,t4

00004c00 <.LVL158>:
    4c00:	02be8333          	mul	t1,t4,a1

00004c04 <.LVL159>:
    4c04:	018f0f33          	add	t5,t5,s8

00004c08 <.LVL160>:
    4c08:	01035d93          	srli	s11,t1,0x10

00004c0c <.LVL161>:
    4c0c:	01ed8f33          	add	t5,s11,t5
    4c10:	02538cb3          	mul	s9,t2,t0

00004c14 <.LVL162>:
    4c14:	018f7463          	bgeu	t5,s8,4c1c <.L75>
    4c18:	01ac8cb3          	add	s9,s9,s10

00004c1c <.L75>:
    4c1c:	010f5c13          	srli	s8,t5,0x10
    4c20:	019c0c33          	add	s8,s8,s9

00004c24 <.LVL164>:
    4c24:	00010cb7          	lui	s9,0x10

00004c28 <.LVL165>:
    4c28:	fffc8d13          	addi	s10,s9,-1 # ffff <.LLST3+0x57a4>

00004c2c <.LVL166>:
    4c2c:	01af7f33          	and	t5,t5,s10

00004c30 <.LVL167>:
    4c30:	010f1f13          	slli	t5,t5,0x10
    4c34:	01a37333          	and	t1,t1,s10

00004c38 <.LVL168>:
    4c38:	006f0333          	add	t1,t5,t1

00004c3c <.LBB79>:
    4c3c:	01412f03          	lw	t5,20(sp)
    4c40:	011708b3          	add	a7,a4,a7

00004c44 <.LVL170>:
    4c44:	01812d03          	lw	s10,24(sp)

00004c48 <.LVL171>:
    4c48:	01ea0f33          	add	t5,s4,t5

00004c4c <.LVL172>:
    4c4c:	00e8b733          	sltu	a4,a7,a4

00004c50 <.LVL173>:
    4c50:	00ef0733          	add	a4,t5,a4

00004c54 <.LBB80>:
    4c54:	00d886b3          	add	a3,a7,a3

00004c58 <.LVL175>:
    4c58:	01a70d33          	add	s10,a4,s10

00004c5c <.LVL176>:
    4c5c:	0116b8b3          	sltu	a7,a3,a7

00004c60 <.LVL177>:
    4c60:	011d08b3          	add	a7,s10,a7

00004c64 <.LVL178>:
    4c64:	00a68533          	add	a0,a3,a0

00004c68 <.LVL179>:
    4c68:	01288933          	add	s2,a7,s2

00004c6c <.LBB81>:
    4c6c:	00d536b3          	sltu	a3,a0,a3
    4c70:	00d906b3          	add	a3,s2,a3

00004c74 <.LBB82>:
    4c74:	014f3a33          	sltu	s4,t5,s4

00004c78 <.LVL181>:
    4c78:	01e73f33          	sltu	t5,a4,t5

00004c7c <.LBB83>:
    4c7c:	00ed3733          	sltu	a4,s10,a4

00004c80 <.LVL183>:
    4c80:	01a8bd33          	sltu	s10,a7,s10

00004c84 <.LBB84>:
    4c84:	01ea6f33          	or	t5,s4,t5

00004c88 <.LBB85>:
    4c88:	011938b3          	sltu	a7,s2,a7

00004c8c <.LBB86>:
    4c8c:	01a76733          	or	a4,a4,s10

00004c90 <.LBB87>:
    4c90:	0126b933          	sltu	s2,a3,s2
    4c94:	01868c33          	add	s8,a3,s8

00004c98 <.LBB88>:
    4c98:	00ef0733          	add	a4,t5,a4

00004c9c <.LBB89>:
    4c9c:	0128e8b3          	or	a7,a7,s2
    4ca0:	00e88933          	add	s2,a7,a4

00004ca4 <.LBB90>:
    4ca4:	03c28f33          	mul	t5,t0,t3

00004ca8 <.LBB92>:
    4ca8:	00dc38b3          	sltu	a7,s8,a3
    4cac:	00650333          	add	t1,a0,t1

00004cb0 <.LVL189>:
    4cb0:	00a33533          	sltu	a0,t1,a0
    4cb4:	00ac0533          	add	a0,s8,a0
    4cb8:	01853c33          	sltu	s8,a0,s8
    4cbc:	0188e8b3          	or	a7,a7,s8
    4cc0:	04612e23          	sw	t1,92(sp)
    4cc4:	012888b3          	add	a7,a7,s2

00004cc8 <.LBB93>:
    4cc8:	02be06b3          	mul	a3,t3,a1

00004ccc <.LVL192>:
    4ccc:	02b78a33          	mul	s4,a5,a1

00004cd0 <.LVL193>:
    4cd0:	0106d713          	srli	a4,a3,0x10
    4cd4:	01ea0a33          	add	s4,s4,t5

00004cd8 <.LVL194>:
    4cd8:	01470733          	add	a4,a4,s4
    4cdc:	02578933          	mul	s2,a5,t0

00004ce0 <.LVL195>:
    4ce0:	01e77463          	bgeu	a4,t5,4ce8 <.L100>
    4ce4:	01990933          	add	s2,s2,s9

00004ce8 <.L100>:
    4ce8:	01075f13          	srli	t5,a4,0x10
    4cec:	012f0f33          	add	t5,t5,s2

00004cf0 <.LVL197>:
    4cf0:	00010937          	lui	s2,0x10

00004cf4 <.LVL198>:
    4cf4:	fff90a13          	addi	s4,s2,-1 # ffff <.LLST3+0x57a4>
    4cf8:	01477733          	and	a4,a4,s4

00004cfc <.LVL199>:
    4cfc:	0146f6b3          	and	a3,a3,s4

00004d00 <.LVL200>:
    4d00:	01071713          	slli	a4,a4,0x10

00004d04 <.LBB94>:
    4d04:	03548a33          	mul	s4,s1,s5

00004d08 <.LBB95>:
    4d08:	00d70733          	add	a4,a4,a3

00004d0c <.LBB96>:
    4d0c:	030a86b3          	mul	a3,s5,a6

00004d10 <.LVL202>:
    4d10:	030b0833          	mul	a6,s6,a6

00004d14 <.LVL203>:
    4d14:	01480c33          	add	s8,a6,s4
    4d18:	0106d813          	srli	a6,a3,0x10

00004d1c <.LVL204>:
    4d1c:	01880833          	add	a6,a6,s8
    4d20:	036484b3          	mul	s1,s1,s6

00004d24 <.LVL205>:
    4d24:	01487463          	bgeu	a6,s4,4d2c <.L101>
    4d28:	012484b3          	add	s1,s1,s2

00004d2c <.L101>:
    4d2c:	01085913          	srli	s2,a6,0x10
    4d30:	00010c37          	lui	s8,0x10
    4d34:	009904b3          	add	s1,s2,s1

00004d38 <.LVL207>:
    4d38:	fffc0913          	addi	s2,s8,-1 # ffff <.LLST3+0x57a4>
    4d3c:	0126f6b3          	and	a3,a3,s2

00004d40 <.LVL208>:
    4d40:	01287833          	and	a6,a6,s2

00004d44 <.LVL209>:
    4d44:	01081813          	slli	a6,a6,0x10

00004d48 <.LBB97>:
    4d48:	03db8a33          	mul	s4,s7,t4

00004d4c <.LBB98>:
    4d4c:	00d80833          	add	a6,a6,a3

00004d50 <.LBB99>:
    4d50:	03d98eb3          	mul	t4,s3,t4

00004d54 <.LVL212>:
    4d54:	010a5693          	srli	a3,s4,0x10
    4d58:	03338933          	mul	s2,t2,s3

00004d5c <.LVL213>:
    4d5c:	037383b3          	mul	t2,t2,s7

00004d60 <.LVL214>:
    4d60:	01d383b3          	add	t2,t2,t4

00004d64 <.LVL215>:
    4d64:	007686b3          	add	a3,a3,t2

00004d68 <.LVL216>:
    4d68:	01d6f463          	bgeu	a3,t4,4d70 <.L102>
    4d6c:	01890933          	add	s2,s2,s8

00004d70 <.L102>:
    4d70:	0106de93          	srli	t4,a3,0x10

00004d74 <.LVL218>:
    4d74:	012e8eb3          	add	t4,t4,s2

00004d78 <.LVL219>:
    4d78:	00010937          	lui	s2,0x10

00004d7c <.LVL220>:
    4d7c:	fff90393          	addi	t2,s2,-1 # ffff <.LLST3+0x57a4>
    4d80:	0076f6b3          	and	a3,a3,t2

00004d84 <.LVL221>:
    4d84:	007a7a33          	and	s4,s4,t2

00004d88 <.LVL222>:
    4d88:	01069693          	slli	a3,a3,0x10

00004d8c <.LBB100>:
    4d8c:	02ba83b3          	mul	t2,s5,a1

00004d90 <.LBB101>:
    4d90:	014686b3          	add	a3,a3,s4

00004d94 <.LBB102>:
    4d94:	02bb05b3          	mul	a1,s6,a1

00004d98 <.LVL224>:
    4d98:	03528a33          	mul	s4,t0,s5

00004d9c <.LVL225>:
    4d9c:	01458c33          	add	s8,a1,s4
    4da0:	0103d593          	srli	a1,t2,0x10

00004da4 <.LVL226>:
    4da4:	018585b3          	add	a1,a1,s8
    4da8:	036282b3          	mul	t0,t0,s6

00004dac <.LVL227>:
    4dac:	0145f463          	bgeu	a1,s4,4db4 <.L103>
    4db0:	012282b3          	add	t0,t0,s2

00004db4 <.L103>:
    4db4:	0105d913          	srli	s2,a1,0x10
    4db8:	005902b3          	add	t0,s2,t0

00004dbc <.LVL229>:
    4dbc:	00010937          	lui	s2,0x10
    4dc0:	fff90a13          	addi	s4,s2,-1 # ffff <.LLST3+0x57a4>

00004dc4 <.LVL230>:
    4dc4:	0145f5b3          	and	a1,a1,s4

00004dc8 <.LVL231>:
    4dc8:	0143f3b3          	and	t2,t2,s4

00004dcc <.LVL232>:
    4dcc:	01059593          	slli	a1,a1,0x10

00004dd0 <.LBB103>:
    4dd0:	03378a33          	mul	s4,a5,s3

00004dd4 <.LBB104>:
    4dd4:	007585b3          	add	a1,a1,t2

00004dd8 <.LBB105>:
    4dd8:	037787b3          	mul	a5,a5,s7

00004ddc <.LVL234>:
    4ddc:	03cb83b3          	mul	t2,s7,t3

00004de0 <.LVL235>:
    4de0:	03c98e33          	mul	t3,s3,t3

00004de4 <.LVL236>:
    4de4:	0103dc13          	srli	s8,t2,0x10

00004de8 <.LVL237>:
    4de8:	01c787b3          	add	a5,a5,t3
    4dec:	00fc07b3          	add	a5,s8,a5

00004df0 <.LVL239>:
    4df0:	01c7f463          	bgeu	a5,t3,4df8 <.L104>
    4df4:	012a0a33          	add	s4,s4,s2

00004df8 <.L104>:
    4df8:	00e50733          	add	a4,a0,a4

00004dfc <.LVL241>:
    4dfc:	0107de13          	srli	t3,a5,0x10

00004e00 <.LVL242>:
    4e00:	00010937          	lui	s2,0x10
    4e04:	01e88f33          	add	t5,a7,t5

00004e08 <.LVL243>:
    4e08:	014e0e33          	add	t3,t3,s4

00004e0c <.LBB106>:
    4e0c:	00a73533          	sltu	a0,a4,a0

00004e10 <.LBB107>:
    4e10:	fff90a13          	addi	s4,s2,-1 # ffff <.LLST3+0x57a4>

00004e14 <.LVL245>:
    4e14:	00af0533          	add	a0,t5,a0
    4e18:	01070833          	add	a6,a4,a6

00004e1c <.LVL246>:
    4e1c:	0147f7b3          	and	a5,a5,s4

00004e20 <.LVL247>:
    4e20:	009504b3          	add	s1,a0,s1

00004e24 <.LVL248>:
    4e24:	0143f3b3          	and	t2,t2,s4

00004e28 <.LBB108>:
    4e28:	00e83733          	sltu	a4,a6,a4

00004e2c <.LBB109>:
    4e2c:	01079793          	slli	a5,a5,0x10
    4e30:	007787b3          	add	a5,a5,t2

00004e34 <.LBB110>:
    4e34:	00e483b3          	add	t2,s1,a4

00004e38 <.LBB112>:
    4e38:	011f38b3          	sltu	a7,t5,a7

00004e3c <.LVL252>:
    4e3c:	01e53f33          	sltu	t5,a0,t5

00004e40 <.LBB113>:
    4e40:	00a4b533          	sltu	a0,s1,a0

00004e44 <.LVL254>:
    4e44:	0093b4b3          	sltu	s1,t2,s1

00004e48 <.LVL255>:
    4e48:	00956533          	or	a0,a0,s1

00004e4c <.LBB114>:
    4e4c:	01e8e8b3          	or	a7,a7,t5

00004e50 <.LBB115>:
    4e50:	00a888b3          	add	a7,a7,a0

00004e54 <.LBB116>:
    4e54:	037a8533          	mul	a0,s5,s7
    4e58:	00d806b3          	add	a3,a6,a3

00004e5c <.LVL258>:
    4e5c:	01d38eb3          	add	t4,t2,t4

00004e60 <.LBB118>:
    4e60:	06d12023          	sw	a3,96(sp)

00004e64 <.LVL260>:
    4e64:	0106b6b3          	sltu	a3,a3,a6

00004e68 <.LVL261>:
    4e68:	00de8733          	add	a4,t4,a3

00004e6c <.LVL262>:
    4e6c:	007eb3b3          	sltu	t2,t4,t2

00004e70 <.LVL263>:
    4e70:	01d73eb3          	sltu	t4,a4,t4

00004e74 <.LVL264>:
    4e74:	01d3e3b3          	or	t2,t2,t4

00004e78 <.LVL265>:
    4e78:	00b705b3          	add	a1,a4,a1

00004e7c <.LBB119>:
    4e7c:	03598ab3          	mul	s5,s3,s5

00004e80 <.LBB120>:
    4e80:	011383b3          	add	t2,t2,a7

00004e84 <.LBB121>:
    4e84:	005382b3          	add	t0,t2,t0

00004e88 <.LVL269>:
    4e88:	00e5b733          	sltu	a4,a1,a4

00004e8c <.LVL270>:
    4e8c:	00e28733          	add	a4,t0,a4

00004e90 <.LVL271>:
    4e90:	00f587b3          	add	a5,a1,a5

00004e94 <.LVL272>:
    4e94:	01c70e33          	add	t3,a4,t3

00004e98 <.LBB122>:
    4e98:	06f12223          	sw	a5,100(sp)
    4e9c:	00b7b7b3          	sltu	a5,a5,a1
    4ea0:	00fe07b3          	add	a5,t3,a5

00004ea4 <.LBB123>:
    4ea4:	033b09b3          	mul	s3,s6,s3

00004ea8 <.LVL274>:
    4ea8:	01055693          	srli	a3,a0,0x10

00004eac <.LBB124>:
    4eac:	0072b3b3          	sltu	t2,t0,t2

00004eb0 <.LVL276>:
    4eb0:	005732b3          	sltu	t0,a4,t0

00004eb4 <.LBB125>:
    4eb4:	00ee3733          	sltu	a4,t3,a4
    4eb8:	01c7be33          	sltu	t3,a5,t3

00004ebc <.LBB126>:
    4ebc:	0053e3b3          	or	t2,t2,t0

00004ec0 <.LBB127>:
    4ec0:	01c76733          	or	a4,a4,t3

00004ec4 <.LBB128>:
    4ec4:	037b0b33          	mul	s6,s6,s7

00004ec8 <.LVL279>:
    4ec8:	015b0b33          	add	s6,s6,s5

00004ecc <.LVL280>:
    4ecc:	016686b3          	add	a3,a3,s6

00004ed0 <.LVL281>:
    4ed0:	0156f463          	bgeu	a3,s5,4ed8 <.L135>
    4ed4:	012989b3          	add	s3,s3,s2

00004ed8 <.L135>:
    4ed8:	00010837          	lui	a6,0x10

00004edc <.LVL283>:
    4edc:	fff80813          	addi	a6,a6,-1 # ffff <.LLST3+0x57a4>
    4ee0:	0106d593          	srli	a1,a3,0x10
    4ee4:	0106f6b3          	and	a3,a3,a6

00004ee8 <.LVL284>:
    4ee8:	01069693          	slli	a3,a3,0x10
    4eec:	01057533          	and	a0,a0,a6

00004ef0 <.LVL285>:
    4ef0:	00a686b3          	add	a3,a3,a0
    4ef4:	00d786b3          	add	a3,a5,a3
    4ef8:	007585b3          	add	a1,a1,t2

00004efc <.LBB129>:
    4efc:	00f6b7b3          	sltu	a5,a3,a5
    4f00:	00e58733          	add	a4,a1,a4

00004f04 <.LVL287>:
    4f04:	00e787b3          	add	a5,a5,a4
    4f08:	013787b3          	add	a5,a5,s3
    4f0c:	06f12623          	sw	a5,108(sp)

00004f10 <.LBB131>:
    4f10:	01012783          	lw	a5,16(sp)
    4f14:	00d31313          	slli	t1,t1,0xd

00004f18 <.LBB130>:
    4f18:	06d12423          	sw	a3,104(sp)

00004f1c <.LBB133>:
    4f1c:	00c7e7b3          	or	a5,a5,a2

00004f20 <.LVL289>:
    4f20:	00ffefb3          	or	t6,t6,a5

00004f24 <.LVL290>:
    4f24:	01f36333          	or	t1,t1,t6

00004f28 <.LVL291>:
    4f28:	05010793          	addi	a5,sp,80
    4f2c:	06010613          	addi	a2,sp,96

00004f30 <.L138>:
    4f30:	00c7a703          	lw	a4,12(a5)
    4f34:	0107a683          	lw	a3,16(a5)
    4f38:	00478793          	addi	a5,a5,4
    4f3c:	01375713          	srli	a4,a4,0x13
    4f40:	00d69693          	slli	a3,a3,0xd
    4f44:	00d76733          	or	a4,a4,a3
    4f48:	fee7ae23          	sw	a4,-4(a5)
    4f4c:	fef612e3          	bne	a2,a5,4f30 <.L138>

00004f50 <.LBE133>:
    4f50:	05812703          	lw	a4,88(sp)

00004f54 <.LBB134>:
    4f54:	05012783          	lw	a5,80(sp)
    4f58:	00603333          	snez	t1,t1

00004f5c <.LBE134>:
    4f5c:	04e12423          	sw	a4,72(sp)
    4f60:	05412703          	lw	a4,84(sp)

00004f64 <.LBB135>:
    4f64:	00f36333          	or	t1,t1,a5

00004f68 <.LBE135>:
    4f68:	05c12783          	lw	a5,92(sp)
    4f6c:	04e12223          	sw	a4,68(sp)

00004f70 <.LBE20>:
    4f70:	00100737          	lui	a4,0x100

00004f74 <.LBB136>:
    4f74:	04f12623          	sw	a5,76(sp)
    4f78:	04612023          	sw	t1,64(sp)

00004f7c <.LBE136>:
    4f7c:	00e7f7b3          	and	a5,a5,a4
    4f80:	52078e63          	beqz	a5,54bc <.L178>

00004f84 <.LBB137>:
    4f84:	01f31313          	slli	t1,t1,0x1f

00004f88 <.LVL295>:
    4f88:	04010793          	addi	a5,sp,64
    4f8c:	04c10613          	addi	a2,sp,76

00004f90 <.L140>:
    4f90:	0007a703          	lw	a4,0(a5)
    4f94:	0047a683          	lw	a3,4(a5)
    4f98:	00478793          	addi	a5,a5,4
    4f9c:	00175713          	srli	a4,a4,0x1
    4fa0:	01f69693          	slli	a3,a3,0x1f
    4fa4:	00d76733          	or	a4,a4,a3
    4fa8:	fee7ae23          	sw	a4,-4(a5)
    4fac:	fef612e3          	bne	a2,a5,4f90 <.L140>

00004fb0 <.LVL297>:
    4fb0:	04c12783          	lw	a5,76(sp)
    4fb4:	00603333          	snez	t1,t1

00004fb8 <.LVL298>:
    4fb8:	0017d793          	srli	a5,a5,0x1
    4fbc:	04f12623          	sw	a5,76(sp)

00004fc0 <.LBE138>:
    4fc0:	04012783          	lw	a5,64(sp)
    4fc4:	0067e7b3          	or	a5,a5,t1
    4fc8:	04f12023          	sw	a5,64(sp)

00004fcc <.L139>:
    4fcc:	00812703          	lw	a4,8(sp)
    4fd0:	000047b7          	lui	a5,0x4
    4fd4:	fff78793          	addi	a5,a5,-1 # 3fff <.LVL227+0x3>
    4fd8:	00f707b3          	add	a5,a4,a5

00004fdc <.LVL301>:
    4fdc:	50f05263          	blez	a5,54e0 <.L144>
    4fe0:	04012703          	lw	a4,64(sp)
    4fe4:	00777693          	andi	a3,a4,7
    4fe8:	04068463          	beqz	a3,5030 <.L145>
    4fec:	00f77693          	andi	a3,a4,15
    4ff0:	00400613          	li	a2,4
    4ff4:	02c68e63          	beq	a3,a2,5030 <.L145>

00004ff8 <.LBB139>:
    4ff8:	00470713          	addi	a4,a4,4 # 100004 <.LLST3+0xf57a9>
    4ffc:	00473693          	sltiu	a3,a4,4
    5000:	04e12023          	sw	a4,64(sp)

00005004 <.LVL302>:
    5004:	04412703          	lw	a4,68(sp)

00005008 <.LVL303>:
    5008:	00e68733          	add	a4,a3,a4
    500c:	04e12223          	sw	a4,68(sp)

00005010 <.LVL304>:
    5010:	00d73733          	sltu	a4,a4,a3

00005014 <.LVL305>:
    5014:	04812683          	lw	a3,72(sp)
    5018:	00e68733          	add	a4,a3,a4

0000501c <.LVL306>:
    501c:	04e12423          	sw	a4,72(sp)

00005020 <.LVL307>:
    5020:	00d73733          	sltu	a4,a4,a3

00005024 <.LVL308>:
    5024:	04c12683          	lw	a3,76(sp)
    5028:	00d70733          	add	a4,a4,a3

0000502c <.LVL309>:
    502c:	04e12623          	sw	a4,76(sp)

00005030 <.L145>:
    5030:	04c12703          	lw	a4,76(sp)
    5034:	001006b7          	lui	a3,0x100
    5038:	00d776b3          	and	a3,a4,a3
    503c:	02068063          	beqz	a3,505c <.L150>
    5040:	fff007b7          	lui	a5,0xfff00

00005044 <.LVL311>:
    5044:	fff78793          	addi	a5,a5,-1 # ffefffff <.LLST3+0xffef57a4>
    5048:	00f77733          	and	a4,a4,a5
    504c:	04e12623          	sw	a4,76(sp)
    5050:	00812703          	lw	a4,8(sp)
    5054:	000047b7          	lui	a5,0x4

00005058 <.LVL312>:
    5058:	00f707b3          	add	a5,a4,a5

0000505c <.L150>:
    505c:	04010713          	addi	a4,sp,64
    5060:	04c10593          	addi	a1,sp,76

00005064 <.L151>:
    5064:	00072683          	lw	a3,0(a4)
    5068:	00472603          	lw	a2,4(a4)
    506c:	00470713          	addi	a4,a4,4
    5070:	0036d693          	srli	a3,a3,0x3
    5074:	01d61613          	slli	a2,a2,0x1d
    5078:	00c6e6b3          	or	a3,a3,a2
    507c:	fed72e23          	sw	a3,-4(a4)
    5080:	feb712e3          	bne	a4,a1,5064 <.L151>

00005084 <.LBE140>:
    5084:	000086b7          	lui	a3,0x8
    5088:	ffe68613          	addi	a2,a3,-2 # 7ffe <.LLST42+0xe>

0000508c <.LBB141>:
    508c:	04c12703          	lw	a4,76(sp)

00005090 <.LBE141>:
    5090:	42f64c63          	blt	a2,a5,54c8 <.L152>

00005094 <.LBB142>:
    5094:	00375713          	srli	a4,a4,0x3
    5098:	04e12623          	sw	a4,76(sp)

0000509c <.L153>:
    509c:	04c12703          	lw	a4,76(sp)

000050a0 <.LBE143>:
    50a0:	0ac12083          	lw	ra,172(sp)
    50a4:	00040513          	mv	a0,s0

000050a8 <.LBB144>:
    50a8:	04e11e23          	sh	a4,92(sp)
    50ac:	00412703          	lw	a4,4(sp)

000050b0 <.LBE144>:
    50b0:	0a412483          	lw	s1,164(sp)
    50b4:	0a012903          	lw	s2,160(sp)

000050b8 <.LBB145>:
    50b8:	00f71713          	slli	a4,a4,0xf
    50bc:	00f767b3          	or	a5,a4,a5

000050c0 <.LVL317>:
    50c0:	04f11f23          	sh	a5,94(sp)

000050c4 <.LBE145>:
    50c4:	04012783          	lw	a5,64(sp)
    50c8:	09c12983          	lw	s3,156(sp)
    50cc:	09812a03          	lw	s4,152(sp)
    50d0:	00f42023          	sw	a5,0(s0)
    50d4:	04412783          	lw	a5,68(sp)
    50d8:	09412a83          	lw	s5,148(sp)
    50dc:	09012b03          	lw	s6,144(sp)
    50e0:	00f42223          	sw	a5,4(s0)
    50e4:	04812783          	lw	a5,72(sp)
    50e8:	08c12b83          	lw	s7,140(sp)
    50ec:	08812c03          	lw	s8,136(sp)
    50f0:	00f42423          	sw	a5,8(s0)
    50f4:	05c12783          	lw	a5,92(sp)
    50f8:	08412c83          	lw	s9,132(sp)
    50fc:	08012d03          	lw	s10,128(sp)
    5100:	00f42623          	sw	a5,12(s0)
    5104:	0a812403          	lw	s0,168(sp)
    5108:	07c12d83          	lw	s11,124(sp)
    510c:	0b010113          	addi	sp,sp,176

00005110 <.LVL320>:
    5110:	00008067          	ret

00005114 <.L2>:
    5114:	00a7e633          	or	a2,a5,a0
    5118:	00d66633          	or	a2,a2,a3
    511c:	00e66633          	or	a2,a2,a4
    5120:	14060c63          	beqz	a2,5278 <.L174>

00005124 <.LBB146>:
    5124:	04070e63          	beqz	a4,5180 <.L6>
    5128:	00070513          	mv	a0,a4
    512c:	21c020ef          	jal	ra,7348 <__clzsi2>

00005130 <.LBB9>:
    5130:	ff450693          	addi	a3,a0,-12

00005134 <.LVL323>:
    5134:	02000613          	li	a2,32
    5138:	40d60633          	sub	a2,a2,a3

0000513c <.LVL324>:
    513c:	00000793          	li	a5,0

00005140 <.L7>:
    5140:	ffc00593          	li	a1,-4
    5144:	02b785b3          	mul	a1,a5,a1
    5148:	02010313          	addi	t1,sp,32
    514c:	00c58713          	addi	a4,a1,12
    5150:	00e30733          	add	a4,t1,a4
    5154:	40b005b3          	neg	a1,a1

00005158 <.L12>:
    5158:	0ee31063          	bne	t1,a4,5238 <.L15>
    515c:	fff78713          	addi	a4,a5,-1 # 3fff <.LVL227+0x3>

00005160 <.LVL326>:
    5160:	00279793          	slli	a5,a5,0x2
    5164:	02010613          	addi	a2,sp,32

00005168 <.LVL327>:
    5168:	05078793          	addi	a5,a5,80
    516c:	00c787b3          	add	a5,a5,a2
    5170:	02012603          	lw	a2,32(sp)
    5174:	00d616b3          	sll	a3,a2,a3

00005178 <.LVL328>:
    5178:	fad7a823          	sw	a3,-80(a5)
    517c:	07c0006f          	j	51f8 <.L14>

00005180 <.L6>:
    5180:	02068663          	beqz	a3,51ac <.L8>
    5184:	00068513          	mv	a0,a3
    5188:	1c0020ef          	jal	ra,7348 <__clzsi2>

0000518c <.LVL330>:
    518c:	02050513          	addi	a0,a0,32

00005190 <.L9>:
    5190:	ff450693          	addi	a3,a0,-12
    5194:	4056d793          	srai	a5,a3,0x5

00005198 <.LVL332>:
    5198:	01f6f693          	andi	a3,a3,31

0000519c <.LVL333>:
    519c:	02068863          	beqz	a3,51cc <.L11>
    51a0:	02000613          	li	a2,32
    51a4:	40d60633          	sub	a2,a2,a3

000051a8 <.LVL334>:
    51a8:	f99ff06f          	j	5140 <.L7>

000051ac <.L8>:
    51ac:	00050863          	beqz	a0,51bc <.L10>
    51b0:	198020ef          	jal	ra,7348 <__clzsi2>

000051b4 <.LVL336>:
    51b4:	04050513          	addi	a0,a0,64
    51b8:	fd9ff06f          	j	5190 <.L9>

000051bc <.L10>:
    51bc:	00078513          	mv	a0,a5
    51c0:	188020ef          	jal	ra,7348 <__clzsi2>

000051c4 <.LVL339>:
    51c4:	06050513          	addi	a0,a0,96
    51c8:	fc9ff06f          	j	5190 <.L9>

000051cc <.L11>:
    51cc:	ffc00613          	li	a2,-4
    51d0:	02c78633          	mul	a2,a5,a2
    51d4:	02c10713          	addi	a4,sp,44

000051d8 <.LBB11>:
    51d8:	00300693          	li	a3,3

000051dc <.L13>:
    51dc:	00c705b3          	add	a1,a4,a2
    51e0:	0005a583          	lw	a1,0(a1)
    51e4:	fff68693          	addi	a3,a3,-1

000051e8 <.LVL343>:
    51e8:	ffc70713          	addi	a4,a4,-4
    51ec:	00b72223          	sw	a1,4(a4)

000051f0 <.LVL344>:
    51f0:	fef6d6e3          	bge	a3,a5,51dc <.L13>
    51f4:	fff78713          	addi	a4,a5,-1

000051f8 <.L14>:
    51f8:	00170793          	addi	a5,a4,1
    51fc:	00279793          	slli	a5,a5,0x2
    5200:	00800693          	li	a3,8
    5204:	02010713          	addi	a4,sp,32
    5208:	00d7ea63          	bltu	a5,a3,521c <.L16>
    520c:	02012023          	sw	zero,32(sp)
    5210:	00072223          	sw	zero,4(a4)
    5214:	ff878793          	addi	a5,a5,-8
    5218:	02810713          	addi	a4,sp,40

0000521c <.L16>:
    521c:	00400693          	li	a3,4
    5220:	00d7e463          	bltu	a5,a3,5228 <.L17>
    5224:	00072023          	sw	zero,0(a4)

00005228 <.L17>:
    5228:	ffffc4b7          	lui	s1,0xffffc

0000522c <.LVL346>:
    522c:	01148493          	addi	s1,s1,17 # ffffc011 <.LLST3+0xffff17b6>
    5230:	40a484b3          	sub	s1,s1,a0
    5234:	d6cff06f          	j	47a0 <.L203>

00005238 <.L15>:
    5238:	00072803          	lw	a6,0(a4)
    523c:	ffc72883          	lw	a7,-4(a4)
    5240:	00b70e33          	add	t3,a4,a1
    5244:	00d81833          	sll	a6,a6,a3
    5248:	00c8d8b3          	srl	a7,a7,a2
    524c:	01186833          	or	a6,a6,a7
    5250:	010e2023          	sw	a6,0(t3)
    5254:	ffc70713          	addi	a4,a4,-4
    5258:	f01ff06f          	j	5158 <.L12>

0000525c <.L3>:
    525c:	00a7e7b3          	or	a5,a5,a0
    5260:	00d7e7b3          	or	a5,a5,a3
    5264:	00e7e7b3          	or	a5,a5,a4
    5268:	00200b93          	li	s7,2
    526c:	d2078c63          	beqz	a5,47a4 <.L5>
    5270:	00300b93          	li	s7,3
    5274:	d30ff06f          	j	47a4 <.L5>

00005278 <.L174>:
    5278:	00000493          	li	s1,0

0000527c <.LBE147>:
    527c:	00100b93          	li	s7,1
    5280:	d24ff06f          	j	47a4 <.L5>

00005284 <.L18>:
    5284:	016967b3          	or	a5,s2,s6

00005288 <.LVL351>:
    5288:	0157e7b3          	or	a5,a5,s5
    528c:	00a7e7b3          	or	a5,a5,a0
    5290:	14078c63          	beqz	a5,53e8 <.L176>

00005294 <.LBB148>:
    5294:	04050c63          	beqz	a0,52ec <.L22>
    5298:	0b0020ef          	jal	ra,7348 <__clzsi2>

0000529c <.LBB16>:
    529c:	ff450693          	addi	a3,a0,-12

000052a0 <.LVL353>:
    52a0:	02000593          	li	a1,32
    52a4:	40d585b3          	sub	a1,a1,a3

000052a8 <.LVL354>:
    52a8:	00000793          	li	a5,0

000052ac <.L23>:
    52ac:	ffc00613          	li	a2,-4
    52b0:	02c78633          	mul	a2,a5,a2
    52b4:	03010313          	addi	t1,sp,48
    52b8:	00c60713          	addi	a4,a2,12
    52bc:	00e30733          	add	a4,t1,a4
    52c0:	40c00633          	neg	a2,a2

000052c4 <.L28>:
    52c4:	0ee31263          	bne	t1,a4,53a8 <.L31>
    52c8:	fff78713          	addi	a4,a5,-1

000052cc <.LVL356>:
    52cc:	00279793          	slli	a5,a5,0x2
    52d0:	02010613          	addi	a2,sp,32
    52d4:	05078793          	addi	a5,a5,80
    52d8:	00c787b3          	add	a5,a5,a2
    52dc:	03012603          	lw	a2,48(sp)
    52e0:	00d616b3          	sll	a3,a2,a3

000052e4 <.LVL357>:
    52e4:	fcd7a023          	sw	a3,-64(a5)
    52e8:	0800006f          	j	5368 <.L30>

000052ec <.L22>:
    52ec:	020a8663          	beqz	s5,5318 <.L24>
    52f0:	000a8513          	mv	a0,s5
    52f4:	054020ef          	jal	ra,7348 <__clzsi2>

000052f8 <.LVL359>:
    52f8:	02050513          	addi	a0,a0,32

000052fc <.L25>:
    52fc:	ff450693          	addi	a3,a0,-12
    5300:	4056d793          	srai	a5,a3,0x5

00005304 <.LVL361>:
    5304:	01f6f693          	andi	a3,a3,31

00005308 <.LVL362>:
    5308:	02068a63          	beqz	a3,533c <.L27>
    530c:	02000593          	li	a1,32
    5310:	40d585b3          	sub	a1,a1,a3

00005314 <.LVL363>:
    5314:	f99ff06f          	j	52ac <.L23>

00005318 <.L24>:
    5318:	000b0a63          	beqz	s6,532c <.L26>
    531c:	000b0513          	mv	a0,s6
    5320:	028020ef          	jal	ra,7348 <__clzsi2>

00005324 <.LVL365>:
    5324:	04050513          	addi	a0,a0,64
    5328:	fd5ff06f          	j	52fc <.L25>

0000532c <.L26>:
    532c:	00090513          	mv	a0,s2
    5330:	018020ef          	jal	ra,7348 <__clzsi2>

00005334 <.LVL368>:
    5334:	06050513          	addi	a0,a0,96
    5338:	fc5ff06f          	j	52fc <.L25>

0000533c <.L27>:
    533c:	ffc00613          	li	a2,-4
    5340:	02c78633          	mul	a2,a5,a2
    5344:	03c10713          	addi	a4,sp,60

00005348 <.LBB18>:
    5348:	00300693          	li	a3,3

0000534c <.L29>:
    534c:	00c705b3          	add	a1,a4,a2
    5350:	0005a583          	lw	a1,0(a1)
    5354:	fff68693          	addi	a3,a3,-1

00005358 <.LVL372>:
    5358:	ffc70713          	addi	a4,a4,-4
    535c:	00b72223          	sw	a1,4(a4)

00005360 <.LVL373>:
    5360:	fef6d6e3          	bge	a3,a5,534c <.L29>
    5364:	fff78713          	addi	a4,a5,-1

00005368 <.L30>:
    5368:	00170793          	addi	a5,a4,1
    536c:	00279793          	slli	a5,a5,0x2
    5370:	00800693          	li	a3,8
    5374:	03010713          	addi	a4,sp,48
    5378:	00d7ea63          	bltu	a5,a3,538c <.L32>
    537c:	02012823          	sw	zero,48(sp)
    5380:	00072223          	sw	zero,4(a4)
    5384:	ff878793          	addi	a5,a5,-8
    5388:	03810713          	addi	a4,sp,56

0000538c <.L32>:
    538c:	00400693          	li	a3,4
    5390:	00d7e463          	bltu	a5,a3,5398 <.L33>
    5394:	00072023          	sw	zero,0(a4)

00005398 <.L33>:
    5398:	ffffc7b7          	lui	a5,0xffffc
    539c:	01178793          	addi	a5,a5,17 # ffffc011 <.LLST3+0xffff17b6>
    53a0:	40a787b3          	sub	a5,a5,a0
    53a4:	c90ff06f          	j	4834 <.L204>

000053a8 <.L31>:
    53a8:	00072803          	lw	a6,0(a4)
    53ac:	ffc72883          	lw	a7,-4(a4)
    53b0:	00c70e33          	add	t3,a4,a2
    53b4:	00d81833          	sll	a6,a6,a3
    53b8:	00b8d8b3          	srl	a7,a7,a1
    53bc:	01186833          	or	a6,a6,a7
    53c0:	010e2023          	sw	a6,0(t3)
    53c4:	ffc70713          	addi	a4,a4,-4
    53c8:	efdff06f          	j	52c4 <.L28>

000053cc <.L19>:
    53cc:	01696933          	or	s2,s2,s6
    53d0:	01596933          	or	s2,s2,s5
    53d4:	00a96933          	or	s2,s2,a0
    53d8:	00200693          	li	a3,2
    53dc:	c4090e63          	beqz	s2,4838 <.L21>
    53e0:	00300693          	li	a3,3
    53e4:	c54ff06f          	j	4838 <.L21>

000053e8 <.L176>:
    53e8:	00000793          	li	a5,0

000053ec <.LBE149>:
    53ec:	00100693          	li	a3,1
    53f0:	c48ff06f          	j	4838 <.L21>

000053f4 <.L35>:
    53f4:	00100713          	li	a4,1
    53f8:	00f717b3          	sll	a5,a4,a5
    53fc:	5307f713          	andi	a4,a5,1328
    5400:	04071463          	bnez	a4,5448 <.L38>
    5404:	0887f713          	andi	a4,a5,136
    5408:	08071663          	bnez	a4,5494 <.L39>
    540c:	2407f793          	andi	a5,a5,576
    5410:	c6078263          	beqz	a5,4874 <.L36>

00005414 <.L40>:
    5414:	000087b7          	lui	a5,0x8
    5418:	04f12623          	sw	a5,76(sp)
    541c:	04012423          	sw	zero,72(sp)
    5420:	04012223          	sw	zero,68(sp)
    5424:	04012023          	sw	zero,64(sp)

00005428 <.LVL380>:
    5428:	fff78793          	addi	a5,a5,-1 # 7fff <.LLST42+0xf>
    542c:	00012223          	sw	zero,4(sp)
    5430:	c6dff06f          	j	509c <.L153>

00005434 <.L34>:
    5434:	00f00713          	li	a4,15
    5438:	fce78ee3          	beq	a5,a4,5414 <.L40>
    543c:	00b00713          	li	a4,11
    5440:	04e78a63          	beq	a5,a4,5494 <.L39>

00005444 <.LBB150>:
    5444:	01312223          	sw	s3,4(sp)

00005448 <.L38>:
    5448:	02012783          	lw	a5,32(sp)
    544c:	04f12023          	sw	a5,64(sp)
    5450:	02412783          	lw	a5,36(sp)
    5454:	04f12223          	sw	a5,68(sp)
    5458:	02812783          	lw	a5,40(sp)
    545c:	04f12423          	sw	a5,72(sp)
    5460:	02c12783          	lw	a5,44(sp)

00005464 <.L141>:
    5464:	04f12623          	sw	a5,76(sp)
    5468:	00200793          	li	a5,2
    546c:	28fb8263          	beq	s7,a5,56f0 <.L142>
    5470:	00300793          	li	a5,3
    5474:	fafb80e3          	beq	s7,a5,5414 <.L40>
    5478:	00100793          	li	a5,1
    547c:	b4fb98e3          	bne	s7,a5,4fcc <.L139>

00005480 <.L205>:
    5480:	04012623          	sw	zero,76(sp)
    5484:	04012423          	sw	zero,72(sp)
    5488:	04012223          	sw	zero,68(sp)

0000548c <.LBB159>:
    548c:	04012023          	sw	zero,64(sp)
    5490:	2340006f          	j	56c4 <.L173>

00005494 <.L39>:
    5494:	01412223          	sw	s4,4(sp)

00005498 <.L37>:
    5498:	03012783          	lw	a5,48(sp)
    549c:	00068b93          	mv	s7,a3

000054a0 <.LVL388>:
    54a0:	04f12023          	sw	a5,64(sp)
    54a4:	03412783          	lw	a5,52(sp)
    54a8:	04f12223          	sw	a5,68(sp)
    54ac:	03812783          	lw	a5,56(sp)
    54b0:	04f12423          	sw	a5,72(sp)
    54b4:	03c12783          	lw	a5,60(sp)

000054b8 <.LVL389>:
    54b8:	fadff06f          	j	5464 <.L141>

000054bc <.L178>:
    54bc:	00c12783          	lw	a5,12(sp)
    54c0:	00f12423          	sw	a5,8(sp)

000054c4 <.LVL391>:
    54c4:	b09ff06f          	j	4fcc <.L139>

000054c8 <.L152>:
    54c8:	04012623          	sw	zero,76(sp)
    54cc:	04012423          	sw	zero,72(sp)
    54d0:	04012223          	sw	zero,68(sp)
    54d4:	04012023          	sw	zero,64(sp)
    54d8:	fff68793          	addi	a5,a3,-1
    54dc:	bc1ff06f          	j	509c <.L153>

000054e0 <.L144>:
    54e0:	00100693          	li	a3,1
    54e4:	00078863          	beqz	a5,54f4 <.L154>
    54e8:	40f686b3          	sub	a3,a3,a5

000054ec <.LVL394>:
    54ec:	07400793          	li	a5,116
    54f0:	1cd7ce63          	blt	a5,a3,56cc <.L155>

000054f4 <.L154>:
    54f4:	04010513          	addi	a0,sp,64
    54f8:	4056d713          	srai	a4,a3,0x5

000054fc <.LVL396>:
    54fc:	00050593          	mv	a1,a0
    5500:	01f6f693          	andi	a3,a3,31

00005504 <.LVL397>:
    5504:	00000793          	li	a5,0
    5508:	00000613          	li	a2,0

0000550c <.L156>:
    550c:	02e61e63          	bne	a2,a4,5548 <.L157>
    5510:	00300613          	li	a2,3

00005514 <.LVL399>:
    5514:	40e60633          	sub	a2,a2,a4
    5518:	00271593          	slli	a1,a4,0x2
    551c:	04069063          	bnez	a3,555c <.L158>
    5520:	00050813          	mv	a6,a0

00005524 <.L159>:
    5524:	00b808b3          	add	a7,a6,a1
    5528:	0008a883          	lw	a7,0(a7)
    552c:	00168693          	addi	a3,a3,1

00005530 <.LVL401>:
    5530:	00480813          	addi	a6,a6,4
    5534:	ff182e23          	sw	a7,-4(a6)

00005538 <.LVL402>:
    5538:	fed656e3          	bge	a2,a3,5524 <.L159>
    553c:	00400693          	li	a3,4

00005540 <.LVL403>:
    5540:	40e68733          	sub	a4,a3,a4

00005544 <.LVL404>:
    5544:	06c0006f          	j	55b0 <.L163>

00005548 <.L157>:
    5548:	0005a803          	lw	a6,0(a1)
    554c:	00160613          	addi	a2,a2,1

00005550 <.LVL406>:
    5550:	00458593          	addi	a1,a1,4
    5554:	0107e7b3          	or	a5,a5,a6

00005558 <.LVL407>:
    5558:	fb5ff06f          	j	550c <.L156>

0000555c <.L158>:
    555c:	05058813          	addi	a6,a1,80
    5560:	02010893          	addi	a7,sp,32
    5564:	01180833          	add	a6,a6,a7
    5568:	fd082803          	lw	a6,-48(a6)
    556c:	02000313          	li	t1,32
    5570:	40d30333          	sub	t1,t1,a3
    5574:	00681833          	sll	a6,a6,t1
    5578:	0107e7b3          	or	a5,a5,a6

0000557c <.LVL409>:
    557c:	00000e13          	li	t3,0
    5580:	00b50833          	add	a6,a0,a1
    5584:	40b005b3          	neg	a1,a1

00005588 <.L161>:
    5588:	0ece4263          	blt	t3,a2,566c <.L162>
    558c:	00400593          	li	a1,4
    5590:	00261613          	slli	a2,a2,0x2
    5594:	40e58733          	sub	a4,a1,a4

00005598 <.LVL411>:
    5598:	05060613          	addi	a2,a2,80
    559c:	02010593          	addi	a1,sp,32
    55a0:	00b60633          	add	a2,a2,a1
    55a4:	04c12583          	lw	a1,76(sp)
    55a8:	00d5d6b3          	srl	a3,a1,a3

000055ac <.LVL412>:
    55ac:	fcd62823          	sw	a3,-48(a2)

000055b0 <.L163>:
    55b0:	00400693          	li	a3,4
    55b4:	40e686b3          	sub	a3,a3,a4
    55b8:	00269693          	slli	a3,a3,0x2
    55bc:	00271713          	slli	a4,a4,0x2
    55c0:	00800613          	li	a2,8
    55c4:	00e50733          	add	a4,a0,a4
    55c8:	00c6ea63          	bltu	a3,a2,55dc <.L164>
    55cc:	00072023          	sw	zero,0(a4)
    55d0:	00072223          	sw	zero,4(a4)
    55d4:	ff868693          	addi	a3,a3,-8
    55d8:	00870713          	addi	a4,a4,8

000055dc <.L164>:
    55dc:	00400613          	li	a2,4
    55e0:	00c6e463          	bltu	a3,a2,55e8 <.L165>
    55e4:	00072023          	sw	zero,0(a4)

000055e8 <.L165>:
    55e8:	04012703          	lw	a4,64(sp)

000055ec <.LBB154>:
    55ec:	00f037b3          	snez	a5,a5

000055f0 <.LBE154>:
    55f0:	00e7e7b3          	or	a5,a5,a4
    55f4:	04f12023          	sw	a5,64(sp)

000055f8 <.LBE152>:
    55f8:	0077f713          	andi	a4,a5,7
    55fc:	04070463          	beqz	a4,5644 <.L166>
    5600:	00f7f713          	andi	a4,a5,15
    5604:	00400693          	li	a3,4
    5608:	02d70e63          	beq	a4,a3,5644 <.L166>

0000560c <.LBB156>:
    560c:	04412703          	lw	a4,68(sp)
    5610:	00478793          	addi	a5,a5,4
    5614:	04f12023          	sw	a5,64(sp)

00005618 <.LVL415>:
    5618:	0047b793          	sltiu	a5,a5,4

0000561c <.LVL416>:
    561c:	00f707b3          	add	a5,a4,a5
    5620:	04f12223          	sw	a5,68(sp)

00005624 <.LVL417>:
    5624:	00e7b7b3          	sltu	a5,a5,a4

00005628 <.LVL418>:
    5628:	04812703          	lw	a4,72(sp)
    562c:	00f707b3          	add	a5,a4,a5

00005630 <.LVL419>:
    5630:	04f12423          	sw	a5,72(sp)

00005634 <.LVL420>:
    5634:	00e7b7b3          	sltu	a5,a5,a4

00005638 <.LVL421>:
    5638:	04c12703          	lw	a4,76(sp)
    563c:	00e787b3          	add	a5,a5,a4

00005640 <.LVL422>:
    5640:	04f12623          	sw	a5,76(sp)

00005644 <.L166>:
    5644:	04c12703          	lw	a4,76(sp)
    5648:	000807b7          	lui	a5,0x80
    564c:	00e7f7b3          	and	a5,a5,a4
    5650:	04078263          	beqz	a5,5694 <.L171>

00005654 <.LVL424>:
    5654:	04012623          	sw	zero,76(sp)
    5658:	04012423          	sw	zero,72(sp)
    565c:	04012223          	sw	zero,68(sp)
    5660:	04012023          	sw	zero,64(sp)
    5664:	00100793          	li	a5,1
    5668:	a35ff06f          	j	509c <.L153>

0000566c <.L162>:
    566c:	00082883          	lw	a7,0(a6)
    5670:	00482e83          	lw	t4,4(a6)
    5674:	00b80f33          	add	t5,a6,a1
    5678:	00d8d8b3          	srl	a7,a7,a3
    567c:	006e9eb3          	sll	t4,t4,t1
    5680:	01d8e8b3          	or	a7,a7,t4
    5684:	011f2023          	sw	a7,0(t5)

00005688 <.LVL426>:
    5688:	001e0e13          	addi	t3,t3,1

0000568c <.LVL427>:
    568c:	00480813          	addi	a6,a6,4
    5690:	ef9ff06f          	j	5588 <.L161>

00005694 <.L171>:
    5694:	00c50693          	addi	a3,a0,12

00005698 <.L172>:
    5698:	00052783          	lw	a5,0(a0)
    569c:	00452703          	lw	a4,4(a0)
    56a0:	00450513          	addi	a0,a0,4
    56a4:	0037d793          	srli	a5,a5,0x3
    56a8:	01d71713          	slli	a4,a4,0x1d
    56ac:	00e7e7b3          	or	a5,a5,a4
    56b0:	fef52e23          	sw	a5,-4(a0)
    56b4:	fea692e3          	bne	a3,a0,5698 <.L172>

000056b8 <.LVL429>:
    56b8:	04c12783          	lw	a5,76(sp)
    56bc:	0037d793          	srli	a5,a5,0x3
    56c0:	04f12623          	sw	a5,76(sp)

000056c4 <.L173>:
    56c4:	00000793          	li	a5,0
    56c8:	9d5ff06f          	j	509c <.L153>

000056cc <.L155>:
    56cc:	04412703          	lw	a4,68(sp)
    56d0:	04012783          	lw	a5,64(sp)
    56d4:	00e7e7b3          	or	a5,a5,a4
    56d8:	04812703          	lw	a4,72(sp)
    56dc:	00e7e7b3          	or	a5,a5,a4
    56e0:	04c12703          	lw	a4,76(sp)
    56e4:	00e7e7b3          	or	a5,a5,a4
    56e8:	fc078ee3          	beqz	a5,56c4 <.L173>
    56ec:	d95ff06f          	j	5480 <.L205>

000056f0 <.L142>:
    56f0:	000087b7          	lui	a5,0x8
    56f4:	04012623          	sw	zero,76(sp)
    56f8:	04012423          	sw	zero,72(sp)
    56fc:	04012223          	sw	zero,68(sp)
    5700:	04012023          	sw	zero,64(sp)
    5704:	fff78793          	addi	a5,a5,-1 # 7fff <.LLST42+0xf>
    5708:	995ff06f          	j	509c <.L153>

0000570c <__subtf3>:
    570c:	f9010113          	addi	sp,sp,-112
    5710:	0085a783          	lw	a5,8(a1)
    5714:	05512a23          	sw	s5,84(sp)
    5718:	00c5aa83          	lw	s5,12(a1)
    571c:	0045a703          	lw	a4,4(a1)
    5720:	05412c23          	sw	s4,88(sp)
    5724:	00050a13          	mv	s4,a0
    5728:	0005a503          	lw	a0,0(a1)
    572c:	05312e23          	sw	s3,92(sp)

00005730 <.LBB3>:
    5730:	02f12c23          	sw	a5,56(sp)
    5734:	00f12c23          	sw	a5,24(sp)

00005738 <.LBE3>:
    5738:	00062883          	lw	a7,0(a2)

0000573c <.LBB4>:
    573c:	010a9793          	slli	a5,s5,0x10

00005740 <.LBE4>:
    5740:	00462803          	lw	a6,4(a2)
    5744:	00862683          	lw	a3,8(a2)
    5748:	00c62983          	lw	s3,12(a2)
    574c:	06912223          	sw	s1,100(sp)

00005750 <.LBB5>:
    5750:	0107d793          	srli	a5,a5,0x10
    5754:	001a9493          	slli	s1,s5,0x1
    5758:	02a12823          	sw	a0,48(sp)
    575c:	03512e23          	sw	s5,60(sp)
    5760:	00a12823          	sw	a0,16(sp)

00005764 <.LBE5>:
    5764:	06112623          	sw	ra,108(sp)
    5768:	06812423          	sw	s0,104(sp)
    576c:	07212023          	sw	s2,96(sp)
    5770:	05612823          	sw	s6,80(sp)
    5774:	05712623          	sw	s7,76(sp)
    5778:	05812423          	sw	s8,72(sp)

0000577c <.LBB6>:
    577c:	02e12a23          	sw	a4,52(sp)
    5780:	00e12a23          	sw	a4,20(sp)
    5784:	00f12e23          	sw	a5,28(sp)
    5788:	0114d493          	srli	s1,s1,0x11

0000578c <.LVL2>:
    578c:	01fada93          	srli	s5,s5,0x1f

00005790 <.LBB7>:
    5790:	01010513          	addi	a0,sp,16
    5794:	01c10593          	addi	a1,sp,28

00005798 <.L2>:
    5798:	0005a783          	lw	a5,0(a1)
    579c:	ffc5a703          	lw	a4,-4(a1)
    57a0:	ffc58593          	addi	a1,a1,-4
    57a4:	00379793          	slli	a5,a5,0x3
    57a8:	01d75713          	srli	a4,a4,0x1d
    57ac:	00e7e7b3          	or	a5,a5,a4
    57b0:	00f5a223          	sw	a5,4(a1)
    57b4:	feb512e3          	bne	a0,a1,5798 <.L2>

000057b8 <.LVL5>:
    57b8:	01012783          	lw	a5,16(sp)

000057bc <.LBB8>:
    57bc:	01099713          	slli	a4,s3,0x10
    57c0:	00199b93          	slli	s7,s3,0x1

000057c4 <.LBB9>:
    57c4:	00379793          	slli	a5,a5,0x3

000057c8 <.LBB10>:
    57c8:	01075713          	srli	a4,a4,0x10
    57cc:	03112823          	sw	a7,48(sp)
    57d0:	03012a23          	sw	a6,52(sp)
    57d4:	03312e23          	sw	s3,60(sp)
    57d8:	03112023          	sw	a7,32(sp)
    57dc:	03012223          	sw	a6,36(sp)

000057e0 <.LBB11>:
    57e0:	00f12823          	sw	a5,16(sp)

000057e4 <.LBB12>:
    57e4:	02d12c23          	sw	a3,56(sp)
    57e8:	02d12423          	sw	a3,40(sp)
    57ec:	02e12623          	sw	a4,44(sp)
    57f0:	011bdb93          	srli	s7,s7,0x11

000057f4 <.LVL6>:
    57f4:	01f9d993          	srli	s3,s3,0x1f

000057f8 <.LBB13>:
    57f8:	02010813          	addi	a6,sp,32
    57fc:	02c10893          	addi	a7,sp,44

00005800 <.L3>:
    5800:	0008a703          	lw	a4,0(a7)
    5804:	ffc8a683          	lw	a3,-4(a7)
    5808:	ffc88893          	addi	a7,a7,-4
    580c:	00371713          	slli	a4,a4,0x3
    5810:	01d6d693          	srli	a3,a3,0x1d
    5814:	00d76733          	or	a4,a4,a3
    5818:	00e8a223          	sw	a4,4(a7)
    581c:	ff1812e3          	bne	a6,a7,5800 <.L3>

00005820 <.LVL9>:
    5820:	02012403          	lw	s0,32(sp)

00005824 <.LBE13>:
    5824:	00008e37          	lui	t3,0x8
    5828:	fffe0e13          	addi	t3,t3,-1 # 7fff <.LLST42+0xf>

0000582c <.LBB14>:
    582c:	00341413          	slli	s0,s0,0x3
    5830:	02812023          	sw	s0,32(sp)

00005834 <.LBE14>:
    5834:	41748333          	sub	t1,s1,s7
    5838:	07cb9e63          	bne	s7,t3,58b4 <.L4>
    583c:	02812683          	lw	a3,40(sp)
    5840:	02412703          	lw	a4,36(sp)

00005844 <.LBB15>:
    5844:	00030e93          	mv	t4,t1

00005848 <.LBE15>:
    5848:	00d76733          	or	a4,a4,a3
    584c:	02c12683          	lw	a3,44(sp)
    5850:	00d76733          	or	a4,a4,a3
    5854:	00876733          	or	a4,a4,s0
    5858:	04070a63          	beqz	a4,58ac <.L5>

0000585c <.L350>:
    585c:	333a98e3          	bne	s5,s3,638c <.L7>

00005860 <.L6>:
    5860:	02412903          	lw	s2,36(sp)
    5864:	02812983          	lw	s3,40(sp)

00005868 <.LVL11>:
    5868:	02c12b03          	lw	s6,44(sp)

0000586c <.LBB54>:
    586c:	6c030263          	beqz	t1,5f30 <.L48>
    5870:	409b8833          	sub	a6,s7,s1

00005874 <.LVL12>:
    5874:	50049e63          	bnez	s1,5d90 <.L49>
    5878:	01412683          	lw	a3,20(sp)
    587c:	01812703          	lw	a4,24(sp)
    5880:	01c12883          	lw	a7,28(sp)
    5884:	00e6e633          	or	a2,a3,a4
    5888:	01166633          	or	a2,a2,a7
    588c:	00f66633          	or	a2,a2,a5
    5890:	48061463          	bnez	a2,5d18 <.L50>

00005894 <.LVL13>:
    5894:	02812823          	sw	s0,48(sp)
    5898:	03212a23          	sw	s2,52(sp)
    589c:	03312c23          	sw	s3,56(sp)
    58a0:	03612e23          	sw	s6,60(sp)

000058a4 <.L359>:
    58a4:	00080493          	mv	s1,a6

000058a8 <.LVL15>:
    58a8:	0f00006f          	j	5998 <.L11>

000058ac <.L5>:
    58ac:	0019c993          	xori	s3,s3,1

000058b0 <.LVL17>:
    58b0:	fadff06f          	j	585c <.L350>

000058b4 <.L4>:
    58b4:	0019c993          	xori	s3,s3,1

000058b8 <.LBB113>:
    58b8:	00030e93          	mv	t4,t1

000058bc <.LBE113>:
    58bc:	073a90e3          	bne	s5,s3,611c <.L8>

000058c0 <.LBB114>:
    58c0:	fa6050e3          	blez	t1,5860 <.L6>

000058c4 <.LVL21>:
    58c4:	01412903          	lw	s2,20(sp)
    58c8:	01812983          	lw	s3,24(sp)

000058cc <.LVL22>:
    58cc:	01c12b03          	lw	s6,28(sp)
    58d0:	0a0b9a63          	bnez	s7,5984 <.L9>
    58d4:	02412683          	lw	a3,36(sp)
    58d8:	02812703          	lw	a4,40(sp)
    58dc:	02c12583          	lw	a1,44(sp)
    58e0:	00e6e633          	or	a2,a3,a4
    58e4:	00b66633          	or	a2,a2,a1
    58e8:	00866633          	or	a2,a2,s0
    58ec:	00061e63          	bnez	a2,5908 <.L10>

000058f0 <.L355>:
    58f0:	02f12823          	sw	a5,48(sp)
    58f4:	03212a23          	sw	s2,52(sp)
    58f8:	03312c23          	sw	s3,56(sp)
    58fc:	03612e23          	sw	s6,60(sp)

00005900 <.LBB116>:
    5900:	00030493          	mv	s1,t1

00005904 <.LVL25>:
    5904:	0940006f          	j	5998 <.L11>

00005908 <.L10>:
    5908:	fff30613          	addi	a2,t1,-1

0000590c <.LVL27>:
    590c:	04061863          	bnez	a2,595c <.L12>

00005910 <.LBB16>:
    5910:	00878433          	add	s0,a5,s0
    5914:	01268933          	add	s2,a3,s2
    5918:	02812823          	sw	s0,48(sp)

0000591c <.LVL28>:
    591c:	00f43433          	sltu	s0,s0,a5

00005920 <.LVL29>:
    5920:	00890433          	add	s0,s2,s0

00005924 <.LVL30>:
    5924:	02812a23          	sw	s0,52(sp)

00005928 <.LVL31>:
    5928:	00d936b3          	sltu	a3,s2,a3

0000592c <.LVL32>:
    592c:	01243433          	sltu	s0,s0,s2

00005930 <.LVL33>:
    5930:	013709b3          	add	s3,a4,s3

00005934 <.LVL34>:
    5934:	0086e6b3          	or	a3,a3,s0

00005938 <.LVL35>:
    5938:	00d986b3          	add	a3,s3,a3
    593c:	02d12c23          	sw	a3,56(sp)

00005940 <.LVL36>:
    5940:	00e9b7b3          	sltu	a5,s3,a4

00005944 <.LVL37>:
    5944:	0136b6b3          	sltu	a3,a3,s3

00005948 <.LVL38>:
    5948:	00d7e7b3          	or	a5,a5,a3

0000594c <.LVL39>:
    594c:	016585b3          	add	a1,a1,s6
    5950:	00b787b3          	add	a5,a5,a1

00005954 <.L351>:
    5954:	00100493          	li	s1,1

00005958 <.LBB120>:
    5958:	3080006f          	j	5c60 <.L23>

0000595c <.L12>:
    595c:	01c30463          	beq	t1,t3,5964 <.L361>
    5960:	20c0106f          	j	6b6c <.L24>

00005964 <.L361>:
    5964:	02f12823          	sw	a5,48(sp)
    5968:	4100006f          	j	5d78 <.L360>

0000596c <.L265>:
    596c:	00040793          	mv	a5,s0
    5970:	ff5ff06f          	j	5964 <.L361>

00005974 <.L266>:
    5974:	00068913          	mv	s2,a3
    5978:	00070993          	mv	s3,a4
    597c:	00060b13          	mv	s6,a2

00005980 <.LVL45>:
    5980:	fe5ff06f          	j	5964 <.L361>

00005984 <.L9>:
    5984:	17c49c63          	bne	s1,t3,5afc <.L25>

00005988 <.LVL47>:
    5988:	02f12823          	sw	a5,48(sp)
    598c:	03212a23          	sw	s2,52(sp)
    5990:	03312c23          	sw	s3,56(sp)
    5994:	03612e23          	sw	s6,60(sp)

00005998 <.L11>:
    5998:	03012783          	lw	a5,48(sp)
    599c:	0077f713          	andi	a4,a5,7
    59a0:	04070463          	beqz	a4,59e8 <.L251>
    59a4:	00f7f713          	andi	a4,a5,15
    59a8:	00400693          	li	a3,4
    59ac:	02d70e63          	beq	a4,a3,59e8 <.L251>

000059b0 <.LBB109>:
    59b0:	03412703          	lw	a4,52(sp)
    59b4:	00478793          	addi	a5,a5,4
    59b8:	02f12823          	sw	a5,48(sp)

000059bc <.LVL49>:
    59bc:	0047b793          	sltiu	a5,a5,4

000059c0 <.LVL50>:
    59c0:	00f707b3          	add	a5,a4,a5
    59c4:	02f12a23          	sw	a5,52(sp)

000059c8 <.LVL51>:
    59c8:	00e7b7b3          	sltu	a5,a5,a4

000059cc <.LVL52>:
    59cc:	03812703          	lw	a4,56(sp)
    59d0:	00f707b3          	add	a5,a4,a5

000059d4 <.LVL53>:
    59d4:	02f12c23          	sw	a5,56(sp)

000059d8 <.LVL54>:
    59d8:	00e7b7b3          	sltu	a5,a5,a4

000059dc <.LVL55>:
    59dc:	03c12703          	lw	a4,60(sp)
    59e0:	00e787b3          	add	a5,a5,a4

000059e4 <.LVL56>:
    59e4:	02f12e23          	sw	a5,60(sp)

000059e8 <.L251>:
    59e8:	03c12783          	lw	a5,60(sp)
    59ec:	00080737          	lui	a4,0x80
    59f0:	00e7f733          	and	a4,a5,a4
    59f4:	02070463          	beqz	a4,5a1c <.L256>
    59f8:	00008737          	lui	a4,0x8
    59fc:	00148493          	addi	s1,s1,1

00005a00 <.LVL58>:
    5a00:	fff70713          	addi	a4,a4,-1 # 7fff <.LLST42+0xf>
    5a04:	00e49463          	bne	s1,a4,5a0c <.LVL58+0xc>
    5a08:	1500106f          	j	6b58 <.L257>
    5a0c:	fff80737          	lui	a4,0xfff80
    5a10:	fff70713          	addi	a4,a4,-1 # fff7ffff <.LLST3+0xfff757a4>
    5a14:	00e7f7b3          	and	a5,a5,a4
    5a18:	02f12e23          	sw	a5,60(sp)

00005a1c <.L256>:
    5a1c:	03010793          	addi	a5,sp,48
    5a20:	03c10613          	addi	a2,sp,60

00005a24 <.L259>:
    5a24:	0007a703          	lw	a4,0(a5)
    5a28:	0047a683          	lw	a3,4(a5)
    5a2c:	00478793          	addi	a5,a5,4
    5a30:	00375713          	srli	a4,a4,0x3
    5a34:	01d69693          	slli	a3,a3,0x1d
    5a38:	00d76733          	or	a4,a4,a3
    5a3c:	fee7ae23          	sw	a4,-4(a5)
    5a40:	fef612e3          	bne	a2,a5,5a24 <.L259>

00005a44 <.LVL61>:
    5a44:	03c12703          	lw	a4,60(sp)

00005a48 <.LBE110>:
    5a48:	000086b7          	lui	a3,0x8
    5a4c:	fff68793          	addi	a5,a3,-1 # 7fff <.LLST42+0xf>

00005a50 <.LBB111>:
    5a50:	00375713          	srli	a4,a4,0x3
    5a54:	02e12e23          	sw	a4,60(sp)

00005a58 <.LBE111>:
    5a58:	02f49a63          	bne	s1,a5,5a8c <.L260>
    5a5c:	03412603          	lw	a2,52(sp)
    5a60:	03012783          	lw	a5,48(sp)
    5a64:	00c7e7b3          	or	a5,a5,a2
    5a68:	03812603          	lw	a2,56(sp)
    5a6c:	00c7e7b3          	or	a5,a5,a2
    5a70:	00e7e7b3          	or	a5,a5,a4
    5a74:	00078c63          	beqz	a5,5a8c <.L260>
    5a78:	02d12e23          	sw	a3,60(sp)
    5a7c:	02012c23          	sw	zero,56(sp)
    5a80:	02012a23          	sw	zero,52(sp)
    5a84:	02012823          	sw	zero,48(sp)

00005a88 <.LVL62>:
    5a88:	00000a93          	li	s5,0

00005a8c <.L260>:
    5a8c:	03c12783          	lw	a5,60(sp)
    5a90:	01149493          	slli	s1,s1,0x11

00005a94 <.LVL64>:
    5a94:	0114d493          	srli	s1,s1,0x11
    5a98:	00f11623          	sh	a5,12(sp)

00005a9c <.LBE125>:
    5a9c:	03012783          	lw	a5,48(sp)

00005aa0 <.LBB126>:
    5aa0:	00fa9a93          	slli	s5,s5,0xf

00005aa4 <.LVL65>:
    5aa4:	009aeab3          	or	s5,s5,s1

00005aa8 <.LBE126>:
    5aa8:	00fa2023          	sw	a5,0(s4)
    5aac:	03412783          	lw	a5,52(sp)

00005ab0 <.LBB127>:
    5ab0:	01511723          	sh	s5,14(sp)

00005ab4 <.LBE127>:
    5ab4:	06c12083          	lw	ra,108(sp)
    5ab8:	00fa2223          	sw	a5,4(s4)
    5abc:	03812783          	lw	a5,56(sp)

00005ac0 <.LVL67>:
    5ac0:	06812403          	lw	s0,104(sp)
    5ac4:	06412483          	lw	s1,100(sp)
    5ac8:	00fa2423          	sw	a5,8(s4)
    5acc:	00c12783          	lw	a5,12(sp)
    5ad0:	06012903          	lw	s2,96(sp)
    5ad4:	05c12983          	lw	s3,92(sp)
    5ad8:	00fa2623          	sw	a5,12(s4)
    5adc:	05412a83          	lw	s5,84(sp)
    5ae0:	05012b03          	lw	s6,80(sp)
    5ae4:	04c12b83          	lw	s7,76(sp)

00005ae8 <.LVL68>:
    5ae8:	04812c03          	lw	s8,72(sp)
    5aec:	000a0513          	mv	a0,s4
    5af0:	05812a03          	lw	s4,88(sp)
    5af4:	07010113          	addi	sp,sp,112

00005af8 <.LVL70>:
    5af8:	00008067          	ret

00005afc <.L25>:
    5afc:	02c12703          	lw	a4,44(sp)
    5b00:	000806b7          	lui	a3,0x80
    5b04:	00d76733          	or	a4,a4,a3
    5b08:	02e12623          	sw	a4,44(sp)

00005b0c <.LDL1>:
    5b0c:	07400713          	li	a4,116
    5b10:	00675463          	bge	a4,t1,5b18 <.LDL1+0xc>
    5b14:	0640106f          	j	6b78 <.L26>
    5b18:	00030613          	mv	a2,t1

00005b1c <.L261>:
    5b1c:	40565693          	srai	a3,a2,0x5

00005b20 <.LBB129>:
    5b20:	00088513          	mv	a0,a7

00005b24 <.LBB130>:
    5b24:	01f67613          	andi	a2,a2,31

00005b28 <.LVL74>:
    5b28:	00000713          	li	a4,0
    5b2c:	00000593          	li	a1,0

00005b30 <.L27>:
    5b30:	02d59c63          	bne	a1,a3,5b68 <.L28>
    5b34:	00300593          	li	a1,3

00005b38 <.LVL76>:
    5b38:	40d585b3          	sub	a1,a1,a3
    5b3c:	00269513          	slli	a0,a3,0x2
    5b40:	02061e63          	bnez	a2,5b7c <.L29>

00005b44 <.L30>:
    5b44:	00a88333          	add	t1,a7,a0
    5b48:	00032303          	lw	t1,0(t1)
    5b4c:	00160613          	addi	a2,a2,1

00005b50 <.LVL78>:
    5b50:	00488893          	addi	a7,a7,4
    5b54:	fe68ae23          	sw	t1,-4(a7)

00005b58 <.LVL79>:
    5b58:	fec5d6e3          	bge	a1,a2,5b44 <.L30>
    5b5c:	00400613          	li	a2,4

00005b60 <.LVL80>:
    5b60:	40d606b3          	sub	a3,a2,a3

00005b64 <.LVL81>:
    5b64:	0640006f          	j	5bc8 <.L34>

00005b68 <.L28>:
    5b68:	00052303          	lw	t1,0(a0)
    5b6c:	00158593          	addi	a1,a1,1

00005b70 <.LVL83>:
    5b70:	00450513          	addi	a0,a0,4
    5b74:	00676733          	or	a4,a4,t1

00005b78 <.LVL84>:
    5b78:	fb9ff06f          	j	5b30 <.L27>

00005b7c <.L29>:
    5b7c:	04050893          	addi	a7,a0,64
    5b80:	002888b3          	add	a7,a7,sp
    5b84:	fe08a883          	lw	a7,-32(a7)
    5b88:	02000e13          	li	t3,32
    5b8c:	40ce0e33          	sub	t3,t3,a2
    5b90:	01c898b3          	sll	a7,a7,t3
    5b94:	01176733          	or	a4,a4,a7

00005b98 <.LVL86>:
    5b98:	00000e93          	li	t4,0
    5b9c:	00a808b3          	add	a7,a6,a0
    5ba0:	40a00533          	neg	a0,a0

00005ba4 <.L32>:
    5ba4:	14bec663          	blt	t4,a1,5cf0 <.L33>
    5ba8:	00400513          	li	a0,4
    5bac:	40d506b3          	sub	a3,a0,a3

00005bb0 <.LVL88>:
    5bb0:	02c12503          	lw	a0,44(sp)
    5bb4:	00259593          	slli	a1,a1,0x2

00005bb8 <.LVL89>:
    5bb8:	04058593          	addi	a1,a1,64
    5bbc:	002585b3          	add	a1,a1,sp
    5bc0:	00c55633          	srl	a2,a0,a2

00005bc4 <.LVL90>:
    5bc4:	fec5a023          	sw	a2,-32(a1)

00005bc8 <.L34>:
    5bc8:	00400613          	li	a2,4
    5bcc:	40d60633          	sub	a2,a2,a3
    5bd0:	00261613          	slli	a2,a2,0x2
    5bd4:	00269693          	slli	a3,a3,0x2
    5bd8:	00800593          	li	a1,8
    5bdc:	00d806b3          	add	a3,a6,a3
    5be0:	00b66a63          	bltu	a2,a1,5bf4 <.L35>
    5be4:	0006a023          	sw	zero,0(a3) # 80000 <.LLST3+0x757a5>

00005be8 <.LVL92>:
    5be8:	0006a223          	sw	zero,4(a3)
    5bec:	ff860613          	addi	a2,a2,-8
    5bf0:	00868693          	addi	a3,a3,8

00005bf4 <.L35>:
    5bf4:	00400593          	li	a1,4
    5bf8:	00b66463          	bltu	a2,a1,5c00 <.L36>
    5bfc:	0006a023          	sw	zero,0(a3)

00005c00 <.L36>:
    5c00:	02012683          	lw	a3,32(sp)

00005c04 <.LBB20>:
    5c04:	00e03733          	snez	a4,a4

00005c08 <.LBE20>:
    5c08:	00d76733          	or	a4,a4,a3

00005c0c <.L37>:
    5c0c:	02412683          	lw	a3,36(sp)

00005c10 <.LBB23>:
    5c10:	02e12023          	sw	a4,32(sp)

00005c14 <.LBB24>:
    5c14:	00e78733          	add	a4,a5,a4
    5c18:	01268933          	add	s2,a3,s2
    5c1c:	02e12823          	sw	a4,48(sp)

00005c20 <.LVL96>:
    5c20:	00f73733          	sltu	a4,a4,a5

00005c24 <.LVL97>:
    5c24:	02812783          	lw	a5,40(sp)
    5c28:	00e90733          	add	a4,s2,a4

00005c2c <.LVL98>:
    5c2c:	02e12a23          	sw	a4,52(sp)

00005c30 <.LVL99>:
    5c30:	00d936b3          	sltu	a3,s2,a3

00005c34 <.LVL100>:
    5c34:	01273733          	sltu	a4,a4,s2

00005c38 <.LVL101>:
    5c38:	013789b3          	add	s3,a5,s3

00005c3c <.LVL102>:
    5c3c:	00e6e733          	or	a4,a3,a4

00005c40 <.LVL103>:
    5c40:	00e98733          	add	a4,s3,a4
    5c44:	02e12c23          	sw	a4,56(sp)

00005c48 <.LVL104>:
    5c48:	00f9b7b3          	sltu	a5,s3,a5

00005c4c <.LVL105>:
    5c4c:	01373733          	sltu	a4,a4,s3

00005c50 <.LVL106>:
    5c50:	00e7e7b3          	or	a5,a5,a4

00005c54 <.LVL107>:
    5c54:	02c12703          	lw	a4,44(sp)

00005c58 <.LVL108>:
    5c58:	00eb0733          	add	a4,s6,a4
    5c5c:	00e787b3          	add	a5,a5,a4

00005c60 <.L23>:
    5c60:	00080737          	lui	a4,0x80

00005c64 <.LBB25>:
    5c64:	02f12e23          	sw	a5,60(sp)

00005c68 <.LBE25>:
    5c68:	00e7f733          	and	a4,a5,a4
    5c6c:	d20706e3          	beqz	a4,5998 <.L11>
    5c70:	fff80737          	lui	a4,0xfff80
    5c74:	fff70713          	addi	a4,a4,-1 # fff7ffff <.LLST3+0xfff757a4>
    5c78:	00e7f7b3          	and	a5,a5,a4
    5c7c:	02f12e23          	sw	a5,60(sp)

00005c80 <.LBB26>:
    5c80:	03012783          	lw	a5,48(sp)

00005c84 <.LBE26>:
    5c84:	00148493          	addi	s1,s1,1

00005c88 <.LBB28>:
    5c88:	03c10593          	addi	a1,sp,60
    5c8c:	01f79713          	slli	a4,a5,0x1f

00005c90 <.LVL112>:
    5c90:	03010793          	addi	a5,sp,48

00005c94 <.L119>:
    5c94:	0007a683          	lw	a3,0(a5)
    5c98:	0047a603          	lw	a2,4(a5)
    5c9c:	00478793          	addi	a5,a5,4
    5ca0:	0016d693          	srli	a3,a3,0x1
    5ca4:	01f61613          	slli	a2,a2,0x1f
    5ca8:	00c6e6b3          	or	a3,a3,a2
    5cac:	fed7ae23          	sw	a3,-4(a5)
    5cb0:	fef592e3          	bne	a1,a5,5c94 <.L119>

00005cb4 <.LVL114>:
    5cb4:	03c12783          	lw	a5,60(sp)
    5cb8:	0017d793          	srli	a5,a5,0x1
    5cbc:	02f12e23          	sw	a5,60(sp)

00005cc0 <.LBB29>:
    5cc0:	00e037b3          	snez	a5,a4

00005cc4 <.LBE29>:
    5cc4:	03012703          	lw	a4,48(sp)

00005cc8 <.LVL116>:
    5cc8:	00f767b3          	or	a5,a4,a5
    5ccc:	02f12823          	sw	a5,48(sp)

00005cd0 <.LBE30>:
    5cd0:	000087b7          	lui	a5,0x8
    5cd4:	fff78793          	addi	a5,a5,-1 # 7fff <.LLST42+0xf>
    5cd8:	ccf490e3          	bne	s1,a5,5998 <.L11>

00005cdc <.LVL117>:
    5cdc:	02012e23          	sw	zero,60(sp)
    5ce0:	02012c23          	sw	zero,56(sp)
    5ce4:	02012a23          	sw	zero,52(sp)
    5ce8:	02012823          	sw	zero,48(sp)

00005cec <.LBB131>:
    5cec:	cadff06f          	j	5998 <.L11>

00005cf0 <.L33>:
    5cf0:	0008a303          	lw	t1,0(a7)
    5cf4:	0048af03          	lw	t5,4(a7)
    5cf8:	00a88fb3          	add	t6,a7,a0
    5cfc:	00c35333          	srl	t1,t1,a2
    5d00:	01cf1f33          	sll	t5,t5,t3
    5d04:	01e36333          	or	t1,t1,t5
    5d08:	006fa023          	sw	t1,0(t6)

00005d0c <.LVL120>:
    5d0c:	001e8e93          	addi	t4,t4,1

00005d10 <.LVL121>:
    5d10:	00488893          	addi	a7,a7,4
    5d14:	e91ff06f          	j	5ba4 <.L32>

00005d18 <.L50>:
    5d18:	fff80613          	addi	a2,a6,-1

00005d1c <.LVL123>:
    5d1c:	04061663          	bnez	a2,5d68 <.L51>

00005d20 <.LBB32>:
    5d20:	00878433          	add	s0,a5,s0
    5d24:	01268933          	add	s2,a3,s2
    5d28:	02812823          	sw	s0,48(sp)

00005d2c <.LVL124>:
    5d2c:	00f43433          	sltu	s0,s0,a5

00005d30 <.LVL125>:
    5d30:	00890433          	add	s0,s2,s0

00005d34 <.LVL126>:
    5d34:	02812a23          	sw	s0,52(sp)

00005d38 <.LVL127>:
    5d38:	00d936b3          	sltu	a3,s2,a3

00005d3c <.LVL128>:
    5d3c:	01243433          	sltu	s0,s0,s2

00005d40 <.LVL129>:
    5d40:	013709b3          	add	s3,a4,s3

00005d44 <.LVL130>:
    5d44:	0086e6b3          	or	a3,a3,s0

00005d48 <.LVL131>:
    5d48:	00d986b3          	add	a3,s3,a3
    5d4c:	02d12c23          	sw	a3,56(sp)

00005d50 <.LVL132>:
    5d50:	00e9b7b3          	sltu	a5,s3,a4

00005d54 <.LVL133>:
    5d54:	0136b6b3          	sltu	a3,a3,s3

00005d58 <.LVL134>:
    5d58:	00d7e7b3          	or	a5,a5,a3

00005d5c <.LVL135>:
    5d5c:	016888b3          	add	a7,a7,s6
    5d60:	011787b3          	add	a5,a5,a7
    5d64:	bf1ff06f          	j	5954 <.L351>

00005d68 <.L51>:
    5d68:	000087b7          	lui	a5,0x8
    5d6c:	fff78793          	addi	a5,a5,-1 # 7fff <.LLST42+0xf>
    5d70:	60f81ee3          	bne	a6,a5,6b8c <.L62>

00005d74 <.L63>:
    5d74:	02812823          	sw	s0,48(sp)

00005d78 <.L360>:
    5d78:	03212a23          	sw	s2,52(sp)
    5d7c:	03312c23          	sw	s3,56(sp)
    5d80:	03612e23          	sw	s6,60(sp)

00005d84 <.LBB135>:
    5d84:	38c0006f          	j	6110 <.L357>

00005d88 <.L267>:
    5d88:	00078413          	mv	s0,a5
    5d8c:	fe9ff06f          	j	5d74 <.L63>

00005d90 <.L49>:
    5d90:	000087b7          	lui	a5,0x8
    5d94:	fff78793          	addi	a5,a5,-1 # 7fff <.LLST42+0xf>
    5d98:	fcfb8ee3          	beq	s7,a5,5d74 <.L63>
    5d9c:	01c12783          	lw	a5,28(sp)
    5da0:	00080737          	lui	a4,0x80
    5da4:	00e7e7b3          	or	a5,a5,a4
    5da8:	00f12e23          	sw	a5,28(sp)

00005dac <.LDL2>:
    5dac:	07400793          	li	a5,116
    5db0:	5f07c2e3          	blt	a5,a6,6b94 <.L64>
    5db4:	00080613          	mv	a2,a6

00005db8 <.L262>:
    5db8:	02000713          	li	a4,32
    5dbc:	02e64733          	div	a4,a2,a4

00005dc0 <.LBB138>:
    5dc0:	00058693          	mv	a3,a1

00005dc4 <.LBB139>:
    5dc4:	00000493          	li	s1,0

00005dc8 <.LVL143>:
    5dc8:	00000793          	li	a5,0

00005dcc <.L65>:
    5dcc:	02e7ce63          	blt	a5,a4,5e08 <.L66>
    5dd0:	00300793          	li	a5,3

00005dd4 <.LVL145>:
    5dd4:	01f67893          	andi	a7,a2,31
    5dd8:	40e787b3          	sub	a5,a5,a4
    5ddc:	00271813          	slli	a6,a4,0x2
    5de0:	02089e63          	bnez	a7,5e1c <.L67>

00005de4 <.L68>:
    5de4:	010586b3          	add	a3,a1,a6
    5de8:	0006a683          	lw	a3,0(a3)
    5dec:	00188893          	addi	a7,a7,1

00005df0 <.LVL147>:
    5df0:	00458593          	addi	a1,a1,4
    5df4:	fed5ae23          	sw	a3,-4(a1)

00005df8 <.LVL148>:
    5df8:	ff17d6e3          	bge	a5,a7,5de4 <.L68>
    5dfc:	00400793          	li	a5,4
    5e00:	40e78733          	sub	a4,a5,a4

00005e04 <.LVL149>:
    5e04:	0780006f          	j	5e7c <.L73>

00005e08 <.L66>:
    5e08:	0006a803          	lw	a6,0(a3)
    5e0c:	00178793          	addi	a5,a5,1

00005e10 <.LVL151>:
    5e10:	00468693          	addi	a3,a3,4
    5e14:	0104e4b3          	or	s1,s1,a6

00005e18 <.LVL152>:
    5e18:	fb5ff06f          	j	5dcc <.L65>

00005e1c <.L67>:
    5e1c:	02000693          	li	a3,32
    5e20:	02d66633          	rem	a2,a2,a3

00005e24 <.LVL154>:
    5e24:	40c68633          	sub	a2,a3,a2
    5e28:	00070693          	mv	a3,a4
    5e2c:	00075463          	bgez	a4,5e34 <.L70>

00005e30 <.LVL155>:
    5e30:	00000693          	li	a3,0

00005e34 <.L70>:
    5e34:	00269693          	slli	a3,a3,0x2
    5e38:	04068693          	addi	a3,a3,64
    5e3c:	002686b3          	add	a3,a3,sp
    5e40:	fd06a683          	lw	a3,-48(a3)
    5e44:	00000313          	li	t1,0
    5e48:	00c696b3          	sll	a3,a3,a2
    5e4c:	00d4e4b3          	or	s1,s1,a3

00005e50 <.LVL157>:
    5e50:	010506b3          	add	a3,a0,a6
    5e54:	41000833          	neg	a6,a6

00005e58 <.L71>:
    5e58:	0af34863          	blt	t1,a5,5f08 <.L72>
    5e5c:	00400693          	li	a3,4
    5e60:	40e68733          	sub	a4,a3,a4

00005e64 <.LVL159>:
    5e64:	01c12683          	lw	a3,28(sp)
    5e68:	00279793          	slli	a5,a5,0x2

00005e6c <.LVL160>:
    5e6c:	04078793          	addi	a5,a5,64
    5e70:	002787b3          	add	a5,a5,sp
    5e74:	0116d6b3          	srl	a3,a3,a7
    5e78:	fcd7a823          	sw	a3,-48(a5)

00005e7c <.L73>:
    5e7c:	00400793          	li	a5,4
    5e80:	00000613          	li	a2,0
    5e84:	00e7c663          	blt	a5,a4,5e90 <.L75>
    5e88:	40e787b3          	sub	a5,a5,a4
    5e8c:	00279613          	slli	a2,a5,0x2

00005e90 <.L75>:
    5e90:	00271713          	slli	a4,a4,0x2
    5e94:	00e50533          	add	a0,a0,a4
    5e98:	00000593          	li	a1,0
    5e9c:	83dfb0ef          	jal	ra,16d8 <__GI_memset>

00005ea0 <.LBE35>:
    5ea0:	01012703          	lw	a4,16(sp)

00005ea4 <.LBB36>:
    5ea4:	009037b3          	snez	a5,s1

00005ea8 <.LBE36>:
    5ea8:	00e7e7b3          	or	a5,a5,a4

00005eac <.L76>:
    5eac:	01412683          	lw	a3,20(sp)

00005eb0 <.LBB39>:
    5eb0:	00f12823          	sw	a5,16(sp)

00005eb4 <.LBB40>:
    5eb4:	00f407b3          	add	a5,s0,a5
    5eb8:	01268933          	add	s2,a3,s2
    5ebc:	02f12823          	sw	a5,48(sp)

00005ec0 <.LVL164>:
    5ec0:	0087b7b3          	sltu	a5,a5,s0

00005ec4 <.LVL165>:
    5ec4:	00f90733          	add	a4,s2,a5
    5ec8:	01812783          	lw	a5,24(sp)

00005ecc <.LVL166>:
    5ecc:	02e12a23          	sw	a4,52(sp)

00005ed0 <.LVL167>:
    5ed0:	00d936b3          	sltu	a3,s2,a3

00005ed4 <.LVL168>:
    5ed4:	01273733          	sltu	a4,a4,s2

00005ed8 <.LVL169>:
    5ed8:	013789b3          	add	s3,a5,s3

00005edc <.LVL170>:
    5edc:	00e6e733          	or	a4,a3,a4

00005ee0 <.LVL171>:
    5ee0:	00e98733          	add	a4,s3,a4
    5ee4:	02e12c23          	sw	a4,56(sp)

00005ee8 <.LVL172>:
    5ee8:	00f9b7b3          	sltu	a5,s3,a5

00005eec <.LVL173>:
    5eec:	01373733          	sltu	a4,a4,s3

00005ef0 <.LVL174>:
    5ef0:	00e7e7b3          	or	a5,a5,a4

00005ef4 <.LVL175>:
    5ef4:	01c12703          	lw	a4,28(sp)

00005ef8 <.LBB140>:
    5ef8:	000b8493          	mv	s1,s7

00005efc <.LBB141>:
    5efc:	00eb0733          	add	a4,s6,a4
    5f00:	00e787b3          	add	a5,a5,a4

00005f04 <.LBE41>:
    5f04:	d5dff06f          	j	5c60 <.L23>

00005f08 <.L72>:
    5f08:	0006a583          	lw	a1,0(a3)
    5f0c:	0046ae03          	lw	t3,4(a3)
    5f10:	01068eb3          	add	t4,a3,a6
    5f14:	0115d5b3          	srl	a1,a1,a7
    5f18:	00ce1e33          	sll	t3,t3,a2
    5f1c:	01c5e5b3          	or	a1,a1,t3
    5f20:	00bea023          	sw	a1,0(t4)

00005f24 <.LVL178>:
    5f24:	00130313          	addi	t1,t1,1

00005f28 <.LVL179>:
    5f28:	00468693          	addi	a3,a3,4
    5f2c:	f2dff06f          	j	5e58 <.L71>

00005f30 <.L48>:
    5f30:	00008337          	lui	t1,0x8
    5f34:	00148813          	addi	a6,s1,1
    5f38:	ffe30893          	addi	a7,t1,-2 # 7ffe <.LLST42+0xe>
    5f3c:	011878b3          	and	a7,a6,a7
    5f40:	01412683          	lw	a3,20(sp)
    5f44:	01812703          	lw	a4,24(sp)
    5f48:	01c12603          	lw	a2,28(sp)
    5f4c:	03010593          	addi	a1,sp,48
    5f50:	03c10513          	addi	a0,sp,60
    5f54:	12089263          	bnez	a7,6078 <.L87>
    5f58:	00e6e833          	or	a6,a3,a4
    5f5c:	00c86833          	or	a6,a6,a2
    5f60:	00f86833          	or	a6,a6,a5
    5f64:	0a049a63          	bnez	s1,6018 <.L88>

00005f68 <.LVL181>:
    5f68:	00081e63          	bnez	a6,5f84 <.L89>
    5f6c:	02812823          	sw	s0,48(sp)
    5f70:	03212a23          	sw	s2,52(sp)
    5f74:	03312c23          	sw	s3,56(sp)
    5f78:	03612e23          	sw	s6,60(sp)

00005f7c <.L354>:
    5f7c:	00000493          	li	s1,0
    5f80:	a19ff06f          	j	5998 <.L11>

00005f84 <.L89>:
    5f84:	013965b3          	or	a1,s2,s3
    5f88:	0165e5b3          	or	a1,a1,s6
    5f8c:	0085e5b3          	or	a1,a1,s0
    5f90:	00059c63          	bnez	a1,5fa8 <.L90>
    5f94:	02f12823          	sw	a5,48(sp)
    5f98:	02d12a23          	sw	a3,52(sp)
    5f9c:	02e12c23          	sw	a4,56(sp)
    5fa0:	02c12e23          	sw	a2,60(sp)

00005fa4 <.LBB148>:
    5fa4:	9f5ff06f          	j	5998 <.L11>

00005fa8 <.L90>:
    5fa8:	00878433          	add	s0,a5,s0
    5fac:	01268933          	add	s2,a3,s2
    5fb0:	02812823          	sw	s0,48(sp)

00005fb4 <.LVL186>:
    5fb4:	00f43433          	sltu	s0,s0,a5

00005fb8 <.LVL187>:
    5fb8:	00890433          	add	s0,s2,s0

00005fbc <.LVL188>:
    5fbc:	02812a23          	sw	s0,52(sp)

00005fc0 <.LVL189>:
    5fc0:	00d936b3          	sltu	a3,s2,a3

00005fc4 <.LVL190>:
    5fc4:	01243433          	sltu	s0,s0,s2

00005fc8 <.LVL191>:
    5fc8:	013709b3          	add	s3,a4,s3

00005fcc <.LVL192>:
    5fcc:	0086e6b3          	or	a3,a3,s0

00005fd0 <.LVL193>:
    5fd0:	00d986b3          	add	a3,s3,a3
    5fd4:	00e9b7b3          	sltu	a5,s3,a4

00005fd8 <.LVL194>:
    5fd8:	02d12c23          	sw	a3,56(sp)

00005fdc <.LVL195>:
    5fdc:	0136b6b3          	sltu	a3,a3,s3

00005fe0 <.LVL196>:
    5fe0:	00d7e7b3          	or	a5,a5,a3

00005fe4 <.LVL197>:
    5fe4:	01660633          	add	a2,a2,s6
    5fe8:	00c787b3          	add	a5,a5,a2

00005fec <.LBE43>:
    5fec:	00080737          	lui	a4,0x80

00005ff0 <.LVL198>:
    5ff0:	00e7f733          	and	a4,a5,a4
    5ff4:	00071663          	bnez	a4,6000 <.L101>

00005ff8 <.LBB44>:
    5ff8:	02f12e23          	sw	a5,60(sp)
    5ffc:	f81ff06f          	j	5f7c <.L354>

00006000 <.L101>:
    6000:	fff80737          	lui	a4,0xfff80
    6004:	fff70713          	addi	a4,a4,-1 # fff7ffff <.LLST3+0xfff757a4>
    6008:	00e7f7b3          	and	a5,a5,a4
    600c:	02f12e23          	sw	a5,60(sp)

00006010 <.LBB151>:
    6010:	00100493          	li	s1,1

00006014 <.LVL200>:
    6014:	985ff06f          	j	5998 <.L11>

00006018 <.L88>:
    6018:	94080ae3          	beqz	a6,596c <.L265>
    601c:	01396933          	or	s2,s2,s3
    6020:	01696933          	or	s2,s2,s6
    6024:	00896933          	or	s2,s2,s0
    6028:	940906e3          	beqz	s2,5974 <.L266>

0000602c <.LBB154>:
    602c:	02612e23          	sw	t1,60(sp)
    6030:	02012c23          	sw	zero,56(sp)
    6034:	02012a23          	sw	zero,52(sp)
    6038:	02012823          	sw	zero,48(sp)

0000603c <.LBB45>:
    603c:	00050793          	mv	a5,a0

00006040 <.L104>:
    6040:	0007a703          	lw	a4,0(a5)
    6044:	ffc7a683          	lw	a3,-4(a5)
    6048:	ffc78793          	addi	a5,a5,-4
    604c:	00371713          	slli	a4,a4,0x3
    6050:	01d6d693          	srli	a3,a3,0x1d
    6054:	00d76733          	or	a4,a4,a3
    6058:	00e7a223          	sw	a4,4(a5)
    605c:	fef592e3          	bne	a1,a5,6040 <.L104>

00006060 <.L352>:
    6060:	03012783          	lw	a5,48(sp)

00006064 <.LBE67>:
    6064:	000084b7          	lui	s1,0x8

00006068 <.LVL206>:
    6068:	fff48493          	addi	s1,s1,-1 # 7fff <.LLST42+0xf>

0000606c <.LBB68>:
    606c:	00379793          	slli	a5,a5,0x3

00006070 <.LBB156>:
    6070:	02f12823          	sw	a5,48(sp)
    6074:	5f00006f          	j	6664 <.L356>

00006078 <.L87>:
    6078:	00878433          	add	s0,a5,s0
    607c:	01268933          	add	s2,a3,s2
    6080:	02812823          	sw	s0,48(sp)

00006084 <.LVL208>:
    6084:	00f43433          	sltu	s0,s0,a5

00006088 <.LVL209>:
    6088:	00890433          	add	s0,s2,s0

0000608c <.LVL210>:
    608c:	02812a23          	sw	s0,52(sp)

00006090 <.LVL211>:
    6090:	00d937b3          	sltu	a5,s2,a3

00006094 <.LVL212>:
    6094:	01243433          	sltu	s0,s0,s2

00006098 <.LVL213>:
    6098:	013709b3          	add	s3,a4,s3

0000609c <.LVL214>:
    609c:	0087e7b3          	or	a5,a5,s0

000060a0 <.LVL215>:
    60a0:	00f987b3          	add	a5,s3,a5
    60a4:	02f12c23          	sw	a5,56(sp)

000060a8 <.LVL216>:
    60a8:	00e9b733          	sltu	a4,s3,a4

000060ac <.LVL217>:
    60ac:	0137b7b3          	sltu	a5,a5,s3

000060b0 <.LVL218>:
    60b0:	00f767b3          	or	a5,a4,a5

000060b4 <.LVL219>:
    60b4:	01660633          	add	a2,a2,s6
    60b8:	00c787b3          	add	a5,a5,a2
    60bc:	02f12e23          	sw	a5,60(sp)

000060c0 <.LBB47>:
    60c0:	00058793          	mv	a5,a1

000060c4 <.L116>:
    60c4:	0007a703          	lw	a4,0(a5)
    60c8:	0047a683          	lw	a3,4(a5)
    60cc:	00478793          	addi	a5,a5,4
    60d0:	00175713          	srli	a4,a4,0x1
    60d4:	01f69693          	slli	a3,a3,0x1f
    60d8:	00d76733          	or	a4,a4,a3
    60dc:	fee7ae23          	sw	a4,-4(a5)
    60e0:	fef512e3          	bne	a0,a5,60c4 <.L116>

000060e4 <.LBE47>:
    60e4:	00008737          	lui	a4,0x8
    60e8:	fff70713          	addi	a4,a4,-1 # 7fff <.LLST42+0xf>

000060ec <.LBB51>:
    60ec:	03c12783          	lw	a5,60(sp)

000060f0 <.LBE51>:
    60f0:	00e80863          	beq	a6,a4,6100 <.L117>

000060f4 <.LBB52>:
    60f4:	0017d793          	srli	a5,a5,0x1
    60f8:	02f12e23          	sw	a5,60(sp)
    60fc:	fa8ff06f          	j	58a4 <.L359>

00006100 <.L117>:
    6100:	02012e23          	sw	zero,60(sp)
    6104:	02012c23          	sw	zero,56(sp)
    6108:	02012a23          	sw	zero,52(sp)
    610c:	02012823          	sw	zero,48(sp)

00006110 <.L357>:
    6110:	000084b7          	lui	s1,0x8

00006114 <.LVL225>:
    6114:	fff48493          	addi	s1,s1,-1 # 7fff <.LLST42+0xf>
    6118:	881ff06f          	j	5998 <.L11>

0000611c <.L8>:
    611c:	26605863          	blez	t1,638c <.L7>

00006120 <.LBB162>:
    6120:	01412903          	lw	s2,20(sp)
    6124:	01812983          	lw	s3,24(sp)

00006128 <.LVL228>:
    6128:	01c12b03          	lw	s6,28(sp)

0000612c <.LBB163>:
    612c:	080b9e63          	bnez	s7,61c8 <.L122>
    6130:	02412f03          	lw	t5,36(sp)
    6134:	02812e83          	lw	t4,40(sp)
    6138:	02c12683          	lw	a3,44(sp)
    613c:	01df6733          	or	a4,t5,t4
    6140:	00d76733          	or	a4,a4,a3
    6144:	00876733          	or	a4,a4,s0
    6148:	fa070463          	beqz	a4,58f0 <.L355>
    614c:	fff30513          	addi	a0,t1,-1

00006150 <.LVL229>:
    6150:	04051c63          	bnez	a0,61a8 <.L124>

00006154 <.LBB70>:
    6154:	41e90633          	sub	a2,s2,t5
    6158:	40878733          	sub	a4,a5,s0

0000615c <.LVL231>:
    615c:	00c938b3          	sltu	a7,s2,a2

00006160 <.LVL232>:
    6160:	00e7b5b3          	sltu	a1,a5,a4
    6164:	40b60633          	sub	a2,a2,a1

00006168 <.LVL233>:
    6168:	00088313          	mv	t1,a7

0000616c <.LVL234>:
    616c:	41d985b3          	sub	a1,s3,t4
    6170:	01d9b833          	sltu	a6,s3,t4
    6174:	00e7fc63          	bgeu	a5,a4,618c <.L129>
    6178:	012f1a63          	bne	t5,s2,618c <.L129>

0000617c <.LVL235>:
    617c:	fff58593          	addi	a1,a1,-1

00006180 <.L130>:
    6180:	413e8eb3          	sub	t4,t4,s3
    6184:	001eb513          	seqz	a0,t4

00006188 <.LVL237>:
    6188:	00c0006f          	j	6194 <.L131>

0000618c <.L129>:
    618c:	406585b3          	sub	a1,a1,t1

00006190 <.LVL239>:
    6190:	fe0898e3          	bnez	a7,6180 <.L130>

00006194 <.L131>:
    6194:	40db07b3          	sub	a5,s6,a3
    6198:	010566b3          	or	a3,a0,a6

0000619c <.LVL241>:
    619c:	40d787b3          	sub	a5,a5,a3

000061a0 <.L353>:
    61a0:	00100493          	li	s1,1

000061a4 <.LBB165>:
    61a4:	1bc0006f          	j	6360 <.L132>

000061a8 <.L124>:
    61a8:	fbc30e63          	beq	t1,t3,5964 <.L361>
    61ac:	07400713          	li	a4,116
    61b0:	02a75c63          	bge	a4,a0,61e8 <.L263>

000061b4 <.L134>:
    61b4:	02012623          	sw	zero,44(sp)
    61b8:	02012423          	sw	zero,40(sp)
    61bc:	02012223          	sw	zero,36(sp)
    61c0:	00100713          	li	a4,1
    61c4:	1140006f          	j	62d8 <.L145>

000061c8 <.L122>:
    61c8:	bdc480e3          	beq	s1,t3,5d88 <.L267>
    61cc:	02c12703          	lw	a4,44(sp)
    61d0:	000806b7          	lui	a3,0x80
    61d4:	00d76733          	or	a4,a4,a3
    61d8:	02e12623          	sw	a4,44(sp)

000061dc <.LDL3>:
    61dc:	07400713          	li	a4,116
    61e0:	fc674ae3          	blt	a4,t1,61b4 <.L134>
    61e4:	00030513          	mv	a0,t1

000061e8 <.L263>:
    61e8:	40555693          	srai	a3,a0,0x5

000061ec <.LBB166>:
    61ec:	00088593          	mv	a1,a7

000061f0 <.LBB167>:
    61f0:	01f57513          	andi	a0,a0,31

000061f4 <.LVL249>:
    61f4:	00000713          	li	a4,0
    61f8:	00000613          	li	a2,0

000061fc <.L135>:
    61fc:	02d61c63          	bne	a2,a3,6234 <.L136>
    6200:	00300613          	li	a2,3

00006204 <.LVL251>:
    6204:	40d60633          	sub	a2,a2,a3
    6208:	00269593          	slli	a1,a3,0x2
    620c:	02051e63          	bnez	a0,6248 <.L137>

00006210 <.L138>:
    6210:	00b88333          	add	t1,a7,a1
    6214:	00032303          	lw	t1,0(t1)
    6218:	00150513          	addi	a0,a0,1

0000621c <.LVL253>:
    621c:	00488893          	addi	a7,a7,4
    6220:	fe68ae23          	sw	t1,-4(a7)

00006224 <.LVL254>:
    6224:	fea656e3          	bge	a2,a0,6210 <.L138>
    6228:	00400613          	li	a2,4
    622c:	40d606b3          	sub	a3,a2,a3

00006230 <.LVL255>:
    6230:	0640006f          	j	6294 <.L142>

00006234 <.L136>:
    6234:	0005a303          	lw	t1,0(a1)
    6238:	00160613          	addi	a2,a2,1

0000623c <.LVL257>:
    623c:	00458593          	addi	a1,a1,4
    6240:	00676733          	or	a4,a4,t1

00006244 <.LVL258>:
    6244:	fb9ff06f          	j	61fc <.L135>

00006248 <.L137>:
    6248:	04058893          	addi	a7,a1,64
    624c:	002888b3          	add	a7,a7,sp
    6250:	fe08a883          	lw	a7,-32(a7)
    6254:	02000e13          	li	t3,32
    6258:	40ae0e33          	sub	t3,t3,a0
    625c:	01c898b3          	sll	a7,a7,t3
    6260:	01176733          	or	a4,a4,a7

00006264 <.LVL260>:
    6264:	00000e93          	li	t4,0
    6268:	00b808b3          	add	a7,a6,a1
    626c:	40b005b3          	neg	a1,a1

00006270 <.L140>:
    6270:	0acec663          	blt	t4,a2,631c <.L141>
    6274:	00400593          	li	a1,4
    6278:	40d586b3          	sub	a3,a1,a3

0000627c <.LVL262>:
    627c:	02c12583          	lw	a1,44(sp)
    6280:	00261613          	slli	a2,a2,0x2

00006284 <.LVL263>:
    6284:	04060613          	addi	a2,a2,64
    6288:	00260633          	add	a2,a2,sp
    628c:	00a5d5b3          	srl	a1,a1,a0
    6290:	feb62023          	sw	a1,-32(a2)

00006294 <.L142>:
    6294:	00400613          	li	a2,4
    6298:	40d60633          	sub	a2,a2,a3
    629c:	00261613          	slli	a2,a2,0x2
    62a0:	00269693          	slli	a3,a3,0x2
    62a4:	00800593          	li	a1,8
    62a8:	00d806b3          	add	a3,a6,a3
    62ac:	00b66a63          	bltu	a2,a1,62c0 <.L143>
    62b0:	0006a023          	sw	zero,0(a3) # 80000 <.LLST3+0x757a5>

000062b4 <.LVL265>:
    62b4:	0006a223          	sw	zero,4(a3)
    62b8:	ff860613          	addi	a2,a2,-8
    62bc:	00868693          	addi	a3,a3,8

000062c0 <.L143>:
    62c0:	00400593          	li	a1,4
    62c4:	00b66463          	bltu	a2,a1,62cc <.L144>
    62c8:	0006a023          	sw	zero,0(a3)

000062cc <.L144>:
    62cc:	02012683          	lw	a3,32(sp)

000062d0 <.LBB74>:
    62d0:	00e03733          	snez	a4,a4

000062d4 <.LBE74>:
    62d4:	00d76733          	or	a4,a4,a3

000062d8 <.L145>:
    62d8:	02412503          	lw	a0,36(sp)

000062dc <.LBB78>:
    62dc:	02e12023          	sw	a4,32(sp)

000062e0 <.LBB79>:
    62e0:	40e78733          	sub	a4,a5,a4

000062e4 <.LVL270>:
    62e4:	40a90633          	sub	a2,s2,a0
    62e8:	00e7b6b3          	sltu	a3,a5,a4
    62ec:	00c938b3          	sltu	a7,s2,a2

000062f0 <.LVL271>:
    62f0:	40d60633          	sub	a2,a2,a3

000062f4 <.LVL272>:
    62f4:	02812683          	lw	a3,40(sp)
    62f8:	00088313          	mv	t1,a7

000062fc <.LVL273>:
    62fc:	40d985b3          	sub	a1,s3,a3
    6300:	00d9b833          	sltu	a6,s3,a3
    6304:	04e7f063          	bgeu	a5,a4,6344 <.L150>
    6308:	03251e63          	bne	a0,s2,6344 <.L150>

0000630c <.LVL274>:
    630c:	fff58593          	addi	a1,a1,-1

00006310 <.L151>:
    6310:	413686b3          	sub	a3,a3,s3
    6314:	0016b513          	seqz	a0,a3
    6318:	0380006f          	j	6350 <.L152>

0000631c <.L141>:
    631c:	0008a303          	lw	t1,0(a7)
    6320:	0048af03          	lw	t5,4(a7)
    6324:	00b88fb3          	add	t6,a7,a1
    6328:	00a35333          	srl	t1,t1,a0
    632c:	01cf1f33          	sll	t5,t5,t3
    6330:	01e36333          	or	t1,t1,t5
    6334:	006fa023          	sw	t1,0(t6)

00006338 <.LVL277>:
    6338:	001e8e93          	addi	t4,t4,1

0000633c <.LVL278>:
    633c:	00488893          	addi	a7,a7,4
    6340:	f31ff06f          	j	6270 <.L140>

00006344 <.L150>:
    6344:	406585b3          	sub	a1,a1,t1

00006348 <.LVL280>:
    6348:	00000513          	li	a0,0
    634c:	fc0892e3          	bnez	a7,6310 <.L151>

00006350 <.L152>:
    6350:	02c12783          	lw	a5,44(sp)
    6354:	01056533          	or	a0,a0,a6

00006358 <.LVL282>:
    6358:	40fb07b3          	sub	a5,s6,a5
    635c:	40a787b3          	sub	a5,a5,a0

00006360 <.L132>:
    6360:	02e12823          	sw	a4,48(sp)

00006364 <.LBE82>:
    6364:	00080737          	lui	a4,0x80

00006368 <.LBB83>:
    6368:	02f12e23          	sw	a5,60(sp)
    636c:	02b12c23          	sw	a1,56(sp)
    6370:	02c12a23          	sw	a2,52(sp)

00006374 <.LBE83>:
    6374:	00e7f6b3          	and	a3,a5,a4
    6378:	e2068063          	beqz	a3,5998 <.L11>

0000637c <.LBB84>:
    637c:	fff70713          	addi	a4,a4,-1 # 7ffff <.LLST3+0x757a4>
    6380:	00e7f7b3          	and	a5,a5,a4
    6384:	02f12e23          	sw	a5,60(sp)
    6388:	5500006f          	j	68d8 <.L227>

0000638c <.L7>:
    638c:	02412903          	lw	s2,36(sp)
    6390:	02812c03          	lw	s8,40(sp)
    6394:	02c12b03          	lw	s6,44(sp)

00006398 <.LBB168>:
    6398:	26030a63          	beqz	t1,660c <.L153>
    639c:	409b8733          	sub	a4,s7,s1

000063a0 <.LVL286>:
    63a0:	0a049e63          	bnez	s1,645c <.L154>
    63a4:	01412303          	lw	t1,20(sp)
    63a8:	01812883          	lw	a7,24(sp)
    63ac:	01c12683          	lw	a3,28(sp)
    63b0:	01136633          	or	a2,t1,a7
    63b4:	00d66633          	or	a2,a2,a3
    63b8:	00f66633          	or	a2,a2,a5
    63bc:	02061063          	bnez	a2,63dc <.L155>

000063c0 <.LVL287>:
    63c0:	02812823          	sw	s0,48(sp)
    63c4:	03212a23          	sw	s2,52(sp)
    63c8:	03812c23          	sw	s8,56(sp)
    63cc:	03612e23          	sw	s6,60(sp)

000063d0 <.LBB169>:
    63d0:	00070493          	mv	s1,a4

000063d4 <.L206>:
    63d4:	00098a93          	mv	s5,s3

000063d8 <.LVL290>:
    63d8:	dc0ff06f          	j	5998 <.L11>

000063dc <.L155>:
    63dc:	fff70813          	addi	a6,a4,-1

000063e0 <.LVL292>:
    63e0:	04081c63          	bnez	a6,6438 <.L156>

000063e4 <.LBB85>:
    63e4:	40f40733          	sub	a4,s0,a5

000063e8 <.LVL294>:
    63e8:	40690633          	sub	a2,s2,t1
    63ec:	00c937b3          	sltu	a5,s2,a2

000063f0 <.LVL295>:
    63f0:	00e435b3          	sltu	a1,s0,a4
    63f4:	40b60633          	sub	a2,a2,a1

000063f8 <.LVL296>:
    63f8:	00078e13          	mv	t3,a5

000063fc <.LVL297>:
    63fc:	411c05b3          	sub	a1,s8,a7
    6400:	011c3533          	sltu	a0,s8,a7
    6404:	00e47c63          	bgeu	s0,a4,641c <.L161>
    6408:	01231a63          	bne	t1,s2,641c <.L161>

0000640c <.LVL298>:
    640c:	fff58593          	addi	a1,a1,-1

00006410 <.L162>:
    6410:	418888b3          	sub	a7,a7,s8
    6414:	0018b813          	seqz	a6,a7

00006418 <.LVL300>:
    6418:	00c0006f          	j	6424 <.L163>

0000641c <.L161>:
    641c:	41c585b3          	sub	a1,a1,t3

00006420 <.LVL302>:
    6420:	fe0798e3          	bnez	a5,6410 <.L162>

00006424 <.L163>:
    6424:	40db07b3          	sub	a5,s6,a3
    6428:	00a866b3          	or	a3,a6,a0

0000642c <.LVL304>:
    642c:	40d787b3          	sub	a5,a5,a3

00006430 <.LBE85>:
    6430:	00098a93          	mv	s5,s3

00006434 <.LVL305>:
    6434:	d6dff06f          	j	61a0 <.L353>

00006438 <.L156>:
    6438:	000087b7          	lui	a5,0x8
    643c:	fff78793          	addi	a5,a5,-1 # 7fff <.LLST42+0xf>
    6440:	76f71463          	bne	a4,a5,6ba8 <.L164>

00006444 <.L165>:
    6444:	02812823          	sw	s0,48(sp)
    6448:	03212a23          	sw	s2,52(sp)
    644c:	03812c23          	sw	s8,56(sp)
    6450:	03612e23          	sw	s6,60(sp)
    6454:	00098a93          	mv	s5,s3

00006458 <.LVL308>:
    6458:	cb9ff06f          	j	6110 <.L357>

0000645c <.L154>:
    645c:	000087b7          	lui	a5,0x8
    6460:	fff78793          	addi	a5,a5,-1 # 7fff <.LLST42+0xf>
    6464:	fefb80e3          	beq	s7,a5,6444 <.L165>
    6468:	01c12783          	lw	a5,28(sp)
    646c:	000806b7          	lui	a3,0x80
    6470:	00d7e7b3          	or	a5,a5,a3
    6474:	00f12e23          	sw	a5,28(sp)

00006478 <.LDL4>:
    6478:	07400793          	li	a5,116
    647c:	72e7ca63          	blt	a5,a4,6bb0 <.L166>
    6480:	00070813          	mv	a6,a4

00006484 <.L264>:
    6484:	02000793          	li	a5,32
    6488:	02f847b3          	div	a5,a6,a5

0000648c <.LBB172>:
    648c:	00058693          	mv	a3,a1

00006490 <.LBB173>:
    6490:	00000493          	li	s1,0

00006494 <.LVL312>:
    6494:	00000713          	li	a4,0

00006498 <.L167>:
    6498:	02f74e63          	blt	a4,a5,64d4 <.L168>
    649c:	00300693          	li	a3,3
    64a0:	01f87893          	andi	a7,a6,31
    64a4:	40f686b3          	sub	a3,a3,a5
    64a8:	00279613          	slli	a2,a5,0x2
    64ac:	02089e63          	bnez	a7,64e8 <.L169>

000064b0 <.L170>:
    64b0:	00c58733          	add	a4,a1,a2
    64b4:	00072703          	lw	a4,0(a4)
    64b8:	00188893          	addi	a7,a7,1

000064bc <.LVL315>:
    64bc:	00458593          	addi	a1,a1,4
    64c0:	fee5ae23          	sw	a4,-4(a1)

000064c4 <.LVL316>:
    64c4:	ff16d6e3          	bge	a3,a7,64b0 <.L170>
    64c8:	00400713          	li	a4,4
    64cc:	40f707b3          	sub	a5,a4,a5

000064d0 <.LVL317>:
    64d0:	0780006f          	j	6548 <.L175>

000064d4 <.L168>:
    64d4:	0006a603          	lw	a2,0(a3) # 80000 <.LLST3+0x757a5>
    64d8:	00170713          	addi	a4,a4,1

000064dc <.LVL319>:
    64dc:	00468693          	addi	a3,a3,4
    64e0:	00c4e4b3          	or	s1,s1,a2

000064e4 <.LVL320>:
    64e4:	fb5ff06f          	j	6498 <.L167>

000064e8 <.L169>:
    64e8:	02000713          	li	a4,32

000064ec <.LVL321>:
    64ec:	02e86833          	rem	a6,a6,a4

000064f0 <.LVL322>:
    64f0:	41070833          	sub	a6,a4,a6
    64f4:	00078713          	mv	a4,a5
    64f8:	0007d463          	bgez	a5,6500 <.L172>

000064fc <.LVL323>:
    64fc:	00000713          	li	a4,0

00006500 <.L172>:
    6500:	00271713          	slli	a4,a4,0x2
    6504:	04070713          	addi	a4,a4,64
    6508:	00270733          	add	a4,a4,sp
    650c:	fd072703          	lw	a4,-48(a4)
    6510:	00000313          	li	t1,0
    6514:	01071733          	sll	a4,a4,a6
    6518:	00e4e4b3          	or	s1,s1,a4

0000651c <.LVL325>:
    651c:	00c50733          	add	a4,a0,a2
    6520:	40c00633          	neg	a2,a2

00006524 <.L173>:
    6524:	08d34c63          	blt	t1,a3,65bc <.L174>
    6528:	00400713          	li	a4,4
    652c:	00269693          	slli	a3,a3,0x2
    6530:	40f707b3          	sub	a5,a4,a5

00006534 <.LVL327>:
    6534:	04068713          	addi	a4,a3,64
    6538:	002706b3          	add	a3,a4,sp
    653c:	01c12703          	lw	a4,28(sp)
    6540:	01175733          	srl	a4,a4,a7
    6544:	fce6a823          	sw	a4,-48(a3)

00006548 <.L175>:
    6548:	00400713          	li	a4,4
    654c:	00000613          	li	a2,0
    6550:	00f74663          	blt	a4,a5,655c <.L177>
    6554:	40f70733          	sub	a4,a4,a5
    6558:	00271613          	slli	a2,a4,0x2

0000655c <.L177>:
    655c:	00279793          	slli	a5,a5,0x2
    6560:	00f50533          	add	a0,a0,a5
    6564:	00000593          	li	a1,0
    6568:	970fb0ef          	jal	ra,16d8 <__GI_memset>

0000656c <.LBE88>:
    656c:	01012783          	lw	a5,16(sp)

00006570 <.LBB89>:
    6570:	00903733          	snez	a4,s1

00006574 <.LBE89>:
    6574:	00f76733          	or	a4,a4,a5

00006578 <.L178>:
    6578:	01412683          	lw	a3,20(sp)

0000657c <.LBB93>:
    657c:	00e12823          	sw	a4,16(sp)

00006580 <.LBB94>:
    6580:	40e40733          	sub	a4,s0,a4

00006584 <.LVL331>:
    6584:	40d90633          	sub	a2,s2,a3
    6588:	00e437b3          	sltu	a5,s0,a4
    658c:	00c93833          	sltu	a6,s2,a2

00006590 <.LVL332>:
    6590:	40f60633          	sub	a2,a2,a5

00006594 <.LVL333>:
    6594:	01812783          	lw	a5,24(sp)
    6598:	00080893          	mv	a7,a6

0000659c <.LVL334>:
    659c:	40fc05b3          	sub	a1,s8,a5
    65a0:	00fc3533          	sltu	a0,s8,a5
    65a4:	04e47063          	bgeu	s0,a4,65e4 <.L183>
    65a8:	03269e63          	bne	a3,s2,65e4 <.L183>

000065ac <.LVL335>:
    65ac:	fff58593          	addi	a1,a1,-1

000065b0 <.L184>:
    65b0:	418787b3          	sub	a5,a5,s8
    65b4:	0017b693          	seqz	a3,a5
    65b8:	0380006f          	j	65f0 <.L185>

000065bc <.L174>:
    65bc:	00072583          	lw	a1,0(a4)
    65c0:	00472e03          	lw	t3,4(a4)
    65c4:	00c70eb3          	add	t4,a4,a2
    65c8:	0115d5b3          	srl	a1,a1,a7
    65cc:	010e1e33          	sll	t3,t3,a6
    65d0:	01c5e5b3          	or	a1,a1,t3
    65d4:	00bea023          	sw	a1,0(t4)

000065d8 <.LVL338>:
    65d8:	00130313          	addi	t1,t1,1

000065dc <.LVL339>:
    65dc:	00470713          	addi	a4,a4,4
    65e0:	f45ff06f          	j	6524 <.L173>

000065e4 <.L183>:
    65e4:	411585b3          	sub	a1,a1,a7

000065e8 <.LVL341>:
    65e8:	00000693          	li	a3,0
    65ec:	fc0812e3          	bnez	a6,65b0 <.L184>

000065f0 <.L185>:
    65f0:	01c12783          	lw	a5,28(sp)
    65f4:	00a6e6b3          	or	a3,a3,a0

000065f8 <.LBB174>:
    65f8:	000b8493          	mv	s1,s7

000065fc <.LBB175>:
    65fc:	40fb07b3          	sub	a5,s6,a5
    6600:	40d787b3          	sub	a5,a5,a3

00006604 <.LBE97>:
    6604:	00098a93          	mv	s5,s3

00006608 <.LVL344>:
    6608:	d59ff06f          	j	6360 <.L132>

0000660c <.L153>:
    660c:	000088b7          	lui	a7,0x8
    6610:	00148713          	addi	a4,s1,1
    6614:	ffe88613          	addi	a2,a7,-2 # 7ffe <.LLST42+0xe>
    6618:	00c77733          	and	a4,a4,a2

0000661c <.LBB176>:
    661c:	01412803          	lw	a6,20(sp)
    6620:	01812503          	lw	a0,24(sp)
    6624:	01c12683          	lw	a3,28(sp)

00006628 <.LBB177>:
    6628:	1e071663          	bnez	a4,6814 <.L186>
    662c:	01896633          	or	a2,s2,s8
    6630:	00a865b3          	or	a1,a6,a0
    6634:	01666633          	or	a2,a2,s6
    6638:	00d5e5b3          	or	a1,a1,a3
    663c:	00866633          	or	a2,a2,s0
    6640:	00f5e5b3          	or	a1,a1,a5
    6644:	10049e63          	bnez	s1,6760 <.L187>

00006648 <.LVL346>:
    6648:	02059263          	bnez	a1,666c <.L188>
    664c:	02812823          	sw	s0,48(sp)
    6650:	03212a23          	sw	s2,52(sp)
    6654:	03812c23          	sw	s8,56(sp)
    6658:	03612e23          	sw	s6,60(sp)
    665c:	d6061ce3          	bnez	a2,63d4 <.L206>

00006660 <.L189>:
    6660:	00000493          	li	s1,0

00006664 <.L356>:
    6664:	00000a93          	li	s5,0

00006668 <.LVL349>:
    6668:	b30ff06f          	j	5998 <.L11>

0000666c <.L188>:
    666c:	00061c63          	bnez	a2,6684 <.L190>
    6670:	02f12823          	sw	a5,48(sp)
    6674:	03012a23          	sw	a6,52(sp)
    6678:	02a12c23          	sw	a0,56(sp)
    667c:	02d12e23          	sw	a3,60(sp)

00006680 <.LBB180>:
    6680:	8fdff06f          	j	5f7c <.L354>

00006684 <.L190>:
    6684:	41280733          	sub	a4,a6,s2
    6688:	40878633          	sub	a2,a5,s0

0000668c <.LVL353>:
    668c:	00e835b3          	sltu	a1,a6,a4

00006690 <.LVL354>:
    6690:	00c7b333          	sltu	t1,a5,a2
    6694:	00058893          	mv	a7,a1

00006698 <.LVL355>:
    6698:	40670733          	sub	a4,a4,t1

0000669c <.LVL356>:
    669c:	41850e33          	sub	t3,a0,s8
    66a0:	01853eb3          	sltu	t4,a0,s8
    66a4:	00c7fa63          	bgeu	a5,a2,66b8 <.L195>
    66a8:	01281863          	bne	a6,s2,66b8 <.L195>

000066ac <.LVL357>:
    66ac:	fffe0893          	addi	a7,t3,-1

000066b0 <.L196>:
    66b0:	001e3313          	seqz	t1,t3
    66b4:	0100006f          	j	66c4 <.L197>

000066b8 <.L195>:
    66b8:	411e08b3          	sub	a7,t3,a7

000066bc <.LVL360>:
    66bc:	00000313          	li	t1,0
    66c0:	fe0598e3          	bnez	a1,66b0 <.L196>

000066c4 <.L197>:
    66c4:	01d36333          	or	t1,t1,t4

000066c8 <.LVL362>:
    66c8:	416685b3          	sub	a1,a3,s6
    66cc:	406585b3          	sub	a1,a1,t1

000066d0 <.LBE98>:
    66d0:	00080337          	lui	t1,0x80

000066d4 <.LBB99>:
    66d4:	02b12e23          	sw	a1,60(sp)
    66d8:	03112c23          	sw	a7,56(sp)
    66dc:	02e12a23          	sw	a4,52(sp)
    66e0:	02c12823          	sw	a2,48(sp)

000066e4 <.LBE99>:
    66e4:	0065f333          	and	t1,a1,t1
    66e8:	06030263          	beqz	t1,674c <.L198>

000066ec <.LBB100>:
    66ec:	41090733          	sub	a4,s2,a6

000066f0 <.LVL365>:
    66f0:	40f407b3          	sub	a5,s0,a5

000066f4 <.LVL366>:
    66f4:	00e938b3          	sltu	a7,s2,a4

000066f8 <.LVL367>:
    66f8:	00f43633          	sltu	a2,s0,a5

000066fc <.LVL368>:
    66fc:	40c70633          	sub	a2,a4,a2
    6700:	00088313          	mv	t1,a7

00006704 <.LVL369>:
    6704:	40ac05b3          	sub	a1,s8,a0
    6708:	00ac3733          	sltu	a4,s8,a0
    670c:	00f47a63          	bgeu	s0,a5,6720 <.L203>
    6710:	01281863          	bne	a6,s2,6720 <.L203>

00006714 <.LVL370>:
    6714:	fff58593          	addi	a1,a1,-1

00006718 <.L204>:
    6718:	001e3813          	seqz	a6,t3
    671c:	0100006f          	j	672c <.L205>

00006720 <.L203>:
    6720:	406585b3          	sub	a1,a1,t1

00006724 <.LVL373>:
    6724:	00000813          	li	a6,0
    6728:	fe0898e3          	bnez	a7,6718 <.L204>

0000672c <.L205>:
    672c:	40db06b3          	sub	a3,s6,a3
    6730:	00e86833          	or	a6,a6,a4

00006734 <.LVL375>:
    6734:	410686b3          	sub	a3,a3,a6
    6738:	02d12e23          	sw	a3,60(sp)
    673c:	02b12c23          	sw	a1,56(sp)

00006740 <.LVL376>:
    6740:	02c12a23          	sw	a2,52(sp)

00006744 <.LVL377>:
    6744:	02f12823          	sw	a5,48(sp)

00006748 <.LBB182>:
    6748:	c8dff06f          	j	63d4 <.L206>

0000674c <.L198>:
    674c:	00e66633          	or	a2,a2,a4

00006750 <.LVL380>:
    6750:	01166633          	or	a2,a2,a7
    6754:	00b66633          	or	a2,a2,a1
    6758:	f00604e3          	beqz	a2,6660 <.L189>
    675c:	821ff06f          	j	5f7c <.L354>

00006760 <.L187>:
    6760:	03010313          	addi	t1,sp,48
    6764:	03c10713          	addi	a4,sp,60
    6768:	04059e63          	bnez	a1,67c4 <.L207>
    676c:	02061e63          	bnez	a2,67a8 <.L208>

00006770 <.LVL382>:
    6770:	03112e23          	sw	a7,60(sp)
    6774:	02012c23          	sw	zero,56(sp)
    6778:	02012a23          	sw	zero,52(sp)
    677c:	02012823          	sw	zero,48(sp)

00006780 <.LBB101>:
    6780:	00070793          	mv	a5,a4

00006784 <.L209>:
    6784:	0007a703          	lw	a4,0(a5)
    6788:	ffc7a683          	lw	a3,-4(a5)
    678c:	ffc78793          	addi	a5,a5,-4
    6790:	00371713          	slli	a4,a4,0x3
    6794:	01d6d693          	srli	a3,a3,0x1d
    6798:	00d76733          	or	a4,a4,a3
    679c:	00e7a223          	sw	a4,4(a5)
    67a0:	fef312e3          	bne	t1,a5,6784 <.L209>
    67a4:	8bdff06f          	j	6060 <.L352>

000067a8 <.L208>:
    67a8:	02812823          	sw	s0,48(sp)
    67ac:	03212a23          	sw	s2,52(sp)
    67b0:	03812c23          	sw	s8,56(sp)
    67b4:	03612e23          	sw	s6,60(sp)

000067b8 <.LBB184>:
    67b8:	00098a93          	mv	s5,s3

000067bc <.L358>:
    67bc:	fff88493          	addi	s1,a7,-1

000067c0 <.LVL387>:
    67c0:	9d8ff06f          	j	5998 <.L11>

000067c4 <.L207>:
    67c4:	00061c63          	bnez	a2,67dc <.L210>

000067c8 <.LVL389>:
    67c8:	02f12823          	sw	a5,48(sp)
    67cc:	03012a23          	sw	a6,52(sp)
    67d0:	02a12c23          	sw	a0,56(sp)
    67d4:	02d12e23          	sw	a3,60(sp)
    67d8:	fe5ff06f          	j	67bc <.L358>

000067dc <.L210>:
    67dc:	03112e23          	sw	a7,60(sp)
    67e0:	02012c23          	sw	zero,56(sp)
    67e4:	02012a23          	sw	zero,52(sp)
    67e8:	02012823          	sw	zero,48(sp)

000067ec <.LBB102>:
    67ec:	00070793          	mv	a5,a4

000067f0 <.L211>:
    67f0:	0007a703          	lw	a4,0(a5)
    67f4:	ffc7a683          	lw	a3,-4(a5)
    67f8:	ffc78793          	addi	a5,a5,-4
    67fc:	00371713          	slli	a4,a4,0x3
    6800:	01d6d693          	srli	a3,a3,0x1d
    6804:	00d76733          	or	a4,a4,a3
    6808:	00e7a223          	sw	a4,4(a5)
    680c:	fef312e3          	bne	t1,a5,67f0 <.L211>
    6810:	851ff06f          	j	6060 <.L352>

00006814 <.L186>:
    6814:	41280733          	sub	a4,a6,s2
    6818:	40878633          	sub	a2,a5,s0

0000681c <.LVL394>:
    681c:	00e835b3          	sltu	a1,a6,a4

00006820 <.LVL395>:
    6820:	00c7b333          	sltu	t1,a5,a2
    6824:	40670733          	sub	a4,a4,t1

00006828 <.LVL396>:
    6828:	00058893          	mv	a7,a1

0000682c <.LVL397>:
    682c:	41850333          	sub	t1,a0,s8
    6830:	01853f33          	sltu	t5,a0,s8
    6834:	00c7fa63          	bgeu	a5,a2,6848 <.L216>
    6838:	01281863          	bne	a6,s2,6848 <.L216>

0000683c <.LVL398>:
    683c:	fff30893          	addi	a7,t1,-1 # 7ffff <.LLST3+0x757a4>

00006840 <.L217>:
    6840:	00133e13          	seqz	t3,t1
    6844:	0100006f          	j	6854 <.L218>

00006848 <.L216>:
    6848:	411308b3          	sub	a7,t1,a7

0000684c <.LVL401>:
    684c:	00000e13          	li	t3,0
    6850:	fe0598e3          	bnez	a1,6840 <.L217>

00006854 <.L218>:
    6854:	01ee6e33          	or	t3,t3,t5

00006858 <.LVL403>:
    6858:	416685b3          	sub	a1,a3,s6
    685c:	41c585b3          	sub	a1,a1,t3

00006860 <.LBE103>:
    6860:	00080e37          	lui	t3,0x80

00006864 <.LBB104>:
    6864:	02b12e23          	sw	a1,60(sp)
    6868:	03112c23          	sw	a7,56(sp)
    686c:	02e12a23          	sw	a4,52(sp)
    6870:	02c12823          	sw	a2,48(sp)

00006874 <.LBE104>:
    6874:	01c5fe33          	and	t3,a1,t3
    6878:	140e0863          	beqz	t3,69c8 <.L219>

0000687c <.LBB105>:
    687c:	41090733          	sub	a4,s2,a6

00006880 <.LVL406>:
    6880:	40f407b3          	sub	a5,s0,a5

00006884 <.LVL407>:
    6884:	00e938b3          	sltu	a7,s2,a4

00006888 <.LVL408>:
    6888:	00f43633          	sltu	a2,s0,a5

0000688c <.LVL409>:
    688c:	40c70633          	sub	a2,a4,a2
    6890:	00088e13          	mv	t3,a7

00006894 <.LVL410>:
    6894:	40ac05b3          	sub	a1,s8,a0
    6898:	00ac3733          	sltu	a4,s8,a0
    689c:	00f47a63          	bgeu	s0,a5,68b0 <.L224>
    68a0:	01281863          	bne	a6,s2,68b0 <.L224>

000068a4 <.LVL411>:
    68a4:	fff58593          	addi	a1,a1,-1

000068a8 <.L225>:
    68a8:	00133e93          	seqz	t4,t1
    68ac:	00c0006f          	j	68b8 <.L226>

000068b0 <.L224>:
    68b0:	41c585b3          	sub	a1,a1,t3

000068b4 <.LVL414>:
    68b4:	fe089ae3          	bnez	a7,68a8 <.L225>

000068b8 <.L226>:
    68b8:	40db06b3          	sub	a3,s6,a3
    68bc:	00eeeeb3          	or	t4,t4,a4

000068c0 <.LVL416>:
    68c0:	41d68733          	sub	a4,a3,t4
    68c4:	02e12e23          	sw	a4,60(sp)
    68c8:	02b12c23          	sw	a1,56(sp)

000068cc <.LVL417>:
    68cc:	02c12a23          	sw	a2,52(sp)

000068d0 <.LVL418>:
    68d0:	02f12823          	sw	a5,48(sp)

000068d4 <.LBE105>:
    68d4:	00098a93          	mv	s5,s3

000068d8 <.L227>:
    68d8:	03c12503          	lw	a0,60(sp)
    68dc:	10050063          	beqz	a0,69dc <.L228>
    68e0:	269000ef          	jal	ra,7348 <__clzsi2>

000068e4 <.L229>:
    68e4:	ff450513          	addi	a0,a0,-12

000068e8 <.LBB62>:
    68e8:	02000713          	li	a4,32
    68ec:	01f57813          	andi	a6,a0,31
    68f0:	02e547b3          	div	a5,a0,a4

000068f4 <.LVL423>:
    68f4:	12080063          	beqz	a6,6a14 <.L232>
    68f8:	03010313          	addi	t1,sp,48
    68fc:	02e566b3          	rem	a3,a0,a4

00006900 <.LVL424>:
    6900:	40d70633          	sub	a2,a4,a3
    6904:	ffc00693          	li	a3,-4

00006908 <.LVL425>:
    6908:	02d786b3          	mul	a3,a5,a3
    690c:	00c68713          	addi	a4,a3,12
    6910:	00e30733          	add	a4,t1,a4
    6914:	40d006b3          	neg	a3,a3

00006918 <.L233>:
    6918:	12e31663          	bne	t1,a4,6a44 <.L236>
    691c:	03012683          	lw	a3,48(sp)
    6920:	fff78713          	addi	a4,a5,-1

00006924 <.LVL426>:
    6924:	00279793          	slli	a5,a5,0x2

00006928 <.LVL427>:
    6928:	04078793          	addi	a5,a5,64
    692c:	002787b3          	add	a5,a5,sp
    6930:	010696b3          	sll	a3,a3,a6
    6934:	fed7a823          	sw	a3,-16(a5)

00006938 <.L237>:
    6938:	00170713          	addi	a4,a4,1
    693c:	03010793          	addi	a5,sp,48
    6940:	00271713          	slli	a4,a4,0x2
    6944:	00800693          	li	a3,8
    6948:	00078893          	mv	a7,a5
    694c:	00d76a63          	bltu	a4,a3,6960 <.L238>
    6950:	02012823          	sw	zero,48(sp)
    6954:	0007a223          	sw	zero,4(a5)
    6958:	ff870713          	addi	a4,a4,-8
    695c:	03810793          	addi	a5,sp,56

00006960 <.L238>:
    6960:	00400693          	li	a3,4
    6964:	00d76463          	bltu	a4,a3,696c <.L239>
    6968:	0007a023          	sw	zero,0(a5)

0000696c <.L239>:
    696c:	1c954863          	blt	a0,s1,6b3c <.L240>
    6970:	40950533          	sub	a0,a0,s1

00006974 <.LVL429>:
    6974:	00150513          	addi	a0,a0,1

00006978 <.LBB58>:
    6978:	40555713          	srai	a4,a0,0x5

0000697c <.LVL431>:
    697c:	01f57793          	andi	a5,a0,31

00006980 <.LVL432>:
    6980:	00088593          	mv	a1,a7
    6984:	00088613          	mv	a2,a7
    6988:	00000313          	li	t1,0
    698c:	00000693          	li	a3,0

00006990 <.L241>:
    6990:	0ce69c63          	bne	a3,a4,6a68 <.L242>
    6994:	00300693          	li	a3,3

00006998 <.LVL434>:
    6998:	40e686b3          	sub	a3,a3,a4
    699c:	00271613          	slli	a2,a4,0x2
    69a0:	0c079e63          	bnez	a5,6a7c <.L243>

000069a4 <.L244>:
    69a4:	00c58533          	add	a0,a1,a2
    69a8:	00052503          	lw	a0,0(a0)
    69ac:	00178793          	addi	a5,a5,1

000069b0 <.LVL436>:
    69b0:	00458593          	addi	a1,a1,4
    69b4:	fea5ae23          	sw	a0,-4(a1)

000069b8 <.LVL437>:
    69b8:	fef6d6e3          	bge	a3,a5,69a4 <.L244>
    69bc:	00400793          	li	a5,4

000069c0 <.LVL438>:
    69c0:	40e78733          	sub	a4,a5,a4

000069c4 <.LVL439>:
    69c4:	1040006f          	j	6ac8 <.L248>

000069c8 <.L219>:
    69c8:	00e66633          	or	a2,a2,a4

000069cc <.LVL441>:
    69cc:	01166633          	or	a2,a2,a7
    69d0:	00b66633          	or	a2,a2,a1
    69d4:	c80606e3          	beqz	a2,6660 <.L189>
    69d8:	f01ff06f          	j	68d8 <.L227>

000069dc <.L228>:
    69dc:	03812503          	lw	a0,56(sp)
    69e0:	00050863          	beqz	a0,69f0 <.L230>
    69e4:	165000ef          	jal	ra,7348 <__clzsi2>

000069e8 <.LVL443>:
    69e8:	02050513          	addi	a0,a0,32
    69ec:	ef9ff06f          	j	68e4 <.L229>

000069f0 <.L230>:
    69f0:	03412503          	lw	a0,52(sp)
    69f4:	00050863          	beqz	a0,6a04 <.L231>
    69f8:	151000ef          	jal	ra,7348 <__clzsi2>

000069fc <.LVL446>:
    69fc:	04050513          	addi	a0,a0,64
    6a00:	ee5ff06f          	j	68e4 <.L229>

00006a04 <.L231>:
    6a04:	03012503          	lw	a0,48(sp)
    6a08:	141000ef          	jal	ra,7348 <__clzsi2>

00006a0c <.LVL449>:
    6a0c:	06050513          	addi	a0,a0,96
    6a10:	ed5ff06f          	j	68e4 <.L229>

00006a14 <.L232>:
    6a14:	ffc00613          	li	a2,-4
    6a18:	02c78633          	mul	a2,a5,a2
    6a1c:	03c10713          	addi	a4,sp,60

00006a20 <.LBB64>:
    6a20:	00300693          	li	a3,3

00006a24 <.L234>:
    6a24:	00c705b3          	add	a1,a4,a2
    6a28:	0005a583          	lw	a1,0(a1)
    6a2c:	fff68693          	addi	a3,a3,-1

00006a30 <.LVL453>:
    6a30:	ffc70713          	addi	a4,a4,-4
    6a34:	00b72223          	sw	a1,4(a4)

00006a38 <.LVL454>:
    6a38:	fef6d6e3          	bge	a3,a5,6a24 <.L234>
    6a3c:	fff78713          	addi	a4,a5,-1
    6a40:	ef9ff06f          	j	6938 <.L237>

00006a44 <.L236>:
    6a44:	00072583          	lw	a1,0(a4)
    6a48:	ffc72883          	lw	a7,-4(a4)
    6a4c:	00d70e33          	add	t3,a4,a3
    6a50:	010595b3          	sll	a1,a1,a6
    6a54:	00c8d8b3          	srl	a7,a7,a2
    6a58:	0115e5b3          	or	a1,a1,a7
    6a5c:	00be2023          	sw	a1,0(t3) # 80000 <.LLST3+0x757a5>
    6a60:	ffc70713          	addi	a4,a4,-4
    6a64:	eb5ff06f          	j	6918 <.L233>

00006a68 <.L242>:
    6a68:	00062503          	lw	a0,0(a2)
    6a6c:	00168693          	addi	a3,a3,1

00006a70 <.LVL457>:
    6a70:	00460613          	addi	a2,a2,4
    6a74:	00a36333          	or	t1,t1,a0

00006a78 <.LVL458>:
    6a78:	f19ff06f          	j	6990 <.L241>

00006a7c <.L243>:
    6a7c:	04060593          	addi	a1,a2,64
    6a80:	002585b3          	add	a1,a1,sp
    6a84:	ff05a583          	lw	a1,-16(a1)
    6a88:	02000813          	li	a6,32
    6a8c:	40f80833          	sub	a6,a6,a5
    6a90:	010595b3          	sll	a1,a1,a6
    6a94:	00b36333          	or	t1,t1,a1

00006a98 <.LVL460>:
    6a98:	00000e13          	li	t3,0
    6a9c:	00c885b3          	add	a1,a7,a2
    6aa0:	40c00633          	neg	a2,a2

00006aa4 <.L246>:
    6aa4:	06de4863          	blt	t3,a3,6b14 <.L247>
    6aa8:	00400613          	li	a2,4
    6aac:	40e60733          	sub	a4,a2,a4

00006ab0 <.LVL462>:
    6ab0:	03c12603          	lw	a2,60(sp)
    6ab4:	00269693          	slli	a3,a3,0x2

00006ab8 <.LVL463>:
    6ab8:	04068693          	addi	a3,a3,64
    6abc:	002686b3          	add	a3,a3,sp
    6ac0:	00f657b3          	srl	a5,a2,a5

00006ac4 <.LVL464>:
    6ac4:	fef6a823          	sw	a5,-16(a3)

00006ac8 <.L248>:
    6ac8:	00400693          	li	a3,4
    6acc:	40e686b3          	sub	a3,a3,a4
    6ad0:	00271713          	slli	a4,a4,0x2
    6ad4:	00e887b3          	add	a5,a7,a4
    6ad8:	00269713          	slli	a4,a3,0x2
    6adc:	00800693          	li	a3,8
    6ae0:	00d76a63          	bltu	a4,a3,6af4 <.L249>
    6ae4:	0007a023          	sw	zero,0(a5)
    6ae8:	0007a223          	sw	zero,4(a5)
    6aec:	ff870713          	addi	a4,a4,-8
    6af0:	00878793          	addi	a5,a5,8

00006af4 <.L249>:
    6af4:	00400693          	li	a3,4
    6af8:	00d76463          	bltu	a4,a3,6b00 <.L250>
    6afc:	0007a023          	sw	zero,0(a5)

00006b00 <.L250>:
    6b00:	03012703          	lw	a4,48(sp)

00006b04 <.LBB60>:
    6b04:	006037b3          	snez	a5,t1

00006b08 <.LBE60>:
    6b08:	00f767b3          	or	a5,a4,a5
    6b0c:	02f12823          	sw	a5,48(sp)
    6b10:	c6cff06f          	j	5f7c <.L354>

00006b14 <.L247>:
    6b14:	0005a503          	lw	a0,0(a1)
    6b18:	0045ae83          	lw	t4,4(a1)
    6b1c:	00c58f33          	add	t5,a1,a2
    6b20:	00f55533          	srl	a0,a0,a5
    6b24:	010e9eb3          	sll	t4,t4,a6
    6b28:	01d56533          	or	a0,a0,t4
    6b2c:	00af2023          	sw	a0,0(t5)

00006b30 <.LVL468>:
    6b30:	001e0e13          	addi	t3,t3,1

00006b34 <.LVL469>:
    6b34:	00458593          	addi	a1,a1,4
    6b38:	f6dff06f          	j	6aa4 <.L246>

00006b3c <.L240>:
    6b3c:	03c12783          	lw	a5,60(sp)
    6b40:	fff80737          	lui	a4,0xfff80
    6b44:	fff70713          	addi	a4,a4,-1 # fff7ffff <.LLST3+0xfff757a4>
    6b48:	00e7f7b3          	and	a5,a5,a4
    6b4c:	40a484b3          	sub	s1,s1,a0
    6b50:	02f12e23          	sw	a5,60(sp)

00006b54 <.LBB189>:
    6b54:	e45fe06f          	j	5998 <.L11>

00006b58 <.L257>:
    6b58:	02012e23          	sw	zero,60(sp)
    6b5c:	02012c23          	sw	zero,56(sp)
    6b60:	02012a23          	sw	zero,52(sp)
    6b64:	02012823          	sw	zero,48(sp)
    6b68:	eb5fe06f          	j	5a1c <.L256>

00006b6c <.L24>:
    6b6c:	07400713          	li	a4,116
    6b70:	00c74463          	blt	a4,a2,6b78 <.L26>
    6b74:	fa9fe06f          	j	5b1c <.L261>

00006b78 <.L26>:
    6b78:	02012623          	sw	zero,44(sp)
    6b7c:	02012423          	sw	zero,40(sp)
    6b80:	02012223          	sw	zero,36(sp)
    6b84:	00100713          	li	a4,1
    6b88:	884ff06f          	j	5c0c <.L37>

00006b8c <.L62>:
    6b8c:	07400793          	li	a5,116
    6b90:	a2c7d463          	bge	a5,a2,5db8 <.L262>

00006b94 <.L64>:
    6b94:	00012e23          	sw	zero,28(sp)
    6b98:	00012c23          	sw	zero,24(sp)
    6b9c:	00012a23          	sw	zero,20(sp)
    6ba0:	00100793          	li	a5,1
    6ba4:	b08ff06f          	j	5eac <.L76>

00006ba8 <.L164>:
    6ba8:	07400793          	li	a5,116
    6bac:	8d07dce3          	bge	a5,a6,6484 <.L264>

00006bb0 <.L166>:
    6bb0:	00012e23          	sw	zero,28(sp)
    6bb4:	00012c23          	sw	zero,24(sp)
    6bb8:	00012a23          	sw	zero,20(sp)
    6bbc:	00100713          	li	a4,1
    6bc0:	9b9ff06f          	j	6578 <.L178>

00006bc4 <__fixunstfsi>:
    6bc4:	00052783          	lw	a5,0(a0)
    6bc8:	00452603          	lw	a2,4(a0)
    6bcc:	00c52703          	lw	a4,12(a0)
    6bd0:	00852683          	lw	a3,8(a0)
    6bd4:	fe010113          	addi	sp,sp,-32

00006bd8 <.LBB3>:
    6bd8:	00f12023          	sw	a5,0(sp)
    6bdc:	00c12223          	sw	a2,4(sp)
    6be0:	00f12823          	sw	a5,16(sp)
    6be4:	00171613          	slli	a2,a4,0x1

00006be8 <.LBE3>:
    6be8:	000047b7          	lui	a5,0x4

00006bec <.LBB4>:
    6bec:	00d12423          	sw	a3,8(sp)
    6bf0:	00e12623          	sw	a4,12(sp)
    6bf4:	00d12c23          	sw	a3,24(sp)
    6bf8:	01165613          	srli	a2,a2,0x11

00006bfc <.LBE4>:
    6bfc:	ffe78513          	addi	a0,a5,-2 # 3ffe <.LVL227+0x2>
    6c00:	0ac55463          	bge	a0,a2,6ca8 <.L7>
    6c04:	01f75593          	srli	a1,a4,0x1f
    6c08:	00000513          	li	a0,0
    6c0c:	04059c63          	bnez	a1,6c64 <.L1>
    6c10:	01e78593          	addi	a1,a5,30
    6c14:	fff00513          	li	a0,-1
    6c18:	04c5c663          	blt	a1,a2,6c64 <.L1>

00006c1c <.LBB10>:
    6c1c:	01071713          	slli	a4,a4,0x10

00006c20 <.LBB11>:
    6c20:	000105b7          	lui	a1,0x10

00006c24 <.LBB12>:
    6c24:	01075713          	srli	a4,a4,0x10

00006c28 <.LBB13>:
    6c28:	06f78793          	addi	a5,a5,111

00006c2c <.LBE6>:
    6c2c:	00b76733          	or	a4,a4,a1

00006c30 <.LBB7>:
    6c30:	40c787b3          	sub	a5,a5,a2
    6c34:	4057d613          	srai	a2,a5,0x5

00006c38 <.LVL4>:
    6c38:	02000593          	li	a1,32
    6c3c:	01f7f793          	andi	a5,a5,31

00006c40 <.LBE7>:
    6c40:	00e12e23          	sw	a4,28(sp)

00006c44 <.LBB8>:
    6c44:	40f585b3          	sub	a1,a1,a5

00006c48 <.LVL6>:
    6c48:	04079863          	bnez	a5,6c98 <.L3>

00006c4c <.LVL7>:
    6c4c:	00261613          	slli	a2,a2,0x2

00006c50 <.LVL8>:
    6c50:	02060793          	addi	a5,a2,32

00006c54 <.LVL9>:
    6c54:	00278633          	add	a2,a5,sp
    6c58:	ff062783          	lw	a5,-16(a2)
    6c5c:	00f12823          	sw	a5,16(sp)

00006c60 <.L4>:
    6c60:	01012503          	lw	a0,16(sp)

00006c64 <.L1>:
    6c64:	02010113          	addi	sp,sp,32

00006c68 <.LVL12>:
    6c68:	00008067          	ret

00006c6c <.L6>:
    6c6c:	00f6d6b3          	srl	a3,a3,a5
    6c70:	00b715b3          	sll	a1,a4,a1

00006c74 <.LVL14>:
    6c74:	00b6e6b3          	or	a3,a3,a1
    6c78:	00d12823          	sw	a3,16(sp)

00006c7c <.LVL15>:
    6c7c:	00100693          	li	a3,1

00006c80 <.L5>:
    6c80:	00269693          	slli	a3,a3,0x2

00006c84 <.LVL17>:
    6c84:	02068693          	addi	a3,a3,32
    6c88:	002686b3          	add	a3,a3,sp
    6c8c:	00f75733          	srl	a4,a4,a5
    6c90:	fee6a823          	sw	a4,-16(a3)
    6c94:	fcdff06f          	j	6c60 <.L4>

00006c98 <.L3>:
    6c98:	00200513          	li	a0,2
    6c9c:	fca608e3          	beq	a2,a0,6c6c <.L6>
    6ca0:	00000693          	li	a3,0
    6ca4:	fddff06f          	j	6c80 <.L5>

00006ca8 <.L7>:
    6ca8:	00000513          	li	a0,0
    6cac:	fb9ff06f          	j	6c64 <.L1>

00006cb0 <__floatunsitf>:
    6cb0:	fd010113          	addi	sp,sp,-48
    6cb4:	02912223          	sw	s1,36(sp)
    6cb8:	02112623          	sw	ra,44(sp)
    6cbc:	02812423          	sw	s0,40(sp)
    6cc0:	00050493          	mv	s1,a0

00006cc4 <.LBB13>:
    6cc4:	10058463          	beqz	a1,6dcc <.L2>

00006cc8 <.LBB3>:
    6cc8:	00058513          	mv	a0,a1
    6ccc:	00058413          	mv	s0,a1

00006cd0 <.LBB5>:
    6cd0:	678000ef          	jal	ra,7348 <__clzsi2>

00006cd4 <.LBE5>:
    6cd4:	05150793          	addi	a5,a0,81

00006cd8 <.LBB6>:
    6cd8:	00004637          	lui	a2,0x4
    6cdc:	01e60613          	addi	a2,a2,30 # 401e <.LVL227+0x22>

00006ce0 <.LBB7>:
    6ce0:	4057d713          	srai	a4,a5,0x5

00006ce4 <.LBE7>:
    6ce4:	00812823          	sw	s0,16(sp)
    6ce8:	00012a23          	sw	zero,20(sp)
    6cec:	00012c23          	sw	zero,24(sp)
    6cf0:	00012e23          	sw	zero,28(sp)

00006cf4 <.LBB8>:
    6cf4:	01f7f793          	andi	a5,a5,31

00006cf8 <.LBB9>:
    6cf8:	40a60633          	sub	a2,a2,a0

00006cfc <.LBB10>:
    6cfc:	02078c63          	beqz	a5,6d34 <.L3>

00006d00 <.LVL5>:
    6d00:	00200693          	li	a3,2
    6d04:	0cd71063          	bne	a4,a3,6dc4 <.L8>
    6d08:	02000693          	li	a3,32
    6d0c:	40f686b3          	sub	a3,a3,a5

00006d10 <.LVL6>:
    6d10:	00d456b3          	srl	a3,s0,a3

00006d14 <.LVL7>:
    6d14:	00d12e23          	sw	a3,28(sp)

00006d18 <.L4>:
    6d18:	fff70693          	addi	a3,a4,-1

00006d1c <.LVL9>:
    6d1c:	00271713          	slli	a4,a4,0x2
    6d20:	02070713          	addi	a4,a4,32
    6d24:	00270733          	add	a4,a4,sp
    6d28:	00f41433          	sll	s0,s0,a5

00006d2c <.LVL10>:
    6d2c:	fe872823          	sw	s0,-16(a4)
    6d30:	0340006f          	j	6d64 <.L5>

00006d34 <.L3>:
    6d34:	00300793          	li	a5,3

00006d38 <.LVL12>:
    6d38:	40e787b3          	sub	a5,a5,a4
    6d3c:	00279793          	slli	a5,a5,0x2
    6d40:	02078793          	addi	a5,a5,32
    6d44:	002787b3          	add	a5,a5,sp
    6d48:	ff07a783          	lw	a5,-16(a5)
    6d4c:	00200693          	li	a3,2
    6d50:	00f12e23          	sw	a5,28(sp)

00006d54 <.LVL13>:
    6d54:	00200793          	li	a5,2
    6d58:	00f71663          	bne	a4,a5,6d64 <.L5>
    6d5c:	00812c23          	sw	s0,24(sp)

00006d60 <.LVL14>:
    6d60:	00100693          	li	a3,1

00006d64 <.L5>:
    6d64:	00269693          	slli	a3,a3,0x2
    6d68:	00012823          	sw	zero,16(sp)

00006d6c <.LVL16>:
    6d6c:	00012a23          	sw	zero,20(sp)
    6d70:	ffc68693          	addi	a3,a3,-4
    6d74:	00400793          	li	a5,4
    6d78:	00f6e463          	bltu	a3,a5,6d80 <.L7>
    6d7c:	00012c23          	sw	zero,24(sp)

00006d80 <.L7>:
    6d80:	01c12783          	lw	a5,28(sp)
    6d84:	00c11723          	sh	a2,14(sp)

00006d88 <.LBE14>:
    6d88:	02c12083          	lw	ra,44(sp)

00006d8c <.LBB15>:
    6d8c:	00f11623          	sh	a5,12(sp)

00006d90 <.LBE15>:
    6d90:	01012783          	lw	a5,16(sp)
    6d94:	02812403          	lw	s0,40(sp)
    6d98:	00048513          	mv	a0,s1
    6d9c:	00f4a023          	sw	a5,0(s1)
    6da0:	01412783          	lw	a5,20(sp)
    6da4:	00f4a223          	sw	a5,4(s1)
    6da8:	01812783          	lw	a5,24(sp)
    6dac:	00f4a423          	sw	a5,8(s1)
    6db0:	00c12783          	lw	a5,12(sp)
    6db4:	00f4a623          	sw	a5,12(s1)
    6db8:	02412483          	lw	s1,36(sp)
    6dbc:	03010113          	addi	sp,sp,48

00006dc0 <.LVL20>:
    6dc0:	00008067          	ret

00006dc4 <.L8>:
    6dc4:	00300713          	li	a4,3

00006dc8 <.LVL22>:
    6dc8:	f51ff06f          	j	6d18 <.L4>

00006dcc <.L2>:
    6dcc:	00012e23          	sw	zero,28(sp)
    6dd0:	00012c23          	sw	zero,24(sp)
    6dd4:	00012a23          	sw	zero,20(sp)
    6dd8:	00012823          	sw	zero,16(sp)
    6ddc:	00000613          	li	a2,0
    6de0:	fa1ff06f          	j	6d80 <.L7>

00006de4 <__extenddftf2>:
    6de4:	01465713          	srli	a4,a2,0x14
    6de8:	00c61793          	slli	a5,a2,0xc
    6dec:	7ff77713          	andi	a4,a4,2047

00006df0 <.LBE2>:
    6df0:	fd010113          	addi	sp,sp,-48

00006df4 <.LBB3>:
    6df4:	00c7d793          	srli	a5,a5,0xc

00006df8 <.LBE3>:
    6df8:	00170693          	addi	a3,a4,1
    6dfc:	02812423          	sw	s0,40(sp)
    6e00:	02912223          	sw	s1,36(sp)
    6e04:	03212023          	sw	s2,32(sp)
    6e08:	02112623          	sw	ra,44(sp)
    6e0c:	00b12823          	sw	a1,16(sp)
    6e10:	00f12a23          	sw	a5,20(sp)
    6e14:	00012e23          	sw	zero,28(sp)
    6e18:	00012c23          	sw	zero,24(sp)
    6e1c:	7fe6f693          	andi	a3,a3,2046
    6e20:	00050913          	mv	s2,a0
    6e24:	00058413          	mv	s0,a1

00006e28 <.LBB4>:
    6e28:	01f65493          	srli	s1,a2,0x1f

00006e2c <.LBE4>:
    6e2c:	08068263          	beqz	a3,6eb0 <.L2>
    6e30:	000046b7          	lui	a3,0x4
    6e34:	c0068693          	addi	a3,a3,-1024 # 3c00 <.LVL122+0x4>
    6e38:	00d70733          	add	a4,a4,a3

00006e3c <.LBB5>:
    6e3c:	0047d693          	srli	a3,a5,0x4
    6e40:	00d12e23          	sw	a3,28(sp)

00006e44 <.LVL4>:
    6e44:	01c79793          	slli	a5,a5,0x1c

00006e48 <.LVL5>:
    6e48:	0045d693          	srli	a3,a1,0x4
    6e4c:	00d7e7b3          	or	a5,a5,a3
    6e50:	01c59413          	slli	s0,a1,0x1c
    6e54:	00f12c23          	sw	a5,24(sp)

00006e58 <.LVL6>:
    6e58:	00812a23          	sw	s0,20(sp)

00006e5c <.LVL7>:
    6e5c:	00012823          	sw	zero,16(sp)

00006e60 <.L3>:
    6e60:	01c12783          	lw	a5,28(sp)
    6e64:	00f49493          	slli	s1,s1,0xf

00006e68 <.LVL9>:
    6e68:	00e4e4b3          	or	s1,s1,a4
    6e6c:	00f11623          	sh	a5,12(sp)

00006e70 <.LBE6>:
    6e70:	01012783          	lw	a5,16(sp)

00006e74 <.LBB7>:
    6e74:	00911723          	sh	s1,14(sp)

00006e78 <.LBE7>:
    6e78:	02c12083          	lw	ra,44(sp)
    6e7c:	00f92023          	sw	a5,0(s2)
    6e80:	01412783          	lw	a5,20(sp)

00006e84 <.LVL11>:
    6e84:	02812403          	lw	s0,40(sp)
    6e88:	02412483          	lw	s1,36(sp)
    6e8c:	00f92223          	sw	a5,4(s2)
    6e90:	01812783          	lw	a5,24(sp)
    6e94:	00090513          	mv	a0,s2
    6e98:	00f92423          	sw	a5,8(s2)
    6e9c:	00c12783          	lw	a5,12(sp)
    6ea0:	00f92623          	sw	a5,12(s2)
    6ea4:	02012903          	lw	s2,32(sp)
    6ea8:	03010113          	addi	sp,sp,48

00006eac <.LVL13>:
    6eac:	00008067          	ret

00006eb0 <.L2>:
    6eb0:	00b7e533          	or	a0,a5,a1
    6eb4:	10071063          	bnez	a4,6fb4 <.L4>
    6eb8:	fa0504e3          	beqz	a0,6e60 <.L3>

00006ebc <.LBB8>:
    6ebc:	04078e63          	beqz	a5,6f18 <.L5>
    6ec0:	00078513          	mv	a0,a5
    6ec4:	484000ef          	jal	ra,7348 <__clzsi2>

00006ec8 <.L6>:
    6ec8:	03150693          	addi	a3,a0,49
    6ecc:	4056d793          	srai	a5,a3,0x5

00006ed0 <.LVL17>:
    6ed0:	01f6f693          	andi	a3,a3,31

00006ed4 <.LVL18>:
    6ed4:	04068863          	beqz	a3,6f24 <.L7>
    6ed8:	ffc00613          	li	a2,-4
    6edc:	02c78633          	mul	a2,a5,a2
    6ee0:	02000813          	li	a6,32
    6ee4:	01010313          	addi	t1,sp,16
    6ee8:	40d80833          	sub	a6,a6,a3

00006eec <.LVL19>:
    6eec:	00c60713          	addi	a4,a2,12
    6ef0:	00e30733          	add	a4,t1,a4
    6ef4:	40c00633          	neg	a2,a2

00006ef8 <.L8>:
    6ef8:	08e31c63          	bne	t1,a4,6f90 <.L11>
    6efc:	fff78713          	addi	a4,a5,-1

00006f00 <.LVL20>:
    6f00:	00279793          	slli	a5,a5,0x2

00006f04 <.LVL21>:
    6f04:	02078793          	addi	a5,a5,32
    6f08:	002787b3          	add	a5,a5,sp
    6f0c:	00d416b3          	sll	a3,s0,a3

00006f10 <.LVL22>:
    6f10:	fed7a823          	sw	a3,-16(a5)
    6f14:	03c0006f          	j	6f50 <.L10>

00006f18 <.L5>:
    6f18:	430000ef          	jal	ra,7348 <__clzsi2>

00006f1c <.LVL24>:
    6f1c:	02050513          	addi	a0,a0,32
    6f20:	fa9ff06f          	j	6ec8 <.L6>

00006f24 <.L7>:
    6f24:	ffc00613          	li	a2,-4
    6f28:	02c78633          	mul	a2,a5,a2
    6f2c:	01c10713          	addi	a4,sp,28

00006f30 <.LBB10>:
    6f30:	00300693          	li	a3,3

00006f34 <.L9>:
    6f34:	00c705b3          	add	a1,a4,a2
    6f38:	0005a583          	lw	a1,0(a1) # 10000 <.LLST3+0x57a5>
    6f3c:	fff68693          	addi	a3,a3,-1

00006f40 <.LVL28>:
    6f40:	ffc70713          	addi	a4,a4,-4
    6f44:	00b72223          	sw	a1,4(a4)

00006f48 <.LVL29>:
    6f48:	fef6d6e3          	bge	a3,a5,6f34 <.L9>
    6f4c:	fff78713          	addi	a4,a5,-1

00006f50 <.L10>:
    6f50:	00170793          	addi	a5,a4,1
    6f54:	00279793          	slli	a5,a5,0x2
    6f58:	00800693          	li	a3,8
    6f5c:	01010713          	addi	a4,sp,16
    6f60:	00d7ea63          	bltu	a5,a3,6f74 <.L12>
    6f64:	00012823          	sw	zero,16(sp)
    6f68:	00072223          	sw	zero,4(a4)
    6f6c:	ff878793          	addi	a5,a5,-8
    6f70:	01810713          	addi	a4,sp,24

00006f74 <.L12>:
    6f74:	00400693          	li	a3,4
    6f78:	00d7e463          	bltu	a5,a3,6f80 <.L13>
    6f7c:	00072023          	sw	zero,0(a4)

00006f80 <.L13>:
    6f80:	00004737          	lui	a4,0x4
    6f84:	c0c70713          	addi	a4,a4,-1012 # 3c0c <.L58+0x8>
    6f88:	40a70733          	sub	a4,a4,a0

00006f8c <.LVL31>:
    6f8c:	ed5ff06f          	j	6e60 <.L3>

00006f90 <.L11>:
    6f90:	00072583          	lw	a1,0(a4)
    6f94:	ffc72883          	lw	a7,-4(a4)
    6f98:	00c70e33          	add	t3,a4,a2
    6f9c:	00d595b3          	sll	a1,a1,a3
    6fa0:	0108d8b3          	srl	a7,a7,a6
    6fa4:	0115e5b3          	or	a1,a1,a7
    6fa8:	00be2023          	sw	a1,0(t3)
    6fac:	ffc70713          	addi	a4,a4,-4
    6fb0:	f49ff06f          	j	6ef8 <.L8>

00006fb4 <.L4>:
    6fb4:	02050863          	beqz	a0,6fe4 <.L14>

00006fb8 <.LBB12>:
    6fb8:	01c79713          	slli	a4,a5,0x1c

00006fbc <.LVL35>:
    6fbc:	0045d693          	srli	a3,a1,0x4
    6fc0:	00d76733          	or	a4,a4,a3
    6fc4:	00e12c23          	sw	a4,24(sp)

00006fc8 <.LVL36>:
    6fc8:	0047d793          	srli	a5,a5,0x4

00006fcc <.LBE12>:
    6fcc:	00008737          	lui	a4,0x8

00006fd0 <.LBB13>:
    6fd0:	01c59413          	slli	s0,a1,0x1c

00006fd4 <.LBE13>:
    6fd4:	00e7e7b3          	or	a5,a5,a4

00006fd8 <.LBB14>:
    6fd8:	00812a23          	sw	s0,20(sp)

00006fdc <.LVL39>:
    6fdc:	00012823          	sw	zero,16(sp)

00006fe0 <.LBE14>:
    6fe0:	00f12e23          	sw	a5,28(sp)

00006fe4 <.L14>:
    6fe4:	00008737          	lui	a4,0x8
    6fe8:	fff70713          	addi	a4,a4,-1 # 7fff <.LLST42+0xf>
    6fec:	e75ff06f          	j	6e60 <.L3>

00006ff0 <__trunctfdf2>:
    6ff0:	00c52583          	lw	a1,12(a0)
    6ff4:	00852783          	lw	a5,8(a0)
    6ff8:	00052683          	lw	a3,0(a0)
    6ffc:	fe010113          	addi	sp,sp,-32
    7000:	00452703          	lw	a4,4(a0)

00007004 <.LBB3>:
    7004:	00f12423          	sw	a5,8(sp)
    7008:	00f12c23          	sw	a5,24(sp)
    700c:	01059793          	slli	a5,a1,0x10
    7010:	0107d793          	srli	a5,a5,0x10
    7014:	00d12023          	sw	a3,0(sp)
    7018:	00d12823          	sw	a3,16(sp)
    701c:	01010613          	addi	a2,sp,16
    7020:	00159693          	slli	a3,a1,0x1
    7024:	00b12623          	sw	a1,12(sp)
    7028:	00f12e23          	sw	a5,28(sp)
    702c:	00e12223          	sw	a4,4(sp)
    7030:	00e12a23          	sw	a4,20(sp)
    7034:	0116d693          	srli	a3,a3,0x11

00007038 <.LVL1>:
    7038:	01f5d593          	srli	a1,a1,0x1f

0000703c <.LBB4>:
    703c:	01c10793          	addi	a5,sp,28
    7040:	00060893          	mv	a7,a2

00007044 <.L2>:
    7044:	0007a703          	lw	a4,0(a5)
    7048:	ffc7a503          	lw	a0,-4(a5)
    704c:	ffc78793          	addi	a5,a5,-4
    7050:	00371713          	slli	a4,a4,0x3
    7054:	01d55513          	srli	a0,a0,0x1d
    7058:	00a76733          	or	a4,a4,a0
    705c:	00e7a223          	sw	a4,4(a5)
    7060:	fef612e3          	bne	a2,a5,7044 <.L2>

00007064 <.LVL4>:
    7064:	01012503          	lw	a0,16(sp)

00007068 <.LBE4>:
    7068:	00008737          	lui	a4,0x8
    706c:	00168793          	addi	a5,a3,1

00007070 <.LBB5>:
    7070:	00351513          	slli	a0,a0,0x3

00007074 <.LBE5>:
    7074:	ffe70713          	addi	a4,a4,-2 # 7ffe <.LLST42+0xe>

00007078 <.LBB6>:
    7078:	00a12823          	sw	a0,16(sp)

0000707c <.LBE6>:
    707c:	00e7f7b3          	and	a5,a5,a4
    7080:	22078063          	beqz	a5,72a0 <.L3>
    7084:	ffffc7b7          	lui	a5,0xffffc
    7088:	40078793          	addi	a5,a5,1024 # ffffc400 <.LLST3+0xffff1ba5>
    708c:	00f686b3          	add	a3,a3,a5

00007090 <.LVL6>:
    7090:	7fe00793          	li	a5,2046
    7094:	28d7cc63          	blt	a5,a3,732c <.L21>
    7098:	0cd05863          	blez	a3,7168 <.L5>

0000709c <.LBB7>:
    709c:	01812603          	lw	a2,24(sp)
    70a0:	01c12783          	lw	a5,28(sp)
    70a4:	01412703          	lw	a4,20(sp)

000070a8 <.LVL8>:
    70a8:	01c65813          	srli	a6,a2,0x1c
    70ac:	00479793          	slli	a5,a5,0x4
    70b0:	0107e7b3          	or	a5,a5,a6
    70b4:	00f12a23          	sw	a5,20(sp)

000070b8 <.LBB9>:
    70b8:	00471793          	slli	a5,a4,0x4
    70bc:	00a7e7b3          	or	a5,a5,a0

000070c0 <.LVL10>:
    70c0:	01c75713          	srli	a4,a4,0x1c

000070c4 <.LVL11>:
    70c4:	00461613          	slli	a2,a2,0x4
    70c8:	00f037b3          	snez	a5,a5

000070cc <.LVL12>:
    70cc:	00c76733          	or	a4,a4,a2

000070d0 <.LBE9>:
    70d0:	00e7e7b3          	or	a5,a5,a4

000070d4 <.L6>:
    70d4:	01412703          	lw	a4,20(sp)

000070d8 <.L17>:
    70d8:	0077f613          	andi	a2,a5,7
    70dc:	02060063          	beqz	a2,70fc <.L18>

000070e0 <.LVL15>:
    70e0:	00f7f613          	andi	a2,a5,15
    70e4:	00400513          	li	a0,4
    70e8:	00a60a63          	beq	a2,a0,70fc <.L18>

000070ec <.LBB12>:
    70ec:	00478613          	addi	a2,a5,4
    70f0:	00f63533          	sltu	a0,a2,a5
    70f4:	00a70733          	add	a4,a4,a0
    70f8:	00060793          	mv	a5,a2

000070fc <.L18>:
    70fc:	00800637          	lui	a2,0x800
    7100:	00c77633          	and	a2,a4,a2
    7104:	1e060a63          	beqz	a2,72f8 <.L7>
    7108:	ff800537          	lui	a0,0xff800
    710c:	fff50513          	addi	a0,a0,-1 # ff7fffff <.LLST3+0xff7f57a4>
    7110:	00168693          	addi	a3,a3,1
    7114:	7ff00813          	li	a6,2047
    7118:	00a77533          	and	a0,a4,a0

0000711c <.LVL17>:
    711c:	00000613          	li	a2,0
    7120:	00000713          	li	a4,0
    7124:	01068a63          	beq	a3,a6,7138 <.L4>
    7128:	0037d793          	srli	a5,a5,0x3

0000712c <.LVL18>:
    712c:	01d51613          	slli	a2,a0,0x1d
    7130:	00f66633          	or	a2,a2,a5

00007134 <.LVL19>:
    7134:	00355713          	srli	a4,a0,0x3

00007138 <.L4>:
    7138:	7ff007b7          	lui	a5,0x7ff00
    713c:	01469693          	slli	a3,a3,0x14
    7140:	00c71713          	slli	a4,a4,0xc

00007144 <.LVL21>:
    7144:	00f6f6b3          	and	a3,a3,a5
    7148:	00c75713          	srli	a4,a4,0xc
    714c:	01f59593          	slli	a1,a1,0x1f

00007150 <.LVL22>:
    7150:	00e6e6b3          	or	a3,a3,a4
    7154:	00b6e7b3          	or	a5,a3,a1

00007158 <.LBE20>:
    7158:	00060513          	mv	a0,a2
    715c:	00078593          	mv	a1,a5
    7160:	02010113          	addi	sp,sp,32

00007164 <.LVL24>:
    7164:	00008067          	ret

00007168 <.L5>:
    7168:	fcc00793          	li	a5,-52
    716c:	18f6c063          	blt	a3,a5,72ec <.L22>
    7170:	01c12783          	lw	a5,28(sp)
    7174:	00080737          	lui	a4,0x80

00007178 <.LBB21>:
    7178:	00060813          	mv	a6,a2

0000717c <.LBE21>:
    717c:	00f76eb3          	or	t4,a4,a5

00007180 <.LBB23>:
    7180:	03d00793          	li	a5,61
    7184:	40d787b3          	sub	a5,a5,a3
    7188:	4057d693          	srai	a3,a5,0x5

0000718c <.LVL26>:
    718c:	01f7f713          	andi	a4,a5,31

00007190 <.LBE23>:
    7190:	01d12e23          	sw	t4,28(sp)

00007194 <.LBB24>:
    7194:	00000513          	li	a0,0
    7198:	00000793          	li	a5,0

0000719c <.L8>:
    719c:	00082303          	lw	t1,0(a6)
    71a0:	00150513          	addi	a0,a0,1

000071a4 <.LVL29>:
    71a4:	00480813          	addi	a6,a6,4
    71a8:	0067e7b3          	or	a5,a5,t1

000071ac <.LVL30>:
    71ac:	fea698e3          	bne	a3,a0,719c <.L8>
    71b0:	00300513          	li	a0,3

000071b4 <.LVL31>:
    71b4:	40d50533          	sub	a0,a0,a3
    71b8:	00269813          	slli	a6,a3,0x2
    71bc:	02071463          	bnez	a4,71e4 <.L9>

000071c0 <.L10>:
    71c0:	01088333          	add	t1,a7,a6
    71c4:	00032303          	lw	t1,0(t1)
    71c8:	00170713          	addi	a4,a4,1 # 80001 <.LLST3+0x757a6>

000071cc <.LVL33>:
    71cc:	00488893          	addi	a7,a7,4
    71d0:	fe68ae23          	sw	t1,-4(a7)

000071d4 <.LVL34>:
    71d4:	fee556e3          	bge	a0,a4,71c0 <.L10>
    71d8:	00400713          	li	a4,4

000071dc <.LVL35>:
    71dc:	40d706b3          	sub	a3,a4,a3

000071e0 <.LVL36>:
    71e0:	04c0006f          	j	722c <.L14>

000071e4 <.L9>:
    71e4:	02080893          	addi	a7,a6,32
    71e8:	002888b3          	add	a7,a7,sp
    71ec:	ff08a883          	lw	a7,-16(a7)
    71f0:	02000e13          	li	t3,32
    71f4:	40ee0e33          	sub	t3,t3,a4
    71f8:	01c898b3          	sll	a7,a7,t3
    71fc:	0117e7b3          	or	a5,a5,a7

00007200 <.LVL38>:
    7200:	00000f13          	li	t5,0
    7204:	010608b3          	add	a7,a2,a6
    7208:	41000833          	neg	a6,a6

0000720c <.L12>:
    720c:	06af4663          	blt	t5,a0,7278 <.L13>
    7210:	00251513          	slli	a0,a0,0x2
    7214:	02050513          	addi	a0,a0,32
    7218:	00400813          	li	a6,4
    721c:	00250533          	add	a0,a0,sp
    7220:	00eed733          	srl	a4,t4,a4

00007224 <.LVL40>:
    7224:	40d806b3          	sub	a3,a6,a3

00007228 <.LVL41>:
    7228:	fee52823          	sw	a4,-16(a0)

0000722c <.L14>:
    722c:	00400513          	li	a0,4
    7230:	40d50533          	sub	a0,a0,a3
    7234:	00269693          	slli	a3,a3,0x2

00007238 <.LVL43>:
    7238:	00d60733          	add	a4,a2,a3
    723c:	00251693          	slli	a3,a0,0x2
    7240:	00800613          	li	a2,8
    7244:	00c6ea63          	bltu	a3,a2,7258 <.L15>
    7248:	00072023          	sw	zero,0(a4)
    724c:	00072223          	sw	zero,4(a4)
    7250:	ff868693          	addi	a3,a3,-8
    7254:	00870713          	addi	a4,a4,8

00007258 <.L15>:
    7258:	00400613          	li	a2,4
    725c:	00c6e463          	bltu	a3,a2,7264 <.L16>
    7260:	00072023          	sw	zero,0(a4)

00007264 <.L16>:
    7264:	01012703          	lw	a4,16(sp)

00007268 <.LBB25>:
    7268:	00f037b3          	snez	a5,a5

0000726c <.LBE25>:
    726c:	00000693          	li	a3,0

00007270 <.LBB29>:
    7270:	00e7e7b3          	or	a5,a5,a4
    7274:	e61ff06f          	j	70d4 <.L6>

00007278 <.L13>:
    7278:	0008a303          	lw	t1,0(a7)
    727c:	0048af83          	lw	t6,4(a7)
    7280:	010882b3          	add	t0,a7,a6
    7284:	00e35333          	srl	t1,t1,a4
    7288:	01cf9fb3          	sll	t6,t6,t3
    728c:	01f36333          	or	t1,t1,t6
    7290:	0062a023          	sw	t1,0(t0)

00007294 <.LVL47>:
    7294:	001f0f13          	addi	t5,t5,1

00007298 <.LVL48>:
    7298:	00488893          	addi	a7,a7,4
    729c:	f71ff06f          	j	720c <.L12>

000072a0 <.L3>:
    72a0:	08068863          	beqz	a3,7330 <.L23>

000072a4 <.LBB10>:
    72a4:	01412783          	lw	a5,20(sp)
    72a8:	01812703          	lw	a4,24(sp)
    72ac:	01c12683          	lw	a3,28(sp)

000072b0 <.LBE10>:
    72b0:	00f76633          	or	a2,a4,a5
    72b4:	00d66633          	or	a2,a2,a3
    72b8:	00a66633          	or	a2,a2,a0
    72bc:	08060063          	beqz	a2,733c <.L24>

000072c0 <.LBB31>:
    72c0:	00471613          	slli	a2,a4,0x4
    72c4:	00469693          	slli	a3,a3,0x4

000072c8 <.LVL52>:
    72c8:	01c7d793          	srli	a5,a5,0x1c

000072cc <.LVL53>:
    72cc:	01c75713          	srli	a4,a4,0x1c

000072d0 <.LVL54>:
    72d0:	00d76733          	or	a4,a4,a3

000072d4 <.LVL55>:
    72d4:	00c7e7b3          	or	a5,a5,a2

000072d8 <.LBE32>:
    72d8:	004006b7          	lui	a3,0x400
    72dc:	00d76733          	or	a4,a4,a3

000072e0 <.LVL57>:
    72e0:	ff87f793          	andi	a5,a5,-8

000072e4 <.LVL58>:
    72e4:	7ff00693          	li	a3,2047
    72e8:	df1ff06f          	j	70d8 <.L17>

000072ec <.L22>:
    72ec:	00000693          	li	a3,0

000072f0 <.LBB15>:
    72f0:	00500793          	li	a5,5
    72f4:	00000713          	li	a4,0

000072f8 <.L7>:
    72f8:	0037d793          	srli	a5,a5,0x3

000072fc <.LVL62>:
    72fc:	01d71613          	slli	a2,a4,0x1d
    7300:	00f66633          	or	a2,a2,a5

00007304 <.LVL63>:
    7304:	7ff00793          	li	a5,2047
    7308:	00375713          	srli	a4,a4,0x3
    730c:	e2f696e3          	bne	a3,a5,7138 <.L4>

00007310 <.LVL65>:
    7310:	00e66633          	or	a2,a2,a4
    7314:	00000713          	li	a4,0
    7318:	e20600e3          	beqz	a2,7138 <.L4>
    731c:	00080737          	lui	a4,0x80
    7320:	00000613          	li	a2,0
    7324:	00000593          	li	a1,0

00007328 <.LVL66>:
    7328:	e11ff06f          	j	7138 <.L4>

0000732c <.L21>:
    732c:	7ff00693          	li	a3,2047

00007330 <.L23>:
    7330:	00000713          	li	a4,0
    7334:	00000613          	li	a2,0
    7338:	e01ff06f          	j	7138 <.L4>

0000733c <.L24>:
    733c:	00000713          	li	a4,0

00007340 <.LBE34>:
    7340:	7ff00693          	li	a3,2047
    7344:	df5ff06f          	j	7138 <.L4>

00007348 <__clzsi2>:
    7348:	000107b7          	lui	a5,0x10
    734c:	02f57a63          	bgeu	a0,a5,7380 <.L2>
    7350:	10053793          	sltiu	a5,a0,256
    7354:	0017c793          	xori	a5,a5,1
    7358:	00379793          	slli	a5,a5,0x3

0000735c <.L3>:
    735c:	02000713          	li	a4,32
    7360:	40f70733          	sub	a4,a4,a5
    7364:	00f55533          	srl	a0,a0,a5

00007368 <.LVL2>:
    7368:	00000797          	auipc	a5,0x0
    736c:	0947a783          	lw	a5,148(a5) # 73fc <_GLOBAL_OFFSET_TABLE_+0x34>

00007370 <.LVL3>:
    7370:	00a787b3          	add	a5,a5,a0
    7374:	0007c503          	lbu	a0,0(a5)

00007378 <.LBE3>:
    7378:	40a70533          	sub	a0,a4,a0
    737c:	00008067          	ret

00007380 <.L2>:
    7380:	01000737          	lui	a4,0x1000
    7384:	01000793          	li	a5,16
    7388:	fce56ae3          	bltu	a0,a4,735c <.L3>
    738c:	01800793          	li	a5,24
    7390:	fcdff06f          	j	735c <.L3>

00007394 <main>:
#include <stdio.h>

int main( int argc, char ** argv )
{
    7394:	ff010113          	addi	sp,sp,-16
    7398:	00050593          	mv	a1,a0

0000739c <.LVL1>:
	printf( "Hello, world %08x\n", argc );
    739c:	00001517          	auipc	a0,0x1
    73a0:	28450513          	addi	a0,a0,644 # 8620 <.LC0>

000073a4 <.LVL2>:
{
    73a4:	00112623          	sw	ra,12(sp)
	printf( "Hello, world %08x\n", argc );
    73a8:	d79f80ef          	jal	ra,120 <__GI_printf>

000073ac <.LVL3>:
}
    73ac:	00c12083          	lw	ra,12(sp)
    73b0:	00000513          	li	a0,0
    73b4:	01010113          	addi	sp,sp,16
    73b8:	00008067          	ret
