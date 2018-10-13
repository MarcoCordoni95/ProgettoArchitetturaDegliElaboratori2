main:

.data

A: .space 32				#definisco un array di 8 elementi, ciascuno di 4 byte

stringa_new_line: .asciiz "\n"		#definisco il comando ascii per il ritorno a capo

string1: .asciiz "   Benvenuto in Mymedia! "									#inizio definizione delle stringhe
string2: .asciiz "   Inserire il nome utente prego... "
string3: .asciiz "   Inserire la classe appena conseguita (numero da 1 a 5)... "
string4: .asciiz "   Inserire la media conseguita al termine del primo quadrimestre "
string5: .asciiz "   Ora possiamo iniziare con l'inserimento dei voti relativi al secondo quadrimestre... "
string6: .asciiz "   Quale voto hai conseguito in matematica? "
string7: .asciiz "   Quale voto hai conseguito in italiano? "
string8: .asciiz "   Quale voto hai conseguito in storia? "
string9: .asciiz "   Quale voto hai conseguito in economia aziendale? "
string10: .asciiz "   Quale voto hai conseguito in informatica? "
string11: .asciiz "   Quale voto hai conseguito in educazione fisica? "
string12: .asciiz "   Quale voto hai conseguito in diritto? "
string13: .asciiz "   Quale voto hai conseguito in geografia? "
string14: .asciiz "   La tua nuova media e'... "
string15: .asciiz "   Complimenti sei migliorato di... "
string16: .asciiz "   Mi spiace sei peggiorato di... "
string17: .asciiz "   punto/i. "
string18: .asciiz "   Complimenti non hai debiti, sei ammesso all'anno successivo! "
string19: .asciiz "   Complimenti non hai debiti, sei ammesso alla maturita'! "
string20: .asciiz "   Mi spiace ma di debiti ne hai... "
string21: .asciiz "   Sei stato bocciato. "
string22: .asciiz "   Non sei ammesso alla maturita'. "
string23: .asciiz "   Per accedere all'anno successivo dovrai sostenere i recuperi. "				
string24: .asciiz "   Dato errato! "						
string25: .asciiz "   Matematica: "										
string26: .asciiz "   Italiano: "										
string27: .asciiz "   Storia "										
string28: .asciiz "   Economia aziendale "										
string29: .asciiz "   Informatica: "										
string30: .asciiz "   Educazione fisica: "					
string31: .asciiz "   Diritto: "										
string32: .asciiz "   Geografia: "										
string33: .asciiz "   Non sei ne' migliorato ne' peggiorato "			
string34: .asciiz "   Studente: "										#fine definizione delle stringhe


.text

addi $sp, $sp, -4	# creo uno spazio di 4 byte dentro lo stack 
sw $ra, 0($sp)		# salvo nello stack l'attuale contenuto di $ra

la $s3, A		# Scrive il base address di A in $s3

li $v0, 4		# seleziona print_string
la $a0, string1		# $a0 contiene l'indirizzo di string1		
syscall			# lancia print_string

jal f3			# salto alla procedura f3 per effettuare un ritorno a capo
jal f3			# salto alla procedura f3 per effettuare un ritorno a capo

li $v0, 4		# seleziona print_string
la $a0, string2 	# $a0 contiene l'indirizzo di string2		
syscall			# lancia print_string

li $v0, 8		# seleziona read_string
syscall			# lancia read_string

move $s0,$a0		# salva il nome utente in $s0


addi $a1,$zero,6	# salva 6 in $a1

#INIZIO CICLO PER INSERIMENTO DELLA CLASSE
ripeti1:		# inizio del while

li $v0, 4		# seleziona print_string
la $a0, string3 	# $a0 contiene l'indirizzo di string3		
syscall			# lancia print_string

jal f1			# salto alla procedura f1 per controllare la validita' del dato

beq $v1, $zero, else1	# salta all'else se la classe non e' compresa fra 0 e 6 
move $s1,$v0		# salva la classe in $s1
j exit1			# salta all'uscita del ciclo

else1:			# inizio dell'else

jal f2			# salto alla procedura f2 per mostrare il messaggio d'errore
j ripeti1		# reinserimento della classe

