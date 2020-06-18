/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_strcpy.c                                      :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 19:42:16 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/18 19:42:22 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>

void	test_ft_strcpy(void)
{

	char	*dest[2];
	char	*src[2];
	char	*ret[2];
	int		version;

	dest[REAL] = strdup("lalal");
	dest[MINE] = strdup("lalal");
	src[REAL] = strdup("grr");
	src[MINE] = strdup("grr");
	printf("---STRCPY---\n");
	version = REAL;
	while (version < 2)
	{
		ret[version] = NULL;
		printf("%sBEFORE: DEST: %s | SRC: %s | OUT: %p\n", vname(version), dest[version], src[version], ret[version]);
		ret[version] = (version == REAL) ? strcpy(dest[version], src[version]) : ft_strcpy(dest[version], src[version]);
		printf("%sAFTER: DEST: %s | SRC: %s | OUT: %p\n", vname(version), dest[version], src[version], ret[version]);
		write(1, "\n", 1);
		version++;
	}
	free(src[MINE]);
	free(src[REAL]);
	free(dest[MINE]);
	free(dest[REAL]);
}
