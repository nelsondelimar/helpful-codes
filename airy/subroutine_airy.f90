    SUBROUTINE THICKNESS_AIRY(TOPO,NPOINTS,THICKNESS)
    IMPLICIT NONE 
    INTEGER N,I
    REAL(4) TOPO(NPOINTS),THICKNESS(NPOINTS)
    REAL(4) RHO_W, RHO_CC, RHO_CO, RHO_M

    RHO_W = 1030.
    RHO_CC = 2700.
    RHO_CO = 2900.
    RHO_M = 3350.

    DO I = 1,NPOINTS
    IF (TOPO(I) .LE. 0.) THEN
    	THICKNESS(I) = (RHO_CO - RHO_W)*TOPO(I)/(RHO_M - RHO_CO)
    ELSE
    	THICKNESS(I) = (RHO_CC*TOPO(I))/(RHO_M - RHO_CC)
    END IF
    END DO

    RETURN
    END
!-------------------------------------------------------------
    SUBROUTINE WRITE_XYZ(XI,YI,ZI,NPOINTS,FILENAME)
    IMPLICIT NONE 
    
    INTEGER(4) N,LWRITE,I
    REAL(4) XI(NPOINTS), YI(NPOINTS), ZI(NPOINTS)
    CHARACTER*(*) FILENAME

105  FORMAT(1X,ES17.4,2X,ES17.4,2X,ES17.8)  

    LWRITE = 155
    OPEN (UNIT=LWRITE, STATUS='REPLACE', FILE=FILENAME, FORM='FORMATTED')   

    DO I = 1, NPOINTS
        WRITE(LWRITE,105)XI(I),YI(I),ZI(I)
    END DO

    CLOSE (UNIT=LWRITE) 
    RETURN
    END