exit1:			# fine del ciclo
#FINE CICLO PER INSERIMENTO DELLA CLASSE


addi $a1,$zero,11	# salva 11 in $a1

#INIZIO CICLO PER INSERIMENTO DELLA MEDIA
ripeti2:		# inizio del while

li $v0, 4		# seleziona print_string
la $a0, string4 	# $a0 contiene l'indirizzo di string4		
syscall			# lancia print_string

jal f1			# salto alla procedura f1 per controllare la validita' del dato

beq $v1, $zero, else2	# salta all'else se la media non e' compresa fra 0 e 11 
move $s2,$v0		# salva la media in $s2
j exit2			# salta all'uscita del ciclo

else2:			#inizio dell'else			

jal f2			# salto alla procedura f2 per mostrare il messaggio d'errore
j ripeti2		# reinserimento della media

exit2:			# fine del ciclo
#FINE CICLO PER INSERIMENTO DELLA MEDIA



jal f3			# salto alla procedura f3 per effettuare un ritorno a capo 

li $v0, 4		# seleziona print_string
la $a0, string5		# $a0 contiene l'indirizzo di string5		
syscall			# lancia print_string

jal f3			# salto alla procedura f3 per effettuare un ritorno a capo
jal f3			# salto alla procedura f3 per effettuare un ritorno a capo


#INIZIO INSERIMENTO VOTI

#CICLO PER INSERIMENTO DEL PRIMO VOTO
ripeti3:		# inizio del while

li $v0, 4		# seleziona print_string
la $a0, string6 	# $a0 contiene l'indirizzo di string6		
syscall			# lancia print_string

jal f1			# salto alla procedura f1 per controllare la validita' del dato

beq $v1, $zero, else3	# salta all'else se il voto non e' compreso fra 0 e 11, quindi il bit di "flag" $v1 e' zero
sw $v0, 0($s3)		# salva il voto in A[0]
j exit3			# salta all'uscita del ciclo

else3:			# inizio dell'else	
	
jal f2			# salto alla procedura f2 per mostrare il messaggio d'errore
j ripeti3		# reinserimento del voto

exit3:			# fine del ciclo
#FINE CICLO PER INSERIMENTO DEL PRIMO VOTO


#CICLO PER INSERIMENTO DEL SECONDO VOTO
ripeti4:		# inizio del while

li $v0, 4		# seleziona print_string
la $a0, string7 	# $a0 contiene l'indirizzo di string7		
syscall			# lancia print_string

jal f1			# salto alla procedura f1 per controllare la validita' del dato

beq $v1, $zero, else4	# salta all'else se il voto non e' compreso fra 0 e 11, quindi il bit di "flag" $v1 e' zero
sw $v0, 4($s3)		# salva il voto in A[1]
j exit4			# salta all'uscita del ciclo

else4:			# inizio dell'else			
 
jal f2			# salto alla procedura f2 per mostrare il messaggio d'errore
j ripeti4		# reinserimento del voto

exit4:			# fine del ciclo
#FINE CICLO PER INSERIMENTO DEL SECONDO VOTO


#CICLO PER INSERIMENTO DEL TERZO VOTO
ripeti5:		# inizio del while

li $v0, 4		# seleziona print_string
la $a0, string8 	# $a0 contiene l'indirizzo di string8		
syscall			# lancia print_string

jal f1			# salto alla procedura f1 per controllare la validita' del dato
beq $v1, $zero, else5	# salta all'else se il voto non e' compreso fra 0 e 11, quindi il bit di "flag" $v1 e' zero 
sw $v0, 8($s3)		# salva il voto in A[2]

j exit5			# salta all'uscita del ciclo

else5:			# inizio dell'else		

jal f2			# salto alla procedura f2 per mostrare il messaggio d'errore
j ripeti5		# reinserimento del voto

exit5:			# fine del ciclo
#FINE CICLO PER INSERIMENTO DEL TERZO VOTO



#CICLO PER INSERIMENTO DEL QUARTO VOTO
ripeti6:		# inizio del while

li $v0, 4		# seleziona print_string
la $a0, string9 	# $a0 contiene l'indirizzo di string9		
syscall			# lancia print_string

