# How to install Docker and OpenShift on Windows 10 (oc cluster up)

Windows 10

Note: Windows 10 Pro is a prerequisite (Docker will not run on Windows 10 Home)

- Windows download URL: [https://store.docker.com/editions/community/docker-ce-desktop-windows](https://store.docker.com/editions/community/docker-ce-desktop-windows)
- Download docker

![](../images/1.png)


- Install Docker
  - Accept the security prompt

    ![](../images/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F9af46363-d2bd-4c59-9afe-88ee767f5e78%2FUntitled.png)

  - Option #1 - Make sure you choose option to use Linux Containers (default during the installation), Click OK
    - Note: Windows will produce an error if Windows containers are used:
      - Error: Error response from daemon: {"message":"Windows does not support privileged mode"}

    ![](../images/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F66eb167c-2ae6-4f05-88f4-79ab3f2d954c%2FUntitled.png)

  ![](../images/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F411382aa-9204-4087-9081-b4b67f03bbe9%2FUntitled.png)

  - Once installation is complete, logo

  ![](../images/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F89a6be2e-0adc-4d1d-b920-cabe1c359e2a%2FUntitled.png)

  - After logging back in, you will be prompted to perform a reboot, Click OK

  ![](../images/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F03dc7b17-4ae6-48ee-ae80-6b182dc42d02%2FUntitled.png)

  - Reboot
  - Docker will start automatically on boot, you will see a screen like this:

    ![](../images/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F6bc45956-be58-4827-8410-c9ed43d5c82b%2FUntitled.png)

  - Ensure Docker is configured to run with Insecure Registry
    - Right click on the Docker icon in the taskbar hub, select settings
    - Click Daemon
    - Check the Experimental features box
    - Enter the subnet 172.30.0.0/16
    - Click Apply, Docker will restart

    ![](../images/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F70a6a684-88cf-4fa5-af82-1dc27b589e26%2FUntitled.png)

  - OC Client Tools: Next thing we need is the "OC Client Tools" - You can grab them from Red Hat here:

    [https://github.com/openshift/origin/releases/download](https://github.com/openshift/origin/releases/download/v3.9.0/openshift-origin-client-tools-v3.9.0-191fece-windows.zip)

    Download: openshift-origin-client-tools-v3.7.2-282e43f-windows.zip

    ![](../images/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc5cfe908-d0d6-4fa7-9fc1-f7cc1db0dee7%2FUntitled.png)

  - Installation instructions:

  [Installing OpenShift Client Tools on Windows - OpenShift Blog](https://blog.openshift.com/installing-oc-tools-windows/)

  - Extract the contents of the downloaded ZIP file to: C:\Program Files (x86)\OpenShift
  - Set the PATH variable:
    - Open the Control Panel (hit the Windows key and then type Control Panel on 8.1 and above), and click on System. Click on Advanced system settings on the left or open the Advanced tab of System Properties. Click the button labeled Environment Variables… at the bottom. Look for the option in the User variables section for Path.

      ![](../images/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F67aa127d-faa5-491d-b0f9-f9f05eee975d%2FUntitled.png)

      ![](../images/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4f47bc0a-636b-467c-a229-54e7b09bb79e%2FUntitled.png)

    - Click the "path" variable and click New

      ![](../images/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F0df3e353-2968-4e1d-b7f8-4f56e46ca6e8%2FUntitled.png)

    - Enter C:\Program Files (x86)\OpenShift

      ![](../images/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe9d48684-3b68-4ad3-865f-e8942fa9cd72%2FUntitled.png)

    - Click OK to save
    - Open a Command Prompt
    - Type oc version to verify the path variable is working correctly

          oc version
          oc v3.7.2+282e43f
          kubernetes v1.7.6+a08f5eeb62
          features: Basic-Auth

    - Launch the oc cluster
      - oc cluster up

            oc cluster up
            Starting OpenShift using openshift/origin:v3.7.2 ...
            Pulling image openshift/origin:v3.7.2
            Pulled 1/4 layers, 29% complete
            Pulled 2/4 layers, 50% complete
            Pulled 3/4 layers, 93% complete
            Pulled 4/4 layers, 100% complete
            Extracting
            Image pull complete
            OpenShift server started.

      - Login details

            The server is accessible via web console at:
                https://10.0.75.2:8443

            You are logged in as:
                User:     developer
                Password: <any value>

            To login as administrator:
                oc login -u system:admin

      - Make sure you can login to your cluster as admin

            oc login -u system:admin

            Logged into "https://10.0.75.2:8443" as "system:admin" using existing credentials.

            You have access to the following projects and can switch between them with 'oc project <projectname>':

                dashai
                default
                kube-public
                kube-system
              * myproject
                openshift
                openshift-infra
                openshift-node

            Using project "myproject".

      - Elevate the "developer" account to be a cluster admin

            oc adm policy add-cluster-role-to-user cluster-admin developer

            cluster role "cluster-admin" added: "developer"

    - Access the Openshift origin dashboard

    ![](../images/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F24fc0e00-7d09-4469-bcec-5702895a33c5%2FUntitled.png)

    - Dashboard

    ![](../images/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ffe144e61-6e72-4416-80a3-9a96a3bea97f%2FUntitled.png)

    - Before creating a project, Git must be installed on the Windows system and added to the PATH, use the following link:
      - [https://git-scm.com/download/win](https://git-scm.com/download/win)
