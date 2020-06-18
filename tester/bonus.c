/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   bonus.c                                            :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 18:06:34 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/18 18:07:24 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>

void		bonus(void)
{
	printf("~~~~BONUS FUNCTIONS~~~~\n\n");
	test_ft_list_push_front();
	test_ft_list_size();
	test_ft_strchr();
	test_ft_atoi_base();
	test_ft_itoa_base();
	test_ft_list_sort();
	test_ft_list_remove_if();
}
