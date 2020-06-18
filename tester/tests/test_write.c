/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_write.c                                       :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 19:43:33 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/18 19:43:43 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>

void	test_ft_write(void)
{
	char	str[] = "Yeet";
	int		version;
	int		out[2];

	version = REAL;
	printf("---WRITE---\n");
	while (version < 2)
	{
		write(1, vname(version), ft_strlen(vname(version)));
		out[version] = (version == REAL) ?
			write(1, str, strlen(str)) : ft_write(1, str, strlen(str));
		printf(" | OUT: %d | ERRNO: %d\n", out[version], errno);
		version++;
	}
	write(1, "\n", 1);
}
