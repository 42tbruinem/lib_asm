/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_list_sort.c                                     :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/03/11 19:39:41 by tbruinem       #+#    #+#                */
/*   Updated: 2020/03/11 21:06:29 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include "libasm.h"

int		ft_item_cmp(void *item1, void *item2)
{
	size_t	len1;
	size_t	len2;

	len1 = ft_strlen((char *)item1);
	len2 = ft_strlen((char *)item2);
//	printf("len1: %ld | len2: %ld\n", len1, len2);
	if (len1 > len2)
		return (1);
	return (0);
}

void	ft_list_addfront(t_list **begin, t_list *add)
{
	add->next = *begin;
	*begin = add;
}

void	ft_list_skip(t_list **list, size_t iter)
{
	size_t	i;

	i = 0;
	while (i < iter && (*list)->next)
	{
		*list = (*list)->next;
		i++;
	}
}

void	ft_list_sort(t_list **begin, int (*cmp)(void *item1, void *item2))
{
	size_t	len;
	size_t	i;
	t_list	*highest;
	t_list	*highest_prev;
	t_list	*iter;

	len = ft_list_size(*begin);
	printf("LEN: %ld\n", len);
	i = 0;
	while (i < len)
	{
		iter = *begin;
		ft_list_skip(&iter, i);
		highest = iter;
		while (iter && iter->next)
		{
			if (cmp(iter->next->data, highest->data))
			{
				highest = iter->next;
				highest_prev = iter;
			}
			iter = iter->next;
		}
		if (highest != *begin)
		{
			highest_prev->next = highest->next;
			ft_list_addfront(begin, highest);
		}
		i++;
	}
}
