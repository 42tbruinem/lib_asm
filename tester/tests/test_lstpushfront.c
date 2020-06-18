/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_lstpushfront.c                                :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 19:41:06 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/18 20:23:58 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>

void	test_ft_list_push_front(void)
{
	t_list	*head;

	head = malloc(sizeof(t_list));
	if (!head)
		return ;
	printf("---LST_PUSHFRONT---\n");
	head->data = "oldhead";
	head->next = NULL;
	ft_list_push_front(&head, "head");
	printf("format: head->elem1\n");
	ft_list_print(head);
	free(head);
	printf("\n");
}
