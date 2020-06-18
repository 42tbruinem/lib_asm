/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_lstsort.c                                     :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 19:38:57 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/18 19:40:05 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>

void	test_ft_list_sort(void)
{
	t_list	*head;
	size_t	size;

	head = NULL;
	ft_list_push_front(&head, "0");
	ft_list_push_front(&head, "22");
	ft_list_push_front(&head, "444");
	ft_list_push_front(&head, "4");
	printf("---LST_SORT---\n");
	size = ft_list_size(head);
	printf("before:\n");
	ft_list_print(head);
	ft_list_sort(&head, &ft_item_cmp);
	printf("after:\n");
	ft_list_print(head);
	printf("\n");
}
