### Segmento de datos
.data   
	.globl  cadena1
introduccion:   
	.asciiz  "Práctica 1 -> Torres de Hanoi\n"
cadena1:    
	.asciiz   "(%d) Mueve un disco del palo %d al palo %d \n"
	
### Segmento de texto (programa)
.text                       # Comienzo de seccion de codigo de usuario
                   # Alineamiento en formato palabra (multiplo de 4)
.globl main                 # La etiqueta "main" se hace conocida a nivel global

main:   
	la  a0, 6 
	lw $t2, ($a0)
	           # Num. de discos        
	li   a1, 1          # Palo de inicio (donde estan los discos)  
	li   a2, 2          # Palo auxiliar (vacío)        
	li   a3, 3          # Palo destino (adonde deberían acabar los discos)        
	li   t7, 0        
	jal  TdeH        
	j    _exit          # Saltamos a la rutina de salida para terminar
               		    # Final de la seccion "main"

##      Procedimiento de las Torres de Hanoi 
TdeH:   addi sp, sp, -20    # Hace hueco en la pila para 5 elementos        
	sw   ra, 16(sp)     # Guarda la dirección de llamada arriba de la pila        
	sw   a0,  0(sp)     # Guarda el num. de discos        
	sw   a1,  4(sp)     # Guarda origen        
	sw   a2,  8(sp)     # Guarda destino        
	sw   a3, 12(sp)     # Guarda auxiliar        
	slt  t1, a0, 1      # Inicializa t1=1 si a0 < 1, en otro caso, t1=0
	bne  t1, 1, Recursion	#Salta a recursión si t1 ? 1      
	j ending	    #Salta a ending
Recursion:	        
	lw      a0, 0(sp)       # Recuperamos los valores de la pila        
	lw      a1, 4(sp)        
	lw      a2, 12(sp)      # Intercambiamos el de enmedio con el final         
	lw      a3, 8(sp)        
	add     a0, a0, -1      # Disminuye en uno el número de discos                                 
				# que verá la función llamada        
	jal TdeH
	        
	addi    t7, t7, 1        
	la      a0, cadena1     # indicamos la cadena y aprovechamos                                
				# los otros argumentos        
	move    a1, t7        
	lw      a2, 4(sp)        
	lw      a3, 12(sp)        
	jal   printf            # llama a printf que está en la libreria I/O          
	lw      a0, 0(sp)       # Recuperamos los valores de la pila        
	lw      a3, 12(s  p)        
	lw      a1, 8(sp)       # Intercambiamos el primero con el de enmedio         
	lw      a2, 4(sp)        
	sub     a0, a0, 1       # Disminuye en uno el número de discos                                 
				# que verá la función llamada        
	jal TdeH
ending:         
	
	lw      a0, 0(sp)       # carga de vuelta el num. de discos en a0        
	lw      a1, 4(sp)       # E igualmente deshace la operación con el resto         
	lw      a2, 8(sp)       # de los registros        
	lw      a3, 12(sp)       
	lw      ra, 16(sp)            
	addi sp, sp, 20         # Vuelve a colocar el puntero de pila         
	jr ra