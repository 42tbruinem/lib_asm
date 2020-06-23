/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_lstsize.c                                     :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 19:40:32 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/23 21:01:14 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>
#include <tester.h>

static int	numsize(int num)
{
	int size;

	size = (num >= 0) ? 0 : 1;
	num = (num >= 0) ? num : -num;
	while (num)
	{
		num /= 10;
		size++;
	}
	return (size);
}

static void	numfill(char *new, int num, int size)
{
	while (size >= 0)
	{
		new[size] = (num % 10) + '0';
		num /= 10;
		size--;
	}
}

static char	*itoa(int num)
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

static char	*strjoin(char *s1, char *s2)
{
	char	*new;

	new = malloc(sizeof(char) * (strlen(s1) + strlen(s2) + 1));
	strcpy(new, s1);
	strcat(new, s2);
	free(s2);
	return (new);
}

void	test_ft_list_size(char *p1)
{
	t_list	*head;
	size_t	out;
	int		size;
	int		i;

	i = 0;
	size = (p1) ? atoi(p1) : 0;
	head = NULL;
	printf("---LST_SIZE---\n");
	while (i < size)
	{
		ft_list_push_front(&head, strjoin("LIST-", itoa(i + 1)));
		i++;
	}
	ft_list_print(head);
	out = ft_list_size(head);
	printf("OUT: %ld\n\n", out);
}
