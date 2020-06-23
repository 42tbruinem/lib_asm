/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_read.c                                        :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 19:43:57 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/23 22:35:01 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>
#include <tester.h>

void	test_ft_read(char *p1)
{
	int			fd;
	static char	buf[2][50];
	int			out[2];
	int			version;
	char		*filename;

	filename = (p1) ? p1 : "readtest.txt";
	printf("---READ---\n");
	version = REAL;
	while (version < 2)
	{
		fd = open(filename, O_RDONLY);
		if (fd == -1 || (read(fd, (void *)0, 0) == -1))
		{
			printf("Not a valid file descriptor.\n");	
			return ;
		}
		write(1, vname(version), ft_strlen(vname(version)));
		out[version] = (version == REAL) ?
			read(fd, buf[version], 49) : ft_read(fd, buf[version], 49);
		printf("STR: %s | OUT: %d | ERRNO: %d\n", buf[version], out[version], errno);
		version++;
		close(fd);
	}
	write(1, "\n", 1);
}
