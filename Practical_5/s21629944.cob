       IDENTIFICATION DIVISION.
       PROGRAM-ID. Statistics.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR OCCURS 5 TIMES INDEXED BY I.
          05 NUM PIC S9(3).
       01 SMALLEST PIC S9(3) VALUE 999.
       01 LARGEST PIC S9(3) VALUE -999.
       01 SEARCHMODE PIC S9(3).
       01 MODE-COUNT PIC 9(3) VALUE 0.
       01 TEMP-COUNT PIC 9(3).
       01 ARR OCCURS 5 TIMES INDEXED BY J.
            05 NUM2 PIC S9(3).
       PROCEDURE DIVISION.
       BEGIN.
           PERFORM READ-DATA.
           PERFORM FIND-SMALLEST.
           PERFORM FIND-LARGEST.
           PERFORM FIND-MODE.
           DISPLAY "Smallest: " SMALLEST.
           DISPLAY "Largest: " LARGEST.
           DISPLAY "Mode: " SEARCHMODE.
           STOP RUN.

       READ-DATA.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               DISPLAY "Enter a number: "
               ACCEPT NUM(I)
           END-PERFORM.

       FIND-SMALLEST.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               IF NUM(I) < SMALLEST THEN
                   MOVE NUM(I) TO SMALLEST
               END-IF
           END-PERFORM.

       FIND-LARGEST.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               IF NUM(I) > LARGEST THEN
                   MOVE NUM(I) TO LARGEST
               END-IF
           END-PERFORM.

       FIND-MODE.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               MOVE 0 TO TEMP-COUNT
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 5
                   IF NUM(I) = NUM(J) THEN
                       ADD 1 TO TEMP-COUNT
                   END-IF
               END-PERFORM
               IF TEMP-COUNT > MODE-COUNT THEN
                   MOVE TEMP-COUNT TO MODE-COUNT
                   MOVE NUM(I) TO SEARCHMODE
               END-IF
           END-PERFORM.