jal f1			# salto alla procedura f1 per controllare la validita' del dato
beq $v1, $zero, else6	# salta all'else se il voto non e' compreso fra 0 e 11, quindi il bit di "flag" $v1 e' zero 
sw $v0, 12($s3)		# salva il voto in A[3]

j exit6			# salta all'uscita del ciclo

else6:			# inizio dell'else			

jal f2			# salto alla procedura f2 per mostrare il messaggio d'errore
j ripeti6		# reinserimento del voto

exit6:			# fine del ciclo
#FINE CICLO PER INSERIMENTO DEL QUARTO VOTO



#CICLO PER INSERIMENTO DEL QUINTO VOTO
ripeti7:		# inizio del while

li $v0, 4		# seleziona print_string
la $a0, string10 	# $a0 contiene l'indirizzo di string10		
syscall			# lancia print_string

jal f1			# salto alla procedura f1 per controllare la validita' del dato
beq $v1, $zero, else7	# salta all'else se il voto non e' compreso fra 0 e 11, quindi il bit di "flag" $v1 e' zero 
sw $v0, 16($s3)		# salva il voto in A[4]

j exit7			# salta all'uscita del ciclo

else7:			# inizio dell'else			

jal f2			# salto alla procedura f2 per mostrare il messaggio d'errore
j ripeti7		# reinserimento del voto

exit7:			# fine del ciclo
#FINE CICLO PER INSERIMENTO DEL QUINTO VOTO



#CICLO PER INSERIMENTO DEL SESTO VOTO
ripeti8:		#inizio del while

li $v0, 4		# seleziona print_string
la $a0, string11 	# $a0 contiene l'indirizzo di string11		
syscall			# lancia print_string

jal f1			# salto alla procedura f1 per controllare la validita' del dato
beq $v1, $zero, else8	# salta all'else se il voto non e' compreso fra 0 e 11, quindi il bit di "flag" $v1 e' zero 
sw $v0, 20($s3)		# salva il voto in A[5]

j exit8			# salta all'uscita del ciclo

else8:			# inizio dell'else			

jal f2			# salto alla procedura f2 per mostrare il messaggio d'errore
j ripeti8		# reinserimento del voto

exit8:			# fine del ciclo
#FINE CICLO PER INSERIMENTO DEL SESTO VOTO



#CICLO PER INSERIMENTO DEL SETTIMO VOTO
ripeti9:		# inizio del while

li $v0, 4		# seleziona print_string
la $a0, string12 	# $a0 contiene l'indirizzo di string12		
syscall			# lancia print_string

jal f1			# salto alla procedura f1 per controllare la validita' del dato
beq $v1, $zero, else9	# salta all'else se il voto non e' compreso fra 0 e 11, quindi il bit di "flag" $v1 e' zero 
sw $v0, 24($s3)		# salva il voto in A[6]

j exit9			# salta all'uscita del ciclo

else9:			# inizio dell'else			

jal f2			# salto alla procedura f2 per mostrare il messaggio d'errore
j ripeti9		# reinserimento del voto

exit9:			# fine del ciclo
#FINE CICLO PER INSERIMENTO DEL SETTIMO VOTO


#CICLO PER INSERIMENTO DEL L'OTTAVO VOTO
ripeti10:		# inizio del while

li $v0, 4		# seleziona print_string
la $a0, string13 	# $a0 contiene l'indirizzo di string13	
syscall			# lancia print_string

jal f1			# salto alla procedura f1 per controllare la validita' del dato
beq $v1, $zero, else10	# salta all'else se il voto non e' compreso fra 0 e 11, quindi il bit di "flag" $v1 e' zero 
sw $v0, 28($s3)		# salva il voto in A[7]

j exit10		# salta all'uscita del ciclo

else10:			# inizio dell'else			

jal f2			# salto alla procedura f2 per mostrare il messaggio d'errore
j ripeti10		# reinserimento del voto

exit10:			# fine del ciclo
#FINE CICLO PER INSERIMENTO DEL L'OTTAVO VOTO

#FINE INSERIMENTO VOTI


