<h1 align="center"><b>0x14. MYSQL</b></h1>
<div align="center"><code>DevOps</code> <code>SysAdmin</code> <code>MySQL</code></div>

<br>

## Concepts
<details>
<summary><b><a href="https://intranet.alxswe.com/concepts">Database administration</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://intranet.alxswe.com/concepts/68">Web stack debugging</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://intranet.alxswe.com/concepts">[How to] Install mysql 5.7</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>

<br><div align="center"><img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x14-mysql/images/KkrkDHT.png"></div>

<!-- <br>

## Background Context -->

<br>

## Resources
<details>
<summary><b><a href="https://www.digitalocean.com/community/tutorials/how-to-choose-a-redundancy-plan-to-ensure-high-availability#sql-replication">What is a primary-replica cluster</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://www.digitalocean.com/community/tutorials/how-to-set-up-replication-in-mysql">MySQL primary replica setup</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://www.databasejournal.com/ms-sql/developing-a-sql-server-backup-strategy/">Build a robust database backup strategy</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>



<br>

**man or help:**
- `mysqldump`

<br>

## Learning Objectives
<details>
<summary><b><a href=" "> </a>What is the main role of a database</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>What is a database replica</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>What is the purpose of a database replica</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>Why database backups need to be stored in different physical locations</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>What operation should you regularly perform to make sure that your database backup strategy actually works</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<br>

## Requirements
- Allowed editors: `vi`, `vim`, `emacs`
- All your files will be interpreted on Ubuntu 16.04 LTS
- All your files should end with a new line
- A `README.md` file, at the root of the folder of the project, is mandatory
- All your Bash script files must be executable
- Your Bash script must pass `Shellcheck` (version `0.3.7-5~ubuntu16.04.1` via `apt-get`) without any error
- The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
- The second line of all your Bash scripts should be a comment explaining what is the script doing

<!-- ## More Info -->

<br>

## Tasks
<details>
<summary>

### 0. Install MySQL
`mandatory`
</summary>

First things first, let’s get MySQL installed on **both** your web-01 and web-02 servers.
- MySQL distribution must be 5.7.x
- Make sure that [task #3](https://intranet.alxswe.com/tasks/1372) of your [SSH project](https://intranet.alxswe.com/projects/244) is completed for `web-01` and `web-02`. The checker will connect to your servers to check MySQL status
- Please make sure you have your `README.md` pushed to GitHub.
Example:
```
ubuntu@229-web-01:~$ mysql --version
mysql  Ver 14.14 Distrib 5.7.25, for Linux (x86_64) using  EditLine wrapper
ubuntu@229-web-01:~$
```
</details>

<details>
<summary>

### 1. Let us in!
`mandatory`
</summary>

In order for us to verify that your servers are properly configured, we need you to create a user and password for both MySQL databases which will allow the checker access to them.

Create a MySQL user named holberton_user on both web-01 and web-02 with the host name set to localhost and the password projectcorrection280hbtn. This will allow us to access the replication status on both servers.
Make sure that holberton_user has permission to check the primary/replica status of your databases.
In addition to that, make sure that task #3 of your SSH project is completed for web-01 and web-02. You will likely need to add the public key to web-02 as you only added it to web-01 for this project. The checker will connect to your servers to check MySQL status
Example:
```
ubuntu@229-web-01:~$ mysql -uholberton_user -p -e "SHOW GRANTS FOR 'holberton_user'@'localhost'"
Enter password:
+-----------------------------------------------------------------+
| Grants for holberton_user@localhost                             |
+-----------------------------------------------------------------+
| GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost' |
+-----------------------------------------------------------------+
ubuntu@229-web-01:~$
```
</details>

<details>
<summary>

### 2. If only you could see what I've seen with your eyes
`mandatory`
</summary>


</details>

<details>
<summary>

### 3. Quite an experience to live in fear, isn't it?
`mandatory`
</summary>


</details>

<details>
<summary>

### 4. Setup a Primary-Replica infrastructure using MySQL
`mandatory`

File: [4-mysql_configuration_primary](), [4-mysql_configuration_replica]()
</summary>


</details>

<details>
<summary>

### 5. MySQL backup
`mandatory`

File: [5-mysql_backup]()
</summary>


</details>

