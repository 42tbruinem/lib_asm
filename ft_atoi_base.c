/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_atoi_base.c                                     :+:    :+:            */
/*                                                     +:+                    */
/*   By: tbruinem <tbruinem@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/03/09 19:52:15 by tbruinem       #+#    #+#                */
/*   Updated: 2020/03/10 20:12:04 by tbruinem      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <stdio.h>

char	*ft_strchr(char *str, char c);

/* char	*ft_strchr(char *str, char c)
{
	size_t	i;

	i = 0;
	while (str[i] && str[i] != c)
	{
//		printf("str: %s | c: %c\n", str, c);
		i++;
	}
	if (!str[i])
		return (NULL);
	return (str + i);
} */

void	ft_skip_whitespace(char *str, size_t *i)
{
	while ((str[*i] >= 9 && str[*i] <= 13) || str[*i] == ' ')
		i++;
}

int		ft_validate_base(char *base, size_t *len)
{
	while (base[*len])
	{
		if (base[*len + 1] && ft_strchr(&base[*len + 1], base[*len]))
			return (0);
		(*len)++;
	}
	return (1);
}

int		get_sign(char *str, size_t *i)
{
	int	ret;

	if (str[*i] == '-')
		ret = -1;
	else
		ret = 1;
	if (str[*i] == '+' || str[*i] == '-')
		(*i)++;
	return (ret);
}

int		ft_atoi_base(char *str, char *base)
{
	size_t	ret;
	int		sign;
	size_t	i;
	size_t	base_num;
	char	*tmp;

	i = 0;
	base_num = 0;
	ft_skip_whitespace(str, &i);
	if (ft_validate_base(base, &base_num) == 0)
		return (0);
	sign = get_sign(str, &i);
	ret = 0;
	printf("base_num: %ld\n", base_num);
	while (str[i])
	{
		tmp = ft_strchr(base, str[i]);
		if (!tmp)
			return (ret);
		ret = (ret * base_num) + (tmp - base);
		i++;
	}
	return (ret * sign);
}

int 	main(void)
{
	char	str[] = "101010";
	char	base[] = "01";
	int		ret;

	ret = ft_atoi_base(str, base);
	printf("ret: %d\n", ret);
	return (0);
}
