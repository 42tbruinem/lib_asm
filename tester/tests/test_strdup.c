/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_strdup.c                                      :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 19:41:28 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/18 19:41:36 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>

void	test_ft_strdup(void)
{
	char	str[] = "wkdfldf";
	char	*dup = NULL;
	int		version;

	version = REAL;
	printf("---STRDUP---\n");
	while (version < 2)
	{
		dup = (version == REAL) ? strdup(str) : ft_strdup(str);
		printf("%sSTR: %s | DUP: %s\n", vname(version), str, dup);
		free(dup);
		dup = NULL;
		version++;
	}
	write(1, "\n", 1);
}