addi $a0, $zero, 8	# salvo in $a0 la dimensione dell'array
addi $a1, $s3, 0	# salvo in $a1 il base address dell'array

jal f4			# salto alla procedura f4 per la somma degli elementi dell'array

div $s4, $v0, 8		# salva la media dei voti in $s4

jal f3			# salto alla procedura f3 per effettuare un ritorno a capo

li $v0, 4		# seleziona print_string
la $a0, string34	# $a0 contiene l'indirizzo di string34		
syscall			# lancia print_string

li $v0, 4		# seleziona print_string
add $a0,$s0,$zero	# $a0 contiene il nome dello studente	
syscall			# lancia print_string

jal f3			# salto alla procedura f3 per effettuare un ritorno a capo


li $v0, 4		# seleziona print_string
la $a0, string25	# $a0 contiene l'indirizzo di string25		
syscall			# lancia print_string

li $v0, 1		# seleziona print_int
lw $a0, 0,($s3)		# $a0 contiene il voto di matematica
syscall			# lancia print_int

jal f3			# salto alla procedura f3 per effettuare un ritorno a capo



li $v0, 4		# seleziona print_string
la $a0, string26	# $a0 contiene l'indirizzo di string26		
syscall			# lancia print_string

li $v0, 1		# seleziona print_int
lw $a0, 4,($s3)		# $a0 contiene il voto di italiano
syscall			# lancia print_int

jal f3			# salto alla procedura f3 per effettuare un ritorno a capo



li $v0, 4		# seleziona print_string
la $a0, string27	# $a0 contiene l'indirizzo di string27		
syscall			# lancia print_string

li $v0, 1		# seleziona print_int
lw $a0, 8,($s3)		# $a0 contiene il voto di storia
syscall			# lancia print_int

jal f3			# salto alla procedura f3 per effettuare un ritorno a capo



li $v0, 4		# seleziona print_string
la $a0, string28	# $a0 contiene l'indirizzo di string28		
syscall			# lancia print_string

li $v0, 1		# seleziona print_int
lw $a0, 12,($s3)	# $a0 contiene il voto di economia
syscall			# lancia print_int

jal f3			# salto alla procedura f3 per effettuare un ritorno a capo



li $v0, 4		# seleziona print_string
la $a0, string29	# $a0 contiene l'indirizzo di string29		
syscall			# lancia print_string

li $v0, 1		# seleziona print_int
lw $a0, 16,($s3)	# $a0 contiene il voto di informatica
syscall			# lancia print_int

jal f3			# salto alla procedura f3 per effettuare un ritorno a capo



li $v0, 4		# seleziona print_string
la $a0, string30	# $a0 contiene l'indirizzo di string30		
syscall			# lancia print_string

li $v0, 1		# seleziona print_int
lw $a0, 20,($s3)	# $a0 contiene il voto di educazione fisica
syscall			# lancia print_int

jal f3			# salto alla procedura f3 per effettuare un ritorno a capo



li $v0, 4		# seleziona print_string
la $a0, string31	# $a0 contiene l'indirizzo di string31		
syscall			# lancia print_string

li $v0, 1		# seleziona print_int
lw $a0, 24,($s3)	# $a0 contiene il voto di diritto
syscall			# lancia print_int

jal f3			# salto alla procedura f3 per effettuare un ritorno a capo



li $v0, 4		# seleziona print_string
la $a0, string32	# $a0 contiene l'indirizzo di string32		
syscall			# lancia print_string

li $v0, 1		# seleziona print_int
lw $a0, 28,($s3)	# $a0 contiene il voto di geografia
syscall			# lancia print_int

jal f3			# salto alla procedura f3 per effettuare un ritorno a capo
jal f3			# salto alla procedura f3 per effettuare un ritorno a capo


li $v0, 4		# seleziona print_string
la $a0, string14	# $a0 contiene l'indirizzo di string14		
syscall			# lancia print_string

li $v0, 1		# seleziona print_int
add $a0, $zero, $s4	# $a0 contiene la media	
syscall			# lancia print_int

jal f3			# salto alla procedura f3 per effettuare un ritorno a capo


