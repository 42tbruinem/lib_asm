/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   write_test.c                                       :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/03/13 10:12:42 by tbruinem       #+#    #+#                */
/*   Updated: 2020/03/13 10:13:44 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

int		main(void)
{
	char	str[] = "write me!\n";

	ft_write(1, str, 10);
	return (0);
}
