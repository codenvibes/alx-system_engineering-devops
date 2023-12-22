<h1 align="center"><b>0x0C. WEB SERVER</b></h1>
<div align="center"><code>DevOps</code> <code>SysAdmin</code></div>

<br>
<div align="center"><img width=80% src="https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/266/8Gu52Qv.png"></div>
<br>

<br>

> <h2>Notes</h2> <details><summary><b><a href="">What is virtualization?</a></b></summary><br>virtualization is creating multiple server instances on one physical system<br><br><p align="center">※※※※※※※※※※※※</p></details> <details><summary><b><a href="">What is a proxy?</a></b></summary><br>A proxy, short for "proxy server," is an intermediate server that acts as a gateway between a user's device (such as a computer or smartphone) and the internet. When you connect to the internet through a proxy, your requests for information or services are processed by the proxy server, which then forwards those requests to the destination server. The destination server sends the response back to the proxy, which, in turn, sends it back to your device.<br><br><p align="center">※※※※※※※※※※※※</p></details> <details><summary><b><a href="">Difference between a proxy and a vpn</a></b></summary><br>1. Encryption: VPNs encrypt all the data transmitted between the user's device and the VPN server, providing a high level of security. Proxies may not encrypt data, exposing it to potential interception. <br> 2. Scope: Proxies often work at the application or protocol level, while VPNs cover all internet traffic from the device. <br> 3. Anonymity and Security: VPNs generally provide a higher level of anonymity and security due to their encryption features. <br> 4. Use Cases: Proxies are often used for specific purposes like content filtering, caching, or hiding IP addresses, while VPNs are more versatile and are commonly used for overall privacy and security. <br><br> A proxy acts as an intermediary between a user and the internet, forwarding requests on behalf of the user. It can be used to bypass geo-restrictions or improve privacy, but it typically only works for specific applications or protocols. A VPN (Virtual Private Network), on the other hand, encrypts all the internet traffic from a device and routes it through a server in a chosen location, providing both security and privacy across all applications and protocols. While a proxy can provide some level of anonymity and access control, a VPN offers a more comprehensive solution for privacy and security. or organization.<br><br><p align="center">※※※※※※※※※※※※</p></details> <details><summary><b><a href="">Launching Ubuntu instances with Multipass</a></b></summary><br>- https://www.youtube.com/watch?v=Z91l6ZdQjhI<br>- Install Multipass - https://multipass.run/install<br><br><p align="center">※※※※※※※※※※※※</p></details>  <details><summary><b><a href="">Concurrency in Web Servers: How Multiple Clients Are Served Simultaneously</a></b></summary><br>When multiple clients request the same web resource (e.g., a web page, an image, or a script) from a web server, the server serves them concurrently using various mechanisms to handle the incoming requests. Here's a simplified rundown of what happens when multiple clients request the same web resource from a server:<br><br>1. Client Sends Request: Each client (web browser or application) sends a request to the web server for the desired resource. This request includes information like the URL of the resource, any required headers (such as cookies or authentication tokens), and the HTTP method (e.g., GET for retrieving a resource).<br>2. Server Receives Requests: The web server receives these requests and adds them to a queue to be processed.<br>3. Connection Handling: The server may use techniques like multiplexing or keep-alive connections to efficiently manage the TCP connections with the clients, allowing multiple requests to be handled over the same connection without the need to establish new connections for each request.<br>4. Request Processing: When a request reaches the front of the queue, the web server's parent process (or a master thread, in the case of multi-threaded servers) selects an available child process (or worker thread) from a pool of processes/threads to handle the request.<br>5. Child Process Handles Request: The selected child process is responsible for handling the client's request. This involves tasks like parsing the request, retrieving the requested resource from the file system or a database, processing any dynamic content (e.g., executing server-side scripts), and generating the response.<br>6. Response Generation: Once the requested resource has been processed, the child process constructs an HTTP response containing the resource (e.g., HTML content, image data) and any necessary headers (e.g., content type, caching directives).<br>7. Sending Response: The server sends the HTTP response back to the client over the established connection, completing the request-response cycle for that client.<br>8. Client Receives Response: Each client receives its respective HTTP response from the server and processes the received data (e.g., rendering HTML, displaying images).<br>9. Connection Closure: Depending on the HTTP headers and server settings, the server or client may close the connection after the response has been fully transmitted.<br><br>This process repeats for each client request, with the web server efficiently managing the allocation of resources (such as CPU time and memory) among the child processes/threads to ensure that multiple clients can be served concurrently without sacrificing performance or stability.<br><br><p align="center">※※※※※※※※※※※※</p></details>

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

