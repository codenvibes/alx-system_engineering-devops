<h1 align="center"><b>0x0B. SSH</b></h1>
<div align="center"><code>DevOps</code> <code>SSH</code> <code>Network</code> <code>SysAdmin</code> <code>Security</code></div>

## Background Context
<img src="https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/244/zPVRKhPsUP5lK.gif">

Along with this project, you have been attributed an Ubuntu server, living in a datacenter far far away. Like level 2 of the application process, you will connect using `ssh`. But contrary to level 2, you will not connect using a password but an RSA key. We’ve configured your server with the public key you created in the first task of [a previous project](https://intranet.alxswe.com/tasks/1223) shared in your [intranet profile](https://intranet.alxswe.com/users/my_profile).

You can access your server information in the [my servers](https://intranet.alxswe.com/servers) section of the intranet, each line with contains the IP and username you should use to connect via `ssh`.

**Note**: Your server is configured with an Ubuntu 20.04 LTS environment.

## Resources
<details>
<summary><b><a href="https://en.wikipedia.org/wiki/Server_%28computing%29#Hardware_requirement">What is a (physical) server - text</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://www.youtube.com/watch?v=B1ANfsDyjeA">What is a (physical) server - video</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://www.digitalocean.com/community/tutorials/ssh-essentials-working-with-ssh-servers-clients-and-keys">SSH essentials</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://www.ssh.com/academy/ssh/config">SSH Config File</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://www.ssh.com/academy/ssh/public-key-authentication">Public Key Authentication for SSH</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://www.youtube.com/watch?v=ORcvSkgdA58">How Secure Shell Works</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://www.youtube.com/watch?v=hQWRp-FdTpc">SSH Crash Course</a> (Long, but highly informative. Watch this if configuring SSH is still confusing. It may be helpful to watch at x1.25 speed or above.)</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>
<br>

**For reference:**

<details>
<summary><b><a href="https://www.digitalocean.com/community/tutorials/understanding-the-ssh-encryption-and-connection-process">Understanding the SSH Encryption and Connection Process</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://en.wikipedia.org/wiki/Secure_Shell">Secure Shell Wiki</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://www.ietf.org/rfc/rfc4251.txt">IETF RFC 4251 (Description of the SSH Protocol)</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://en.wikipedia.org/wiki/Internet_Engineering_Task_Force">Internet Engineering Task Force</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://en.wikipedia.org/wiki/Request_for_Comments">Request for Comments</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>
<br>

**man or help:**
- `ssh`
- `ssh-keygen`
- `ssh-keygen`

## Learning Objectives
<details>
<summary><b><a href=" "> </a>What is a server</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>Where servers usually live</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>What is SSH</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>How to create an SSH RSA key pair</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>How to connect to a remote host using an SSH RSA key pair</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>The advantage of using <code>#!/usr/bin/env bash</code> instead of <code>/bin/bash</code></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


## Requirements
- Allowed editors: `vi`, `vim`, `emacs`
- All your files will be interpreted on Ubuntu 20.04 LTS
- All your files should end with a new line
- A `README.md` file, at the root of the folder of the project, is mandatory
- All your Bash script files must be executable
- The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
- The second line of all your Bash scripts should be a comment explaining what is the script doing

## Your servers


## Tasks
<details>
<summary>

### 0. Use a private key
`mandatory`

File: [0-use_a_private_key]()
</summary>

Write a Bash script that uses `ssh` to connect to your server using the private key `~/.ssh/school` with the user `ubuntu`.

Requirements:

- Only use `ssh` single-character flags
- You cannot use `-l`
- You do not need to handle the case of a private key protected by a passphrase
```
sylvain@ubuntu$ ./0-use_a_private_key
ubuntu@server01:~$ exit
Connection to 8.8.8.8 closed.
sylvain@ubuntu$ 
```

</details>

<details>
<summary>

### 1. Create an SSH key pair
`mandatory`

File: [1-create_ssh_key_pair]()
</summary>

Write a Bash script that creates an RSA key pair.

Requirements:

- Name of the created private key must be `school`
- Number of bits in the created key to be created 4096
- The created key must be protected by the passphrase `betty`

Example:
```
sylvain@ubuntu$ ls
1-create_ssh_key_pair
sylvain@ubuntu$ ./1-create_ssh_key_pair
Generating public/private rsa key pair.
Your identification has been saved in school.
Your public key has been saved in school.pub.
The key fingerprint is:
5d:a8:c1:f5:98:b6:e5:c0:9b:ee:02:c4:d4:01:f3:ba vagrant@ubuntu
The key's randomart image is:
+--[ RSA 4096]----+
|      oo...      |
|      .+.o =     |
|     o  + B +    |
|      o. = O     |
|     .. S = .    |
|      .. .       |
|      E.  .      |
|        ..       |
|         ..      |
+-----------------+
sylvain@ubuntu$ ls
1-create_ssh_key_pair school  school.pub
sylvain@ubuntu$ 
```

</details>

<details>
<summary>

### 2. Client configuration file
`mandatory`

File: [2-ssh_config]()
</summary>


</details>

<details>
<summary>

### 3. Let me in!
`mandatory`

File: [0x0B-ssh]()
</summary>


</details>

<details>
<summary>

### 4. Client configuration file (w/ Puppet)
`#advanced`

File: [100-puppet_ssh_config.pp]()
</summary>


</details>

