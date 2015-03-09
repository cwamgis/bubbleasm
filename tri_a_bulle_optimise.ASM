;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; initialisation du tableau  a trier 5 1 4 2 8 9 3 7 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MOV 	AL,5 ; AL va servir de parametre tampon pour initialiser notre tableau
MOV 	[90],AL

MOV 	AL,1
MOV 	[91],AL

MOV 	AL,4
MOV 	[92],AL

MOV 	AL,2
MOV 	[93],AL

MOV 	AL,8
MOV 	[94],AL

MOV 	AL,9
MOV 	[95],AL

MOV 	AL,3
MOV 	[96],AL

MOV 	AL,7
MOV 	[97],AL

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; indice maximum ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Apres un parcours de tableau, le dernier element est forcement a sa place
; a chaque parcours de tableau, on va donc s arreter un element avant le parcours precedent
; on stocke l indice maximum courant dans [A1]
MOV	AL,97
MOV	[A1],AL

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; initialisation du parcours de tableau ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
iniIndice:
	MOV	CL,90 ; indice permettant de parcourir le tableau
	MOV 	AL,0 ; on stocke un flag permettant de savoir si on a commuté ou pas dans [A0]
	MOV	[A0],AL

; parcours du tableau et commutation eventuelle de deux elements successfis si le deuxieme est inferieur au premier
for:
	; critere d arret boucle
	CMP	CL,[A1] ; (CL - [A1])
	JNS	endfor ; (jump si CL -[A1] >= 0 )si le compteur est superieur ou egal [A1] on sort de la boucle (pq qu'on compare les elements deux a deux)

	MOV	AL,[CL] ; recuperation du premier element
	INC	CL

	MOV	BL,[CL] ; recuperation du deuxieme element

	CMP	AL,BL ; si le premier element est strictement superieur au deuxieme, alors on echange les deux
	JNS	echElts

	JMP	for


; echange des deux valeurs courantes
echElts:
	MOV 	DL,1 ; On passe le flag de commutation a 1
	MOV	[A0],DL

	MOV	[CL],AL ; on passe la premiere valeur dans l'emplacement superieur
	DEC	CL
	MOV	[CL],BL ; on passe la deuxieme valeur dans l'emplacement inferieur

	INC	CL
	JMP	for

endfor:

	; au cas ou on recommence, on decremente l indice maximum de parcours du tableau
	MOV	AL,[A1]
	DEC	AL
	MOV	[A1],AL

	; si il y a une commutation lors du parcours de tableau alors on recommence une autre fois
	MOV	AL,1
	MOV	BL,[A0]
	CMP	BL,AL
	JNS	iniIndice ; jmp si sign flag not set, c est a dire si BL - AL >= 0
	
	END

