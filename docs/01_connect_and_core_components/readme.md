# Connect to DashAI - WebUI / Connect Cluster and Deploy Core Components

Click on the route you exposed earlier - that will open the Dashai configurator:

![](https://static.notion-static.com/cc8ccfc2-b7ae-4975-b89c-adfffd355162/Screenshot_2018-02-12_14.14.01.png)

This will load the main page - Login:

![](https://static.notion-static.com/3e4a78ce-72e1-4b69-91a9-d01411a7d960/Screenshot_2018-03-18_14.49.40.png)

Connect to your Cluster:

You can use your id and password (make sure to add the OpenShift URL)

You can also use the token we used above to login via OC client - **Easiest / Quickest!**

![](https://static.notion-static.com/c4894c1e-bd28-4dd2-8de4-731c4bb468bd/Screenshot_2018-03-18_14.49.53.png)

Now make sure to set the proper project (the project you just created "dashai")

![](https://static.notion-static.com/ec6760b7-62d7-45ed-99a7-8c5cfed8363b/Screenshot_2018-03-18_14.52.54.png)

You cam also select the project from the left menu - "Set Project"

![](https://static.notion-static.com/eacf5eae-459b-44c9-8de7-9d97fdfdbf8e/Screenshot_2018-03-18_14.55.30.png)

Now its time to deploy base components (Influxdb and Grafana containers)

Choose "Deploy Base Components" from the left menu

![](https://static.notion-static.com/2a3cee31-eeba-4094-a360-fa3b2979dea7/Screenshot_2018-03-18_14.57.08.png)

Wait for the results to display

![](https://static.notion-static.com/bfa3ecfa-fdbd-4bb0-bc69-55dbabecbd6a/Screenshot_2018-03-18_14.58.08.png)

You can see the new Builds inside your OpenShift project from the WebUI:

![](https://static.notion-static.com/e09a8cb7-f581-4f56-98cc-b712eca47b43/Screenshot_2018-02-12_14.28.04.png)

Here are your new PODs coming online

![](https://static.notion-static.com/16a04bd5-485a-4ba0-ab04-8af00e1eacb0/Screenshot_2018-02-12_14.28.14.png)

You should have a new grafana route also:

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fcd292d15-a371-4b57-a765-b347dfc0aac7%2FScreenshot2018-04-2422.42.43.png)

Your base components are now deployed...