The main role of a web server is to store, process, and deliver web pages to clients (usually web browsers) upon request. When a user types a web address (URL) into their browser or clicks a link, the browser sends a request to the web server hosting the corresponding website. The web server then processes this request, retrieves the requested web page (which may involve accessing databases or running scripts), and sends it back to the user's browser, which displays the page to the user. In addition to serving web pages, web servers can also handle tasks like processing form submissions, managing user sessions, and serving dynamic content generated by server-side scripts.

<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>What is a child process</b></summary><br>

In the context of a web server, the parent process is typically the main server process responsible for managing the overall operation of the server, including accepting incoming connections, spawning child processes to handle requests, and managing resources. ***The child processes, on the other hand, are the subprocesses created by the parent process to handle specific tasks***, such as serving web pages or processing requests.

Here are examples of parent and child processes in different web server environments:

1. **Apache HTTP Server:**
   - Parent Process: In Apache, the parent process is often referred to as the "httpd" process. This process is responsible for starting the server, listening for incoming connections, and managing the configuration of the server.
   - Child Processes: Apache can create multiple child processes, each of which handles incoming client requests. These child processes are responsible for serving web pages, running scripts, and handling other tasks required to fulfill client requests.

2. **Nginx:**
   - Parent Process: In Nginx, the parent process is the main Nginx server process that is responsible for coordinating the operation of the server.
   - Worker Processes: Nginx uses worker processes to handle incoming connections and requests. These worker processes are spawned by the main Nginx process and are responsible for serving content to clients.

3. **Node.js with Express:**
   - Parent Process: When running a Node.js server using the Express framework, the parent process is the Node.js process itself, which runs the server script.
   - Worker Processes (Clusters): In Node.js, you can use the built-in cluster module to create child processes (worker processes) that can handle incoming requests. Each worker process runs an instance of the server, allowing for better utilization of multi-core systems and improved concurrency.

Different web servers may implement child processes in various ways. For example, in the context of the Apache HTTP Server, child processes are often referred to as "worker processes" or "child threads," depending on the specific configuration and mode of operation. Similarly, in Nginx, child processes are used to handle incoming connections and requests.

<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href=" "> </a>Why web servers usually have a parent process and child processes</b></summary><br>

Web servers often use a parent-child process model for several reasons:

1. **Concurrency:** By having multiple child processes, a web server can handle multiple requests concurrently, allowing it to serve more clients simultaneously and improve overall responsiveness.

2. **Resource Management:** Child processes allow for better resource management. For example, each child process can handle a specific number of requests or connections, preventing any single process from becoming overwhelmed and ensuring that resources are distributed efficiently.

3. **Fault Isolation:** If a child process encounters an error or crashes, it typically does not affect the entire server. The parent process can continue to operate and spawn new child processes to handle incoming requests, minimizing the impact of individual failures.

4. **Scalability:** The parent-child model makes it easier to scale the web server by adding or removing child processes based on the current load. This scalability is crucial for handling varying levels of traffic and ensuring consistent performance.

5. **Security:** Child processes can be isolated from each other, providing a degree of security. If one child process is compromised, it is more difficult for an attacker to gain access to the entire server or other processes.

Overall, the parent-child process model is a commonly used approach in web servers because it provides a good balance of concurrency, scalability, fault tolerance, and security, making it well-suited for handling the demands of serving web content to a large number of clients.

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

A HTTP POST request is to
- [ ] delete data
- [x] submit data
- [ ] request data
</details>

<details>
<summary><h3>Question 2</h3></summary>

The main role of DNS is to
- [ ] name websites
- [ ] translate domain name into port
- [x] translate domain name into IP address
</details>

<details>
<summary><h3>Question 3</h3></summary>

A web server is
- [x] a software
- [ ] a physical machine
</details>

<details>
<summary><h3>Question 4</h3></summary>

What was one of the most important reason for which DNS was created
- [ ] to index the web
- [ ] to connect the Internet
- [x] because humans are not good at remembering long sequences of numbers (IP address)
</details>

<details>
<summary><h3>Question 5</h3></summary>

What is TTL within the context of DNS
- [ ] a time period for DNS maintenance
- [ ] a time period when DNS is not answering requests
- [x] a time period when DNS query results are cached
</details>

