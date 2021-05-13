.eqv MONITOR_SCREEN 0x10010000 	#Dia chi bat dau cua bo nho man hinh
.eqv RED 0x00FF0000 		#Cac gia tri mau thuong su dung
.eqv GREEN 0x0000FF00
.eqv BLACK 0x000000
.eqv BLUE 0x000000FF
.eqv WHITE 0x00FFFFFF
.eqv YELLOW 0x00FFFF00
.text
	li 	$k0, MONITOR_SCREEN 	#Nap dia chi bat dau cua man hinh
	li 	$t0, BLACK
	sw 	$t0, 0($k0)
	nop
	li 	$t0, RED
	sw 	$t0, 4($k0)
	nop
	li 	$t0, RED
	sw 	$t0, 8($k0)
	nop
	
	li 	$t0, RED
	sw 	$t0, 16($k0)
	nop
	
	li 	$t0, RED
	sw 	$t0, 20($k0)
	nop
	li 	$t0, RED
	sw 	$t0, 32($k0)
	nop
	
	li 	$t0, RED
	sw 	$t0, 44($k0)
	nop
	
	li 	$t0, RED
	sw 	$t0, 56($k0)
	nop
	
	li 	$t0, RED
	sw 	$t0, 64($k0)
	nop
	
	li 	$t0, RED
	sw 	$t0, 88($k0)
	nop
	
	li 	$t0, RED
	sw 	$t0, 100($k0)
	nop
	
	li 	$t0, RED
	sw 	$t0, 116($k0)
	nop
	
	li 	$t0, RED
	sw 	$t0, 136($k0)
	nop
	
	li 	$t0, RED
	sw 	$t0, 144($k0)
	nop
	
	li 	$t0, RED
	sw 	$t0, 172($k0)
	nop
	
	li $t0, RED
	lb $t0, 42($k0)
	nop