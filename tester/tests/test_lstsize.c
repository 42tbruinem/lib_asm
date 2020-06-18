/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_lstsize.c                                     :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 19:40:32 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/18 19:40:44 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>

void	test_ft_list_size(void)
{
	t_list	*head;
	size_t	out;

	head = NULL;
	printf("---LST_SIZE---\n");
	ft_list_push_front(&head, "list1");
	ft_list_push_front(&head, "list2");
	ft_list_push_front(&head, "list3");
	ft_list_print(head);
	out = ft_list_size(head);
	printf("out: %ld\n\n", out);
}