<details>
<summary><h3>Question 6</h3></summary>

A DNS A record translates to
- [ ] a domain
- [x] an IP
</details>

<details>
<summary><h3>Question 7</h3></summary>

A DNS CNAME record translates to
- [x] a domain
- [ ] an IP
</details>

<details>
<summary><h3>Question 8</h3></summary>

A HTTP GET request is to
- [ ] delete data
- [ ] submit data
- [x] request data
</details>

<details>
<summary><h3>Question 9</h3></summary>

The main role of a web server is to
- [ ] host files
- [x] serve static content
- [ ] serve dynamic content
</details>

## Tasks
<details>
<summary>

### 0. Transfer a file to your server
`mandatory`

File: [0-transfer_file]()
</summary>

Write a Bash script that transfers a file from our client to a server:

Requirements:

- Accepts 4 parameters
    1. The path to the file to be transferred
    2. The IP of the server we want to transfer the file to
    3. The username `scp` connects with
    4. The path to the SSH private key that `scp` uses
- Display `Usage: 0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY` if less than 3 parameters passed
- `scp` must transfer the file to the user home directory `~/`
- Strict host key checking must be disabled when using `scp`

Example:
```
sylvain@ubuntu$ ./0-transfer_file
Usage: 0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY
sylvain@ubuntu$
sylvain@ubuntu$ ssh ubuntu@8.8.8.8 -i /vagrant/sylvain 'ls ~/'
afile
sylvain@ubuntu$ 
sylvain@ubuntu$ touch some_page.html
sylvain@ubuntu$ ./0-transfer_file some_page.html 8.8.8.8 sylvain /vagrant/private_key
some_page.html                                     100%   12     0.1KB/s   00:00
sylvain@ubuntu$ ssh ubuntu@8.8.8.8 -i /vagrant/private_key 'ls ~/'
afile
some_page.html
sylvain@ubuntu$
```
In this example, I:
- remotely execute the `ls ~/` command via `ssh` to see what `~/` contains
- create a file named `some_page.html`
- execute my `0-transfer_file` script
- remotely execute the `ls ~/` command via `ssh` to see that the file `some_page.html` has been successfully transferred
That is one way of publishing your website pages to your server.
</details>

<details>
<summary>

### 1. Install nginx web server
`mandatory`

File: [1-install_nginx_web_server]()
</summary>

