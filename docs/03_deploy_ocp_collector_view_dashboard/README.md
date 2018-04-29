# Deploy OCP Collector - View your new Dashboard

Select Collectors from the left Dashai Menu - then choose OpenShift:

![](https://static.notion-static.com/531e389d-d042-4a53-908d-71608adfb52f/Screenshot_2018-03-18_15.00.12.png)

This step will deploy the OpenShift components and collector:

![](https://static.notion-static.com/5f2c6166-c25a-4c3a-8e59-d75af4cdd005/Screenshot_2018-03-18_15.05.42.png)

Wait for the status page to display:

![](https://static.notion-static.com/aa19de94-f804-484e-8c81-85af42d58712/Screenshot_2018-03-18_15.06.18.png)

You can monitor the new POD builds via the OpenShift WebUI - Let the deployment finish

Click on the Dashboards link on the left hand side

You will see your new Dashboard "DashAi OpenShift 3.x Monitoring" - Click "Launch"

![](https://static.notion-static.com/c6ef71bf-81f7-4061-a578-fb56557cefdc/Screenshot_2018-03-18_17.20.49.png)

This will launch the Grafana WebUi

Login into the Grafana WebUI - (admin - dashai) - (*You can change the password if you like)*

![](https://static.notion-static.com/2dc33603-019e-49f7-8950-2a8a72fc712b/Screenshot_2018-03-18_17.21.26.png)

You will see your main OpenShift Cluster Dashboard (We loaded some baseline metrics for you)

![](https://static.notion-static.com/856e4f77-ccef-442b-8b83-31bca8248a0b/Screenshot_2018-03-18_17.21.48.png)

You can select also each node in your cluster to view specific node data

![](https://static.notion-static.com/c989ab8d-e658-4d72-9f85-d3f5d8378256/Screenshot_2018-03-18_17.22.25.png)

Ok - you have your OpenShift cluster being monitored with DashAI,

Feel free to customize your dashboard and play with the timeline...
