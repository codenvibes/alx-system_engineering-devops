<h1 align="center"><b>0x0B. SSH</b></h1>
<div align="center"><code>DevOps</code> <code>SSH</code> <code>Network</code> <code>SysAdmin</code> <code>Security</code></div>

## Background Context
<img src="https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/244/zPVRKhPsUP5lK.gif">

Along with this project, you have been attributed an Ubuntu server, living in a datacenter far far away. Like level 2 of the application process, you will connect using `ssh`. But contrary to level 2, you will not connect using a password but an RSA key. We’ve configured your server with the public key you created in the first task of [a previous project](https://intranet.alxswe.com/tasks/1223) shared in your [intranet profile](https://intranet.alxswe.com/users/my_profile).

You can access your server information in the [my servers](https://intranet.alxswe.com/servers) section of the intranet, each line with contains the IP and username you should use to connect via `ssh`.

**Note**: Your server is configured with an Ubuntu 20.04 LTS environment.

<br>

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

<br>

## Learning Objectives
<details>
<summary><b><a href=" "> </a>What is a server</b></summary><br>

***A server is a piece of computer hardware or software (computer program) that provides functionality for other programs or devices, called "clients"***

<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>Where servers usually live</b></summary><br>

Servers can "live" in a variety of places, depending on the context:

1. **Data Centers:** Many servers are housed in data centers, which are facilities specifically designed to store and manage large numbers of servers. Data centers provide the necessary infrastructure, such as power, cooling, and security, to ensure that servers operate reliably.

2. **Cloud Services:** With the rise of cloud computing, servers are often hosted by cloud service providers like Amazon Web Services (AWS), Microsoft Azure, or Google Cloud Platform (GCP). These providers maintain massive data centers around the world and offer server hosting as a service.

3. **On-Premises:** Some organizations maintain their own on-premises server rooms or data centers. These servers are physically located within the organization's facilities and are managed by their internal IT teams.

4. **Edge Computing:** In edge computing, servers are placed closer to the location where data is generated or needed. This can include servers in remote locations, at the "edge" of the network, to reduce latency and improve performance for applications that require real-time processing.

5. **Hybrid Environments:** Many organizations use a combination of on-premises servers, servers hosted in the cloud, and edge servers, creating a hybrid environment that suits their specific needs.

The choice of where to host servers depends on factors like cost, performance, security, and the specific requirements of the applications and services they support.

<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>What is SSH</b></summary><br>

SSH stands for Secure Shell. It's a cryptographic network protocol that allows secure communication between two computers over an insecure network. SSH is widely used for secure remote access to systems and for executing commands on a remote machine. Here are some key aspects of SSH:

1. **Secure Communication:** SSH provides a secure channel over an unsecured network by encrypting the communication between the client and server. This encryption helps protect the confidentiality and integrity of the data being transmitted.

2. **Authentication:** SSH uses cryptographic keys (public and private key pairs) for authentication. When a client attempts to connect to a server using SSH, the server can verify the client's identity using its public key, and the client can verify the server's identity using its public key. This helps prevent man-in-the-middle attacks.

3. **Remote Access:** One of the primary uses of SSH is remote access to systems. Users can log in to a remote machine using an SSH client and execute commands as if they were sitting at the remote system's console.

4. **File Transfer:** SSH can also be used for secure file transfer using utilities like SCP (Secure Copy Protocol) and SFTP (Secure File Transfer Protocol). These utilities allow users to securely transfer files between systems over an SSH connection.

5. **Tunneling:** SSH supports tunneling, which allows users to create secure channels for other network services (such as web browsing or database access) through an SSH connection. This feature can be used to secure traffic that would otherwise be sent in plaintext over the network.

<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>How to create an SSH RSA key pair</b></summary><br>

You can create an SSH RSA key pair using the `ssh-keygen` command, which is a standard tool for generating SSH keys. Here's how you can do it:

1. **Open a Terminal or Command Prompt:** On your local machine, open a terminal window or a command prompt. This process is typically the same whether you're using macOS, Linux, or Windows (with the Windows Subsystem for Linux or a third-party SSH client like PuTTY).

2. **Run the `ssh-keygen` Command:** Type the following command and press Enter:

   ```
   ssh-keygen -t rsa
   ```

   This command tells `ssh-keygen` to create a new RSA key pair. You can also specify a different key type with the `-t` option (e.g., `ed25519` for Ed25519 keys).

3. **Specify the File Location:** `ssh-keygen` will prompt you to specify a file location to save the keys. You can press Enter to accept the default location, which is typically `~/.ssh/id_rsa` for the private key and `~/.ssh/id_rsa.pub` for the public key on Unix-based systems. On Windows, the default location might be different.

4. **Set a Passphrase (Optional):** You can choose to set a passphrase for your private key. This passphrase adds an extra layer of security, as it will be required every time you use the key. If you choose to set a passphrase, you'll be prompted to enter it twice.

5. **Verify the Key Generation:** Once you've completed the steps, `ssh-keygen` will generate your RSA key pair. It will display the location of the keys and some random art for the public key. You can find your private key in the location you specified and the public key in the same location with a `.pub` extension.

Your SSH RSA key pair is now generated and ready to use. You can use the public key (`id_rsa.pub`) to authenticate with SSH servers that you want to access, and the private key (`id_rsa`) will be used for authentication from your local machine. Remember to keep your private key secure and never share it with anyone else.

<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>How to connect to a remote host using an SSH RSA key pair</b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>The advantage of using <code>#!/usr/bin/env bash</code> instead of <code>/bin/bash</code></b></summary><br>

Using `#!/usr/bin/env bash` instead of specifying the absolute path like `/bin/bash` in a shebang line has several advantages:

1. **Portability:**
   - `env` (short for "environment") is a command that searches the user's `PATH` environment variable for the specified command (`bash` in this case). This means that using `#!/usr/bin/env bash` makes your script more portable across different systems. It can find the appropriate `bash` executable, even if it's not located in the same path on every system.

2. **Avoid Hard-Coding Paths:**
   - Hard-coding the path to the `bash` interpreter (e.g., `/bin/bash`) may lead to issues if the script is run on a system where `bash` is located in a different directory. Using `env` allows the system to locate the correct interpreter based on the user's environment.

3. **User Preferences:**
   - Some users prefer to use a different shell or have a custom setup where `bash` is located in a non-standard directory. Using `env` respects the user's preferences and uses the first `bash` executable found in their `PATH`.

4. **Avoid Version Issues:**
   - Different systems may have different versions of `bash` installed in different locations. Using `env` allows the system to use the user's preferred version of `bash` without hard-coding a specific path.

5. **Easier Updates:**
   - If `bash` is updated or moved to a different location on the system, scripts using `#!/usr/bin/env bash` will automatically use the updated version without requiring modifications to the script.

It's important to note that while using `env` has these advantages, it also comes with a slight performance cost, as it involves an additional process to locate the interpreter. However, for most scripts, this difference in performance is negligible compared to the benefits of increased portability and adaptability.

<br><p align="center">※※※※※※※※※※※※</p><br>
</details>

<br>

## Requirements
- Allowed editors: `vi`, `vim`, `emacs`
- All your files will be interpreted on Ubuntu 20.04 LTS
- All your files should end with a new line
- A `README.md` file, at the root of the folder of the project, is mandatory
- All your Bash script files must be executable
- The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
- The second line of all your Bash scripts should be a comment explaining what is the script doing

<br>

## Tasks
<details>
<summary>

### 0. Use a private key
`mandatory`

File: [0-use_a_private_key](https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x0B-ssh/0-use_a_private_key)
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

File: [1-create_ssh_key_pair](https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x0B-ssh/1-create_ssh_key_pair)
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

File: [2-ssh_config](https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x0B-ssh/2-ssh_config)
</summary>

Your machine has an SSH configuration file for the local SSH client, let’s configure it to our needs so that you can connect to a server without typing a password. Share your SSH client configuration in your answer file.

Requirements:

- Your SSH client configuration must be configured to use the private key `~/.ssh/school`
- Your SSH client configuration must be configured to refuse to authenticate using a password

Example:
```
sylvain@ubuntu$ ssh -v ubuntu@98.98.98.98
OpenSSH_6.6.1, OpenSSL 1.0.1f 6 Jan 2014
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 47: Applying options for *
debug1: Connecting to 98.98.98.98 port 22.
debug1: Connection established.
debug1: identity file /home/sylvain/.ssh/school type -1
debug1: identity file /home/sylvain/.ssh/school-cert type -1
debug1: Enabling compatibility mode for protocol 2.0
debug1: Local version string SSH-2.0-OpenSSH_8.1
debug1:Remote protocol version 2.0, remote software version OpenSSH_7.6p1 Ubuntu-4ubuntu0.5
debug1: match: OpenSSH_7.6p1 Ubuntu-4ubuntu2.1 pat OpenSSH* compat 0x04000000
debug1: SSH2_MSG_KEXINIT sent
debug1: SSH2_MSG_KEXINIT received
debug1: kex: server->client aes128-ctr hmac-sha1-etm@openssh.com none
debug1: kex: client->server aes128-ctr hmac-sha1-etm@openssh.com none
debug1: sending SSH2_MSG_KEX_ECDH_INIT
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
debug1: Server host key: ECDSA bd:03:f8:6a:12:28:d6:17:85:c1:b6:91:f1:da:0f:37
debug1: Host '98.98.98.98' is known and matches the ECDSA host key.
debug1: Found key in /home/sylvain/.ssh/known_hosts:1
debug1: ssh_ecdsa_verify: signature correct
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug1: SSH2_MSG_NEWKEYS received
debug1: SSH2_MSG_SERVICE_REQUEST sent
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug1: Authentications that can continue: publickey,password
debug1: Next authentication method: publickey
debug1: Trying private key: /home/sylvain/.ssh/school
debug1: key_parse_private2: missing begin marker
debug1: read PEM private key done: type RSA
debug1: Authentication succeeded (publickey).
Authenticated to 98.98.98.98 ([98.98.98.98]:22).
debug1: channel 0: new [client-session]
debug1: Requesting no-more-sessions@openssh.com
debug1: Entering interactive session.
debug1: client_input_global_request: rtype hostkeys-00@openssh.com want_reply 0
debug1: Sending environment.
debug1: Sending env LANG = en_US.UTF-8
ubuntu@magic-server:~$
```
In the example above, we can see that `ssh` tries to authenticate using `school` and does not try to authenticate using a password. You can replace `98.98.98.98` by the IP of your server for testing purposes.

</details>

<details>
<summary>

### 3. Let me in!
`mandatory`
</summary>

Now that you have successfully connected to your server, we would also like to join the party.

Add the SSH public key below to your server so that we can connect using the `ubuntu` user.
```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNdtrNGtTXe5Tp1EJQop8mOSAuRGLjJ6DW4PqX4wId/Kawz35ESampIqHSOTJmbQ8UlxdJuk0gAXKk3Ncle4safGYqM/VeDK3LN5iAJxf4kcaxNtS3eVxWBE5iF3FbIjOqwxw5Lf5sRa5yXxA8HfWidhbIG5TqKL922hPgsCGABIrXRlfZYeC0FEuPWdr6smOElSVvIXthRWp9cr685KdCI+COxlj1RdVsvIo+zunmLACF9PYdjB2s96Fn0ocD3c5SGLvDOFCyvDojSAOyE70ebIElnskKsDTGwfT4P6jh9OBzTyQEIS2jOaE5RQq4IB4DsMhvbjDSQrP0MdCLgwkN
```

</details>

<details>
<summary>

### 4. Client configuration file (w/ Puppet)
`#advanced`

File: [100-puppet_ssh_config.pp](https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x0B-ssh/100-puppet_ssh_config.pp)
</summary>

Let’s practice using Puppet to make changes to our configuration file. Just as in the previous configuration file task, we’d like you to set up your client SSH configuration file so that you can connect to a server without typing a password.

Requirements:

- Your SSH client configuration must be configured to use the private key `~/.ssh/school`
- Your SSH client configuration must be configured to refuse to authenticate using a password

Example:
```
vagrant@ubuntu:~$ sudo puppet apply 100-puppet_ssh_config.pp
Notice: Compiled catalog for ubuntu-xenial in environment production in 0.11 seconds
Notice: /Stage[main]/Main/File_line[Turn off passwd auth]/ensure: created
Notice: /Stage[main]/Main/File_line[Declare identity file]/ensure: created
Notice: Finished catalog run in 0.03 seconds
vagrant@ubuntu:~$
```

</details>

