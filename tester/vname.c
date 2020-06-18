/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   vname.c                                            :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 18:05:39 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/18 18:05:48 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>

char	*vname(int version)
{
	const char	*names[] = {
		[REAL] = "REAL: ",
		[MINE] = "MINE: ",
	};

	return ((char *)names[version]);
}
