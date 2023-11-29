<h1 align="center"><b>0x0C. WEB SERVER</b></h1>
<div align="center"><code>DevOps</code> <code>SysAdmin</code></div>

<br>
<div align="center"><img width=80% src="https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/266/8Gu52Qv.png"></div>
<br>

## Background Context

https://www.youtube.com/watch?v=AZg4uJkEa-4&feature=youtu.be&hd=1

In this project, some of the tasks will be graded on 2 aspects:

1. Is your `web-01` server configured according to requirements
2. Does your answer file contain a Bash script that automatically performs commands to configure an Ubuntu machine to fit requirements (meaning without any human intervention)

For example, if I need to create a file `/tmp/test` containing the string `hello world` and modify the configuration of Nginx to listen on port `8080` instead of `80`, I can use `emacs` on my server to create the file and to modify the Nginx configuration file `/etc/nginx/sites-enabled/default`.

But my answer file would contain:
```
sylvain@ubuntu cat 88-script_example
#!/usr/bin/env bash
# Configuring a server with specification XYZ
echo hello world > /tmp/test
sed -i 's/80/8080/g' /etc/nginx/sites-enabled/default
sylvain@ubuntu
```
As you can tell, I am not using `emacs` to perform the task in my answer file. This exercise is aiming at training you on automating your work. If you can automate tasks that you do manually, you can then automate yourself out of repetitive tasks and focus your energy on something more interesting. For an [SRE](https://www.atlassian.com/incident-management/devops/sre), that comes very handy when there are hundreds or thousands of servers to manage, the work cannot be only done manually. Note that the checker will execute your script as the `root` user, you do not need to use the `sudo` command.

A good Software Engineer is a [lazy Software Engineer](https://www.techwell.com/techwell-insights/2013/12/why-best-programmers-are-lazy-and-act-dumb).

<br>
<div align="center"><img width=80% src="https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/266/82VsYEC.jpg"></div>
<br>

Tips: to test your answer Bash script, feel free to reproduce the checker environment:
- start a `Ubuntu 16.04` sandbox
- run your script on it
- see how it behaves

## Resources
<details>
<summary><b><a href="https://intranet.alxswe.com/concepts/110">What is a Child Process?</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/How_the_Web_works">How the web works</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://en.wikipedia.org/wiki/Nginx">Nginx</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04">How to Configure Nginx</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://intranet.alxswe.com/concepts/110">Child process concept page</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://landingi.com/help/domains-vs-subdomains/">Root and sub domain</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://www.tutorialspoint.com/http/http_methods.htm">HTTP requests</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://moz.com/learn/seo/redirection">HTTP redirection</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://en.wikipedia.org/wiki/HTTP_404">Not found HTTP response code</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://www.cyberciti.biz/faq/ubuntu-linux-gnome-system-log-viewer/">Logs files on Linux</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>

<br>

### For reference:

<details>
<summary><b><a href="https://datatracker.ietf.org/doc/html/rfc7231">RFC 7231 (HTTP/1.1)</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://datatracker.ietf.org/doc/html/rfc7540">RFC 7540 (HTTP/2)</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>

<br>

### man or help:
- `scp`
- `curl`

<br>

## Learning Objectives
<details>
<summary><b><a href=" "> </a>What is the main role of a web server</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>What is a child process</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>Why web servers usually have a parent process and child processes</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>What are the main HTTP requests</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>

<br>

### DNS

<details>
<summary><b><a href=" "> </a>What DNS stands for</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>What is DNS main role</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>

<br>

### DNS Record Types
- `A`
- `CNAME`
- `TXT`
- `MX`

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
- You can’t use `systemctl` for restarting a process

<!-- ## More Info -->

## Quiz questions
<details>
<summary><h3>Question 0</h3></summary>

Why web servers usually use child processes?
- [ ] To prevent memory leak
- [x] So that the web server can dynamically change the number of child process to accommodate the volume of requests to be processed
- [ ] That’s just a subjective technical choice from the developers who created the software
</details>

<details>
<summary><h3>Question 1</h3></summary>


</details>

<details>
<summary><h3>Question 2</h3></summary>


</details>

<details>
<summary><h3>Question 3</h3></summary>


</details>

<details>
<summary><h3>Question 4</h3></summary>


</details>

<details>
<summary><h3>Question 5</h3></summary>


</details>

<details>
<summary><h3>Question 6</h3></summary>


</details>

<details>
<summary><h3>Question 7</h3></summary>


</details>

<details>
<summary><h3>Question 8</h3></summary>


</details>

<details>
<summary><h3>Question 9</h3></summary>


</details>

## Tasks
<details>
<summary>

### 0. 
`mandatory`

File: []()
</summary>


</details>

<details>
<summary>

### 1. 
`mandatory`

File: []()
</summary>


</details>

<details>
<summary>

### 2. 
`mandatory`

File: []()
</summary>


</details>

<details>
<summary>

### 3. 
`mandatory`

File: []()
</summary>


</details>

<details>
<summary>

### 4. 
`mandatory`

File: []()
</summary>


</details>

<details>
<summary>

### 5. 
`#advanced`

File: []()
</summary>


</details>

