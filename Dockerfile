FROM centos/s2i-core-centos7
ENV HTTPD_VERSION=2.4

ENV SUMMARY="Platform for running Apache httpd $HTTPD_VERSION or building httpd-based application" \
    DESCRIPTION="Apache httpd $HTTPD_VERSION available as docker container, is a powerful, efficient, \
and extensible web server. Apache supports a variety of features, many implemented as compiled modules \
which extend the core functionality. \
These can range from server-side programming language support to authentication schemes. \
Virtual hosting allows one Apache installation to serve many different Web sites."

LABEL summary="$SUMMARY" \
      description="$DESCRIPTION" \
      io.k8s.description="$DESCRIPTION" \
      io.k8s.display-name="Apache httpd $HTTPD_VERSION" \
      io.openshift.expose-services="8080:http,8443:https" \
      io.openshift.tags="builder,httpd,httpd24" \
      name="centos/httpd-24-centos7" \
      version="$HTTPD_VERSION" \
      com.redhat.component="httpd24-docker" \
      usage="s2i build https://github.com/sclorg/httpd-container.git --context-dir=examples/sample-test-app/ centos/httpd-24-centos7 sample-server" \
      maintainer="SoftwareCollections.org <sclorg@redhat.com>"

EXPOSE 8080

RUN yum install -y yum-utils && \
    yum install -y centos-release-scl epel-release && \
    INSTALL_PKGS="gettext hostname nss_wrapper bind-utils httpd24 mod_wsgi" && \
    yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all

ENV HTTPD_CONTAINER_SCRIPTS_PATH=/usr/share/container-scripts/httpd/ \
    HTTPD_APP_ROOT=${APP_ROOT} \
    HTTPD_CONFIGURATION_PATH=${APP_ROOT}/etc/httpd.d \
    HTTPD_MAIN_CONF_PATH=/etc/httpd/conf \
    HTTPD_MAIN_CONF_D_PATH=/etc/httpd/conf.d \
    HTTPD_VAR_RUN=/var/run/httpd \
    HTTPD_DATA_PATH=/var/www \
    HTTPD_DATA_ORIG_PATH=/opt/rh/httpd24/root/var/www \
    HTTPD_LOG_PATH=/var/log/httpd24 \
    HTTPD_SCL=httpd24

ENV BASH_ENV=${HTTPD_APP_ROOT}/scl_enable \
    ENV=${HTTPD_APP_ROOT}/scl_enable \
    PROMPT_COMMAND=". ${HTTPD_APP_ROOT}/scl_enable"

COPY ./s2i/bin/ $STI_SCRIPTS_PATH
COPY ./root /

RUN pip install --upgrade pip
RUN pip install flask datetime  datetime oauth2client  httplib2  wtforms  urllib3  requests  python-dateutil
RUN pip install --upgrade google-api-python-client
RUN yum groupinstall -y "Development Tools"

RUN yum remove -y git

RUN yum -y install python-pip wget curl-devel gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel

RUN wget -P /tmp https://www.kernel.org/pub/software/scm/git/git-2.9.5.tar.gz
RUN tar -zxf /tmp/git-2.9.5.tar.gz -C /tmp &&  /tmp/git-* && make configure && ./configure --prefix=/usr/local && make install
RUN cp /usr/local/bin/git /usr/bin/git

RUN wget -P /tmp https://github.com/openshift/origin/releases/download/v3.7.1/openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar.gz
RUN tar -zxvf  /tmp/openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar.gz -C /tmp &&  mv /tmp/openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit/oc /usr/bin 
RUN rm -rf /tmp/*

RUN mkdir /opt/app-root/src/.kube &&  chmod 777 /opt/app-root/src/.kube

RUN mkdir -p /dashai/
ADD app.tgz /dashai/
RUN chmod 777 -R /dashai/token &&  chmod 777 /dashai/token/*

ADD httpd.conf /etc/httpd/conf/

# Reset permissions of filesystem to default values
RUN /usr/libexec/httpd-prepare && rpm-file-permissions

RUN chmod 777 -R /var/log/httpd
USER 1001


CMD ["/usr/bin/run-httpd"]