slt $t0,$s2,$s4		# assegna 1 a $t0 se la vecchia media e' minore di quella nuova
slt $t1,$s4,$s2		# assegna 1 a $t1 se la nuova media e' minore di quella vecchia 

beq $t0,$t1,uguale	# se $t0 e' uguale a $t1 quindi se la nuova media e' uguale a quella vecchia salta a "uguale"
beq $t0,$zero,peggiorato # se $t0 e' uguale a zero quindi se la nuova media e' inferiore salta a "peggiorato"
j migliorato		#salta a "migliorato" se non sei ne' peggiorato ne' rimasto costante

uguale:

li $v0, 4		# seleziona print_string
la $a0, string33	# $a0 contiene l'indirizzo di string33		
syscall			# lancia print_string
j exit11		# salta a exit11

peggiorato:

li $v0, 4		# seleziona print_string
la $a0, string16	# $a0 contiene l'indirizzo di string16		
syscall			# lancia print_string

sub $t0, $s2,$s4	

li $v0, 1		# seleziona print_int
add $a0, $zero, $t0	# $a0 contiene la differenza 
syscall			# lancia print_int

li $v0, 4		# seleziona print_string
la $a0, string17	# $a0 contiene l'indirizzo di string17		
syscall			# lancia print_string
j exit11		# salta a exit11

migliorato:

li $v0, 4		# seleziona print_string
la $a0, string15	# $a0 contiene l'indirizzo di string15		
syscall			# lancia print_string

sub $t0, $s4,$s2	
li $v0, 1		# seleziona print_int
add $a0, $zero, $t0	# $a0 contiene la differenza 
syscall			# lancia print_int

li $v0, 4		# seleziona print_string
la $a0, string17	# $a0 contiene l'indirizzo di string17		
syscall			# lancia print_string

exit11:


addi $a0, $zero, 8	# salvo in $a0 la dimensione dell'array
addi $a1, $s3, 0	# salvo in $a1 il base address dell'array

jal f5			# salta alla procedura f5 per calcolare il numero di materie insufficienti nell'array

addi $s5 ,$v0,0		# salva il numero di materie insufficienti in $s5

addi $t0,$s1,-5		# sottrai 5 alla classe e salva il risultato in $t0

beq $s5,$zero,noinsuff	# se non ci sono insufficienze quindi se il numero di debiti e' zero salta a "noinsuff"

li $v0, 4		# seleziona print_string
la $a0, string20	# $a0 contiene l'indirizzo di string20		
syscall			# lancia print_string


li $v0, 1		# seleziona print_int
add $a0, $zero, $s5	# $a0 contiene il numero di debiti
syscall			# lancia print_int

jal f3			# salto alla procedura f3 per effettuare un ritorno a capo 

beq $t0,$zero,quinta1	# se $t0 e' uguale a zero salta a quinta1
addi $t0,$zero,4	# salva 4 in $t0
slt $t1,$t0,$s5		# assegna 1 a $t1 se i debiti sono piu' di 4
bne $t1,$zero,bocciato	# se $t1 e' diverso da zero salta a "bocciato"

li $v0, 4		# seleziona print_string
la $a0, string23	# $a0 contiene l'indirizzo di string23		
syscall			# lancia print_string
j exit12		# salta a exit12

bocciato:

li $v0, 4		# seleziona print_string
la $a0, string21	# $a0 contiene l'indirizzo di string21		
syscall			# lancia print_string
j exit12		# salta a exit12

quinta1:

li $v0, 4		# seleziona print_string
la $a0, string22	# $a0 contiene l'indirizzo di string22		
syscall			# lancia print_string
j exit12		# salta a exit12

noinsuff:

beq $t0,$zero,quinta2	# salta a "quinta2" se $t0 e' zero cioe' sei in quinta e non hai debiti

li $v0, 4		# seleziona print_string
la $a0, string18	# $a0 contiene l'indirizzo di string18		
syscall			# lancia print_string
j exit12		# salta a exit12

quinta2:

li $v0, 4		# seleziona print_string
la $a0, string19	# $a0 contiene l'indirizzo di string19		
syscall			# lancia print_string

exit12:

lw $ra, 0($sp)		# salvo in $ra il contenuto dello stack
addi $sp,$sp,4		# tolgo lo spazio di 4 byte dentro lo stack 

