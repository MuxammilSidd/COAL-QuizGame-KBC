include irvine32.inc

.data

enterchoiceText byte "Enter your choice",0
questions byte "King",0,"Hee Hee Haa Haa Hoo Hoo",0, "Skibidi boop boop",0 ,"Little Endian",0 ,"Big Endian",0,"Yellow Flash",0,"Tusnade",0

options byte "A) shafique Rehman B) Khusro c) Jamil D) Humayun ki janeman",0
		byte "A) shafique Rehman B) Khusro c) Jamil D) Humayun ki janeman",0
		byte "A) shafique Rehman B) Khusro c) Jamil D) Humayun ki janeman",0
		byte "A) shafique Rehman B) Khusro c) Jamil D) Humayun ki janeman",0
		byte "A) shafique Rehman B) Khusro c) Manmohan D) Humayun ki janeman",0
		byte "A) Minato Namikaze B) Khusro c) Jamil D) Humayun ki janeman",0
		byte "A) shafique Rehman B) Khusro c) Jamil D) 106",0

answers byte 'a','b','c','d','c','a','d'
;answers byte "shafique Rehman",0,"Khusro",0, "Jamil",0, "Humayun ki janeman" ,0, "Manmohan",0,"Minato namikaze",0,"106",0


index byte 0

input byte 0


.code
main proc

call getrandom				;will return eax

; finding and printing Question

mov edx,offset questions
call findQuestionOffset
mov eax,edx
call writehex
call crlf
call writestring
call crlf
call crlf



; printing options 

mov edx,offset options

movzx eax, index			;index will be stored when getrandom functiion will be called
call findQuestionOffset
mov eax,edx
call writehex
call crlf
call writestring
call crlf
call crlf



; Taking answer from user

;mov edx,offset input
;mov ecx,30
;call readstring
;call crlf
;call crlf

call readchar
mov input,al
call writechar
call crlf
call crlf



; Finding the correct answer and printing for debugging

;movzx eax, index			;index will be stored when getrandom functiion will be called
;mov edx, offset answers
;call findquestionoffset
;mov eax,edx
;call writehex
;call crlf
;call writestring

movzx ebx,index
dec ebx
movzx eax,answers[ebx]
call writechar
call crlf
call crlf




; comparision
;mov eax,index
;mov esi,answer
;cmp byte ptr [esi+eax], input
;jz msgbox




exit
main endp


findQuestionOffset proc
	mov ecx,0
	dec edx					; values adjusted set according to loop

findQuestionOffsetCode:
	inc ecx
	inc edx			
	cmp ecx,eax						; eax will contain the index given by
	jz findQuestionOffsetExit

findQuestionOffsetInc:
	inc edx
	cmp byte ptr [edx],0
	je findQuestionOffsetCode
	jmp findQuestionOffsetInc

		
findQuestionOffsetExit:
	ret
findQuestionOffset endp







getrandom proc
	call randomize
	mov eax,6
	call randomrange
	inc eax				;to convert into mathematical notation; 1 base index
	mov index, al
	ret
getrandom endp



comment !
findSumOfString proc:
	;esi will have offset of word
	mov eax,0
	findSumOfStringCode
		add eax,[esi]
		inc esi

	cmp [esi],0
	jnz findSumOfStringCode
	ret

findSumOfString endp


toUpper proc
				; we will have the character index in ecx and offset in esi

	cmp byte ptr [esi+ecx],' '
	jz lowercase

	cmp byte ptr [esi+ecx],'a'
	js lowercase
	cmp byte ptr [esi+ecx],'z'
	jns lowercase

	sub byte ptr [esi+ecx],32

	lowercase:
	ret
toUpper endp
!


end main