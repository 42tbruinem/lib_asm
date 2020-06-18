/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_atoibase.c                                    :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 19:39:20 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/18 20:22:47 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>

void	test_ft_atoi_base(char *p1, char *p2)
{
	char	*str;
	char	*base;
	int		ret;

	str = (p1) ? p1 : "123";
	if (p1 && strcmp(p1, "NULL") == 0)
		str = NULL;
	base = (p2) ? p2 : "0123456789";
	if (p2 && strcmp(p2, "NULL") == 0)
		base = NULL;
	ret = 0;
	printf("---ATOI_BASE---\n");
	ret = ft_atoi_base(str, base);
	printf("MINE: STR: %s | BASE: %s | OUT: %d\n\n", str, base, ret);
}
