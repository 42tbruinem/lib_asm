/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_lstsort.c                                     :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 19:38:57 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/24 00:08:28 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>
#include <tester.h>
#include <time.h>
#include <stdlib.h>

int			numsize(int num)
{
	int size;

	size = (num > 0) ? 0 : 1;
	num = (num >= 0) ? num : -num;
	while (num)
	{
		num /= 10;
		size++;
	}
	return (size);
}

void		numfill(char *new, int num, int size)
{
	while (size >= 0)
	{
		new[size] = (num % 10) + '0';
		num /= 10;
		size--;
	}
}

char		*itoa(int num)
{
	int		size;
	char	*new;

	size = numsize(num);
	new = malloc(sizeof(char) * (size + 1));
	new[size] = 0;
	numfill(new, (num >= 0) ? num : -num, size - 1);
	if (num < 0)
		new[0] = '-';
	return (new);
}

int			exists(t_list *head, char *str)
{
	while (head)
	{
		if (strcmp(str, (char *)head->data) == 0)
			return (1);
		head = head->next;
	}
	return (0);
}

void		cleanup(t_list *head)
{
	t_list *del;

	while (head)
	{
		del = head;
		head = head->next;
		free(del->data);
		free(del);
	}
}

int			numcmp(char *s1, char *s2)
{
	int ret;

	ret = atoi(s1) - atoi(s2);
	if (ret > 0)
		ret = 1;
	else if (ret < 0)
		ret = 0;
	return (ret);
}

void		test_ft_list_sort(char *p1)
{
	t_list	*head = NULL;
	size_t	size;
	char	*str;
	size_t	stuck;
	size_t	i;

	stuck = 0;
	size = (p1) ? atoi(p1) : 5;
	i = 0;
	while (i < size)
	{
		srand(time(NULL) + stuck);
		str = itoa(rand() % (size));
		while (exists(head, str))
		{
			free(str);
			srand(time(NULL));
			str = itoa(rand() % (size));
			stuck++;
		}
		ft_list_push_front(&head, str);
		i++;
	}
	printf("---LST_SORT---\n");
	printf("BEFORE:\n");
	ft_list_print(head);
	ft_list_sort(&head, &numcmp);
	printf("AFTER:\n");
	ft_list_print(head);
	cleanup(head);
	printf("\n");
}
