<h1 align="center"><b>0x07. NETWORKING BASICS #0</b></h1>
<div align="center"><code>DevOps</code> <code>Network</code></div>

<!-- # Background Context -->

# Resources
<details>
<summary><b><a href="https://en.wikipedia.org/wiki/OSI_model">[OSI model]<a></b></summary>


</details>

<details>
<summary><b><a href="https://www.lifewire.com/lans-wans-and-other-area-networks-817376">[Different types of network]<a></b></summary>


</details>

<details>
<summary><b><a href="https://en.wikipedia.org/wiki/Local_area_network">[LAN network]<a></b></summary>


</details>

<details>
<summary><b><a href="https://en.wikipedia.org/wiki/Wide_area_network">[WAN network]<a></b></summary>


</details>

<details>
<summary><b><a href="https://en.wikipedia.org/wiki/Internet">[Internet]<a></b></summary>


</details>

<details>
<summary><b><a href="https://whatismyipaddress.com/mac-address">[MAC address]<a></b></summary>


</details>

<details>
<summary><b><a href="https://www.bleepingcomputer.com/tutorials/ip-addresses-explained/">[What is an IP address]<a></b></summary>


</details>

<details>
<summary><b><a href="https://www.iplocation.net/public-vs-private-ip-address">[Private and public address]<a></b></summary>


</details>

<details>
<summary><b><a href="https://www.webopedia.com/insights/ipv6-ipv4-difference/">[IPv4 and IPv6]<a></b></summary>


</details>

<details>
<summary><b><a href="https://en.wikipedia.org/wiki/Localhost">[Localhost]<a></b></summary>


</details>

<details>
<summary><b><a href="https://www.howtogeek.com/190014/htg-explains-what-is-the-difference-between-tcp-and-udp/">[TCP and UDP]<a></b></summary><br>

TCP (Transmission Control Protocol) and UDP (User Datagram Protocol) are two of the most commonly used transport layer protocols in computer networking. They both serve the purpose of transmitting data over networks, but they do so in different ways, each with its own advantages and disadvantages. Here's an overview of TCP and UDP:

**TCP (Transmission Control Protocol):**

1. **Connection-Oriented:** TCP is a connection-oriented protocol, which means it establishes a reliable connection between the sender and receiver before data transfer begins. This connection is maintained until all data is successfully delivered.

2. **Reliable:** TCP ensures that data is delivered accurately and in the correct order. It employs error detection, retransmission of lost or corrupted packets, and flow control mechanisms to guarantee reliable data transmission.

3. **Ordered:** TCP guarantees that the data sent from one end is received in the same order by the other end. This is important for applications like web browsing and file transfers where data integrity and order matter.

4. **Slower:** Due to its reliability mechanisms and connection setup, TCP can introduce some latency and overhead. It may not be as suitable for real-time applications with strict latency requirements.

5. **Examples of TCP Applications:** HTTP (Hypertext Transfer Protocol) for web browsing, FTP (File Transfer Protocol), SMTP (Simple Mail Transfer Protocol) for email, and many other applications that require reliable data delivery.

**UDP (User Datagram Protocol):**

1. **Connectionless:** UDP is a connectionless protocol, meaning it doesn't establish a connection before transmitting data. It's a "fire and forget" protocol, where data is sent without any confirmation of receipt.

2. **Unreliable:** Unlike TCP, UDP does not guarantee the delivery of data packets. It doesn't have mechanisms for error correction or retransmission of lost packets.

3. **Faster:** Because UDP lacks the overhead of connection setup and error handling, it is generally faster and more suitable for real-time applications that can tolerate some packet loss, such as online gaming and video streaming.

4. **No Ordered Delivery:** UDP does not ensure the order in which data packets are delivered. If order matters for an application, it needs to handle sequencing at a higher layer.

