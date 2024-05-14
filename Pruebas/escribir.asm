# Zona de d a t o s
2 . d a t a 0 x10010000
3 l o n g : .word 7 # Tamano d e l b u f f e r ˜
4 b u f f e r : . s p a c e 7 # B u f f e r donde s e alm ace n a n l o s
5 # c a r a c t e r e s que s e p ul s a n ´
6
7 # Zona de i n s t r u c c i o n e s
8 . t e x t
9 main : l u i $a1 , 0 x f f f f # $a1 <? 0 x f f f f 0 0 0 0
10 # ( d i r b a s e de l o s r e g i s t r o s de E / S )
11 l a $a0 , b u f f e r # Carga l a d i r e c c i o n d e l b u f f e r ´
12 lw $v0 , l o n g ( $0 ) # Carga l a l o n g i t u d d e l b u f f e r
13 addi $v0, $v0, 1
14 c t r : # [ En bl a nc o , p o r a h o r a ]
15 # [ En bl a nc o , p o r a h o r a ]
16 # [ En bl a nc o , p o r a h o r a ]
17 l b $s0 , 4 ( $a1 ) # Lee d e l p u e r t o d e l t e c l a d o
18 sb $s0 , 0 ( $a0 ) # Almacena e l d at o en e l b u f f e r
19 addi $a0 , $a0 , 1 # I n c r e m e nt a e l p u nt e r o d e l b u f f e r
20 addi $v0 , $v0 , ?1 # D e c r . e l tamano d e l b u f f e r ˜
21 bne $v0 , $0 , c t r # ¿Se ha l l e n a d o e l b u f f e r ?
22 f i n : l i $s0 , 0 x00
23 sb $s0 , 0 ( $a0 ) # Almacena f i n de c a de n a en b u f f e r
24
25 l i $v0 , 1 0 # F i n a l i z a l a e j e c u c i o n´
26 s y s c a l l