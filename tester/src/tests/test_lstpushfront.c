/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_lstpushfront.c                                :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 19:41:06 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/23 19:39:05 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>
#include <tester.h>

void	test_ft_list_push_front(char *p1)
{
	t_list	*head;

	printf("---LST_PUSHFRONT---\n");
	head = NULL;
	ft_list_push_front(&head, (void *)p1);
	ft_list_print(head);
	free(head);
	printf("\n");
}
