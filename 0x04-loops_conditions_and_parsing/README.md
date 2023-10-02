<h1 align="center"><b>0x04. LOOPS, CONDITIONS AND PARSING</b></h1>
<div align="center"><code>DevOps</code> <code>Shell</code> <code>Bash</code> <code>Scripting</code></div>

# About **Bash** projects
Unless stated, all your projects will be auto-corrected with Ubuntu 20.04 LTS.

<!-- # Background Context -->

# Resources
- [Loops sample](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_01.html)
- [Variable assignment and arithmetic](https://tldp.org/LDP/abs/html/ops.html)
- [Comparison operators](https://tldp.org/LDP/abs/html/comparison-ops.html)
- [File test operators](https://tldp.org/LDP/abs/html/fto.html)
- [Make your scripts portable](https://www.cyberciti.biz/tips/finding-bash-perl-python-portably-using-env.html)

**man or help:**
- `env`
- `cut`
- `for`
- `while`
- `until`
- `if`

# Learning Objectives
<details>
<summary><h3>How to create SSH keys</h3></summary>
</details>

<details>
<summary><h3>What is the advantage of using <code>#!/usr/bin/env bash</code> over <code>#!/bin/bash</code></h3></summary>
</details>

<details>
<summary><h3>How to use <code>while</code>, <code>until</code> and <code>for</code> loops</h3></summary>
</details>

<details>
<summary><h3>How to use <code>if</code>, <code>else</code>, <code>elif</code> and <code>case</code> condition statements</h3></summary>
</details>

<details>
<summary><h3>How to use the <code>cut</code> command</h3></summary>
</details>

<details>
<summary><h3>What are files and other comparison operators, and how to use them</h3></summary>
</details>

# Requirements
<details>
<summary><h3>General</h3></summary>

- Allowed editors: `vi`, `vim`, `emacs`
- All your files will be interpreted on Ubuntu 20.04 LTS
- All your files should end with a new line
- A `README.md` file, at the root of the folder of the project, is mandatory
- All your Bash script files must be executable
- You are not allowed to use `awk`
- Your Bash script must pass `Shellcheck` (version `0.7.0`) without any error
- The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
- The second line of all your Bash scripts should be a comment explaining what is the script doing
</details>

# More Info
<details>
<summary><h3>Shellcheck</h3></summary>

[Shellcheck](https://github.com/koalaman/shellcheck) is a tool that will help you write proper Bash scripts. It will make recommendations on your syntax and semantics and provide advice on edge cases that you might not have thought about. `Shellcheck` is your friend! **All your Bash scripts must pass `Shellcheck` without any error or you will not get any points on the task**.

`Shellcheck` is available on the school’s computers. If you want to use it on your own computer, here is how to [install it](https://github.com/koalaman/shellcheck#installing).

Examples:

Not passing `Shellcheck`:

<img width=800px src="https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/251/Vxotqyj.png">

Passing `Shellcheck`:

<img width=800px src="https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/251/ubHWxDU.png">

For every feedback, Shellcheck will provide a code that you can use to get more information about the issue, for example for code `SC2034`, you can browse https://github.com/koalaman/shellcheck/wiki/SC2034.
</details>

# Tasks
<details>
<summary>

### 0. 0. Create a SSH RSA key pair
`mandatory`

File: [0-RSA_public_key.pub]()
</summary>

Read for this task:

-   [Linux and Mac OS users](https://askubuntu.com/questions/61557/how-do-i-set-up-ssh-authentication-keys)
-   [Windows users](https://docs.rackspace.com/docs/generating-rsa-keys-with-ssh-puttygen)

man: `ssh-keygen`

You will soon have to manage your own **servers** concept page hosted on remote [data centers](https://www.youtube.com/watch?v=iuqXFC_qIvA&feature=youtu.be&t=46). We need to set them up with your RSA public key so that you can access them via SSH.

Create a RSA key pair.

Requirements:

-   Share your **public key** in your answer file `0-RSA_public_key.pub`
-   Fill the `SSH public key` field of your [intranet profile](https://alx-intranet.hbtn.io/rltoken/qsaEQ3ZWrgs-zoueDpXpPA "intranet profile") with the public key you just generated
-   **Keep the private key to yourself in a secure location**, you will use it later to connect to your servers using SSH. Some storing ideas are Dropbox, Google Drive, password manager, USB key. Failing to do so will prevent you to access your servers, which will prevent you from doing your projects
-   If you decide to add a passphrase to your key, make sure to save this passphrase in a secure location, you will not be able to use your keys without the passphrase

SSH and RSA keys will be covered in depth in a later project.
</details>

<details>
<summary>

### 1. For Best School loop
`mandatory`

File: [1-for_best_school]()
</summary>

Write a Bash script that displays `Best School` 10 times.

Requirement:

-   You must use the `for` loop (`while` and `until` are forbidden)

```bash
sylvain@ubuntu$ head -n 2 1-for_best_school
#!/usr/bin/env bash
# This script is displaying "Best School" 10 times
sylvain@ubuntu$ ./1-for_best_school
Best School
Best School
Best School
Best School
Best School
Best School
Best School
Best School
Best School
Best School
sylvain@ubuntu$

```

Note that:

-   The first line of my Bash script starts with `#!/usr/bin/env bash`
-   The second line of my Bash scripts is a comment explaining what it is doing
</details>

<details>
<summary>

### 2. While Best School loop
`mandatory`

File: [2-while_best_school]()
</summary>

Write a Bash script that displays `Best School` 10 times.

Requirements:

-   You must use the `while` loop (`for` and `until` are forbidden)

```bash
sylvain@ubuntu$ ./2-while_best_school
Best School
Best School
Best School
Best School
Best School
Best School
Best School
Best School
Best School
Best School
sylvain@ubuntu$

```
</details>

<details>
<summary>

### 3. Until Best School loop
`mandatory`

File: [3-until_best_school]()
</summary>

Write a Bash script that displays `Best School` 10 times.

Requirements:

-   You must use the `until` loop (`for` and `while` are forbidden)

```bash
sylvain@ubuntu$ ./3-until_best_school
Best School
Best School
Best School
Best School
Best School
Best School
Best School
Best School
Best School
Best School
sylvain@ubuntu$

```
</details>

<details>
<summary>

### 4. If 9, say Hi!
`mandatory`

File: [4-if_9_say_hi]()
</summary>

Write a Bash script that displays `Best School` 10 times, but for the 9th iteration, displays `Best School` *and then* `Hi` on a new line.

Requirements:

-   You must use the `while` loop (`for` and `until` are forbidden)
-   You must use the `if` statement

```bash
sylvain@ubuntu$ ./4-if_9_say_hi
Best School
Best School
Best School
Best School
Best School
Best School
Best School
Best School
Best School
Hi
Best School
sylvain@ubuntu$

```
</details>

<details>
<summary>

### 5. 4 bad luck, 8 is your chance 
`mandatory`

File: [5-4_bad_luck_8_is_your_chance]()
</summary>

Write a Bash script that loops from 1 to 10 and:

-   displays `bad luck` for the 4th loop iteration
-   displays `good luck` for the 8th loop iteration
-   displays `Best School` for the other iterations

Requirements:

-   You must use the `while` loop (`for` and `until` are forbidden)
-   You must use the `if`, `elif` and `else` statements

```bash
sylvain@ubuntu$ ./5-4_bad_luck_8_is_your_chance
Best School
Best School
Best School
bad luck
Best School
Best School
Best School
good luck
Best School
Best School
sylvain@ubuntu$

```
</details>

<details>
<summary>

### 6. Superstitious numbers
`mandatory`

File: [6-superstitious_numbers]()
</summary>


</details>

<details>
<summary>

### 7. Clock
`mandatory`

File: [7-clock]()
</summary>


</details>

<details>
<summary>

### 8. For ls
`mandatory`

File: [8-for_ls]()
</summary>


</details>

<details>
<summary>

### 9. To file, or not to file
`mandatory`

File: [9-to_file_or_not_to_file]()
</summary>


</details>

<details>
<summary>

### 10. FizzBuzz
`#advanced`

File: [10-fizzbuzz]()
</summary>


</details>

<details>
<summary>

### 11. Read and cut
`#advanced`

File: [100-read_and_cut]()
</summary>


</details>

<details>
<summary>

### 12. Tell the story of passwd
`#advanced`

File: [101-tell_the_story_of_passwd]()
</summary>


</details>

<details>
<summary>

### 13. Let's parse Apache logs
`#advanced`

File: [102-lets_parse_apache_logs]()
</summary>


</details>

<details>
<summary>

### 14. Dig the data
`#advanced`

File: [103-dig_the-data]()
</summary>


</details>