5. **Examples of UDP Applications:** VoIP (Voice over Internet Protocol), online gaming, streaming media (e.g., video and audio), DNS (Domain Name System) for domain name resolution, and other real-time applications.

In summary, TCP is preferred for applications that require reliable and ordered data delivery, while UDP is more suitable for applications where speed and low latency are critical, and some packet loss can be tolerated. The choice between TCP and UDP depends on the specific needs of the application or service being used.
</details>

<details>
<summary><b><a href="https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers">[TCP/UDP ports List]<a></b></summary>


</details>

<details>
<summary><b><a href="https://en.wikipedia.org/wiki/Ping_%28networking_utility%29">[What is ping /ICMP]<a></b></summary>


</details>

<details>
<summary><b><a href="https://www.adminschoice.com/bash-positional-parameters">[Positional parameters]<a></b></summary>


</details>

<br>

**man or help:**
- `netstat`
- `ping`

# Learning Objectives

<details>
<summary><b><a href="">OSI Model</a></b></summary><br>
    <ul>
        <li>What it is</li>
        <li>How many layers it has</li>
        <li>How it is organized</li>
    </ul>
</details>

<details>
<summary><b><a href="">What is a LAN</a></b></summary><br>
    <ul>
        <li>Typical usage</li>
        <li>Typical geographical size</li>
    </ul>
</details>

<details>
<summary><b><a href="">What is a WAN</a></b></summary><br>
    <ul>
        <li>Typical usage</li>
        <li>Typical geographical size</li>
    </ul>
</details>

<details>
<summary><b><a href="">What is the Internet</a></b></summary><br>
    <ul>
        <li>What is an IP address</li>
        <li>What are the 2 types of IP address</li>
        <li>What is <code>localhost</code></li>
        <li>What is a subnet</li>
        <li>Why IPv6 was created</li>
    </ul>
</details>

<details>
<summary><b><a href="">TCP/UDP</a></b></summary><br>
    <ul>
        <li>What are the 2 mainly used data transfer protocols for IP (transfer level on the OSI schema)</li>
        <li>What is the main difference between TCP and UDP</li>
        <li>What is a port</li>
        <li>Memorize SSH, HTTP and HTTPS port numbers</li>
        <li>What tool/protocol is often used to check if a device is connected to a network</li>
    </ul>
</details>

# Requirements
- Allowed editors: `vi`, `vim`, `emacs`
- All your Bash script files will be interpreted on Ubuntu 20.04 LTS
- All your files should end with a new line
- A `README.md` file, at the root of the folder of the project, is mandatory
- All your Bash script files must be executable
- Your Bash script must pass `shellcheck` without any error
- The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
- The second line of all your Bash scripts should be a comment explaining what is the script doing

# More Info
The second line of all your Bash scripts should be a comment explaining what is the script doing

For multiple choice question type tasks, just type the number of the correct answer in your answer file, add a new line for every new answer, example:

