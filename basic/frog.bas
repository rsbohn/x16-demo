5 REM DRAWS A FROG...
10 IF PEEK(217)<>40 THEN SYS65375
100 BL=6:ML=40:AD=0.5:TI$="000000":POKE646,1
110 DIM I(10),XT(BL),YT(BL),XP(BL),YP(BL),XD(BL),YD(BL),SC(BL)
120 DIM X,Y,B2,B3,P,PP,AC
130 VP=20000
140 WP=21000
160 GOSUB 900
190 GOSUB 820
200 GOSUB 670
220 GOSUB 270
230 REM JUMP TARGET
240 PRINTTI
250 REM GET A$:IF A$="" THEN 230
260 END
270 REM JUMP TARGET
280 FOR Y=5 TO 22
290 YT=Y*40+VP
300 X=8
310 VX=YT+X
320 FOR I=0 TO BL
330 IF XT(I)<>0 THEN 560
340 IF PEEK(VX)=6 THEN  X=X+1:VX=VX+1:GOTO 620
350 XT(I)=X:YT(I)=Y
360 IF RND(1)<0.4 THEN 410
370 XP(I)=6+INT(RND(1)*26)
380 YP(I)=0
390 IF Y>10 THEN  YP(I)=24
400 GOTO 450
410 REM JUMP TARGET
420 XP(I)=0
430 IF X>20 THEN  XP(I)=39
440 YP(I)=4+INT(RND(1)*18)
450 LY=ABS(YT(I)-YP(I)):LX=ABS(XT(I)-XP(I))
460 DX=0:DY=0
470 IF LY>LX THEN  LX=LY
480 IF LX=0 THEN 510
490 DX=(XT(I)-XP(I))/LX
500 DY=(YT(I)-YP(I))/LX
510 XD(I)=DX:YD(I)=DY:SC(I)=PEEK(XT(I)+YT(I)*ML+VP)
520 AC=AC+1
530 X=X+1:VX=VX+1
540 B2=XP(I):B3=YP(I)
550 GOTO 580
560 B2=XP(I):B3=YP(I):P=INT(B2+AD)+INT(B3+AD)*ML:CP=INT(P/40):CM=CP*256+1
570 B2=B2+XD(I):B3=B3+YD(I):VPOKE0,CM+(P-40*CP)*2,PEEK(WP+P)
580 P1=INT(B2+AD):P2=INT(B3+AD):P=P1+P2*ML:CP=INT(P/40):CM=CP*256+1
590 VPOKE0,CM+(P-40*CP)*2,SC(I):XP(I)=B2:YP(I)=B3
600 IF P1<>XT(I)ORP2<>YT(I)THEN 620
610 POKEWP+XT(I)+YT(I)*ML,SC(I):AC=AC-1:XT(I)=0
620 NEXT
630 IF X<33 THEN 310
640 X=8:IF Y=22 AND AC<>0 THEN  Y=21
650 NEXT
660 RETURN
670 REM JUMP TARGET
680 CL=0
690 Y=5
700 X=0
710 REM JUMP TARGET
720 READ C:IF C=-99 THEN  RETURN
730 IF C<0 THEN  CL=ABS(C):GOTO 710
740 IF C=100 THEN  CL=0:GOTO 710
750 IF C<X AND C<>0 THEN  Y=Y+1
760 IF C<>0 THEN  X=C
770 P=VP+Y*40
780 READ CN
790 FOR I=P+X TO P+CN+X-1:POKE I,CL:NEXT I
800 X=X+CN
810 GOTO 710
820 REM JUMP TARGET
840 FOR I=20000 TO 20999:POKEI,6:NEXT
860 FOR I=21000 TO 21999:POKEI,6:NEXT
880 FOR Y=0 TO 29:FOR X=0 TO 39
882 Q=Y*256+X*2
884 VPOKE0,Q+1,6
886 VPOKE0,Q,160
888 NEXTX,Y
890 RETURN
900 REM JUMP TARGET
910 PRINT CHR$(147);
930 RETURN
940 DATA -1,12,4,24,4,10,4,100,0,2,-1,0,2,22,4,100,0,2,-1,0,2
950 DATA 10,2,100,0,4,-1,0,2,-5,0,4,-1,0,2,100,0,4,-1,0,2
960 DATA 10,2,100,0,4,-1,0,2,-5,0,4,-1,0,2,100,0,4,-1,0,2
970 DATA -5,10,2,-1,0,4,-5,0,8,-1,0,4,-5,0,2
980 DATA 8,24,8,24,8,24,100,10,20,-5,10,20,10,20
990 DATA 12,16,12,6,-1,0,4,-5,0,6,12,4,-1,0,8,-5,0,4
1000 DATA 8,2,14,2,-1,0,8,-5,0,2,30,2,10,2,14,2,24,2,28,2
1010 DATA 8,8,24,8,-99
