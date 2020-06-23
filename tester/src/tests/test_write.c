/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_write.c                                       :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 19:43:33 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/23 17:15:57 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>
#include <tester.h>

void	test_ft_write(char *p1)
{
	char	*str;
	int		version;
	int		out[2];

	str = (p1) ? p1 : "Yeet";
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
