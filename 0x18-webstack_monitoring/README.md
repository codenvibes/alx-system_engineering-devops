<h1 align="center"><b>0x18. WEBSTACK MONITORING</b></h1>
<div align="center"><code>DevOps</code> <code>SysAdmin</code> <code>monitoring</code></div>

<br>

## Concepts
<details>
<summary><b><a href="https://intranet.alxswe.com/concepts/13">Monitoring</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://intranet.alxswe.com/concepts/67">Server</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>

<br><div align="center"><img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x18-webstack_monitoring/images/hb3pAsO.png"></div>

<br>

## Background Context
“You cannot fix or improve what you cannot measure” is a famous saying in the Tech industry. In the age of the data-ism, monitoring how our Software systems are doing is an important thing. In this project, we will implement one of many tools to measure what is going on our servers.

Web stack monitoring can be broken down into 2 categories:
- Application monitoring: getting data about your running software and making sure it is behaving as expected
- Server monitoring: getting data about your virtual or physical server and making sure they are not overloaded (could be CPU, memory, disk or network overload)

<br><div><img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x18-webstack_monitoring/images/ktCXnhE.jpg"></div>

<br>

## Resources
<details>
<summary><b><a href="https://www.sumologic.com/glossary/server-monitoring/">What is server monitoring</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://en.wikipedia.org/wiki/Application_performance_management">What is application monitoring</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://sre.google/sre-book/monitoring-distributed-systems/">System monitoring by Google</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://docs.nginx.com/nginx/admin-guide/monitoring/logging/">Nginx logging and monitoring</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>



<!-- <br>

**man or help:**
- `` -->

<br>

## Learning Objectives
<details>
<summary><b><a href=" "> </a>Why is monitoring needed</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>What are the 2 main area of monitoring</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>What are access logs for a web server (such as Nginx)</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>What are error logs for a web server (such as Nginx)</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<br>

## Requirements
- Allowed editors: `vi`, `vim`, `emacs`
- All your files will be interpreted on Ubuntu 16.04 LTS
- All your files should end with a new line
- A `README.md` file, at the root of the folder of the project, is mandatory
- All your Bash script files must be executable
- Your Bash script must pass `Shellcheck` (version `0.3.7`) without any error
- The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
- The second line of all your Bash scripts should be a comment explaining what is the script doing

<!-- ## More Info -->

<br>

## Tasks
<details>
<summary>

### 0. Sign up for Datadog and install datadog-agent
`mandatory`

File: [0x18-webstack_monitoring]()
</summary>

For this task head to https://www.datadoghq.com/ and sign up for a free `Datadog` account. When signing up, you’ll have the option of selecting statistics from your current stack that Datadog can monitor for you. Once you have an account set up, follow the instructions given on the website to install the Datadog agent.

</details>

<details>
<summary>

### 1. Monitor some metrics
`mandatory`

File: [0x18-webstack_monitoring]()
</summary>


</details>

<details>
<summary>

### 2. Create a dashboard
`mandatory`

File: [2-setup_datadog]()
</summary>


</details>

