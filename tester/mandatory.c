/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   mandatory.c                                        :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 18:02:35 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/18 18:04:44 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <errno.h>

void	mandatory(void)
{
	printf("~~~~MANDATORY FUNCTIONS~~~~\n\n");
	test_ft_write();
	test_ft_read();
	test_ft_strlen();
	test_ft_strcpy();
	test_ft_strcmp();
	test_ft_strdup();
}
