/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_itoa_base.c                                   :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/03/12 12:12:31 by tbruinem       #+#    #+#                */
/*   Updated: 2020/03/12 12:13:18 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>

int		main(void)
{
	char	base[] = "0123456789";
	char	*ret;

	ret = ft_itoa_base(15, base);
	printf("ret: %s\n", ret);
	return (0);
}
