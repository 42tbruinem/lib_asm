/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   libasm.h                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/03/09 12:30:57 by tbruinem       #+#    #+#                */
/*   Updated: 2020/03/11 20:10:26 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <string.h>
# include <stdio.h>
# include <fcntl.h>
# include <unistd.h>
# include <stdlib.h>
# include <sys/stat.h>
# include <sys/types.h>

typedef struct	s_list
{
	void			*data;
	struct s_list	*next;
}				t_list;

int		ft_item_cmp(void *item1, void *item2);
void	ft_list_sort(t_list **begin, int (*cmp)());
void	ft_list_print(t_list *head);

size_t	ft_write(int fd, void *buf, size_t size);
size_t	ft_read(int fd, void *buf, size_t size);
size_t	ft_strlen(char *str);
char	*ft_strcpy(char *dest, char *src);
int		ft_strcmp(char *s1, char *s2);
char	*ft_strdup(char *str);
char	*ft_strchr(char *str, char c);
void	ft_list_push_front(t_list **head, void *data);
size_t	ft_list_size(t_list *begin);
int		ft_atoi_base(char *str, char *base);

#endif
