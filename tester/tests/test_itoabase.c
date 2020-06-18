/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_itoabase.c                                    :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 19:38:18 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/18 20:15:25 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>

void	test_ft_itoa_base(char *p1, char *p2)
{
	char	*base;
	char	*ret;
	int		num;

	num = (p1) ? (atoi(p1)) : -42;
	base = (p2) ? p2 : "0123456789";
	printf("---ITOA_BASE---\n");
	num = -42;
	ret = ft_itoa_base(num, base);
	printf("MINE: NUM: %d | BASE: %s | OUT: %s\n\n", num, base, ret);
}
