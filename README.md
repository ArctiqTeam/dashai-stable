# Dashai - Arctiq Lab Details

- DashAI - OpenShift Deployment Instructions
  - Project Creation and Initial Deployment Commands:

    First Create a Project from the OpenShift WebUI or OC Command Line

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

    **Create a New Project "We call it dashai"**

    Run the following commands (Make sure you are in you new project.

    You can type oc project to validate what project you are in.

        oc new-project dashai

    **Deploy the based Dashai Web Component / Configurator**

    Stable Release:

        oc new-app https://github.com/ArctiqTeam/dashai-stable --name cfgtool;
        oc expose svc/cfgtool

    RnD Release:

        oc new-app https://github.com/alyarctiq/redoctober --name cfgtool;
        oc expose svc/cfgtool

    **Go back to the OpenShift WebUI:**

    You will see the new project in the webui, have a look and make sure the service was created (you will see the URL you are able to connect to.

    ![](https://static.notion-static.com/271e800e-c566-4a94-8664-5982336fba8e/Screenshot_2018-02-12_13.58.55.png)

    You will see the build start

    ![](https://static.notion-static.com/0dbc504a-4bcd-4dab-a846-ae402c16cf4b/Screenshot_2018-02-12_13.59.36.png)

    You can monitor the build

    ![](https://static.notion-static.com/a15a61f8-fa95-4fd8-b794-9bddc2a41a6f/Screenshot_2018-02-12_14.03.15.png)

    You can see the deployer POD and cfgtool POD

    ![](https://static.notion-static.com/3911ee97-2845-4c54-8fd6-d3acbbd265aa/Screenshot_2018-02-12_14.12.24.png)

  - Connect to DashAI - WebUI / Connect Cluster and Deploy Core Components

    Click on the route available:

    ![](https://static.notion-static.com/cc8ccfc2-b7ae-4975-b89c-adfffd355162/Screenshot_2018-02-12_14.14.01.png)

    This will load the main page - Login:

    ![](https://static.notion-static.com/3e4a78ce-72e1-4b69-91a9-d01411a7d960/Screenshot_2018-03-18_14.49.40.png)

    Connect to your Cluster

    You can use your id and password (make sure to add the OpenShift URL)

    You cal also use the token we used above to login via OC client

    ![](https://static.notion-static.com/c4894c1e-bd28-4dd2-8de4-731c4bb468bd/Screenshot_2018-03-18_14.49.53.png)

    Set the proper project

    ![](https://static.notion-static.com/ec6760b7-62d7-45ed-99a7-8c5cfed8363b/Screenshot_2018-03-18_14.52.54.png)

    Make sure to set the proper project - "dashai"

    You cam also select the project from the left menu - "Set Project"

    ![](https://static.notion-static.com/eacf5eae-459b-44c9-8de7-9d97fdfdbf8e/Screenshot_2018-03-18_14.55.30.png)

    Time to deploy base components (Influxdb and Grafana)

    ![](https://static.notion-static.com/2a3cee31-eeba-4094-a360-fa3b2979dea7/Screenshot_2018-03-18_14.57.08.png)

    ![](https://static.notion-static.com/bfa3ecfa-fdbd-4bb0-bc69-55dbabecbd6a/Screenshot_2018-03-18_14.58.08.png)

    **You can see the Builds inside your OpenShift project:**

    ![](https://static.notion-static.com/e09a8cb7-f581-4f56-98cc-b712eca47b43/Screenshot_2018-02-12_14.28.04.png)

    **Here are the PODs**

    ![](https://static.notion-static.com/16a04bd5-485a-4ba0-ab04-8af00e1eacb0/Screenshot_2018-02-12_14.28.14.png)

        oc volume dc/prometheus --add  --sub-path=data --name=prometheus-volume-1 --type=persistentVolumeClaim --claim-name=prometheus --overwrite --mount-path=/prometheus


        sudo curl -s cfgtool-arctiq-dashai.apps.ocp.lab.arctiq.ca/telegrafget | sh

        wget -O /tmp/dashai-host-poller.sh cfgtool-arctiq-dashai.apps.ocp.lab.arctiq.ca/telegrafget

        chmod +x /tmp/dashai-host-poller.sh

        sudo /tmp/dashai-host-poller.sh



  - Deploy OCP Collector (Check out your DashBoard)

    **Select Collectors from the left Menu:**

    ![](https://static.notion-static.com/531e389d-d042-4a53-908d-71608adfb52f/Screenshot_2018-03-18_15.00.12.png)

    **We are going to Deploy the OpenShift Collector:**

    ![](https://static.notion-static.com/5f2c6166-c25a-4c3a-8e59-d75af4cdd005/Screenshot_2018-03-18_15.05.42.png)

    ![](https://static.notion-static.com/aa19de94-f804-484e-8c81-85af42d58712/Screenshot_2018-03-18_15.06.18.png)

    **You will see your new Dashboard here - Click Link**

    ![](https://static.notion-static.com/c6ef71bf-81f7-4061-a578-fb56557cefdc/Screenshot_2018-03-18_17.20.49.png)

    **Login into the Grafana WebUI - (admin - dashai)**

    ![](https://static.notion-static.com/2dc33603-019e-49f7-8950-2a8a72fc712b/Screenshot_2018-03-18_17.21.26.png)

    **You can see your main OpenShift Cluster Dashboard**

    ![](https://static.notion-static.com/856e4f77-ccef-442b-8b83-31bca8248a0b/Screenshot_2018-03-18_17.21.48.png)

    **You can select each node in your cluster**

    ![](https://static.notion-static.com/c989ab8d-e658-4d72-9f85-d3f5d8378256/Screenshot_2018-03-18_17.22.25.png)

  - Deploy the Host Metrics Collector

    Go back to Metrics from the left Dashai Menu

    We are going to select the Telegraph collector

    ![](https://static.notion-static.com/bf470a3a-20fc-4867-be7d-7eb583b68328/Screenshot_2018-03-18_17.27.23.png)

    ![](https://static.notion-static.com/02520b69-4f15-4e7a-b2a1-5a709aefb75f/Screenshot_2018-03-18_17.28.07.png)

    **Make note of the commands you will need to run on you OpenShift Hosts**

    **You can Monitor other Linux based hosts at the same time if you like**

    ![](https://static.notion-static.com/d0f52dfc-6af8-458f-a9d5-3bab7602c9f3/Screenshot_2018-03-18_17.28.17.png)

    **Go back to you Dashboards in Grafana (you can see**

    ![](https://static.notion-static.com/379aa939-39ab-47e0-92ad-555997580852/Screenshot_2018-03-18_17.32.29.png)

    **Run the command above on you OpenShift hosts and you will start to see data**

  - Deploy Google Sheet

    Link to the sample dashboard template

    Go back to collectors in the Dashai menu

    ![](https://static.notion-static.com/1b9438dd-cb26-4fd9-a4b5-054b0db3d379/Screenshot_2018-03-18_17.34.10.png)

    asdas

    ![](https://static.notion-static.com/e1859e91-381d-48da-b0a6-d821978dd994/Screenshot_2018-03-18_17.34.47.png)

    asda

    ![](https://static.notion-static.com/8460f9e5-be4d-4f4f-aeba-7f6877e39630/Screenshot_2018-02-12_14.58.53.png)

    sds

    ![](https://static.notion-static.com/9afc355b-a073-47a5-8305-95ad6fae4f0f/Screenshot_2018-03-18_17.36.01.png)

    asd

    ![](https://static.notion-static.com/d1078e00-68ad-4010-bd9c-5b17f6238508/Screenshot_2018-02-12_14.55.50.png)

    sds

    ![](https://static.notion-static.com/d81e5454-eefb-4569-bc2b-fad57f82fdc6/Screenshot_2018-02-12_14.57.00.png)

    sdsd

    ![](https://static.notion-static.com/a2634e13-c38e-49c7-859e-71a2086000c2/Screenshot_2018-02-12_14.57.14.png)

    asdsad

    ![](https://static.notion-static.com/84231f9b-90e4-43f1-bd01-475325180c50/Screenshot_2018-03-18_17.37.10.png)

    sds

    ![](https://static.notion-static.com/ab9bbcce-5864-4c4c-b723-98917ba335a5/Screenshot_2018-02-12_15.00.16.png)

    sds

    ![](https://static.notion-static.com/a3ad3249-1e66-4820-a5a3-d4db18851a32/Screenshot_2018-02-12_15.02.18.png)

    sdsd

    ![](https://static.notion-static.com/88090c34-4820-412f-9a62-cce8092483cf/Screenshot_2018-03-18_17.41.02.png)

    Show Example Dashboard

[Dashai - Internal page](https://www.notion.so/72602150-54bf-4b39-bdff-6d856c5a0be2)