Readme:
- [-y on apt-get command](https://askubuntu.com/questions/672892/what-does-y-mean-in-apt-get-y-install-command)

Web servers are the piece of software generating and serving HTML pages, let’s install one!

Requirements:

- Install `nginx` on your `web-01`
- server
- Nginx should be listening on port 80
- When querying Nginx at its root `/` with a GET request (requesting a page) using `curl`, it must return a page that contains the string `Hello World!`
- As an answer file, write a Bash script that configures a new Ubuntu machine to respect above requirements (this script will be run on the server itself)
- You can’t use `systemctl` for restarting `nginx`

Server terminal:
```
root@sy-web-01$ ./1-install_nginx_web_server > /dev/null 2>&1
root@sy-web-01$ 
root@sy-web-01$ curl localhost
Hello World!
root@sy-web-01$ 
```
Local terminal:
```
sylvain@ubuntu$ curl 34.198.248.145/
Hello World!
sylvain@ubuntu$ curl -sI 34.198.248.145/
HTTP/1.1 200 OK
Server: nginx/1.4.6 (Ubuntu)
Date: Tue, 21 Feb 2017 23:43:22 GMT
Content-Type: text/html
Content-Length: 30
Last-Modified: Tue, 21 Feb 2017 07:21:32 GMT
Connection: keep-alive
ETag: "58abea7c-1e"
Accept-Ranges: bytes

sylvain@ubuntu$
```
In this example `34.198.248.145` is the IP of my `web-01` server. If you want to query the Nginx that is locally installed on your server, you can use `curl 127.0.0.1`.

If things are not going as expected, make sure to check out Nginx logs, they can be found in `/var/log/`.

**Maarten’s PRO-tip**: When you use `sudo su` on your web-01 you can become root like this to test your file:
```
sylvain@ubuntu$ sudo su
root@ubuntu#
```
</details>

<details>
<summary>

### 2. Setup a domain name
`mandatory`

File: [2-setup_a_domain_name]()
</summary>

[.TECH Domains](https://get.tech/) is one of the top domain providers. They are known for the stability and quality of their DNS hosting solution. We partnered with .TECH Domains so that you can learn about DNS.

.TECH Domains worked with domain name registrars to give you access to a free domain name for a year. Please get the promo code in your [tools space](https://intranet.alxswe.com/dashboards/my_tools). Feel free to drop a thank you tweet for [.TECH Domains](https://twitter.com/dottechdomains).

Provide the domain name in your answer file.

Requirement:
- provide the domain name only (example: `foobar.tech`), no subdomain (example: `www.foobar.tech`)
- configure your DNS records with an A entry so that your root domain points to your `web-01` IP address **Warning: the propagation of your records can take time (~1-2 hours)**
- go to [your profile](https://intranet.alxswe.com/users/my_profile) and enter your domain in the `Project website url` field

Example:
```
sylvain@ubuntu$ cat 2-setup_a_domain_name
myschool.tech
sylvain@ubuntu$
sylvain@ubuntu$ dig myschool.tech

; <<>> DiG 9.10.6 <<>> myschool.tech
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 26785
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;myschool.tech.     IN  A

;; ANSWER SECTION:
myschool.tech.  7199    IN  A   184.72.193.201

;; Query time: 65 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Fri Aug 02 09:44:36 PDT 2019
;; MSG SIZE  rcvd: 65

sylvain@ubuntu$
```
When your domain name is setup, please verify the Registrar here: https://whois.whoisxmlapi.com/ and you must see in the JSON response: `"registrarName": "Dotserve Inc"`
</details>

<details>
<summary>

### 3. Redirection
`mandatory`

File: [3-redirection]()
</summary>

Readme:
- [Replace a line with multiple lines with sed](https://stackoverflow.com/questions/26041088/sed-replace-line-with-multiline-variable)

Configure your Nginx server so that `/redirect_me` is redirecting to another page.

Requirements:
- The redirection must be a “301 Moved Permanently”
- You answer file should be a Bash script containing commands to automatically configure a Ubuntu machine to respect above requirements
- Using what you did with `1-install_nginx_web_server`, write `3-redirection` so that it configures a brand new Ubuntu machine to the requirements asked in this task
Example:
```
sylvain@ubuntu$ curl -sI 34.198.248.145/redirect_me/
HTTP/1.1 301 Moved Permanently
Server: nginx/1.4.6 (Ubuntu)
Date: Tue, 21 Feb 2017 21:36:04 GMT
Content-Type: text/html
Content-Length: 193
Connection: keep-alive
Location: https://www.youtube.com/watch?v=QH2-TGUlwu4

sylvain@ubuntu$
```
</details>

<details>
<summary>

### 4. Not found page 404
`mandatory`

File: [4-not_found_page_404]()
</summary>

Configure your Nginx server to have a custom 404 page that contains the string `Ceci n'est pas une page`.

Requirements:
- The page must return an HTTP 404 error code
- The page must contain the string `Ceci n'est pas une page`
- Using what you did with `3-redirection`, write `4-not_found_page_404` so that it configures a brand new Ubuntu machine to the requirements asked in this task

Example:
```
sylvain@ubuntu$ curl -sI 34.198.248.145/xyz
HTTP/1.1 404 Not Found
Server: nginx/1.4.6 (Ubuntu)
Date: Tue, 21 Feb 2017 21:46:43 GMT
Content-Type: text/html
Content-Length: 26
Connection: keep-alive
ETag: "58acb50e-1a"

sylvain@ubuntu$ curl 34.198.248.145/xyzfoo
Ceci n'est pas une page

sylvain@ubuntu$
```
</details>

<details>
<summary>

### 5. Install Nginx web server (w/ Puppet)
`#advanced`

File: [7-puppet_install_nginx_web_server.pp]()
</summary>

Time to practice configuring your server with Puppet! Just as you did before, we’d like you to install and configure an Nginx server using Puppet instead of Bash. To save time and effort, you should also include resources in your manifest to perform a 301 redirect when querying /redirect_me.

Requirements:
- Nginx should be listening on port 80
- When querying Nginx at its root `/` with a GET request (requesting a page) using `curl`, it must return a page that contains the string `Hello World!`
- The redirection must be a “301 Moved Permanently”
- Your answer file should be a Puppet manifest containing commands to automatically configure an Ubuntu machine to respect above requirements
</details>

