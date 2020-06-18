make re
gcc -L . -lasm main.c ft_list_print.c -g -fsanitize=address
./a.out