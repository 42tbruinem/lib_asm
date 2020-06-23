/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_strcmp.c                                      :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 19:41:50 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/23 17:18:28 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>
#include <tester.h>

void	test_ft_strcmp(char *p1, char *p2)
{
	char	*s1 = "lala";
	char	*s2 = "lalb";
	int		out[2];
	int		version;

	version = REAL;
	printf("---STRCMP---\n");
	while (version < 2)
	{
		out[version] = (version == REAL) ? strcmp(s1, s2) : ft_strcmp(s1, s2);
		printf("%sSTR1: %s | STR2: %s | OUT: %d\n", vname(version), s1, s2, out[version]);
		version++;
	}
	write(1, "\n", 1);
}
