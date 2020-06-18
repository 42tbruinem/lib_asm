/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test_strchr.c                                      :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 19:39:48 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/18 19:39:57 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>

void	test_ft_strchr(void)
{
	char	str[] = "laalalglla";
	char	*ret;

	printf("---STRCHR---\n");
	ret = ft_strchr(str, 'g');
	printf("str: %s, chr: %c | ret: %s\n\n", str, 'g', ret);
}
