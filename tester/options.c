/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   options.c                                          :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/18 18:56:57 by tbruinem      #+#    #+#                 */
/*   Updated: 2020/06/18 20:09:48 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>
#include <ctype.h>

void		strtolower(char *str)
{
	int	i;

	i = 0;
	while (str[i])
	{
		str[i] = tolower(str[i]);
		i++;
	}
}

static int	str2cmp(char **str2, char *str)
{
	int	i;

	i = 0;
	while (str2[i])
	{
		if (strcmp(str2[i], str) == 0)
			return (i);
		i++;
	}
	return (-1);
}

int			isfunct(char *str, char **options)
{
	char	*funct;
	int		option;

	funct = malloc(strlen(str) + 3 + 1);
	strcpy(funct, "ft_");
	strcat(funct, str);
	option = str2cmp(options, funct);
	free(funct);
	return (option);
}

void		run_funct(int *i, int option, char **args, char **options)
{
	char	*params[2];

	params[0] = (args[*i + 1] && isfunct(args[*i + 1], options) == -1) ? args[*i + 1] : NULL;
	params[1] = (args[*i + 1] && args[*i + 2] && isfunct(args[*i + 2], options) == -1) ? args[*i + 2] : NULL;
	if (option == STRCMP)
	{
		test_ft_strcmp(params[0], params[1]);
		*i += 1 + ((params[0]) ? 1 : 0) + ((params[1] ? 1 : 0));
	}
	if (option == STRLEN)
	{
		test_ft_strlen(params[0]);
		*i += 1 + ((params[0]) ? 1 : 0);
	}
	if (option == STRCPY)
	{
		test_ft_strcpy(params[0], params[1]);
		*i += 1 + ((params[0]) ? 1 : 0) + ((params[1] ? 1 : 0));
	}
	if (option == STRCHR)
	{
		test_ft_strchr(params[0], params[1]);
		*i += 1 + ((params[0]) ? 1 : 0) + ((params[1] ? 1 : 0));
	}
	if (option == STRDUP)
	{
		test_ft_strdup(params[0]);
		*i += 1 + ((params[0]) ? 1 : 0);
	}
	if (option == READ)
	{
		test_ft_read(params[0]);
		*i += 1 + ((params[0]) ? 1 : 0);
	}
	if (option == WRITE)
	{
		test_ft_write(params[0]);
		*i += 1 + ((params[0]) ? 1 : 0);
	}
	if (option == LSTSORT)
	{
		test_ft_list_sort(params[0]);
		*i += 1 + ((params[0]) ? 1 : 0);
	}
	if (options == LSTSIZE)
	{
		test_ft_list_size(params[0]);
		*i += 1 + ((params[0]) ? 1 : 0);
	}
	if (options == LSTPUSHFRONT)
	{
		test_ft_list_push_front(params[0]);
		*i += 1 + ((params[0]) ? 1 : 0);
	}
	if (options == LSTREMOVEIF)
	{
		test_ft_list_remove_if(params[0]);
		*i += 1 + ((params[0]) ? 1 : 0);
	}
	if (options == ITOABASE)
	{
		test_ft_itoa_base(params[0], params[1]);
		*i += 1 + ((params[0]) ? 1 : 0) + ((params[1] ? 1 : 0));
	}
	if (options == ATOIBASE)
	{
		test_ft_itoa_base(params[0], params[1]);
		*i += 1 + ((params[0]) ? 1 : 0) + ((params[1] ? 1 : 0));
	}
}

int			options(int argc, char **args)
{
	const char	*options[] = {
		[ALL] = "all",
		[MANDATORY] = "mandatory",
		[BONUS] = "bonus",
		[STRLEN] = "ft_strlen",
		[STRCPY] = "ft_strcpy",
		[STRCMP] = "ft_strcmp",
		[STRCHR] = "ft_strchr",
		[STRDUP] = "ft_strdup",
		[READ] = "ft_read",
		[WRITE] = "ft_write",
		[LSTPUSHFRONT] = "ft_list_push_front",
		[LSTREMOVEIF] = "ft_list_remove_if",
		[LSTSIZE] = "ft_list_size",
		[LSTSORT] = "ft_list_sort",
		[ATOIBASE] = "ft_atoi_base",
		[ITOABASE] = "ft_itoa_base",
	};
	char		*str;
	int			option;
	int			i;

	i = 0;
	while (i < argc && args[i])
	{
		str = strdup(args[i]);
		option = str2cmp(options, str);
		if (option != -1)
			run_funct(&i, option, args, options);
		else
		{
			if (isfunct(str, options) != -1)
				run_funct(&i, option, args, options);
			else
				i++;
		}
		free(str);
	}
}
