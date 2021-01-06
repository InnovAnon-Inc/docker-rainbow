FROM innovanon/doom-base as rainbow_blood
USER root
ARG LFS=/mnt/lfs
USER lfs
COPY    ./rainbow_blood.zip $LFS/sources/
RUN unzip        rainbow_blood.zip   \
 && mkdir -v     rainbow_blood       \
 && cd           rainbow_blood       \
 && unzip -o '../rainbow blood.pk3'  \
 && rm -v     ../rainbow_blood.zip   \
             '../rainbow blood.pk3'  \
 && zip -q -Z bzip2 -9               \
         -r /tmp/rainbow_blood.pk3 . \
 && cd      /tmp                     \
 && rm -rf                  $LFS/sources/rainbow_blood

FROM scratch as final
COPY --from=rainbow_blood /tmp/rainbow_blood.pk3 /tmp/

