data segment
    
    str1 db "Enter First Number $"
    str2 db "Enter second Number$"
    
    str3 db "First number: $"
    str4 db "Second number:$" 
    
    instr1 db 20 dup("$")
    instr2 db 20 dup("$")
    
    newline db 10,13, "$"
    
    n db ?
    s db ?
    
    msg1 db "Both are same$"
    msg2 db "Both are different$"
    
data ends

code segment
    assume ds:data cs:code

Start:
    
     mov ax,@data
     mov ds,ax
     
     lea si,instr1
     lea di,instr2
     
     ;get string 
      MOV AH,09H
      LEA DX,STR1
      INT 21H

      MOV AH,0AH;get ine function
      MOV DX,SI
      INT 21H


      MOV AH,09H
      LEA DX,NEWLINE
      INT 21H

      MOV AH,09H
      LEA DX,STR2
      INT 21H

      MOV AH,0AH
      MOV DX,DI
      INT 21H


      MOV AH,09H
      LEA DX,NEWLINE
      INT 21H
              
    ;PRINT THE STRING

        MOV AH,09H
        LEA DX,STR3
        INT 21H

        MOV AH,09H
        LEA DX,INSTR1+2
        INT 21H

        MOV AH,09H
        LEA DX,NEWLINE
        INT 21H

        MOV AH,09H
        LEA DX,STR4
        INT 21H

        MOV AH,09H
        LEA DX,INSTR2+2
        INT 21H

        MOV AH,09H
        LEA DX,NEWLINE
        INT 21H  
        
;STRING COMPARISION
        MOV BX,00

        MOV BL,INSTR1+1
        MOV BH,INSTR2+1

        CMP BL,BH
        JNE L1

        ADD SI,2
        ADD DI,2

      L2:MOV BL,BYTE PTR[SI]
        CMP BYTE PTR[DI],BL
        JNE L1
        INC SI
        INC DI
        CMP BYTE PTR[DI],"$"
        JNE L2

        MOV AH,09H
        LEA DX,MSG1
        INT 21H

        JMP L5

      L1:MOV AH,09H
        LEA DX,MSG2
        INT 21H



     L5:
        MOV AH,09H
        LEA DX,NEWLINE
        INT 21H

        MOV AH,4CH
        INT 21H


CODE ENDS
END START
     

