      SUBROUTINE LGND1D
C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C                .      .    .                                       .
C SUBPROGRAM:    LGND1D      PUT RUN TIME IN TITLE
C   PRGMMR: LIN              ORG: W/NMC412   DATE: 97-02-10
C
C ABSTRACT: ADDS A SPECIAL LEGEND TO PLOTTED
C   CHARTS IDENTIFYING THEIR TIME OF EXECUTION OR RUN TIME.
C
C PROGRAM HISTORY LOG:
C   YY-MM-DD  ORIGINAL AUTHOR  UNKNOWN
C   89-04-21  HENRICHSEN  ADD DOCUMENTATION BLOCK AND
C                         REPLACE ENCODE WITH FFI2A
C   93-05-05  LILLY CONVERT SUB. TO FORTRAN 77
C   97-02-10  LIN   CONVERT SUB. TO CFT     77
C
C USAGE:    CALL LGND1D
C
C
C REMARKS:
C
C ATTRIBUTES:
C   LANGUAGE: FORTRAN 77
C   MACHINE:  NAS
C
C$$$
C
      COMMON /ADJUST/  IXADJ, IYADJ
C
      CHARACTER*4 TITLE(4)
      DATA        TITLE      /'#CLO', 'CK T', 'IME ', '####'/
C
      INTEGER    ITIME(8)
C
      CHARACTER*1  ICYCLE
      INTEGER      IPRIOR(2)
C
      NCYCLE = 0
      CALL W3UTCDAT(ITIME)  
C
      IHRPMM = ITIME(5)
      IHRPMM = IHRPMM*100 + ITIME(6)
C     CALL INT2CH(IHRPMM,TITLE(4),4,'L999')
      CALL BIN2CH(IHRPMM,TITLE(4),4,'A999')
C
      ANGLE   = 0.0
      HEIGHT  = 1.0
      IDOTS   = 400 + IXADJ
      IPRIOR(1)  = 0
      IPRIOR(2)  = 2
      ITAG    = 0
      JDOTS   = 65 + IYADJ
      NCHAR   = 16
C
      CALL PUTLAB(IDOTS,JDOTS,HEIGHT,TITLE(1),ANGLE,NCHAR,IPRIOR,ITAG)
      PRINT *,' LGND1D    TIME OF DAY FOR MAP TITLE is ',TITLE
C
      RETURN
      END