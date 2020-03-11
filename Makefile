# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: tbruinem <tbruinem@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/09 13:01:31 by tbruinem       #+#    #+#                 #
#    Updated: 2020/03/11 20:10:16 by tbruinem      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libtest
SRC =	ft_write.s \
		ft_read.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_strdup.s \
		ft_list_push_front_bonus.s \
		ft_list_size_bonus.s \
		ft_strchr_bonus.s \
		ft_atoi_base_bonus.s \
		ft_strlen.s
FLAGS = -Wall -Wextra -Werror
ifdef DEBUG
	FLAGS += -g -fsanitize=address
endif
OBJ = $(SRC:%.s=%.o)

all: $(NAME)

%.o: %.s
	nasm -fmacho64 -g $< -o $@

$(NAME): $(OBJ)
	$(CC) $(FLAGS) ft_list_sort.c ft_list_print.c main.c $^ -o $(NAME)

clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(NAME)

re: fclean all
