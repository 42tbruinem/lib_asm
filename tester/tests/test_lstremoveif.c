/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_lstremoveif.c                                 :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 19:37:34 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/18 19:40:10 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>

void	test_ft_list_remove_if(void)
{
	t_list	*head = NULL;

	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "list");
	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "list");
	ft_list_push_front(&head, "list");
	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "list");
	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "list");
	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "list");
	printf("LIST_REMOVE_IF\n");
	ft_list_print(head);
	ft_list_remove_if(&head, "DELETE_ME", &ft_strcmp);
	ft_list_print(head);
	printf("\n");
}
