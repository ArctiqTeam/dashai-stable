# Deploy Github Collector

Start by clicking on the left menu and selecting Collectors

Choose "Github Collector" - Hit "Deploy"

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fa58481d9-72aa-44d5-a125-20ebc5db9d3f%2FScreenshot2018-04-2815.11.38.png)

Go ahead and click "Deploy"  again

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff29c6d4d-7cae-4b6d-811c-4c4789ff8eb5%2FScreenshot2018-04-2815.11.46.png)

In this section we need you to provide the Github repo's you want to collect data from

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fb1c30e9e-0066-4234-b301-7474c9a08de2%2FScreenshot2018-04-2817.03.56.png)

Below is an example a few different repo's you can use for testing:

    ArctiqTeam/dashai-stable, openshift/origin, kubernetes/kubernetes, prometheus/prometheus, ansible/ansible, tensorflow/tensorflow

ArctiqTeam/dashai-stable, openshift/origin, kubernetes/kubernetes, prometheus/prometheus, ansible/ansible, tensorflow/tensorflow

You can use your own, make sure to follow the formatting (no , after the last repo)

---

You don't need a API token for public repo's, but Github will rate limit the data collection calls. If you use an API token you won't have that limitation.

For any Private Repo you will need an API token.

Here is an example of how to create an API token inside your Github account:

Under "Settings" (top right drop down), then "Developer Settings" (bottom left menu)

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc718fbe4-47da-4c45-a58b-0db489625e95%2FScreenshot2018-04-2816.30.52.png)

Create a new "Personal Access Token" - Provide "repo" permission

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F220c24e8-e7c1-449a-9f6b-e1821c6d99b4%2FScreenshot2018-04-2816.32.25.png)

Copy the token, you will use it to deploy the "Github Collector"

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fa2058083-c38f-4a2e-b7cf-d08feac5f24d%2FScreenshot2018-04-2816.33.21.png)

Enter the repo's and your token and click "Submit"

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fbf10fe68-f604-4288-9dd5-0b118d1b435a%2FScreenshot2018-04-2815.13.48.png)

Wait for the status screen to display

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fa0a7af78-b1b6-4894-9945-fee201b769f0%2FScreenshot2018-04-2815.17.41.png)

You can flip over to your OpenShift project and see a new build and POD coming up

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd50bbf93-1346-4a04-8987-d18107706bea%2FScreenshot2018-04-2816.39.08.png)

If you go into the deployment config and look at the "Environment" tab you will see the repo's and API key

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F00225c71-b712-4ac0-b550-c7508b42ea63%2FScreenshot2018-04-2815.40.10.png)

If you ever want to add more repo's, you can add them at the end of the last entry

When you hit saw this will cause you new POD to redeploy and start collecting the new data

Go ahead and click on the "Dashboard" on the left side and "Launch" your Dashboard

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe1bf722a-a791-4138-abf9-46be228d8201%2FScreenshot2018-04-2816.35.34.png)

We have loaded some default graphs for you (feel free to customize)

![](https://www.notion.so/file/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc4b97289-56f8-43ab-bf54-f0bf114f4458%2FScreenshot2018-04-2816.36.13.png)

    oc set env dc/dashai-github REPOS='ArctiqTeam/dashai-stable,tensorflow/tensorflow, ansible/ansible, openshift/origin'
    deploymentconfig "dashai-github" updated

    oc set env dc/dashai-github REPOS='ArctiqTeam/dashai-stable'


    ArctiqTeam/dashai-stable

sda

    oc set env dc/dashai-github GITHUB_TOKEN='ee1a5e9a2e990c30048be4bbfedebb89bcda283e'
