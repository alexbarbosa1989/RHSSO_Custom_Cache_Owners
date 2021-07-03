# dockerfile to build image SSO 7.x

#start from base image
FROM registry.redhat.io/rh-sso-7/sso74-openshift-rhel8

#Edit owners amount in standalone-openshift.xml
RUN sed -i -E 's/owners="1"/owners="2"/g' /opt/eap/standalone/configuration/standalone-openshift.xml

# Important, use numeric user user to run image in Kubernetes/Openshift. Other containerized env can run with another user i. e., jboss
USER 1001
