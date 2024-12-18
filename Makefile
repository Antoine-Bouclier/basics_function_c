.PHONY: all clean fclean re bonus

NAME = libft.a

CC = cc

CFLAGS = -Wall -Wextra -Werror

SRCS = 	ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c \
		ft_strlen.c ft_strchr.c ft_strdup.c ft_strjoin.c ft_strlcpy.c ft_strlcat.c \
		ft_strncmp.c ft_strrchr.c ft_strmapi.c ft_striteri.c ft_strtrim.c ft_strnstr.c \
		ft_memmove.c ft_memchr.c ft_memset.c ft_memcpy.c ft_memcmp.c \
		ft_putchar_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_putstr_fd.c \
		ft_atoi.c ft_itoa.c ft_split.c ft_calloc.c ft_substr.c \
		ft_toupper.c ft_tolower.c ft_bzero.c

B_SRCS = 	ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c ft_lstadd_back.c \
			ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c

OBJS = $(SRCS:.c=.o)

B_OBJS = $(B_SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJS)
	ar -rcs $(NAME) $(OBJS)
	
%.o : %.c libft.h
	$(CC) $(CFLAGS) -c $< -o $@

bonus: .bonus

.bonus: $(OBJS) $(B_OBJS)
	ar -rcs $(NAME) $(B_OBJS)
	touch $@

clean:
	rm -rf $(OBJS)
	rm -rf $(B_OBJS)

fclean: 
	$(MAKE) clean
	rm -rf $(NAME) .bonus

re:
	$(MAKE) fclean 
	$(MAKE) all
