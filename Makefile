##
## EPITECH PROJECT, 2018
## Makefile
## File description:
## Makefile
##

NAME		=	libasm.so

SRCS		=	src/strlen.asm	\
			src/strchr.asm	\
			src/strcmp.asm

ASMFLAGS	=	-f elf64

LDFLAGS		=	-shared -fno-builtin

ASM		=	nasm

CC		=	gcc

RM		=	rm -f

OBJS		=	$(SRCS:.asm=.o)

%.o: %.asm
		$(ASM) -o $@ $< $(ASMFLAGS)

all:		$(NAME)

$(NAME):	$(OBJS)
		$(CC) $(LDFLAGS) -o $(NAME) $(OBJS)

clean:
		rm -f $(OBJS)

fclean:		clean
		rm -f $(NAME)

re:		fclean all

.PHONY: all clean fclean re