What is the most important position in a software company?
1. Project manager
2. Backend developer
3. System administrator
```bash
sylvain@ubuntu$ cat foo_answer_file
3
sylvain@ubuntu$
```
Source for question 1 [here](https://twitter.com/devopsreact/status/831922429215662080)

# Tasks
<details>
<summary>

### 0. OSI model
`mandatory`

File: [0-OSI_model]()
</summary>

OSI (Open Systems Interconnection) is an abstract model to describe layered communication and computer network design. The idea is to segregate the different parts of what make communication possible.

It is organized from the lowest level to the highest level:

-   The lowest level: layer 1 which is for transmission on physical layers with electrical impulse, light or radio signal
-   The highest level: layer 7 which is for application specific communication like SNMP for emails, HTTP for your web browser, etc

Keep in mind that the OSI model is a concept, it's not even tangible. The OSI model doesn't perform any functions in the networking process. It is a conceptual framework so we can better understand complex interactions that are happening. Most of the functionality in the OSI model exists in all communications systems.

<img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x07-networking_basics/pics/task0a.png">

In this project we will mainly focus on:

-   The Transport layer and especially TCP/UDP
-   On the Network layer with IP and ICMP

The image bellow describes more concretely how you can relate to every level.

<img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x07-networking_basics/pics/task0b.jpg">

Questions:

What is the OSI model?
- [ ] 1.  Set of specifications that network hardware manufacturers must respect
- [x] 2.  The OSI model is a conceptual model that characterizes the communication functions of a telecommunication system without regard to their underlying internal structure and technology
- [ ] 3.  The OSI model is a model that characterizes the communication functions of a telecommunication system with a strong regard for their underlying internal structure and technology

How is the OSI model organized?

- [ ] 1.  Alphabetically
- [x] 2.  From the lowest to the highest level
- [ ] 3.  Randomly
</details>

<details>
<summary>

### 1. Types of network
`mandatory`

File: [1-types_of_network]()
</summary>

<img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x07-networking_basics/pics/task1.jpg">

LAN connect local devices together, WAN connects LANs together, and WANs are operating over the Internet.

Questions:

What type of network a computer in local is connected to?

- [ ] 1.  Internet
- [ ] 2.  WAN
- [x] 3.  LAN

What type of network could connect an office in one building to another office in a building a few streets away?

- [ ] 1.  Internet
- [x] 2.  WAN
- [ ] 3.  LAN

What network do you use when you browse www.google.com from your smartphone (not connected to the Wifi)?

- [x] 1.  Internet
- [ ] 2.  WAN
- [ ] 3.  LAN
</details>

<details>
<summary>

### 2. MAC and IP address
`mandatory`

File: [2-MAC_and_IP_address]()
</summary>

<img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x07-networking_basics/pics/task2.jpg">

Questions:

What is a MAC address?

- [ ] 1.  The name of a network interface
- [x] 2.  The unique identifier of a network interface 
- [ ] 3.  A network interface

What is an IP address?

- [x] 1.  Is to devices connected to a network what postal address is to houses
- [ ] 2.  The unique identifier of a network interface
- [ ] 3.  Is a number that network devices use to connect to networks
</details>

<details>
<summary>

### 3. UDP and TCP
`mandatory`

File: [3-UDP_and_TCP]()
</summary>

<img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x07-networking_basics/pics/task3.jpg">

Let's fill the empty parts in the drawing above.

Questions:

-   Which statement is correct for the TCP box:
    - [x] 1.  `It is a protocol that is transferring data in a slow way but surely`
    - [ ] 2.  `It is a protocol that is transferring data in a fast way and might loss data along in the process`
-   Which statement is correct for the UDP box:
    - [ ] 1.  `It is a protocol that is transferring data in a slow way but surely`
    - [x] 2.  `It is a protocol that is transferring data in a fast way and might loss data along in the process`
-   Which statement is correct for the TCP worker:
    - [x] 1.  `Have you received boxes x, y, z?`
    - [ ] 2.  `May I increase the rate at which I am sending you boxes?`
</details>

<details>
<summary>

### 4. TCP and UDP ports
`mandatory`

File: [4-TCP_and_UDP_ports]()
</summary>

Once packets have been sent to the right network device using IP using either UDP or TCP as a mode of transportation, it needs to actually enter the network device.

If we continue the comparison of a network device to your house, where IP address is like your postal address, UDP and TCP ports are like the windows and doors of your place. A TCP/UDP network device has 65535 ports. Some of them are officially reserved for a specific usage, some of them are known to be used for a specific usage (but nothing is officially declared) and the rest are free of use.

While the full list of ports should not be memorized, it is important to know the most used ports, let's start by remembering 3 of them:

-   **22** for SSH
-   **80** for HTTP
-   **443** for HTTPS

Note that a specific [IP + port = socket](https://stackoverflow.com/questions/152457/what-is-the-difference-between-a-port-and-a-socket).

Write a Bash script that displays listening ports:

-   That only shows listening sockets
-   That shows the PID and name of the program to which each socket belongs

Example:

```bash
sylvain@ubuntu$ sudo ./4-TCP_and_UDP_ports
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 *:sunrpc                *:*                     LISTEN      518/rpcbind
tcp        0      0 *:ssh                   *:*                     LISTEN      1240/sshd
tcp        0      0 *:32938                 *:*                     LISTEN      547/rpc.statd
tcp6       0      0 [::]:sunrpc             [::]:*                  LISTEN      518/rpcbind
tcp6       0      0 [::]:ssh                [::]:*                  LISTEN      1240/sshd
tcp6       0      0 [::]:33737              [::]:*                  LISTEN      547/rpc.statd
udp        0      0 *:sunrpc                *:*                                 518/rpcbind
udp        0      0 *:691                   *:*                                 518/rpcbind
udp        0      0 localhost:723           *:*                                 547/rpc.statd
udp        0      0 *:60129                 *:*                                 547/rpc.statd
udp        0      0 *:3845                  *:*                                 562/dhclient
udp        0      0 *:bootpc                *:*                                 562/dhclient
udp6       0      0 [::]:47444              [::]:*                              547/rpc.statd
udp6       0      0 [::]:sunrpc             [::]:*                              518/rpcbind
udp6       0      0 [::]:50038              [::]:*                              562/dhclient
udp6       0      0 [::]:691                [::]:*                              518/rpcbind
Active UNIX domain sockets (only servers)
Proto RefCnt Flags       Type       State         I-Node   PID/Program name    Path
unix  2      [ ACC ]     STREAM     LISTENING     7724     518/rpcbind         /run/rpcbind.sock
unix  2      [ ACC ]     STREAM     LISTENING     6525     1/init              @/com/ubuntu/upstart
unix  2      [ ACC ]     STREAM     LISTENING     8559     835/dbus-daemon     /var/run/dbus/system_bus_socket
unix  2      [ ACC ]     STREAM     LISTENING     9190     1087/acpid          /var/run/acpid.socket
unix  2      [ ACC ]     SEQPACKET  LISTENING     7156     378/systemd-udevd   /run/udev/control
sylvain@ubuntu$

```
</details>

<details>
<summary>

### 5. Is the host on the network
`mandatory`

File: [5-is_the_host_on_the_network]()
</summary>

The Internet Control Message Protocol (ICMP) is a protocol in the Internet protocol suite. It is used by network devices, to check if other network devices are available on the network. The command `ping` uses ICMP to make sure that a network device remains online or to troubleshoot issues on the network.

Write a Bash script that pings an IP address passed as an argument.

Requirements:

-   Accepts a string as an argument
-   Displays `Usage: 5-is_the_host_on_the_network {IP_ADDRESS}` if no argument passed
-   Ping the IP 5 times

Example:

```bash
sylvain@ubuntu$ ./5-is_the_host_on_the_network 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=63 time=12.9 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=63 time=13.6 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=63 time=7.83 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=63 time=11.3 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=63 time=7.57 ms

--- 8.8.8.8 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4006ms
rtt min/avg/max/mdev = 7.570/10.682/13.679/2.546 ms
sylvain@ubuntu$
sylvain@ubuntu$ ./5-is_the_host_on_the_network
Usage: 5-is_the_host_on_the_network {IP_ADDRESS}
sylvain@ubuntu$

```

It is interesting to look at the `time` value, which is the time that it took for the ICMP request to go to the `8.8.8.8` IP and come back to my host. The IP `8.8.8.8` is owned by Google, and the quickest roundtrip between my computer and Google was 7.57 ms which is pretty fast, which is a sign that the network path between my computer and Google's datacenter is in good shape. A slow ping would indicate a slow network.

Next time you feel that your connection is slow, try the `ping` command to see what is going on!
</details>

