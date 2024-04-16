FROM eclipse-temurin:17-jre-jammy

ENV PATH /usr/local/tomee/bin:$PATH
RUN mkdir -p /usr/local/tomee ~/.gnupg

WORKDIR /usr/local/tomee

RUN apt-get update \
  && apt-get install -y --no-install-recommends gpg dirmngr gpg-agent \
  && rm -rf /var/lib/apt/lists/*

RUN set -xe; \
  for key in \
  # Matt Hogstrom <hogstrom@apache.org>
  9056B710F1E332780DE7AF34CBAEBE39A46C4CA1 \
  # Jeremy Whitlock <jwhitlock@apache.org>
  F067B8140F5DD80E1D3B5D92318242FE9A0B1183 \
  # Richard Kenneth McGuire (CODE SIGNING KEY) <rickmcguire@apache.org>
  223D3A74B068ECA354DC385CE126833F9CF64915 \
  # Jonathan Gallimore <jgallimore@apache.org>
  DBCCD103B8B24F86FFAAB025C8BB472CD297D428 \
  # Jarek Gawor (CODE SIGNING KEY) <gawor@apache.org>
  7A2744A8A9AAF063C23EB7868EBE7DBE8D050EEF \
  # Jarek Gawor <gawor@apache.org>
  B8B301E6105DF628076BD92C5483E55897ABD9B9 \
  # Andy Gumbrecht (TomEE Code Signing) <agumbrecht@tomitribe.com>
  FAA603D58B1BA4EDF65896D0ED340E0E6D545F97 \
  # Romain Manni-Bucau <rmannibucau@tomitribe.com>
  A57DAF81C1B69921F4BA8723A8DE0A4DB863A7C1 \
  # Mark Struberg (Apache) <struberg@apache.org>
  82D8419BA697F0E7FB85916EE91287822FDB81B1 \
  # David Blevins <dblevins@apache.org>
  B7574789F5018690043E6DD9C212662E12F3E1DD \
  # Xu Hai Hong (Ivan Xu @ Geronimo) <xhhsld@gmail.com>
  C23A3F6F595EBD0F960270CC997C8F1A5BE6E4C1 \
  # Jean-Louis Monteiro (CODE SIGNING KEY) <jlmonteiro@apache.org>
  678F2D98F1FD9643811639FB622B8F2D043F71D8 \
  # Romain Manni-Bucau <rmannibucau@apache.org>
  BDD0BBEB753192957EFC5F896A62FC8EF17D8FEF \
  # Romain Manni-Bucau <rmannibucau@apache.org>
  D11DF12CC2CA4894BDE638B967C1227A2678363C \
  # Roberto Cortez (Apache Signing Key) <radcortez@yahoo.com>
  C92604B0DEC5C62CFF5801E73D4683C24EDC64D1 \
  # David Blevins <dblevins@tomitribe.com>
  626C542EDA7C113814B77AF09C04914D63645D20 \
  # Jean-Louis Monteiro (CODE SIGNING KEY) <jlmonteiro@apache.org>
  3948829384B269D333CC5B98358807C52B4B0E23 \
  # Richard Zowalla (Code Signing Key) <rzo1@apache.org>
  B83D15E72253ED1104EB4FBBDAB472F0E5B8A431 \
  # Jonathan S. Fisher  (Code Signing Key) <jfisher@apache.org> 
  871638A21A7F2C38066471420306A354336B4F0D \
  ; do \
    gpg --batch --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "$key" || \
    gpg --batch --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
  done

ENV TOMEE_VER 9.1.3
ENV TOMEE_BUILD plume

RUN set -x \
  && curl -fSL https://dist.apache.org/repos/dist/release/tomee/tomee-${TOMEE_VER}/apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz.asc -o tomee.tar.gz.asc \
  && curl -fSL https://dist.apache.org/repos/dist/release/tomee/tomee-${TOMEE_VER}/apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz.sha512 -o tomee.tar.gz.sha512 \
  && curl -fSL https://dist.apache.org/repos/dist/release/tomee/tomee-${TOMEE_VER}/apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz -o apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz \
  && gpg --batch --verify tomee.tar.gz.asc apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz \
  && echo `cat tomee.tar.gz.sha512` | sha512sum -c - \
  #&& echo `cat tomee.tar.gz.sha512` apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz | sha512sum -c - \
  && tar -zxf apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz \
  && mv apache-tomee-${TOMEE_BUILD}-${TOMEE_VER}/* /usr/local/tomee \
  && rm apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz \
  && rm -Rf apache-tomee-${TOMEE_BUILD}-${TOMEE_VER} \
  && rm bin/*.bat \
  && rm bin/*.exe \
  && rm bin/*.tar.gz* \
  && rm tomee.tar.gz.asc \
  && rm tomee.tar.gz*

EXPOSE 8080
CMD ["catalina.sh", "run"]

