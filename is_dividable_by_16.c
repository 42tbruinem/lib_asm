/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   is_dividable_by_16.c                               :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/03/10 14:57:06 by tbruinem       #+#    #+#                */
/*   Updated: 2020/03/10 19:43:41 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

int		main(void)
{
	long long	num;
	int			mod;

	num = 140732828571896;
	mod = num % 16;
	printf("mod: %d\n", mod);
	return (0);
}
