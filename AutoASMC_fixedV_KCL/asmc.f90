!----------------------------------------------------------------------
!----------------------------------------------------------------------
!   automatically generated functions file
!----------------------------------------------------------------------
!----------------------------------------------------------------------

      SUBROUTINE FUNC(NDIM,U,ICP,PAR,IJAC,F,DFDU,DFDP)
!     ---------- ----

      IMPLICIT NONE
      INTEGER, INTENT(IN) :: NDIM, ICP(*), IJAC
      DOUBLE PRECISION, INTENT(IN) :: U(NDIM), PAR(*)
      DOUBLE PRECISION, INTENT(OUT) :: F(NDIM)
      DOUBLE PRECISION, INTENT(INOUT) :: DFDU(NDIM,NDIM), DFDP(NDIM,*)

      DOUBLE PRECISION G_KCa
      DOUBLE PRECISION G_Kdr
      DOUBLE PRECISION ns
      DOUBLE PRECISION R
      DOUBLE PRECISION Vsocc
      DOUBLE PRECISION q62
      DOUBLE PRECISION kryr2
      DOUBLE PRECISION openPar
      DOUBLE PRECISION K_int
      DOUBLE PRECISION kIPR
      DOUBLE PRECISION km24
      DOUBLE PRECISION H
      DOUBLE PRECISION Tso
      DOUBLE PRECISION y2
      DOUBLE PRECISION kleak
      DOUBLE PRECISION FF
      DOUBLE PRECISION kdiff
      DOUBLE PRECISION Na_int
      DOUBLE PRECISION K_ext
      DOUBLE PRECISION T
      DOUBLE PRECISION G_Cl
      DOUBLE PRECISION y1
      DOUBLE PRECISION kryr1
      DOUBLE PRECISION Km_K
      DOUBLE PRECISION beta
      DOUBLE PRECISION gCa
      DOUBLE PRECISION np
      DOUBLE PRECISION open
      DOUBLE PRECISION inOpen
      DOUBLE PRECISION Na_ext
      DOUBLE PRECISION Ksocc
      DOUBLE PRECISION cp0
      DOUBLE PRECISION Vp
      DOUBLE PRECISION Ks
      DOUBLE PRECISION Cl_int
      DOUBLE PRECISION Ca_CT
      DOUBLE PRECISION Cl_ext
      DOUBLE PRECISION G_bK
      DOUBLE PRECISION kryr3
      DOUBLE PRECISION km
      DOUBLE PRECISION scale
      DOUBLE PRECISION k24
      DOUBLE PRECISION Vs
      DOUBLE PRECISION Cm
      DOUBLE PRECISION Vrocc
      DOUBLE PRECISION Ca_ext
      DOUBLE PRECISION q26
      DOUBLE PRECISION Vm
      DOUBLE PRECISION I_NaKMax
      DOUBLE PRECISION y_Kss
      DOUBLE PRECISION Km_Na
      DOUBLE PRECISION kryr0
      DOUBLE PRECISION alpha
      DOUBLE PRECISION KCL
      DOUBLE PRECISION G_bNa
      DOUBLE PRECISION p
      DOUBLE PRECISION kRyR
      DOUBLE PRECISION L
      DOUBLE PRECISION aleph
      DOUBLE PRECISION Kp
      DOUBLE PRECISION c
      DOUBLE PRECISION cb
      DOUBLE PRECISION ct
      DOUBLE PRECISION h42
      DOUBLE PRECISION Pso
      DOUBLE PRECISION V
      DOUBLE PRECISION cp
      DOUBLE PRECISION E_Na
      DOUBLE PRECISION Jrocc
      DOUBLE PRECISION cs
      DOUBLE PRECISION km42
      DOUBLE PRECISION Jsocc
      DOUBLE PRECISION q24inf
      DOUBLE PRECISION I_bK
      DOUBLE PRECISION q42inf
      DOUBLE PRECISION E_K
      DOUBLE PRECISION K_m1
      DOUBLE PRECISION mVocc
      DOUBLE PRECISION xi2_Inf
      DOUBLE PRECISION JIPR
      DOUBLE PRECISION Jpm
      DOUBLE PRECISION JRyR
      DOUBLE PRECISION I_bNa
      DOUBLE PRECISION Jserca
      DOUBLE PRECISION I_NaK
      DOUBLE PRECISION xi1_Inf
      DOUBLE PRECISION x_Ca1Inf
      DOUBLE PRECISION K_1
      DOUBLE PRECISION Jleak
      DOUBLE PRECISION E_Cl
      DOUBLE PRECISION B
      DOUBLE PRECISION K_4
      DOUBLE PRECISION h24inf
      DOUBLE PRECISION lh42
      DOUBLE PRECISION J_CaL
      DOUBLE PRECISION I_ClCa
      DOUBLE PRECISION K_2
      DOUBLE PRECISION D
      DOUBLE PRECISION m42inf
      DOUBLE PRECISION V24
      DOUBLE PRECISION I_KCa
      DOUBLE PRECISION Jdiff
      DOUBLE PRECISION a42
      DOUBLE PRECISION Vca
      DOUBLE PRECISION k42
      DOUBLE PRECISION m24inf
      DOUBLE PRECISION I_Kdr
      DOUBLE PRECISION a24
      DOUBLE PRECISION xa_Inf
      DOUBLE PRECISION V42
      DOUBLE PRECISION E_Ca
      DOUBLE PRECISION PRyR

      c = U(1)
      cb = U(2)
      ct = U(3)
      h42 = U(4)
      Pso = U(5)

      G_KCa = 2.45
      G_Kdr = 0.035
      ns = 1.75
      R = 8314.4621
      Vsocc = 0.0015
      q62 = 4010.0
      kryr2 = 0.33
      openPar = 1.0
      K_int = 120.0
      kIPR = 0.07
      km24 = 80.0
      H = 20.0
      Tso = 30.0
      y2 = 10.0
      kleak = 0.0032
      FF = 96485.3415
      kdiff = 10.0
      Na_int = 12.0
      K_ext = 8.0
      T = 310.0
      G_Cl = 0.01
      y1 = 100.0
      kryr1 = 0.12
      Km_K = 1.0
      beta = 480.0
      gCa = 0.009
      np = 2.0
      open = 1.0
      inOpen = 1.0
      Na_ext = 130.0
      Ksocc = 450.0
      cp0 = 120.0
      Vp = 0.614
      Ks = 0.26
      Cl_int = 55.0
      Ca_CT = 0.5
      Cl_ext = 140.0
      G_bK = 0.008729
      kryr3 = 700.0
      km = 17.5
      scale = 1.449
      k24 = 0.35
      Vs = 13.25
      Cm = 2e-05
      Vrocc = 0.0005
      Ca_ext = 2.0
      q26 = 10500.0
      Vm = -18.0
      I_NaKMax = 0.7
      y_Kss = 0.15
      Km_Na = 40.0
      kryr0 = 0.0072
      alpha = 280.0
      KCL = PAR(2)
      G_bNa = 0.003263
      p = PAR(1)
      kRyR = 0.11
      L = 0.5
      aleph = 0.0028
      Kp = 0.5
      V = PAR(3)


      E_Na = ( R * T / FF ) * log( Na_ext / Na_int )
      E_K = ( R * T / FF ) * log(( K_ext + KCL ) / K_int )
      E_Cl = ( R * T / FF ) * log( Cl_int / ( Cl_ext + KCL ))
      E_Ca = ( R * T / ( 2.0 * FF )) * log( Ca_ext / ( c * 1.0e-3 ))
      a42 =  1.8 * p ** 2.0 / ( p ** 2.0 + 0.34 )
      V24 =  62.0 + 880.0 / ( p ** 2.0 + 4.0 )
      V42 =  110.0 * p ** 2.0 / ( p ** 2.0 + 0.01 )
      k42 =  0.49 + 0.543 * p ** 3 / ( p ** 3.0 + 64.0 )
      a24 =  1.0 + 5.0 / ( p ** 2.0 + 0.25 )
      km42 =  0.41 + 25.0 * p ** 3.0 / ( p ** 3.0 + 274.6 )
      cs =  y2 * ( ct - c - cb / y1 )
      cp =  cp0 * cs / 100.0
      h24inf =  km24 ** 2.0 / ( cp ** 2.0 + km24 ** 2.0 )
      m42inf =  cb ** 3.0 /( cb ** 3.0 + k42 ** 3.0 )
      m24inf =  cp ** 3.0 / ( cp ** 3.0 + k24 ** 3.0 )
      q42inf =  a42 + V42 * m42inf * h42
      q24inf =  a24 + V24 * ( 1.0 - m24inf * h24inf )
      D =  q42inf * ( q62 + q26 ) / ( q42inf * q62 + q42inf * q26 + q24inf * q62 )
      lh42 =  ( 1.0 - D ) * L + D * H
      PRyR =  ( kryr0 + kryr1 * c ** 3.0 / ( kryr2 ** 3.0 + c ** 3.0 )) * ( cs ** 4.0 / ( kryr3 ** 4.0 + cs ** 4.0 ))
      Jrocc =  openPar * inOpen * openPar * Vrocc * p * ( V - E_Ca )
      Jsocc =  openPar * inOpen * openPar * Vsocc * Pso * ( V - E_Ca )
      Jdiff =  kdiff * ( cb - c )
      Jserca =  Vs * c ** ns / ( Ks ** ns + c ** ns )
      Jleak =  kleak * ( cs - c )
      Jpm =  openPar * ( Vp * c ** np - aleph * Ca_ext ) / ( Kp ** np + c ** np )
      JIPR =  kIPR * ( D * q26 / ( q62 + q26 )) * ( cs - cb )
      JRyR =  kRyR * PRyR * ( cs - c )
      xa_Inf =  1.0 / ( 1.0 + exp(( - V + 5.5 ) / 6.0 ))
      xi1_Inf =  1.0 / ( 1.0 + exp(( V + 4.3 ) / 7.5 ))
      xi2_Inf =  1.0 / ( 1.0 + exp(( V + 4.3 ) / 7.5 ))
      I_Kdr =  G_Kdr * ( y_Kss + ( xi1_Inf + xi2_Inf ) * ( 1 - y_Kss )) * xa_Inf ** 2.0 * ( V - E_K )
      mVocc =  1.0 / ( 1.0 + exp( - ( V - Vm ) / km ))
      Vca =  V * (( 1.0e-3 * c ) - Ca_ext * exp( -2.0 * V * FF / ( R * T ))) / ( 1.0 - exp( - 2.0 * V * FF / ( R * T )))
      J_CaL =  openPar * inOpen * openPar * gCa * mVocc ** 2.0 * Vca
      K_4 =  0.0000125 * exp( -1.99 * V * FF / ( R * T ))
      K_2 =  0.000275 * exp( - 1.51 * V * FF / ( R * T ))
      K_m1 =  0.24 * exp( - 0.012 * V )
      K_1 =  0.85 * exp( 0.04 * V )
      x_Ca1Inf =  (( c * 1.0e-3 ) ** 2.0 + K_4 * ( c * 1.0e-3 )) / (( c * 1.0e-3 ) ** 2.0 + &
      K_4 * ( c * 1.0e-3 ) * ( 1.0 + alpha / beta ) + K_4 * K_2 * alpha / beta )
      B =  K_1 * ( c * 1.0e-3 ) * x_Ca1Inf / K_m1
      I_KCa =  G_KCa * x_Ca1Inf * B * ( V - E_K )
      I_ClCa =  G_Cl * ( V - E_Cl ) / ( 1.0 + ( Ca_CT / c ) ** 3.0 )
      I_NaK =  I_NaKMax * (( K_ext + KCL ) / ( Km_K + ( K_ext + KCL ))) * ( Na_int / ( Km_Na + Na_int ))
      I_bK =  G_bK * ( V - E_K )
      I_bNa =  G_bNa * ( V - E_Na )

      F(1) =  Jdiff + Jleak + JRyR - Jserca + openPar * scale * ( - Jpm + inOpen * openPar * ( - Jrocc - Jsocc - J_CaL ))
      F(2) =  y1 * ( JIPR - Jdiff )
      F(3) =  openPar * scale * ( - Jpm + inOpen * openPar * ( - Jrocc - Jsocc - J_CaL ))
      F(4) =  lh42 * ( km42 ** 3.0 / ( cb ** 3.0 + km42 ** 3.0 ) - h42 )
      F(5) =  1.0 / Tso * ( Ksocc ** 4.0 / ( Ksocc ** 4.0 + cs ** 4.0 ) - Pso )


      END SUBROUTINE FUNC

      SUBROUTINE STPNT(NDIM,U,PAR,T)
!     ---------- -----

      IMPLICIT NONE
      INTEGER, INTENT(IN) :: NDIM
      DOUBLE PRECISION, INTENT(INOUT) :: U(NDIM),PAR(*)
      DOUBLE PRECISION, INTENT(IN) :: T

      PAR(1) = 0.0
      PAR(2) = 0.0
      PAR(3) = -46.679028350414853

      U(1) = 0.165715430397007
      U(2) = 0.165715430397007
      U(3) = 86.614773862844160
      U(4) = 0.938060442341531
      U(5) = 0.068402298300266

      END SUBROUTINE STPNT

      SUBROUTINE BCND
      END SUBROUTINE BCND

      SUBROUTINE ICND
      END SUBROUTINE ICND

      SUBROUTINE FOPT
      END SUBROUTINE FOPT

      SUBROUTINE PVLS
      END SUBROUTINE PVLS
