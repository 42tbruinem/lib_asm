# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: tbruinem <tbruinem@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/09 13:01:31 by tbruinem       #+#    #+#                 #
#    Updated: 2020/03/13 01:25:03 by tbruinem      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

OS = $(shell uname)
NAME = libasm.a
SRC =	ft_write.s \
		ft_read.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_strdup.s \
		ft_list_push_front_bonus.s \
		ft_list_size_bonus.s \
		ft_list_sort_bonus.s \
		ft_strchr_bonus.s \
		ft_atoi_base_bonus.s \
		ft_itoa_base_bonus.s \
		ft_strlen.s
C_FLAGS = -Wall -Wextra -Werror

ifeq ($(OS),Linux) 
S_FLAGS := -felf64
else
S_FLAGS := -fmacho64
endif

ifdef DEBUG
	FLAGS += -g -fsanitize=address
endif
OBJ = $(SRC:%.s=%.o)

all: $(NAME)

%.o: %.s
	nasm $(S_FLAGS) $< -o $@

$(NAME): $(OBJ)
	ar -rcs $(NAME) $^

clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(NAME)

re: fclean all
