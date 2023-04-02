FROM archlinux:base-20230319.0.135218

# Add support for the locale: German
RUN sed -i 's/\(!usr\/share\/i18n\/\)\(charmaps\/\)\(UTF-8.gz\)/\1\2\3 \1\2ISO-8859-1.gz \1\2ISO-8859-15.gz \1locales\/de_DE@euro/g' /etc/pacman.conf \
    && sed -i 's/\(!usr\/share\/\*locales\/\)\(en_??\)/\1\2 \1de_??/g' /etc/pacman.conf

# Install required packages
RUN pacman -Sy \
    && pacman -S --noconfirm \
        glibc \
        openssh \
        python \
        sudo \
        systemd \
    && pacman -Sc --noconfirm

# Add command
ENTRYPOINT ["/usr/sbin/init"]
