/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_test.c                                          :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/03/11 17:24:50 by tbruinem       #+#    #+#                */
/*   Updated: 2020/03/11 17:26:33 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

size_t	ft_strnlen(char *str, size_t n);

int		main(void)
{
	char	str[] = "0123456";
	size_t	n;
	size_t	ret;

	n = 5;
	ret = ft_strnlen(str, n);
	printf("%s | ret: %ld\n", str, ret);
	return (0);
}
