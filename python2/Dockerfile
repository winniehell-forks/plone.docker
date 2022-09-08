FROM python:2.7-slim-buster AS build

ARG PLONE_VERSION=5.2.9
ARG REQUIREMENTS_MD5=237b441ef180499b3e8fedc49ba82612
ARG VERSIONS_MD5=8054f3851fb818fd46f7ba851ffb572a

COPY buildout.cfg build.sh /plone/
WORKDIR /plone/
RUN ./build.sh
ENTRYPOINT ["bin/instance"]
CMD ["console"]
