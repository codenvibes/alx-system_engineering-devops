<h1 align="center"><b>0x12. WEB STACK DEBUGGING #2</b></h1>
<div align="center"><code>DevOps</code> <code>SysAdmin</code> <code>Scripting</code> <code>Debugging</code></div>

<br>

## Concepts
<details>
<summary><b><a href="https://intranet.alxswe.com/concepts/68">Web stack debugging</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<!-- <br>

## Background Context -->

<br><div><img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x12-web_stack_debugging_2/images/99littlebugsinthecode-holberton.jpg"></div>

<br>

## Requirements
- All your files will be interpreted on Ubuntu 20.04 LTS
- All your files should end with a new line
- A README.md file at the root of the folder of the project is mandatory
- All your Bash script files must be executable
- Your Bash scripts must pass `Shellcheck` without any error
- Your Bash scripts must run without error
- The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
- The second line of all your Bash scripts should be a comment explaining what is the script doing

<!-- ## More Info -->

<br>

## Tasks
<details>
<summary>

### 0. Run software as another user
`mandatory`

File: [0-iamsomeoneelse]()
</summary>

<div><img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x12-web_stack_debugging_2/images/eaeff07a715ff880b1ceb8e863a1d141a74a7f85.png"></div><br>

The user `root` is, on Linux, the “superuser”. It can do anything it wants, that’s a good and bad thing. A good practice is that one should never be logged in the `root` user, as if you fat finger a command and for example run `rm -rf /`, there is no comeback. That’s why it is preferable to run as a privileged user, meaning that the user also has the ability to perform tasks that the `root` user can do, just need to use a specific command that you need to discover.

For the containers that you are given in this project as well as the checker, everything is run under the `root` user, which has the ability to run anything as another user.

Requirements:

- write a Bash script that accepts one argument
- the script should run the `whoami` command under the user passed as an argument
- make sure to try your script by passing different users

Example:
```
root@ubuntu:~# whoami
root
root@ubuntu:~# ./0-iamsomeoneelse www-data
www-data
root@ubuntu:~# whoami
root
root@ubuntu:~#
```
</details>

<details>
<summary>

### 1. Run Nginx as Nginx
`mandatory`

File: [1-run_nginx_as_nginx]()
</summary>

The `root` user is a superuser that can do anything on a Unix machine, the top administrator. Security wise, you must do everything that you can to prevent an attacker from logging in as `root`. With this in mind, it’s a good practice not to run your web servers as `root` (which is the default for most configurations) and instead run the process as the less privileged `nginx` user instead. This way, if a hacker does find a security issue that allows them to break-in to your server, the impact is limited by the permissions of the nginx user.

Fix this container so that Nginx is running as the nginx user.

Requirements:

nginx must be running as nginx user
nginx must be listening on all active IPs on port 8080
You cannot use apt-get remove
Write a Bash script that configures the container to fit the above requirements
After debugging:
```
root@ab6f4542747e:~# ps auxff | grep ngin[x]
nginx      884  0.0  0.0  77360  2744 ?        Ss   19:16   0:00 nginx: master process /usr/sbin/nginx
nginx      885  0.0  0.0  77712  2772 ?        S    19:16   0:00  \_ nginx: worker process
nginx      886  0.0  0.0  77712  3180 ?        S    19:16   0:00  \_ nginx: worker process
nginx      887  0.0  0.0  77712  3180 ?        S    19:16   0:00  \_ nginx: worker process
nginx      888  0.0  0.0  77712  3208 ?        S    19:16   0:00  \_ nginx: worker process
root@ab6f4542747e:~#
root@ab6f4542747e:~# nc -z 0 8080 ; echo $?
0
root@ab6f4542747e:~#
```
</details>

<details>
<summary>

### 2. 7 lines or less
`#advanced`

File: [100-fix_in_7_lines_or_less]()
</summary>


</details>