jr $ra


#PROCEDURE

f1:
addi $v1,$zero,0  	# resetto contenuto di $v1 
li $v0, 5		# seleziona read_int
syscall			# lancia read_int
slt $t1, $v0, $a1	# assegna 1 in $t1 il voto e' minore di $a1
slt $t2, $zero, $v0	# assegna 1 in $t2 se zero e' minore del voto
bne $t1, $t2, saltaf1	# salta a "saltaf1" se il voto non e' compreso
addi $v1, $zero, 1	# salva 1 in $v1
saltaf1:
jr $ra			# ritorno alla procedura precedente

f2:
li $v0, 4		# seleziona print_string
la $a0, string24	# $a0 contiene l'indirizzo di string24		
syscall			# lancia print_string
jr $ra			# ritorno alla procedura precedente

f3:
li $v0, 4		# seleziona print_string
la $a0,stringa_new_line # $a0 contiene il ritorno a capo		
syscall			# lancia print_string
jr $ra			# ritorno alla procedura precedente

f4:
addi $sp, $sp, -8 			# creo uno spazio di 8 byte per 2 elementi nello stack
addi $t0, $a0, -1			# salvo in $t0, $a0-1
sw $t0, 0($sp)				# Salvo sullo dim-1
sw $ra, 4($sp)				# Salvo sullo stack $ra e dim-1
bne $a0, $zero, STEP_RICORSIVO 		# salto allo STEP_RICORSIVO se la dimensione dell'array non e' zero
li $v0, 0 				# Caso base: se array vuoto ritorna 0
addi $sp, $sp, 8 			# dealloco stack frame
jr $ra					# ritorno alla procedura chiamante

STEP_RICORSIVO:
move $a0, $t0 				# aggiorno secondo argomento
jal f4 					# chiamata ricorsiva

					# (ora in $v0 ho f4(arr, dim-1))
lw $t0, 0($sp) 				# ripristino dim-1
mul $t1, $t0, 4 			# lo moltiplico per 4 e lo metto in $t1
add $t1, $t1, $a1 			# indirizzo di arr[dim-1]
lw $t2, 0($t1) 				# t2 = arr[dim-1]
add $v0, $v0, $t2 			# $v0 = + f4(arr, dim-1) + arr[dim-1]
lw $ra, 4($sp) 				# ripristino $ra
addi $sp, $sp, 8 			# dealloco stack frame
jr $ra

f5:
addi $sp, $sp, -8 			# creo uno spazio di 8 byte per 2 elementi nello stack
addi $t0, $a0, -1			# salvo in $t0, $a0-1
sw $t0, 0($sp)				# Salvo sullo dim-1
sw $ra, 4($sp)				# Salvo sullo stack $ra e dim-1
bne $a0, $zero, STEP_RICORSIVO2 	# salto allo STEP_RICORSIVO2 se la dimensione dell'array non e' zero
li $v0, 0 				# Caso base: se array vuoto ritorna 0
addi $sp, $sp, 8 			# dealloco stack frame
addi $t4, $zero, 6			# salvo 6 in $t4
jr $ra					# ritorno alla procedura chiamante

STEP_RICORSIVO2:
move $a0, $t0 				# aggiorno secondo argomento
jal f5 					# chiamata ricorsiva

					# (ora in $v0 ho f5(arr, dim-1))
lw $t0, 0($sp) 				# ripristino dim-1
mul $t1, $t0, 4 			# lo moltiplico per 4 e lo metto in $t1
add $t1, $t1, $a1 			# indirizzo di arr[dim-1]
lw $t2, 0($t1) 				# t2 = arr[dim-1]
slt $t3,$t2,$t4				# assegna 1 a $t3 se il voto e' minore di 6 quindi insufficiente
beq $t3,$zero,salta			# salta l'incremento del contatore se il voro non e' insufficiente

addi $v0, $v0, 1 			# $v0 = + f5(arr, dim-1) + 1

salta:
lw $ra, 4($sp) 				# ripristino $ra
addi $sp, $sp, 8 			# dealloco stack frame
jr $ra

#FINE PROCEDURE