# RHSSO_Custom_Cache_Owners

1- Clone or download the Dockerfile in your environment:

~~~
git clone https://github.com/alexbarbosa1989/RHSSO_Custom_Cache_Owners
~~~

2- Pull SSO image from Red Hat Containers Images Catalog https://catalog.redhat.com/software/containers/explore

3- Build the custom image using the Dockerfile (You must be located in the directory where is the Dockerfile):

~~~
podman build -t abarbosa/sso74-openshift-rhel8-custom-owners .
~~~

4- Now the image is ready to use. Can be copied to a image Repository to make it able to be pulled from any location. 
   In this case the image is moved to quay.io https://quay.io/repository/alexbarbosa1989/sso74-openshift-rhel8-custom-owners


## Importing the image in Openshift

1- Log in into the Openshift platform and move to openshift project:

~~~
oc project openshift
~~~

2- Import the image from the container repository:

~~~
oc import-image --from quay.io/alexbarbosa1989/sso74-openshift-rhel8-custom-owners --confirm
~~~

3- Verify the new imagestream:

~~~
oc get is | grep sso74-openshift-rhel8-custom-owners 

NAME                                   DOCKER REPO                                                      TAGS      UPDATED
sso74-openshift-rhel8-custom-owners    172.30.1.1:5000/openshift/sso74-openshift-rhel8-custom-owners    latest    12 minutes ago
~~~

4- Now the image is available to be used into the namespaces and templates
