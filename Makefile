##
## EPITECH PROJECT, 2018
## ASM
## File description:
## ASM
##

CC	=	gcc

ASM	=	nasm

TEST	=	test

ASM_FOLDER	=	./asm/

NAME	=	libasm.so

SRC	=	strcmp.asm	\
		strncmp.asm	\
		strcasecmp.asm	\
		strlen.asm	\
		strpbrk.asm	\
		strcspn.asm	\
		rindex.asm	\
		memset.asm	\
		memcpy.asm	\
		strstr.asm	\
		memmove.asm	\
		strchr.asm

OBJ	=	$(addprefix $(ASM_FOLDER), $(SRC:.asm=.o))

%.o: %.asm
	$(ASM) -f elf64 $< -o $@

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) -shared -o $(NAME) $(OBJ)

test: re
	$(CC) -o $(TEST) -g main.c $(OBJ)
clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)
	rm -f $(TEST)

re:	fclean all

.PHONY: all clean fclean re
