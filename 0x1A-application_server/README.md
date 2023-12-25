<h1 align="center"><b>0x1A. APPLICATION SERVER</b></h1>
<div align="center"><code>DevOps</code> <code>SysAdmin</code></div>

<br>

## Concepts
<details>
<summary><b><a href="https://intranet.alxswe.com/concepts/17">Web Server</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://intranet.alxswe.com/concepts/67">Server</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://intranet.alxswe.com/concepts/68">Web stack debugging</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>

<br><div align="center"><img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x1A-application_server/images/c7d1ed0a2e10d1b4e9b3.jpg"></div><br>

<br>

## Background Context
Your web infrastructure is already serving web pages via `Nginx` that you installed in your [first web stack project](https://intranet.alxswe.com/projects/266). While a web server can also serve dynamic content, this task is usually given to an application server. In this project you will add this piece to your infrastructure, plug it to your `Nginx` and make is serve your Airbnb clone project.


<!-- <br>
<hr>
<h3><a href=>Notes</a></h3>
<hr> -->

<br>

## Resources
<details>
<summary><b><a href="https://www.nginx.com/resources/glossary/application-server-vs-web-server/">Application server vs web server</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-gunicorn-and-nginx-on-ubuntu-16-04">How to Serve a Flask Application with Gunicorn and Nginx on Ubuntu 16.04</a></b> (As mentioned in the video, do <b>not</b> install Gunicorn using <code>virtualenv</code>, just install everything globally)</summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://docs.gunicorn.org/en/latest/run.html">Running Gunicorn</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://werkzeug.palletsprojects.com/en/0.14.x/routing/">Be careful with the way Flask manages slash</a> in <a href="https://flask.palletsprojects.com/en/1.0.x/api/#flask.Flask.route">route</a> - <code>strict_slashes</code></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<details>
<summary><b><a href="https://doc.ubuntu-fr.org/upstart">Upstart documentation</a></b></summary><br>


<br><p align="center">※※※※※※※※※※※※</p><br>
</details>


<!-- <br>

**man or help:**
- `` -->

<br>

## Requirements
### General
- A `README.md` file, at the root of the folder of the project, is mandatory
- Everything Python-related must be done using `python3`
- All config files must have comments

### Bash Scripts
- All your files will be interpreted on Ubuntu 16.04 LTS
- All your files should end with a new line
- All your Bash script files must be executable
- Your Bash script must pass `Shellcheck` (version `0.3.7-5~ubuntu16.04.1` via `apt-get`) without any error
- The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
- The second line of all your Bash scripts should be a comment explaining what is the script doing

<!-- <br>

## More Info -->

<br>

## Tasks
<details>
<summary>

### 0. Set up development with Python
`mandatory`

File: [README.md]()
</summary>

Let’s serve what you built for [AirBnB clone v2 - Web framework](https://intranet.alxswe.com/projects/290) on `web-01`. This task is an exercise in setting up your development environment, which is used for testing and debugging your code before deploying it to production.

Requirements:
- Make sure that [task #3](https://intranet.alxswe.com/tasks/1372) of your [SSH project](https://intranet.alxswe.com/projects/244) is completed for `web-01`. The checker will connect to your servers.
- Install the `net-tools` package on your server: `sudo apt install -y net-tools`
- Git clone your `AirBnB_clone_v2` on your `web-01` server.
- Configure the file `web_flask/0-hello_route.py` to serve its content from the route `/airbnb-onepage/` on port `5000`.
- Your Flask application object must be named `app` (This will allow us to run and check your code).

Example:

**Window 1:**
```
ubuntu@229-web-01:~/AirBnB_clone_v2$ python3 -m web_flask.0-hello_route
 * Serving Flask app "0-hello_route" (lazy loading)
 * Environment: production
   WARNING: Do not use the development server in a production environment.
   Use a production WSGI server instead.
 * Debug mode: off
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
35.231.193.217 - - [02/May/2019 22:19:42] "GET /airbnb-onepage/ HTTP/1.1" 200 -
```
**Window 2:**
```
ubuntu@229-web-01:~/AirBnB_clone_v2$ curl 127.0.0.1:5000/airbnb-onepage/
Hello HBNB!ubuntu@229-web-01:~/AirBnB_clone_v2$
```
</details>

<details>
<summary>

### 1. Set up production with Gunicorn
`mandatory`

File: [0x1A-application_server]()
</summary>

Now that you have your development environment set up, let’s get your production application server set up with `Gunicorn` on `web-01`, port `5000`. You’ll need to install `Gunicorn` and any libraries required by your application. Your Flask application object will serve as a WSGI entry point into your application. This will be your production environment. As you can see we want the production and development of your application to use the same port, so the conditions for serving your dynamic content are the same in both environments.

Requirements:

Install Gunicorn and any other libraries required by your application.
The Flask application object should be called app. (This will allow us to run and check your code)
You will serve the same content from the same route as in the previous task. You can verify that it’s working by binding a Gunicorn instance to localhost listening on port 5000 with your application object as the entry point.
In order to check your code, the checker will bind a Gunicorn instance to port 6000, so make sure nothing is listening on that port.
Example:

Terminal 1:
ubuntu@229-web-01:~/AirBnB_clone_v2$ gunicorn --bind 0.0.0.0:5000 web_flask.0-hello_route:app
[2019-05-03 20:47:20 +0000] [3595] [INFO] Starting gunicorn 19.9.0
[2019-05-03 20:47:20 +0000] [3595] [INFO] Listening at: http://0.0.0.0:5000 (3595)
[2019-05-03 20:47:20 +0000] [3595] [INFO] Using worker: sync
[2019-05-03 20:47:20 +0000] [3598] [INFO] Booting worker with pid: 3598
Terminal 2:
ubuntu@229-web-01:~$ curl 127.0.0.1:5000/airbnb-onepage/
Hello HBNB!ubuntu@229-web-01:~$

</details>

<details>
<summary>

### 2. Serve a page with Nginx
`mandatory`

File: [2-app_server-nginx_config]()
</summary>


</details>

<details>
<summary>

### 3. Add a route with query parameters
`mandatory`

File: [3-app_server-nginx_config]()
</summary>


</details>

<details>
<summary>

### 4. Let's do this for your API
`mandatory`

File: [4-app_server-nginx_config]()
</summary>


</details>

<details>
<summary>

### 5. Serve your AirBnB clone
`mandatory`

File: [5-app_server-nginx_config]()
</summary>


</details>

<details>
<summary>

### 6. Deploy it!
`#advanced`

File: [gunicorn.service]()
</summary>


</details>

<details>
<summary>

### 7. No service interruption
`#advanced`

File: [4-reload_gunicorn_no_downtime]()
</summary>


</details>

