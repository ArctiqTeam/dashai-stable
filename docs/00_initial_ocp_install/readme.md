# Project Creation and Initial Deployment on OpenShift Instructions:

First Create a Project from the OpenShift WebUI or OC Command Line Client:

![](https://static.notion-static.com/613fa2cf-ef29-4d60-ba17-e2c4c58e3c34/Screenshot_2018-03-18_14.30.34.png)

---

**You will need OC binaries to utilize command line tools.**

*Getting Started:*

[https://docs.openshift.com/container-platform/3.7/cli_reference/get_started_cli.html](https://docs.openshift.com/container-platform/3.7/cli_reference/get_started_cli.html)

*CLI Reference:* ****

[https://docs.openshift.com/container-platform/3.7/cli_reference/index.html](https://docs.openshift.com/container-platform/3.7/cli_reference/index.html)

*Basic CLI Operations:*

[https://docs.openshift.com/container-platform/3.7/cli_reference/basic_cli_operations.html](https://docs.openshift.com/container-platform/3.7/cli_reference/basic_cli_operations.html)

---

**You can login using the API token available via the OpenShift WEBUI**

Copy the token and paste from you OC client terminal

![](https://static.notion-static.com/ad660b8c-9566-419b-8bcd-92d515518cd3/Screenshot_2018-03-18_14.39.04.png)

---

**Create a New Project "We generally call it dashai"**

Run the following commands (Make sure you are in your new project)

You can type oc project to validate what project you are in.

    oc new-project dashai

**Deploy the based Dashai Web Component / Configurator**

Stable Release:

    oc new-app https://github.com/ArctiqTeam/dashai-stable --name cfgtool;

    oc expose svc/cfgtool

RnD Release: (Deploy @ your own risk!!!)

    oc new-app https://github.com/alyarctiq/redoctober --name cfgtool;

    oc expose svc/cfgtool

**Go back to the OpenShift WebUI:**

You will see the new project in the webui, have a look and make sure the service was created (You will see the URL near the top on the right side) - we will use this later...

![](https://static.notion-static.com/271e800e-c566-4a94-8664-5982336fba8e/Screenshot_2018-02-12_13.58.55.png)

You will also be able see the build start - look under builds

![](https://static.notion-static.com/0dbc504a-4bcd-4dab-a846-ae402c16cf4b/Screenshot_2018-02-12_13.59.36.png)

You can monitor the build - view the build log

![](https://static.notion-static.com/a15a61f8-fa95-4fd8-b794-9bddc2a41a6f/Screenshot_2018-02-12_14.03.15.png)

After the build finished - you can also see the deployer POD and cfgtool POD

![](https://static.notion-static.com/3911ee97-2845-4c54-8fd6-d3acbbd265aa/Screenshot_2018-02-12_14.12.24.png)
