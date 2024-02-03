ARG TOMCAT_IMAGE_TAG=9-jdk11
FROM tomcat:$TOMCAT_IMAGE_TAG AS Lucee


ARG LUCEE_VERSION=5.4.3.16
ENV LUCEE_VERSION=${LUCEE_VERSION}


ARG LUCEE_EXTENSIONS=
ENV LUCEE_EXTENSIONS=${LUCEE_EXTENSIONS}


ENV CATALINA_BASE /srv/www
ENV CATALINA_HOME /usr/local/tomcat
ENV LUCEE_DOWNLOAD http://release.lucee.org/rest/update/provider/loader/

RUN cat /etc/os-release \
    && echo Downloading Lucee ${LUCEE_VERSION}... \
    && $CATALINA_HOME/bin/makebase.sh $CATALINA_BASE \
    && curl -L -o "${CATALINA_BASE}/lib/${LUCEE_VERSION}.jar" "${LUCEE_DOWNLOAD}${LUCEE_VERSION}"


COPY resources/catalina-base ${CATALINA_BASE}

COPY app ${CATALINA_BASE}/webapps/ROOT

ARG LUCEE_ADMIN_PASSWORD=
ENV LUCEE_ADMIN_PASSWORD=${LUCEE_ADMIN_PASSWORD}

RUN if [ "$LUCEE_ADMIN_PASSWORD" != "" ] ; then \
        mkdir -p "${CATALINA_BASE}/lucee-server/context" \ 
        && echo $LUCEE_ADMIN_PASSWORD > "${CATALINA_BASE}/lucee-server/context/password.txt" ; \
    fi

ENV LUCEE_ADMIN_PASSWORD=

RUN if [ "$LUCEE_VERSION" \> "5.3.6" ] ; then \
        echo "Enabled LUCEE_ENABLE_WARMUP" \
        && export LUCEE_ENABLE_WARMUP=true \
        && export LUCEE_EXTENSIONS \
        && catalina.sh run ; \
    else \
        echo "Start Tomcat and wait 20 seconds to shut down" \
        && catalina.sh start \
        && sleep 20 \
        && catalina.sh stop ; \
    fi

