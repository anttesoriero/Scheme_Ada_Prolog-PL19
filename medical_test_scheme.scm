; Anthony Tesoriero for Programming Languages Fall19

(define (size L)
	; Returns number of patients
	(cond ((null? L)		0)
	(else 				(+ 1 (size (cdr L)))) ))

(define (d_counter L)
        ; Takes in list of nums L, Returns number of "1"'s in disease column
        (cond   ((null? L)      	0)
                ((eq? 1 (cadar L))	(+ 1 (d_counter (cdr L))))
                (else 			(d_counter (cdr L))) ))

(define (t1_counter L)
	; Takes in list of nums L, Returns number of "1"'s in test 1 column
	(cond	((null? L)		0)
		((eq? 1 (caddar L))	(+ 1 (t1_counter (cdr L))))
		(else 			(t1_counter (cdr L))) ))

(define (t2_counter L)
        ; Takes in list of nums L, Returns number of "1"'s in test 2 column
        (cond   ((null? L)      		0)
                ((eq? 1 (car (cdddar L)))	(+ 1 (t2_counter (cdr L))))
                (else				(t2_counter (cdr L))) ))

(define (t1_counter_n L)
        ; Takes in list of nums L, Returns number of "1"'s in test 1 column
        (cond   ((null? L)              0)
                ((eq? 0 (caddar L))     (+ 1 (t1_counter_n (cdr L))))
                (else                   (t1_counter_n (cdr L))) ))

(define (t2_counter_n L)
        ; Takes in list of nums L, Returns number of "0"'s in test 2 column
        (cond   ((null? L)                      0)
                ((eq? 0 (car (cdddar L)))       (+ 1 (t2_counter_n (cdr L))))
                (else                           (t2_counter_n (cdr L))) ))

(define (dt1t L)
	; Compares d and t1
	(cond	((null? L)					0)
		((and (eq? 1 (cadar L)) (eq? 1 (caddar L)))	(+ 1 (dt1t (cdr L))))
		(else 						(dt1t (cdr L))) ))

(define (dt2t L)
	; Compares d t2
	(cond	((null? L)					  0)
		((and (eq? 1 (cadar L)) (eq? 1 (car (cdddar L)))) (+ 1 (dt2t (cdr L))))
		(else						  (dt2t (cdr L))) ))

(define (dt1f L)
        ; Compares d and t1
        (cond   ((null? L)                                      0)
                ((and (eq? 0 (cadar L)) (eq? 0 (caddar L)))     (+ 1 (dt1f (cdr L))))
                (else                                           (dt1f (cdr L))) ))

(define (dt2f L)
        ; Compares d t2
        (cond   ((null? L)                                        0)
                ((and (eq? 0 (cadar L)) (eq? 0 (car (cdddar L)))) (+ 1 (dt2f (cdr L))))
                (else                                             (dt2f (cdr L))) ))



(define (DP1 L)
	; P(D | POS2)
	(/ (dt1t L) (t1_counter L)))

(define (DP2 L)
	; P(D | POS2)
        (/ (dt2t L) (t2_counter L)))

(define (HN1 L)
	; P(H | NEG2)
        (/ (dt1f L) (t1_counter_n L)))

(define (HN2 L)
	; P(H | NEG2)
        (/ (dt2f L) (t2_counter_n L)))

(define (COMP L)
	; Decides which test is best
	(cond	((and (> (DP1 L) (DP2 L)) (> (HN1 L) (HN2 L)))	"Test 1")
		((and (< (DP1 L) (DP2 L)) (< (HN1 L) (HN2 L)))	"Test 2")
		(else						"Neither") ))

(define (medical_test Patient_Data)
	; Prints out all values
	(list (DP1 Patient_Data) (DP2 Patient_Data) 
	      (HN1 Patient_Data) (HN2 Patient_Data) 
	      (COMP Patient_Data) ))


