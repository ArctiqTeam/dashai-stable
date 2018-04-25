# Deploy Google Sheets Collector

Click on the left menu again - Choose "Collectors" from the menu

You are going to select the "Google Sheets" collector

![](https://static.notion-static.com/1b9438dd-cb26-4fd9-a4b5-054b0db3d379/Screenshot_2018-03-18_17.34.10.png)

Go ahead and select "Deploy" - You will be prompted for the information soon"

![](https://static.notion-static.com/e1859e91-381d-48da-b0a6-d821978dd994/Screenshot_2018-03-18_17.34.47.png)

Wait for the status page to display:

![](https://static.notion-static.com/8460f9e5-be4d-4f4f-aeba-7f6877e39630/Screenshot_2018-02-12_14.58.53.png)

You will be prompted for some required information that will enable connectivity to your sheet

Click the link "Click Here To Authorize DashAi"

![](https://static.notion-static.com/9afc355b-a073-47a5-8305-95ad6fae4f0f/Screenshot_2018-03-18_17.36.01.png)

You will be prompted to login to you google account where your sheet lives

Enter you google account email address:

![](https://static.notion-static.com/d1078e00-68ad-4010-bd9c-5b17f6238508/Screenshot_2018-02-12_14.55.50.png)

Input your password:

![](https://static.notion-static.com/d81e5454-eefb-4569-bc2b-fad57f82fdc6/Screenshot_2018-02-12_14.57.00.png)

Allow DashAi to access your sheet (this token is only be available for a short time)

![](https://static.notion-static.com/a2634e13-c38e-49c7-859e-71a2086000c2/Screenshot_2018-02-12_14.57.14.png)

Copy the token that is displayed and paste to the "Google Auth Code" box

Also paste in the URL to you google sheet (the sheet we prepared at the top of this doc)

![](https://static.notion-static.com/9afc355b-a073-47a5-8305-95ad6fae4f0f/Screenshot_2018-03-18_17.36.01.png)

![](https://static.notion-static.com/84231f9b-90e4-43f1-bd01-475325180c50/Screenshot_2018-03-18_17.37.10.png)

Click "Submit"

You can monitor the "dashai-sheets" build in the same OpenShift project via WebUI

![](https://static.notion-static.com/ab9bbcce-5864-4c4c-b723-98917ba335a5/Screenshot_2018-02-12_15.00.16.png)

You will see your google-sheets POD come online

![](https://static.notion-static.com/a3ad3249-1e66-4820-a5a3-d4db18851a32/Screenshot_2018-02-12_15.02.18.png)

Select your "Dashboards" from the left hand Dashai menu

![](https://static.notion-static.com/88090c34-4820-412f-9a62-cce8092483cf/Screenshot_2018-03-18_17.41.02.png)

You can see your new Dashboard "all the data coming from your google sheet"

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4a84373f-c59e-4a4f-89da-ebca20ff7173%2FScreenshot2018-04-2423.31.49.png)

Let's make sure it's working and collecting new data, go to your google sheet

We love the Leafs, so let's up their Stanley Cups to "50"

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F0d1252fd-9e87-4b8b-82e1-020907f4ef27%2FScreenshot2018-04-2423.34.06.png)

Flip back to your dashboard and see the change (wow that was fast)

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7159d1f6-7dfa-405a-943a-3b567c3d388a%2FScreenshot2018-04-2423.34.41.png)

Ok back to reality...

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff1e6f727-333f-4377-8d3d-b3f69c528085%2FScreenshot2018-04-2423.36.20.png)

You can see the data point drop right away

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F12e1a69b-a954-4d4f-a5cd-91642fb607b7%2FScreenshot2018-04-2423.36.33.png)

Ok, so now it's your turn to collect you own data and start showing off you Dashboard