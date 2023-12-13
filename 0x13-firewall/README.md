<h1 align="center"><b>0x13. FIREWALL</b></h1>
<div align="center"><code>DevOps</code> <code>SysAdmin</code> <code>Security</code></div>

<br>

## Concepts
<details>
<summary><b><a href="https://intranet.alxswe.com/concepts/68">Web stack debugging</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>

<br><div align="center"><img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x13-firewall/images/V1HjQ1Y.png"></div>


<br>

## Background Context
### Your servers without a firewall…
<br><div><img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x13-firewall/images/holbertonschool-firewall.gif"></div>

<br>

## Resources
<details>
<summary><b><a href="https://en.wikipedia.org/wiki/Firewall_%28computing%29">What is a firewall</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>



<!-- <br>

**man or help:**
- `` -->

<br>

## More Info
As explained in the **web stack debugging guide** concept page, `telnet` is a very good tool to check if sockets are open with `telnet IP PORT`. For example, if you want to check if port 22 is open on `web-02`:
```
sylvain@ubuntu$ telnet web-02.holberton.online 22
Trying 54.89.38.100...
Connected to web-02.holberton.online.
Escape character is '^]'.
SSH-2.0-OpenSSH_6.6.1p1 Ubuntu-2ubuntu2.8

Protocol mismatch.
Connection closed by foreign host.
sylvain@ubuntu$
```
We can see for this example that the connection is successful: `Connected to web-02.holberton.online.`

Now let’s try connecting to port 2222:
```
sylvain@ubuntu$ telnet web-02.holberton.online 2222
Trying 54.89.38.100...
^C
sylvain@ubuntu$
```
We can see that the connection never succeeds, so after some time I just use `ctrl+c` to kill the process.

This can be used not just for this exercise, but for any debugging situation where two pieces of software need to communicate over sockets.

Note that the school network is filtering outgoing connections (via a network-based firewall), so you might not be able to interact with certain ports on servers outside of the school network. To test your work on `web-01`, please perform the test from outside of the school network, like from your `web-02` server. If you SSH into your `web-02` server, the traffic will be originating from `web-02` and not from the school’s network, bypassing the firewall.

<br>

## Warning!
**Containers on demand cannot be used for this project (Docker container limitation)**

**Be very careful with firewall rules! For instance, if you ever deny port `22/TCP` and log out of your server, you will not be able to reconnect to your server via SSH, and we will not be able to recover it. When you install UFW, port 22 is blocked by default, so you should unblock it immediately before logging out of your server.**


<br>

## Quiz questions
<details>
<summary><b>Question 0</b></summary><br>

What is the main function of a firewall?
- [ ] To filter incoming and outgoing TCP traffic
- [ ] To filter outgoing traffic
- [x] To filter incoming and outgoing network traffic
<br>
</details>

<details>
<summary><b>Question 1</b></summary><br>

What is a firewall?
- [x] A hardware or software security system
- [ ] A software security system
- [ ] A hardware security system
<br>
</details>

<details>
<summary><b>Question 2</b></summary><br>

What is the main function of a firewall?
- [ ] To filter incoming and outgoing TCP traffic
- [ ] To filter outgoing traffic
- [x] To filter incoming and outgoing network traffic
<br>
</details>

<details>
<summary><b>Question 3</b></summary><br>

What is a firewall?
- [x] A hardware or software security system
- [ ] A software security system
- [ ] A hardware security system
<br>
</details>

<details>
<summary><b>Question 4</b></summary><br>

What are the 2 types of firewall?
- [ ] Incoming and outgoing firewall
- [x] Network and host-based firewall
- [ ] Soft and hard firewall
<br>
</details>

<details>
<summary><b>Question 5</b></summary><br>

What are the 2 types of firewall:
- [ ] Incoming and outgoing firewall
- [x] Network and host-based firewall
- [ ] Soft and hard firewall
<br>
</details>

<br>

## Tasks
<details>
<summary>

### 0. Block all incoming traffic but
`mandatory`

File: [0-block_all_incoming_traffic_but]()
</summary>

Let’s install the `ufw` firewall and setup a few rules on `web-01`.

Requirements:

- The requirements below must be applied to `web-01` (feel free to do it on `lb-01` and `web-02`, but it won’t be checked)
- Configure `ufw` so that it blocks all incoming traffic, except the following TCP ports:
    - `22` (SSH)
    - `443` (HTTPS SSL)
    - `80` (HTTP)
- Share the `ufw` commands that you used in your answer file
</details>

<details>
<summary>

### 1. Port forwarding
`#advanced`

File: [100-port_forwarding]()
</summary>


</details>

