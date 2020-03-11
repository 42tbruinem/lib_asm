/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/03/09 11:22:10 by tbruinem       #+#    #+#                */
/*   Updated: 2020/03/11 19:12:31 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

static void	test_ft_read(void)
{
	int			fd;
	static char	buf[50];
	size_t		out;

	printf("READ\n");
	fd = open("readtest.txt", O_RDONLY);
	out = ft_read(fd, buf, 49);
	if ((int)out == -1)
		exit(1);
	printf("out: %ld | buf: %s\n", out, buf);
}

static void	test_ft_write(void)
{
	char	str[] = "Yeet\n";
	size_t	out;

	printf("WRITE\n");
	out = ft_write(1, str, strlen(str));
	if ((int)out == -1)
		exit(1);
	printf("out: %ld\n", out);
}

static void	test_ft_strlen(void)
{
	char	str[] = "0123456789";
	size_t	out;

	out = ft_strlen(str);
	printf("STRLEN\n");
	printf("out: %ld | str: %s\n", out, str);
}

static void	test_ft_strcpy(void)
{
	char	dest[] = "lalal";
	char	src[] = "grr";
	char	*ret;

	ret = NULL;
	printf("STRCPY\n");
	printf("before:\ndest: %s | src: %s | ret: %p\n", dest, src, ret);
	ret = ft_strcpy(dest, src);
	printf("after:\ndest: %s | src: %s | ret: %p\n", dest, src, ret);
}

static void	test_ft_strcmp(void)
{
	char	s1[] = "lalala";
	char	s2[] = "lalalb";
	int		out;

	printf("STRCMP\n");
	out = ft_strcmp(s1, s2);
	printf("out: %d\n", out);
}

static void	test_ft_strdup(void)
{
	char	str[] = "wkdfldf";
	char	*dup = NULL;

	printf("STRDUP\n");
	dup = ft_strdup(str);
	printf("dup: %s\n", dup);
}

static void	test_ft_list_push_front(void)
{
	t_list	*head;

	head = malloc(sizeof(t_list));
	if (!head)
		return ;
	printf("LST_PUSHFRONT\n");
	head->data = "oldhead";
	head->next = NULL;
	ft_list_push_front(&head, "head");
	printf("format: head->elem1 | strings: %s->%s\n", head->data, head->next->data);
}

static void	test_ft_list_size(void)
{
	t_list	*head;
	size_t	out;

	head = NULL;
	printf("LST_SIZE\n");
	ft_list_push_front(&head, "1");
	ft_list_push_front(&head, "2");
	ft_list_push_front(&head, "3");
	out = ft_list_size(head);
	printf("out: %ld\n", out);
}

static void	test_ft_strchr(void)
{
	char	str[] = "laalalglla";
	char	*ret;

	printf("STRCHR\n");
	ret = ft_strchr(str, 'g');
	printf("str: %s, chr: %c | ret: %s\n", str, 'g', ret);
}

static void	test_ft_atoi_base(void)
{
	char	str[] =  "-15";
	char	base[] = "0123456789";
	int		ret;

	ret = 0;
	printf("ATOI_BASE\n");
	ret = ft_atoi_base(str, base);
	printf("ret: %d\n", ret);
}

int		main(void)
{
	test_ft_write();
	test_ft_read();
	test_ft_strlen();
	test_ft_strcpy();
	test_ft_strcmp();
	test_ft_strdup();
	test_ft_list_push_front();
	test_ft_list_size();
	test_ft_strchr();
	test_ft_atoi_base();
	return (0);
}
