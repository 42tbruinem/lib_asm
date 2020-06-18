/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_strlen.c                                      :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 19:43:11 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/18 19:43:19 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>

void	test_ft_strlen(void)
{
	char	str[] = "0123456789";
	int		out[2];
	int		version;

	version = REAL;
	printf("---STRLEN---\n");
	while (version < 2)
	{
		out[version] = (version == REAL) ? strlen(str) : ft_strlen(str);
		printf("%sSTR: %s | OUT: %d\n", vname(version), str, out[version]);
		version++;
	}
	write(1, "\n", 1);
}
