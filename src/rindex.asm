BITS 64

extern  strlen

GLOBAL  rindex:function

rindex:
    ENTER   0,0
    XOR     RBX, RBX
    call    strlen wrt ..plt

loo:
    CMP [RDI + RAX], RDI
    JZ  end
    CMP [RDI + RAX], RSI
    MOV RCX, [RDI + RAX]
    DEC RAX
    JMP loo

end:
    MOV RAX, RCX
    LEAVE
    RET
