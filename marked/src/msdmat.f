       SUBROUTINE MSP(P,N,M,F,T,PMAT)
       IMPLICIT DOUBLE PRECISION (A-H,O-Z)
       INTEGER N,F(N),T,INDEX,I,J,K,L,M
       DOUBLE PRECISION PMAT(N,T,M,M), P(N,(M-1)*(T-1))
       DO 1 I=1,N
       DO 1 J=1,T
       DO 1 K=1,M
       DO 1 L=1,M
          PMAT(I,J,K,L)=0.0D0
  1    CONTINUE
       DO 20 I=1,N
       DO 20 J=F(I),T-1
          IF(J.EQ.F(I)) THEN
                DO 5 K=2,M
                  PMAT(I,J,K,K-1)=1.0D0 
  5             CONTINUE
                PMAT(I,J,1,M)=1.0D0
           ENDIF
           INDEX=(J-1)*(M-1)
           DO 9 K=2,M
              INDEX=INDEX+1
              PMAT(I,J+1,K,K-1)=P(I,INDEX) 
  9        CONTINUE
           DO 11 K=1,M-1
              PMAT(I,J+1,1,K)=1-PMAT(I,J+1,K+1,K) 
 11        CONTINUE
           PMAT(I,J+1,1,M)=1.0D0
 20    CONTINUE
       RETURN
       END
  