
hello_linux:     file format elf32-littleriscv


Disassembly of section .plt:

000003d0 <__libc_start_main@plt-0x20>:
 3d0:	00002397          	auipc	t2,0x2
 3d4:	41c30333          	sub	t1,t1,t3
 3d8:	c343ae03          	lw	t3,-972(t2) # 2004 <main@@Base+0x1bf4>
 3dc:	fd430313          	addi	t1,t1,-44
 3e0:	c3438293          	addi	t0,t2,-972
 3e4:	00235313          	srli	t1,t1,0x2
 3e8:	0042a283          	lw	t0,4(t0)
 3ec:	000e0067          	jr	t3

000003f0 <__libc_start_main@plt>:
 3f0:	00002e17          	auipc	t3,0x2
 3f4:	c1ce2e03          	lw	t3,-996(t3) # 200c <__libc_start_main@GLIBC_2.34>
 3f8:	000e0367          	jalr	t1,t3
 3fc:	00000013          	nop

00000400 <printf@plt>:
 400:	00002e17          	auipc	t3,0x2
 404:	c10e2e03          	lw	t3,-1008(t3) # 2010 <printf@GLIBC_2.33>
 408:	000e0367          	jalr	t1,t3
 40c:	00000013          	nop

Disassembly of section .text:

00000410 <main@@Base>:
 410:	1141                	addi	sp,sp,-16
 412:	85aa                	mv	a1,a0
 414:	00000517          	auipc	a0,0x0
 418:	10850513          	addi	a0,a0,264 # 51c <main@@Base+0x10c>
 41c:	c606                	sw	ra,12(sp)
 41e:	37cd                	jal	400 <printf@plt>
 420:	40b2                	lw	ra,12(sp)
 422:	4501                	li	a0,0
 424:	0141                	addi	sp,sp,16
 426:	8082                	ret
 428:	030000ef          	jal	ra,458 <main@@Base+0x48>
 42c:	00050793          	mv	a5,a0
 430:	00002517          	auipc	a0,0x2
 434:	bf052503          	lw	a0,-1040(a0) # 2020 <main@@Base+0x1c10>
 438:	00012583          	lw	a1,0(sp)
 43c:	00410613          	addi	a2,sp,4
 440:	ff017113          	andi	sp,sp,-16
 444:	00000693          	li	a3,0
 448:	00000713          	li	a4,0
 44c:	00010813          	mv	a6,sp
 450:	fa1ff0ef          	jal	ra,3f0 <__libc_start_main@plt>
 454:	00100073          	ebreak
 458:	00002197          	auipc	gp,0x2
 45c:	3a818193          	addi	gp,gp,936 # 2800 <main@@Base+0x23f0>
 460:	00008067          	ret
 464:	00002517          	auipc	a0,0x2
 468:	ba050513          	addi	a0,a0,-1120 # 2004 <main@@Base+0x1bf4>
 46c:	00002797          	auipc	a5,0x2
 470:	b9878793          	addi	a5,a5,-1128 # 2004 <main@@Base+0x1bf4>
 474:	00a78a63          	beq	a5,a0,488 <main@@Base+0x78>
 478:	00002797          	auipc	a5,0x2
 47c:	ba07a783          	lw	a5,-1120(a5) # 2018 <main@@Base+0x1c08>
 480:	00078463          	beqz	a5,488 <main@@Base+0x78>
 484:	00078067          	jr	a5
 488:	00008067          	ret
 48c:	00002517          	auipc	a0,0x2
 490:	b7850513          	addi	a0,a0,-1160 # 2004 <main@@Base+0x1bf4>
 494:	00002597          	auipc	a1,0x2
 498:	b7058593          	addi	a1,a1,-1168 # 2004 <main@@Base+0x1bf4>
 49c:	40a585b3          	sub	a1,a1,a0
 4a0:	4025d593          	srai	a1,a1,0x2
 4a4:	00200793          	li	a5,2
 4a8:	02f5c5b3          	div	a1,a1,a5
 4ac:	00058a63          	beqz	a1,4c0 <main@@Base+0xb0>
 4b0:	00002797          	auipc	a5,0x2
 4b4:	b747a783          	lw	a5,-1164(a5) # 2024 <main@@Base+0x1c14>
 4b8:	00078463          	beqz	a5,4c0 <main@@Base+0xb0>
 4bc:	00078067          	jr	a5
 4c0:	00008067          	ret
 4c4:	ff010113          	addi	sp,sp,-16
 4c8:	00812423          	sw	s0,8(sp)
 4cc:	00002417          	auipc	s0,0x2
 4d0:	b5c40413          	addi	s0,s0,-1188 # 2028 <main@@Base+0x1c18>
 4d4:	00044783          	lbu	a5,0(s0)
 4d8:	00112623          	sw	ra,12(sp)
 4dc:	02079463          	bnez	a5,504 <main@@Base+0xf4>
 4e0:	00002797          	auipc	a5,0x2
 4e4:	b3c7a783          	lw	a5,-1220(a5) # 201c <main@@Base+0x1c0c>
 4e8:	00078863          	beqz	a5,4f8 <main@@Base+0xe8>
 4ec:	00002517          	auipc	a0,0x2
 4f0:	b1452503          	lw	a0,-1260(a0) # 2000 <main@@Base+0x1bf0>
 4f4:	000780e7          	jalr	a5
 4f8:	f6dff0ef          	jal	ra,464 <main@@Base+0x54>
 4fc:	00100793          	li	a5,1
 500:	00f40023          	sb	a5,0(s0)
 504:	00c12083          	lw	ra,12(sp)
 508:	00812403          	lw	s0,8(sp)
 50c:	01010113          	addi	sp,sp,16
 510:	00008067          	ret
 514:	f79ff06f          	j	48c <main@@Base+0x7c>
