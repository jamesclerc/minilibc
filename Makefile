##
## EPITECH PROJECT, 2018
## Makefile
## File description:
## Makefile
##

NAME		=	libasm.so

SRCS		=	src/strlen.asm	\
			src/strchr.asm	\
			src/strcmp.asm	\
			src/strncmp.asm	\
			src/rindex.asm	\
			src/memset.asm	\
			src/memcpy.asm	\
			src/memmove.asm	\
			src/strstr.asm

ASMFLAGS	=	-f elf64

LDFLAGS		=	-shared -fno-builtin

ASM		=	nasm

CC		=	ld

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
