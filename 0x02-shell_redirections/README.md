# **0x02. 0x02. SHELL, I/O REDIRECTIONS AND FILTERS**

Concepts I tackled🎯:
# Shell, I/O Redirection
## Standard Input, Output, and Error
Programs such as `ls` actually send their results to a special file called **standard output** (often expressed as **stdout**) and their status messages to another file called **standard error** (**stderr**). By default, both standard output and standard error are linked to the screen and not saved into a disk file.

In addition, many programs take input from a facility called **standard input** (**stdin**), which is, by default, attached to the keyboard. **I/O redirection allows us to change where output goes and where input comes from**. **Normally, output goes to the screen and input comes from the keyboard, but with I/O redirection, we can change that.**
## Redirecting Standard Output
To redirect standard output to another file instead of the screen, we use the `>` **redirection operator** followed by
the name of the file. It's often useful to store the output of a command in a file. For example, we could tell the shell to send the output of the `ls` command to the file `ls-output.txt` instead of the screen:
```
terrence@Notebook:~/ALX$ ls -l /usr/bin > ls-output
```
```
terrence@Notebook:~/ALX$ ls -l ls-output
-rw-r--r-- 1 terrence terrence 58497 Apr 24 09:54 ls-output
```
let's repeat our redirection test, but this time with a twist. We'll change the name of the directory to one that does not exist:
```
terrence@Notebook:~/ALX$ ls -l /bin/usr > ls-output
ls: cannot access '/bin/usr': No such file or directory
```
Why was the error message displayed on the screen rather than being redirected to the file `ls-output.txt`? **The answer is that the `ls` program does not send its error messages to standard output**. Instead, it sends its error messages to standard error. Since we only redirected standard output and not standard error, the error message was still sent to the screen.
```
terrence@Notebook:~/ALX$ ls -l ls-output
-rw-r--r-- 1 terrence terrence 0 Apr 24 09:56 ls-output
```
The file now has zero length! This is because when we redirect output with the “`>`” redirection
operator, the destination file is always rewritten from the beginning. Since our `ls` command generated no results and only an error message, the redirection operation
started to rewrite the file and then stopped because of the error, resulting in its truncation. 
```
terrence@Notebook:~/ALX$ > ls-output
```
> Simply using the redirection operator with no command preceding it will truncate an existing file or create a new, empty file.
To append redrected output to a file instead of overwriting the file from the beginning use the `>>` redirection operator.
## Redirecting Standard Error
To redirect standard error we must refer to its **file descriptor**. A program can produce output on any
of several numbered file streams. While we have referred to the first three of these file streams as standard input, output and error, the shell references them internally as file descriptors 0, 1, and 2, respectively. The shell provides a notation for redirecting files using
the file descriptor number. Since **standard error is the same as file descriptor number 2**, we can redirect standard error with this notation:
```
terrence@Notebook:~/ALX$ ls -l /bin/usr 2> ls-error.txt
```
## Redirecting Standard Output and Standard Error to One File
There are cases in which we may want to capture all of the output of a command to a single file. To do this, we must redirect both standard output and standard error at the same
time. There are two ways to do this. Shown here is the traditional way, which works with old versions of the shell:
```
terrence@Notebook:~/ALX$ ls -l /bin/usr > ls-output.txt 2>&1
```
Using this method, we perform two redirections. First we redirect standard output to the file `ls-output.txt` and then we redirect file descriptor 2 (standard error) to file descriptor 1 (standard output) using the notation `2>&1`.

**Notice that the order of the redirections is significant**. The redirection of standard error must always occur after redirecting standard output or it doesn't work.

Recent versions of bash provide a second method for performing combined redirection shown here:
```
terrence@Notebook:~/ALX$ ls -l /bin/usr &> ls-output.txt
```
We use the single notation `&>` to redirect both standard output and standard error to the file `ls-output.txt`. We can also append the standard output and standard error streams to a single file like so:
```
terrence@Notebook:~/ALX$ ls -l /bin/usr &>> ls-output.txt
```
## Disposing of Unwanted Output
Sometimes we don't want output from a command, we just want
to throw it away. This applies particularly to error and status messages. The system provides a way to do this by redirecting output to a special file called “/dev/null”. This file is a system device often referred to as a **bit bucket**, which accepts input and does nothing with it. To suppress error messages from a command, we do this:
```
terrence@Notebook:~/ALX$ ls -l /bin/usr 2> /dev/null
```
> ***`/dev/null` can be considered a black hole of the Linux file system so whatever you throw there can never see the light again.***

## Redirecting Standard Input
### `cat` – Concatenate Files
The `cat` command reads one or more files and copies them to standard output. We can use it to display files without paging.

Since `cat` can accept more than one file as an argument, it can also be used to join files together. Say we have downloaded a large file that has been split into multiple parts (multimedia files are often split this way on
Usenet), and we want to join them back together. If the files were named: `movie.mpeg.001 movie.mpeg.002 ... movie.mpeg.099` we could join them back together with this command as follows:
```
cat movie.mpeg.0* > movie.mpeg
```
Since wildcards always expand in sorted order, the arguments will be arranged in the correct order. What happens if we enter cat with no arguments?
```
terrence@Notebook:~/ALX$ cat
```
Nothing happens, it just sits there like it's hung. It might seem that way, but it's really doing exactly what it's supposed to do. If `cat` is not given any arguments, it reads from standard input and since standard input
is, by default, attached to the keyboard, it's waiting for us to type something! Try adding the following text and pressing Enter:
```
The quick brown fox jumped over the lazy dog.
```
Next, type a `Ctrl-d` to tell cat that it has reached end of file (EOF) on standard input:
```
terrence@Notebook:~/ALX$ cat
The quick brown fox jumped over the lazy dog.
The quick brown fox jumped over the lazy dog.
```
In the absence of filename arguments, `cat` copies standard input to standard output, so we see our line of text repeated. We can use this behavior to create short text files. Let's say we wanted to create a file called `lazy_dog.txt` containing the text in our example.
We would do this:
```
terrence@Notebook:~/ALX$ cat > lazy_dog.txt
The quick brown fox jumped over the lazy dog.
```
To see our results, we can use cat to copy the file to stdout again.

Now that we know how `cat` accepts standard input, in addition to filename arguments, let's try redirecting standard input.
```
terrence@Notebook:~/ALX$ cat < lazy_dog.txt
The quick brown fox jumped over the lazy dog.
```
Using the `<` redirection operator, we change the source of standard input from the keyboard to the file `lazy_dog.txt`. We see that the result is the same as passing a single filename argument. This is not particularly useful compared to passing a filename argument, but it serves to demonstrate using a file as a source of standard input. Other commands make better use of standard input,

## Pipelines
The capability of commands to read data from standard input and send to standard output is utilized by a shell feature called pipelines. **Using the pipe operator `|` (vertical bar), the standard output of one command can be piped into the standard input of another**.

The `less` command accepts standard input. We can use `less` to display, page by page, the output of any command that sends its results to standard output:
```
terrence@Notebook:~/ALX$ ls -l /usr/bin | less
```
### The Difference Between `>` and `|`
At first glance, it may be hard to understand the redirection performed by the pipeline operator `|` versus the redirection operator `>`. **Simply put, the redirection
operator connects a command with a file, while the pipeline operator connects the output of one command with the input of a second command.**
```
command1 > file1
command1 | command2
```
A lot of people will try the following when they are learning about pipelines, “just
to see what happens”:
```
command1 > command2
```
Answer: sometimes something really bad.
### Filters
Pipelines are often used to perform complex operations on data. It is possible to **put several commands together into a pipeline**. Frequently, the commands used this way are referred to as **filters**. Filters take input, change it somehow, and then output it. The first one we will try is `sort`. Imagine we wanted to make a combined list of all the executable programs in `/bin` and `/usr/bin`, put them in sorted order and view the resulting list:
```
terrence@Notebook:~/ALX$ ls /bin /usr/bin/ | sort | less
```
Since we specified two directories (`/bin and /usr/bin`), the output of `ls` would have consisted of two sorted lists, one for each directory. By including `sort` in our pipeline, we changed the data to produce a single, sorted list.
### `uniq` - Report or Omit Repeated Lines
The `uniq` command is often used in conjunction with `sort`. `uniq` accepts a sorted list of data from either standard input or a single filename argument and, by default, removes any duplicates from the list. So, to make sure our list has no duplicates (that is, any programs of the same name that appear in both the `/bin` and `/usr/bin` directories), we will add `uniq` to our pipeline.
```
terrence@Notebook:~/ALX$ ls /bin /usr/bin/ | sort | uniq | less
```
If we want to see the list of duplicates instead, we add the “`-d`” option to uniq like so:
```
terrence@Notebook:~/ALX$ ls /bin/ /usr/bin/ |sort | uniq -d | less
```
### `wc` – Print Line, Word, and Byte Counts
The `wc` (word count) command is used to display the number of lines, words, and bytes contained in files.
```
terrence@Notebook:~/ALX$ wc ls-output.txt
    7902 64566 503634 ls-output.txt
```
In this case, **it prints out three numbers: lines, words, and bytes** contained in `ls-output. txt`. Like our previous commands, if executed without command line arguments, wc accepts standard input. 

The “`-l`” option limits its output to only report lines. Adding it to a pipeline is a handy way to count things. To see the number of items we have in our sorted list, we can do this:
```
terrence@Notebook:~/ALX$ ls /bin/ /usr/bin/ | sort | uniq | wc -l     
```
### `grep` – Print Lines Matching a Pattern
`grep` is a powerful program used to find text patterns within files. When `grep` encounters a “pattern” in the file, it prints out the lines containing it. 

We want to find all the files in our list of programs that have the word zip in the name:
```
terrence@Notebook:~/ALX$ ls /bin /usr/bin/ | sort | uniq | grep zip
bunzip2
bzip2
bzip2recover
funzip
gpg-zip
gunzip
gzip
streamzip
unzip
unzipsfx
zipdetails
zipgrep
zipinfo
```
- `-i`, causes `grep` to ignore case when performing the search (normally searches are case sensitive)
- `-v`, tells `grep` to print only those lines that do not match the pattern.
### `head` / `tail` – Print First / Last Part of Files
The `head` command prints the **first ten lines of a file**, and the `tail` command prints the **last ten lines**. By default, both commands print ten lines of text, but this can be adjusted with the `-n` option.
```
terrence@Notebook:~/ALX$ head -n 5 ls-output.txt
total 127232
lrwxrwxrwx 1 root     root            4 Feb 17  2020 NF -> col1
-rwxr-xr-x 1 root     root        51632 Feb  7  2022 [
-rwxr-xr-x 1 root     root        35344 Jun 21  2022 aa-enabled
-rwxr-xr-x 1 root     root        35344 Jun 21  2022 aa-exec
terrence@Notebook:~/ALX$ tail -n 5 ls-output.txt
-rwxr-xr-x 1 root     root         2206 Sep  5  2022 zless
-rwxr-xr-x 1 root     root         1842 Sep  5  2022 zmore
-rwxr-xr-x 1 root     root         4577 Sep  5  2022 znew
-rwxr-xr-x 1 root     root      1013328 Feb 13  2022 zsh
-rwxr-xr-x 1 root     root          852 Feb 12  2022 zsh5
```
These can be used in pipelines:
```
terrence@Notebook:~/ALX$ ls /usr/bin/ | tail -n 5
zless
zmore
znew
zsh
zsh5
```
`tail` has an option which allows us to view files in real time. This is useful for watching the progress of log files as they are being written/appended. 
### `head` and `tail` combination
To print the nth line of a file, you can use the following command:
```
head -n n filename | tail -n 1
```
For example, to print the 5th line of a file called `sample.txt`, you can use:
```
head -n 5 sample.txt | tail -n 1
```
### `tee` – Read from Stdin and Output to Stdout and Files
The `tee` program reads standard input and copies it to both standard output (allowing the data to continue down the pipeline) and to one or more files. This is useful for capturing a pipeline's contents at an intermediate stage of processing.
```
terrence@Notebook:~/ALX$ ls /usr/bin/ | tee ls.txt | grep zip
bunzip2
bzip2
bzip2recover
funzip
gpg-zip
gunzip
gzip
streamzip
unzip
unzipsfx
zipdetails
zipgrep
zipinfo
```



# Special Characters

# Other Commands: 
### `echo` – Display a line of text
The "`echo`" command is used to print a message or variable value to the standard output. Here are some examples of how to use the "echo" command:
1. Print a message:
```
echo "Hello, World!"
```
2. Print the value of a variable:
```
MY_VAR="Hello, World!"
echo $MY_VAR
```
3. Append text to a file:
```
echo "Hello, World!" >> myfile.txt
```
4. Use escape characters to print special characters:
```
terrence@Notebook:~/ALX$ echo "\"The weather today is rainy.\""
"The weather today is rainy."
```
### `find`
The "`find`" command is used to search for files and directories in a directory hierarchy based on specified criteria such as filename, size, type, owner, group, and more. Here are some examples of how to use the "`find`" command:
1. Find all files in the current directory and its subdirectories:
```
find .
```
This will find all files and directories starting from the current directory and search recursively through all subdirectories.

2. Find all files with a specific name:
```
find . -name "filename.txt"
```
3. Find all files modified within a specific time frame:
```
find . -mtime -7
```
This will find all files in the current directory and its subdirectories that were modified within the last 7 days.

4. Find all files of a specific type:
```
find . -type f -name "*.txt"
```
This will find all files in the current directory and its subdirectories that have the ".txt" extension.

5. Find all empty directories:
```
find . -type d -empty
```
This will find all empty directories in the current directory and its subdirectories.
### `rev`
The `rev` command in a Unix-based shell is used to reverse the order of characters in each line of a file or input. Here are some examples of how the rev command can be used:

1. Reversing the order of characters in a file:
```
rev file.txt
```
This command will reverse the order of characters in each line of file.txt.

2. Reversing the order of characters in a string:
```
echo "Hello world" | rev
```
This command will reverse the order of characters in the string "Hello world" and output it as "dlrow olleH".
### `cut`
The `cut` command in shell is used to extract a specific section of a text file or input stream based on specified delimiter(s). It is often used in conjunction with other shell commands to process and manipulate text data. Here's an example of how to use the `cut` command:
1. Extract a specific column from a CSV file:
Suppose you have a CSV file called "data.csv" containing the following data:
```
Name, Age, Gender
John, 25, M
Mary, 30, F
```
To extract the second column (Age), you can use the following command:
```
cut -d ',' -f 2 data.csv
```
This will output:
```
Age
25
30
```
2. Extract a range of characters from a text file:
Suppose you have a text file called "sample.txt" containing the following text:
```
This is a sample text file.
```
To extract the first 10 characters of this file, you can use the following command:
```
cut -c 1-10 sample.txt
```
This will output:
```
This is a
```
3. Extracting a specific field from a delimited file:
Suppose you have a file called `passwd` which contains user information, with fields separated by colons. For example:
```
root:x:0:0:root:/root:/bin/bash
```
To extract only the username field (the first field) from this file, you can use the following command:
```
cut -d ':' -f 1 passwd
```
This will produce the following output:
```
root
```
4. Extracting data from a command output:
Suppose you want to extract only the process ID (PID) column from the output of the `ps` command. You can use the following command:
```
ps aux | cut -c 1-5
```
This will produce a list of process IDs, which are the first 5 characters of each line of output from the `ps` command.
### `passwd (5) (i.e. man 5 passwd)`
### `fmt`
Reads text from standard input, then outputs formatted text on standard output.
### `pr`
Takes text input from standard input and splits the data into pages with page breaks, headers and footers in preparation for printing.
### `tr`
1. Translating lowercase characters to uppercase:
```
echo "hello" | tr '[:lower:]' '[:upper:]'
```
This command will translate all lowercase letters in the string "hello" to uppercase letters, resulting in the output "HELLO".

2. Removing all whitespace characters:
```
echo "hello   world" | tr -d '[:space:]'
```
This command will remove all whitespace characters (spaces, tabs, newlines) from the string "hello world", resulting in the output "helloworld".

3. Replacing specific characters:
```
echo "hello world" | tr 'o' 'O'
```
This command will replace all occurrences of the letter "o" in the string "hello world" with the letter "O", resulting in the output "hellO wOrld".

4. Translating characters from one set to another:
```
echo "12345" | tr '12' 'ab'
```
This command will translate all occurrences of "1" to "a" and "2" to "b" in the string "12345", resulting in the output "ab345".

5. Removing specific characters:
```
echo "hello world" | tr -d 'l'
```
This command will remove all occurrences of the letter "l" from the string "hello world", resulting in the output "heo word".
### `sed`
Stream editor. Can perform more sophisticated text translations than tr.
### `awk`
An entire programming language designed for constructing filters. Extremely powerful.
1. To print the nth line of a file using `awk`, you can use the following command:
```
awk 'NR == n' filename
```

# Tasks☑️
## 0. Hello World
`mandatory`

Write a script that prints “Hello, World”, followed by a new line to the standard output.
```
julien@ubuntu:/tmp/h$ ./0-hello_world 
Hello, World
julien@ubuntu:/tmp/h$ ./0-hello_world | cat -e
Hello, World$
julien@ubuntu:/tmp/h$ 
```
Repo:

File: [0-hello_world]()
    
## 1. Confused smiley
`mandatory`

Write a script that displays a confused smiley `"(Ôo)'`.
```
julien@ubuntu:/tmp/h$ ./1-confused_smiley 
"(Ôo)'
julien@ubuntu:/tmp/h$ 
```
Repo:

File: [1-confused_smiley]()

## 2. Let's display a file
`mandatory`

Display the content of the `/etc/passwd` file.

Example:
```
$ ./2-hellofile
##
# User Database
#
# Note that this file is consulted directly only when the system is running
# in single-user mode. At other times this information is provided by
# Open Directory.
#
# See the opendirectoryd(8) man page for additional information about
# Open Directory.
##
nobody:*:-2:-2:Unprivileged User:/var/empty:/usr/bin/false
root:*:0:0:System Administrator:/var/root:/bin/sh
daemon:*:1:1:System Services:/var/root:/usr/bin/false
_uucp:*:4:4:Unix to Unix Copy Protocol:/var/spool/uucp:/usr/sbin/uucico
_taskgated:*:13:13:Task Gate Daemon:/var/empty:/usr/bin/false
_networkd:*:24:24:Network Services:/var/networkd:/usr/bin/false
_installassistant:*:25:25:Install Assistant:/var/empty:/usr/bin/false
_lp:*:26:26:Printing Services:/var/spool/cups:/usr/bin/false
_postfix:*:27:27:Postfix Mail Server:/var/spool/postfix:/usr/bin/false
_scsd:*:31:31:Service Configuration Service:/var/empty:/usr/bin/false
_ces:*:32:32:Certificate Enrollment Service:/var/empty:/usr/bin/false
_mcxalr:*:54:54:MCX AppLaunch:/var/empty:/usr/bin/false
_krbfast:*:246:-2:Kerberos FAST Account:/var/empty:/usr/bin/false
$
```
Repo:

File: [2-hellofile]()

## 3. What about 2?
`mandatory`

Display the content of `/etc/passwd` and `/etc/hosts`

Example:
```
$ ./3-twofiles
##
# User Database
#
# Note that this file is consulted directly only when the system is running
# in single-user mode. At other times this information is provided by
# Open Directory.
#
# See the opendirectoryd(8) man page for additional information about
# Open Directory.
##
nobody:*:-2:-2:Unprivileged User:/var/empty:/usr/bin/false
root:*:0:0:System Administrator:/var/root:/bin/sh
daemon:*:1:1:System Services:/var/root:/usr/bin/false
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting. Do not change this entry.
##
127.0.0.1   localhost
255.255.255.255 broadcasthost
::1 localhost
$
```
Repo:

File: [3-twofiles]()
    
## 4. Last lines of a file
`mandatory`

Display the last 10 lines of `/etc/passwd`

Example:
```
$ ./4-lastlines
_assetcache:*:235:235:Asset Cache Service:/var/empty:/usr/bin/false
_coremediaiod:*:236:236:Core Media IO Daemon:/var/empty:/usr/bin/false
_launchservicesd:*:239:239:_launchservicesd:/var/empty:/usr/bin/false
_iconservices:*:240:240:IconServices:/var/empty:/usr/bin/false
_distnote:*:241:241:DistNote:/var/empty:/usr/bin/false
_nsurlsessiond:*:242:242:NSURLSession Daemon:/var/db/nsurlsessiond:/usr/bin/false
_nsurlstoraged:*:243:243:NSURLStorage Daemon:/var/empty:/usr/bin/false
_displaypolicyd:*:244:244:Display Policy Daemon:/var/empty:/usr/bin/false
_astris:*:245:245:Astris Services:/var/db/astris:/usr/bin/false
_krbfast:*:246:-2:Kerberos FAST Account:/var/empty:/usr/bin/false
```
Tips: “Thinks of it as a cat, what is at the end of it?”

Repo:

File: [4-lastlines]()
    
## 5. I'd prefer the first ones actually
`mandatory`

Display the first 10 lines of `/etc/passwd`

Example:
```
$ ./5-firstlines
##
# User Database
#
# Note that this file is consulted directly only when the system is running
# in single-user mode. At other times this information is provided by
# Open Directory.
#
# See the opendirectoryd(8) man page for additional information about
# Open Directory.
##
$
```
Repo:

File: [5-firstlines]()
    
## 6. Line #2
`mandatory`

Write a script that displays the third line of the file `iacta`.

The file `iacta` will be in the working directory
- You’re not allowed to use `sed`
```
julien@ubuntu:/tmp/h$ cat iacta 
Alea iacta est

Alea iacta est ("The die is cast") is a Latin phrase attributed by Suetonius
(as iacta alea est) to Julius Caesar on January 10, 49 BC
as he led his army across the Rubicon river in Northern Italy. With this step,
he entered Italy at the head of his army in defiance of the Senate and began
his long civil war against Pompey and the Optimates. The phrase has been
adopted in Italian (Il dado è tratto), Romanian (Zarurile au fost aruncate),
Spanish (La suerte está echada), French (Les dés sont jetés), Portuguese (A
sorte está lançada), Dutch (De teerling is geworpen),
German (Der Würfel ist gefallen), Hungarian (A kocka el van vetve) and many other languages to
indicate that events have passed a point of no return.

Read more: https://en.wikipedia.org/wiki/Alea_iacta_est
julien@ubuntu:/tmp/h$ ./6-third_line 
Alea iacta est ("The die is cast") is a Latin phrase attributed by Suetonius
julien@ubuntu:/tmp/h$ 
```
Note: The output will differ, depending on the content of the file `iacta`.

Repo:

File: [6-third_line]()
    
## 7. It is a good file that cuts iron without making a noise
`mandatory`

Write a shell script that creates a file named exactly `\*\\'"Best School"\'\\*$\?\*\*\*\*\*:)` containing the text `Best School` ending by a new line.
```
julien@ubuntu:~/shell$ ls && ./7-file && ls -l && cat -e \\*
0-mac_and_cheese 7-file 7-file~ Makefile
total 20
-rwxrw-r-- 1 julien julien 79 Jan 20 06:24 0-mac_and_cheese
-rwxrw-r-- 1 julien julien 90 Jan 20 06:40 7-file
-rwxrw-r-- 1 julien julien 69 Jan 20 06:37 7-file~
-rw-rw-r-- 1 julien julien 14 Jan 20 06:38 Makefile
-rw-rw-r-- 1 julien julien 17 Jan 20 06:40 '\*\\'"Best School"\'\\*$\?\*\*\*\*\*:)'
Best School$
julien@ubuntu:~/shell$
```
Repo:

File: [7-file]()
    
## 8. Save current state of directory
`mandatory`

Write a script that writes into the file `ls_cwd_content` the result of the command `ls -la`. If the file `ls_cwd_content` already exists, it should be overwritten. If the file `ls_cwd_content` does not exist, create it.
```
julien@ubuntu:/tmp/h$ ls -la
total 20
drwxrwxr-x  2 julien julien 4096 Sep 20 18:18 .
drwxrwxrwt 13 root   root   4096 Sep 20 18:18 ..
-rwxrw-r--  1 julien julien   36 Sep 20 18:18 8-cwd_state
-rw-rw-r--  1 betty  julien   23 Sep 20 14:25 hello
-rw-rw-r--  1 julien julien  926 Sep 20 17:52 iacta
julien@ubuntu:/tmp/h$ ./8-cwd_state 
julien@ubuntu:/tmp/h$ ls -la
total 24
drwxrwxr-x  2 julien julien 4096 Sep 20 18:18 .
drwxrwxrwt 13 root   root   4096 Sep 20 18:18 ..
-rwxrw-r--  1 julien julien   36 Sep 20 18:18 8-cwd_state
-rw-rw-r--  1 betty  julien   23 Sep 20 14:25 hello
-rw-rw-r--  1 julien julien  926 Sep 20 17:52 iacta
-rw-rw-r--  1 julien julien  329 Sep 20 18:18 ls_cwd_content
julien@ubuntu:/tmp/h$ cat ls_cwd_content 
total 20
drwxrwxr-x  2 julien julien 4096 Sep 20 18:18 .
drwxrwxrwt 13 root   root   4096 Sep 20 18:18 ..
-rwxrw-r--  1 julien julien   36 Sep 20 18:18 8-cwd_state
-rw-rw-r--  1 betty  julien   23 Sep 20 14:25 hello
-rw-rw-r--  1 julien julien  926 Sep 20 17:52 iacta
-rw-rw-r--  1 julien julien    0 Sep 20 18:18 ls_cwd_content
julien@ubuntu:/tmp/h$ 
```
Repo:

File: [8-cwd_state]()
    
## 9. Duplicate last line
`mandatory`

Write a script that duplicates the last line of the file `iacta`
- The file `iacta` will be in the working directory
```
julien@ubuntu:/tmp/h$ cat iacta 
Alea iacta est

Alea iacta est ("The die is cast") is a Latin phrase attributed by Suetonius
(as iacta alea est) to Julius Caesar on January 10, 49 BC
as he led his army across the Rubicon river in Northern Italy. With this step,
he entered Italy at the head of his army in defiance of the Senate and began
his long civil war against Pompey and the Optimates. The phrase has been
adopted in Italian (Il dado è tratto), Romanian (Zarurile au fost aruncate),
Spanish (La suerte está echada), French (Les dés sont jetés), Portuguese (A
sorte está lançada), Dutch (De teerling is geworpen),
German (Der Würfel ist gefallen), Hungarian (A kocka el van vetve) and many other languages to
indicate that events have passed a point of no return.

Read more: https://en.wikipedia.org/wiki/Alea_iacta_est
julien@ubuntu:/tmp/h$ ./9-duplicate_last_line 
julien@ubuntu:/tmp/h$ cat iacta 
Alea iacta est

Alea iacta est ("The die is cast") is a Latin phrase attributed by Suetonius
(as iacta alea est) to Julius Caesar on January 10, 49 BC
as he led his army across the Rubicon river in Northern Italy. With this step,
he entered Italy at the head of his army in defiance of the Senate and began
his long civil war against Pompey and the Optimates. The phrase has been
adopted in Italian (Il dado è tratto), Romanian (Zarurile au fost aruncate),
Spanish (La suerte está echada), French (Les dés sont jetés), Portuguese (A
sorte está lançada), Dutch (De teerling is geworpen),
German (Der Würfel ist gefallen), Hungarian (A kocka el van vetve) and many other languages to
indicate that events have passed a point of no return.

Read more: https://en.wikipedia.org/wiki/Alea_iacta_est
Read more: https://en.wikipedia.org/wiki/Alea_iacta_est
julien@ubuntu:/tmp/h$ 
```
Repo:

File: [9-duplicate_last_line]()
    

## 10. No more javascript
`mandatory`

Write a script that deletes all the regular files (not the directories) with a `.js` extension that are present in the current directory and all its subfolders.
```
julien@ubuntu:/tmp/h$ ls -lR
.:
total 24
-rwxrw-r-- 1 julien julien   49 Sep 20 18:29 10-no_more_js
drwxrwxr-x 2 julien julien 4096 Sep 20 18:23 dir1
drwxrwxr-x 2 julien julien 4096 Sep 20 18:24 dir.js
-rw-rw-r-- 1 betty  julien   23 Sep 20 14:25 hello
-rw-rw-r-- 1 julien julien  982 Sep 20 18:21 iacta
-rw-rw-r-- 1 julien julien  329 Sep 20 18:18 ls_cwd_content
-rw-rw-r-- 1 julien julien    0 Sep 20 18:23 main.js

./dir1:
total 0
-rw-rw-r-- 1 julien julien 0 Sep 20 18:23 code.js

./dir.js:
total 0
julien@ubuntu:/tmp/h$ ./10-no_more_js 
julien@ubuntu:/tmp/h$ ls -lR
.:
total 24
-rwxrw-r-- 1 julien julien   49 Sep 20 18:29 10-no_more_js
drwxrwxr-x 2 julien julien 4096 Sep 20 18:29 dir1
drwxrwxr-x 2 julien julien 4096 Sep 20 18:24 dir.js
-rw-rw-r-- 1 betty  julien   23 Sep 20 14:25 hello
-rw-rw-r-- 1 julien julien  982 Sep 20 18:21 iacta
-rw-rw-r-- 1 julien julien  329 Sep 20 18:18 ls_cwd_content

./dir1:
total 0

./dir.js:
total 0
julien@ubuntu:/tmp/h$ 
```
Repo:

File: [10-no_more_js]()
    
## 11. Don't just count your directories, make your directories count
`mandatory`

Write a script that counts the number of directories and sub-directories in the current directory.
- The current and parent directories should not be taken into account
- Hidden directories should be counted
```
julien@production-503e7013:~/shell/fun_with_the_shell$ ls -lRa
.:
total 32
drwxrwxr-x 3 julien julien 4096 Jan 20 03:53 .
drwxrwxr-x 3 julien julien 4096 Jan 20 02:58 ..
-rwxr--r-- 1 julien julien 43 Jan 20 02:59 0-commas
-rwxr--r-- 1 julien julien 47 Jan 20 02:50 1-empty_casks
-rwxrw-r-- 1 julien julien 68 Jan 20 03:35 2-gifs
-rwxrw-r-- 1 julien julien 47 Jan 20 03:53 3-directories
-rw-rw-r-- 1 julien julien 14 Jan 20 03:35 Makefile
drwxrwxr-x 4 julien julien 4096 Jan 20 03:42 test_dir

./test_dir:
total 16
drwxrwxr-x 4 julien julien 4096 Jan 20 03:42 .
drwxrwxr-x 3 julien julien 4096 Jan 20 03:53 ..
-rw-rw-r-- 1 julien julien 0 Jan 20 03:40 .horrible_selfie.gif
-rw-rw-r-- 1 julien julien 0 Jan 20 03:23 README.md
-rw-rw-r-- 1 julien julien 0 Jan 20 03:17 docker.gif
-rw-rw-r-- 1 julien julien 0 Jan 20 03:17 file.sh
drwxrwxr-x 2 julien julien 4096 Jan 20 03:23 photos
drwxrwxr-x 2 julien julien 4096 Jan 20 03:23 rep.gif

./test_dir/photos:
total 8
drwxrwxr-x 2 julien julien 4096 Jan 20 03:23 .
drwxrwxr-x 4 julien julien 4096 Jan 20 03:42 ..
-rw-rw-r-- 1 julien julien 0 Jan 20 03:23 cat.gif
-rw-rw-r-- 1 julien julien 0 Jan 20 03:22 index.html
-rw-rw-r-- 1 julien julien 0 Jan 20 03:23 main.gif
-rw-rw-r-- 1 julien julien 0 Jan 20 03:23 rudy_rigot.gif

./test_dir/rep.gif:
total 8
drwxrwxr-x 2 julien julien 4096 Jan 20 03:23 .
drwxrwxr-x 4 julien julien 4096 Jan 20 03:42 ..
julien@production-503e7013:~/shell/fun_with_the_shell$ ./11-directories
3
julien@production-503e7013:~/shell/fun_with_the_shell$
```
Repo:

File: [11-directories]()
    
```
find . -type d -not -name "." | wc -l
```
- `.` specifies the current directory as the starting point
- `-type d` specifies that find should only look for directories
- `-not -name "."` excludes directories with the name `.` (current directory) from the search
- `wc -l` counts the number of lines in the output of `find`, which gives us the total number of directories (including sub-directories) in the current directory

This command will recursively search all directories (including hidden ones) in the current directory and count them, excluding the starting directory and the parent directory.
## 12. What’ new
`mandatory`

Create a script that displays the 10 newest files in the current directory.

Requirements:
- One file per line
- Sorted from the newest to the oldest
```
alex@ubuntu:/tmp$ ls -l
total 7
-rwxr-xr-x 1 501 dialout  32 Sep 27 23:51 0-hello_world
-rwxr-xr-x 1 501 dialout  46 Sep 28 11:09 10-no_more_js
-rwxr-xr-x 1 501 dialout  43 Sep 28 11:19 11-directories
-rwxr-xr-x 1 501 dialout  30 Sep 29 13:43 12-newest_files
-rwxr-xr-x 1 501 dialout  28 Sep 27 23:54 1-confused_smiley
-rwxr-xr-x 1 501 dialout  28 Sep 27 23:58 2-hellofile
-rwxr-xr-x 1 501 dialout  39 Sep 27 23:58 3-twofiles
-rwxr-xr-x 1 501 dialout  33 Sep 27 23:59 4-lastlines
-rwxr-xr-x 1 501 dialout  33 Sep 28 00:00 5-firstlines
-rwxr-xr-x 1 501 dialout  28 Sep 28 00:25 6-third_line
-rwxr-xr-x 1 501 dialout 110 Sep 28 00:34 7-file
-rwxr-xr-x 1 501 dialout  36 Sep 28 00:34 8-cwd_state
-rwxr-xr-x 1 501 dialout  35 Sep 28 00:35 9-duplicate_last_line
-rw-r--r-- 1 501 dialout  19 Sep 27 23:51 README.md
alex@ubuntu:/tmp$ ./12-newest_files 
12-newest_files
11-directories
10-no_more_js
9-duplicate_last_line
7-file
8-cwd_state
6-third_line
5-firstlines
4-lastlines
3-twofiles
alex@ubuntu:/tmp$
```
Repo:

File: [12-newest_files]()
    
```
ls -t1 | head
```
- `ls -t1` lists all files in the current directory, sorted by modification time (newest first), with one file per line
## 13. Being unique is better than being perfect
`mandatory`

Create a script that takes a list of words as input and prints only words that appear exactly once.
- Input format: One line, one word
- Output format: One line, one word
- Words should be sorted
```
julien@ubuntu:/tmp/0x02$ cat list 
C#
C
Javascript
Perl
PHP
PHP
ASP
R
Go
C#
C++
R
Perl
Javascript
Javascript
Python
Javascript
Javascript
Javascript
Java
Java
Python
Javascript
Javascript
Javascript
ASP
julien@ubuntu:/tmp/0x02$ cat list | ./13-unique 
C
C++
Go
julien@ubuntu:/tmp/0x02$ 
```
Repo:

File: [13-unique]()
    
## 14. It must be in that file
`mandatory`

Display lines containing the pattern “root” from the file `/etc/passwd`
```
$ ./14-findthatword
root:*:0:0:System Administrator:/var/root:/bin/sh
daemon:*:1:1:System Services:/var/root:/usr/bin/false
_cvmsroot:*:212:212:CVMS Root:/var/empty:/usr/bin/false
$
```
Repo:

File: [14-findthatword]()
    
## 15. Count that word
`mandatory`

Display the number of lines that contain the pattern “bin” in the file `/etc/passwd`
```
$ ./15-countthatword
81
$ 
```
Repo:

File: [15-countthatword]()
    
## 16. What's next?
`mandatory`

Display lines containing the pattern “root” and 3 lines after them in the file `/etc/passwd`.
```
$ ./16-whatsnext
root:*:0:0:System Administrator:/var/root:/bin/sh
daemon:*:1:1:System Services:/var/root:/usr/bin/false
_uucp:*:4:4:Unix to Unix Copy Protocol:/var/spool/uucp:/usr/sbin/uucico
_taskgated:*:13:13:Task Gate Daemon:/var/empty:/usr/bin/false
_networkd:*:24:24:Network Services:/var/networkd:/usr/bin/false
--
_cvmsroot:*:212:212:CVMS Root:/var/empty:/usr/bin/false
_usbmuxd:*:213:213:iPhone OS Device Helper:/var/db/lockdown:/usr/bin/false
_dovecot:*:214:6:Dovecot Administrator:/var/empty:/usr/bin/false
_dpaudio:*:215:215:DP Audio:/var/empty:/usr/bin/false
$
```
Repo:

File: [16-whatsnext]()
    
```
grep -A 3 "root" /etc/passwd
```
- `grep` searches for lines in a file that match a pattern
- `-A 3` option tells `grep` to display 3 lines after the matching pattern
- `"root"` is the pattern we're searching for
- `/etc/passwd` is the file we're searching in
## 17. I hate bins
`mandatory`

Display all the lines in the file `/etc/passwd` that do not contain the pattern “bin”.
```
$ ./17-hidethisword
##
# User Database
#
# Note that this file is consulted directly only when the system is running
# in single-user mode. At other times this information is provided by
# Open Directory.
#
# See the opendirectoryd(8) man page for additional information about
# Open Directory.
##
$
```
Repo:

File: [17-hidethisword]()
    
## 18. Letters only please
`mandatory`

Display all lines of the file `/etc/ssh/sshd_config` starting with a letter.
- include capital letters as well
```
$ ./18-letteronly
SyslogFacility AUTHPRIV
AuthorizedKeysFile  .ssh/authorized_keys
UsePrivilegeSeparation sandbox # Default for new installations.
AcceptEnv LANG LC_*
Subsystem   sftp    /usr/libexec/sftp-server
$
```
Repo:

File: [18-letteronly]()
    
```
grep -i '^[a-z]' /etc/ssh/sshd_config
```
- `-i` option makes the search case-insensitive, meaning that it will match both uppercase and lowercase letters
- `'^[a-z]'` is a regular expression pattern that matches any line that starts with a lowercase letter. The caret (^) character matches the start of a line, and `[a-z]` matches any lowercase letter from a to z.
## 19. A to Z
`mandatory`

Replace all characters `A` and `c` from input to `Z` and `e` respectively.
```
julien@ubuntu:/tmp/0x02$ echo 'Replace all characters `A` and `c` from input to `Z` and `e`.' | ./19-AZ 
Replaee all eharaeters `Z` and `e` from input to `Z` and `e`.
julien@ubuntu:/tmp/0x02$ 
```
Repo:

File: [19-AZ]()
    
## 20. Without C, you would live in hiago
`mandatory`

Create a script that removes all letters `c` and `C` from input.
```
julien@ubuntu:/tmp/0x02$ echo Chicago | ./20-hiago 
hiago
julien@ubuntu:/tmp/0x02$ 
```
Repo:

File: [20-hiago]()
    
## 21. esreveR
`mandatory`

Write a script that reverse its input.
```
julien@ubuntu:/tmp/0x02$ echo "Reverse" | ./21-reverse 
esreveR
julien@ubuntu:/tmp/0x02$ 
```
Repo:

File: [21-reverse]()
    
```
terrence@Notebook:~/ALX$ rev
Terrence
ecnerreT
Mercedes Benz AMG GLE Coupe 63S
S36 epuoC ELG GMA zneB sedecreM
BMW X6 M Competition
noititepmoC M 6X WMB
```
## 22. DJ Cut Killer
`mandatory`

Write a script that displays all users and their home directories, sorted by users.
- Based on the the `/etc/passwd` file
```
julien@ubuntu:/tmp/0x02$ cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-timesync:x:100:102:systemd Time Synchronization,,,:/run/systemd:/bin/false
systemd-network:x:101:103:systemd Network Management,,,:/run/systemd/netif:/bin/false
systemd-resolve:x:102:104:systemd Resolver,,,:/run/systemd/resolve:/bin/false
systemd-bus-proxy:x:103:105:systemd Bus Proxy,,,:/run/systemd:/bin/false
syslog:x:104:108::/home/syslog:/bin/false
_apt:x:105:65534::/nonexistent:/bin/false
messagebus:x:106:110::/var/run/dbus:/bin/false
uuidd:x:107:111::/run/uuidd:/bin/false
lightdm:x:108:114:Light Display Manager:/var/lib/lightdm:/bin/false
whoopsie:x:109:116::/nonexistent:/bin/false
avahi-autoipd:x:110:119:Avahi autoip daemon,,,:/var/lib/avahi-autoipd:/bin/false
avahi:x:111:120:Avahi mDNS daemon,,,:/var/run/avahi-daemon:/bin/false
dnsmasq:x:112:65534:dnsmasq,,,:/var/lib/misc:/bin/false
colord:x:113:123:colord colour management daemon,,,:/var/lib/colord:/bin/false
speech-dispatcher:x:114:29:Speech Dispatcher,,,:/var/run/speech-dispatcher:/bin/false
hplip:x:115:7:HPLIP system user,,,:/var/run/hplip:/bin/false
kernoops:x:116:65534:Kernel Oops Tracking Daemon,,,:/:/bin/false
pulse:x:117:124:PulseAudio daemon,,,:/var/run/pulse:/bin/false
rtkit:x:118:126:RealtimeKit,,,:/proc:/bin/false
saned:x:119:127::/var/lib/saned:/bin/false
usbmux:x:120:46:usbmux daemon,,,:/var/lib/usbmux:/bin/false
julien:x:1000:1000:Julien Barbier,,,:/home/julien:/bin/bash
guillaume:x:1001:1001:,,,:/home/guillaume:/bin/bash
betty:x:1002:1002::/home/betty:
julien@ubuntu:/tmp/0x02$
julien@ubuntu:/tmp/0x02$ ./22-users_and_homes 
_apt:/nonexistent
avahi-autoipd:/var/lib/avahi-autoipd
avahi:/var/run/avahi-daemon
backup:/var/backups
betty:/home/betty
bin:/bin
colord:/var/lib/colord
daemon:/usr/sbin
dnsmasq:/var/lib/misc
games:/usr/games
gnats:/var/lib/gnats
guillaume:/home/guillaume
hplip:/var/run/hplip
irc:/var/run/ircd
julien:/home/julien
kernoops:/
lightdm:/var/lib/lightdm
list:/var/list
lp:/var/spool/lpd
mail:/var/mail
man:/var/cache/man
messagebus:/var/run/dbus
news:/var/spool/news
nobody:/nonexistent
proxy:/bin
pulse:/var/run/pulse
root:/root
rtkit:/proc
saned:/var/lib/saned
speech-dispatcher:/var/run/speech-dispatcher
sync:/bin
sys:/dev
syslog:/home/syslog
systemd-bus-proxy:/run/systemd
systemd-network:/run/systemd/netif
systemd-resolve:/run/systemd/resolve
systemd-timesync:/run/systemd
usbmux:/var/lib/usbmux
uucp:/var/spool/uucp
uuidd:/run/uuidd
whoopsie:/nonexistent
www-data:/var/www
julien@ubuntu:/tmp/0x02$ 
```
Repo:

File: [22-users_and_homes]()
    
## 23. Empty casks make the most noise
`#advanced`

Write a command that finds all empty files and directories in the current directory and all sub-directories.
- Only the names of the files and directories should be displayed (not the entire path)
- Hidden files should be listed
- One file name per line
- The listing should end with a new line
- You are not allowed to use `basename`, `grep`, `egrep`, `fgrep` or `rgrep`
```
ubuntu@ip-172-31-63-244:~/0x02-shell_redirections$ ls -laR
.:
total 64
drwxrwxr-x 5 ubuntu ubuntu 4096 Oct  7 00:48 .
drwxrwxr-x 7 ubuntu ubuntu 4096 Sep 29 21:36 ..
-rwxrwxr-x 1 ubuntu ubuntu   56 Feb  8  2016 0-commas
drwxrwxr-x 2 ubuntu ubuntu 4096 Feb  8  2016 0-commas-checks
-rwxrwxr-x 1 ubuntu ubuntu   48 Feb  8  2016 1-empty_casks
-rwxrwxr-x 1 ubuntu ubuntu   68 Feb  8  2016 2-gifs
-rwxrwxr-x 1 ubuntu ubuntu   47 Feb  8  2016 3-directories
-rwxrwxr-x 1 ubuntu ubuntu   41 Feb  8  2016 4-zeros
-rwxrwxr-x 1 ubuntu ubuntu   43 Feb  8  2016 5-rot13
-rwxrwxr-x 1 ubuntu ubuntu   25 Feb  8  2016 6-odd
-rwxrwxr-x 1 ubuntu ubuntu   73 Feb  8  2016 7-sort_rot13
-rw-rw-r-- 1 ubuntu ubuntu    0 Oct  7 00:46 ........gif
-rw-rw-r-- 1 ubuntu ubuntu    0 Oct  7 00:47 ..hello.gif
drwxrwxr-x 2 ubuntu ubuntu 4096 Oct  7 00:41 javascript
-rw-rw-r-- 1 ubuntu ubuntu    0 Oct  7 00:48 Kris_is_awesome :)
-rw-rw-r-- 1 ubuntu ubuntu   14 Feb  8  2016 Makefile
-rw-rw-r-- 1 ubuntu ubuntu   69 Feb  8  2016 quote
-rw-rw-r-- 1 ubuntu ubuntu    0 Oct  7 00:24 Rona_napping.gif
-rw-rw-r-- 1 ubuntu ubuntu    0 Oct  6 23:59 root.gif
-rw-rw-r-- 1 ubuntu ubuntu    0 Mar 24  2016 ..something
drwxrwxr-x 3 ubuntu ubuntu 4096 Feb  8  2016 test_dir
-rwxrwxr-x 1 ubuntu ubuntu   54 Feb  8  2016 test.var

./0-commas-checks:
total 16
drwxrwxr-x 2 ubuntu ubuntu 4096 Feb  8  2016 .
drwxrwxr-x 5 ubuntu ubuntu 4096 Oct  7 00:48 ..
-rw-rw-r-- 1 ubuntu ubuntu 1361 Feb  8  2016 28-check.php
-rw-rw-r-- 1 ubuntu ubuntu  481 Feb  8  2016 28-check.php~

./javascript:
total 8
drwxrwxr-x 2 ubuntu ubuntu 4096 Oct  7 00:41 .
drwxrwxr-x 5 ubuntu ubuntu 4096 Oct  7 00:48 ..

./test_dir:
total 12
drwxrwxr-x 3 ubuntu ubuntu 4096 Feb  8  2016 .
drwxrwxr-x 5 ubuntu ubuntu 4096 Oct  7 00:48 ..
-rw-rw-r-- 1 ubuntu ubuntu    0 Feb  8  2016 docker.gif
-rw-rw-r-- 1 ubuntu ubuntu    0 Feb  8  2016 file.sh
-rw-rw-r-- 1 ubuntu ubuntu    0 Feb  8  2016 .horrible_selfie.gif
drwxrwxr-x 2 ubuntu ubuntu 4096 Feb  8  2016 photos
-rw-rw-r-- 1 ubuntu ubuntu    0 Feb  8  2016 README.md

./test_dir/photos:
total 8
drwxrwxr-x 2 ubuntu ubuntu 4096 Feb  8  2016 .
drwxrwxr-x 3 ubuntu ubuntu 4096 Feb  8  2016 ..
-rw-rw-r-- 1 ubuntu ubuntu    0 Feb  8  2016 cat.gif
-rw-rw-r-- 1 ubuntu ubuntu    0 Feb  8  2016 index.html
-rw-rw-r-- 1 ubuntu ubuntu    0 Feb  8  2016 main.gif
-rw-rw-r-- 1 ubuntu ubuntu    0 Feb  8  2016 rudy_rigot.gif
ubuntu@ip-172-31-63-244:~/0x02-shell_redirections$ ./100-empty_casks
Rona_napping.gif
javascript
root.gif
..something
Kris_is_awesome :)
..hello.gif
file.sh
docker.gif
README.md
index.html
main.gif
cat.gif
rudy_rigot.gif
.horrible_selfie.gif
........gif
ubuntu@ip-172-31-63-244:~/0x02-shell_redirections$
```
Repo:

File: [100-empty_casks]()
    
## 24. A gif is worth ten thousand words
`#advanced`

Write a script that lists all the files with a `.gif` extension in the current directory and all its sub-directories.
- Hidden files should be listed
- Only regular files (not directories) should be listed
- The names of the files should be displayed without their extensions
- The files should be sorted by byte values, but case-insensitive (file `aaa` should be listed before file `bbb`, file `.b` should be listed before file `a`, and file `Rona` should be listed after file `jay`)
- One file name per line
- The listing should end with a new line
- You are not allowed to use `basename`, `grep`, `egrep`, `fgrep` or `rgrep`
```
    julien@production-503e7013:~/shell/fun_with_the_shell$ ls -Rla
    .:
    total 28
    drwxrwxr-x 3 julien julien 4096 Jan 20 03:35 .
    drwxrwxr-x 3 julien julien 4096 Jan 20 02:58 ..
    -rwxr--r-- 1 julien julien 43 Jan 20 02:59 0-commas
    -rwxr--r-- 1 julien julien 47 Jan 20 02:50 1-empty_casks
    -rwxrw-r-- 1 julien julien 68 Jan 20 03:35 2-gifs
    -rw-rw-r-- 1 julien julien 14 Jan 20 03:35 Makefile
    drwxrwxr-x 4 julien julien 4096 Jan 20 03:42 test_dir

    ./test_dir:
    total 16
    drwxrwxr-x 4 julien julien 4096 Jan 20 03:42 .
    drwxrwxr-x 3 julien julien 4096 Jan 20 03:35 ..
    -rw-rw-r-- 1 julien julien 0 Jan 20 03:40 .horrible_selfie.gif
    -rw-rw-r-- 1 julien julien 0 Jan 20 03:23 README.md
    -rw-rw-r-- 1 julien julien 0 Jan 20 03:17 docker.gif
    -rw-rw-r-- 1 julien julien 0 Jan 20 03:17 file.sh
    drwxrwxr-x 2 julien julien 4096 Jan 20 03:23 photos
    drwxrwxr-x 2 julien julien 4096 Jan 20 03:23 rep.gif

    ./test_dir/photos:
    total 8
    drwxrwxr-x 2 julien julien 4096 Jan 20 03:23 .
    drwxrwxr-x 4 julien julien 4096 Jan 20 03:42 ..
    -rw-rw-r-- 1 julien julien 0 Jan 20 03:23 cat.gif
    -rw-rw-r-- 1 julien julien 0 Jan 20 03:22 index.html
    -rw-rw-r-- 1 julien julien 0 Jan 20 03:23 main.gif
    -rw-rw-r-- 1 julien julien 0 Jan 20 03:23 Electra_napping.gif

    ./test_dir/rep.gif:
    total 8
    drwxrwxr-x 2 julien julien 4096 Jan 20 03:23 .
    drwxrwxr-x 4 julien julien 4096 Jan 20 03:42 ..
    julien@production-503e7013:~/shell/fun_with_the_shell$ ./101-gifs
    .horrible_selfie
    cat
    docker
    Electra_napping
    main
    julien@production-503e7013:~/shell/fun_with_the_shell$
```
Repo:

File: [101-gifs]()
    
## 25. Acrostic
`#advanced`

An acrostic is a poem (or other form of writing) in which the first letter (or syllable, or word) of each line (or paragraph, or other recurring feature in the text) spells out a word, message or the alphabet. The word comes from the French acrostiche from post-classical Latin acrostichis). As a form of constrained writing, an acrostic can be used as a mnemonic device to aid memory retrieval. Read more.

Create a script that decodes acrostics that use the first letter of each line.
- The ‘decoded’ message has to end with a new line
- You are not allowed to use `grep`, `egrep`, `fgrep` or `rgrep`
```
julien@ubuntu:/tmp/0x02$ cat An\ Acrostic 
Elizabeth it is in vain you say
Love not"—thou sayest it in so sweet a way:
In vain those words from thee or L.E.L.
Zantippe's talents had enforced so well:
Ah! if that language from thy heart arise,
Breath it less gently forth—and veil thine eyes.
Endymion, recollect, when Luna tried
To cure his love—was cured of all beside—
His follie—pride—and passion—for he died.
julien@ubuntu:/tmp/0x02$ ./102-acrostic < An\ Acrostic 
ELIZABETH
julien@ubuntu:/tmp/0x02$ 
```
Repo:

File: [102-acrostic]()
    
## 26. The biggest fan

`#advanced`

Write a script that parses web servers logs in TSV format as input and displays the 11 hosts or IP addresses which did the most requests.
- Order by number of requests, most active host or IP at the top
- You are not allowed to use `grep`, `egrep`, `fgrep` or `rgrep`

Format:
```
host    When possible, the hostname making the request. Uses the IP address if the hostname was unavailable.
logname Unused, always -
time    In seconds, since 1970
method  HTTP method: GET, HEAD, or POST
url Requested path
response    HTTP response code
bytes   Number of bytes in the reply
```
Here is an example with one day of logs of the NASA website (1995).
```
julien@ubuntu:/tmp/0x02$ wget https://s3.amazonaws.com/alx-intranet.hbtn.io/public/nasa_19950801.tsv
--2022-03-08 11:08:26--  https://s3.amazonaws.com/alx-intranet.hbtn.io/public/nasa_19950801.tsv
Resolving s3.amazonaws.com (s3.amazonaws.com)... 52.217.171.144
Connecting to s3.amazonaws.com (s3.amazonaws.com)|52.217.171.144|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 782913 (765K) [binary/octet-stream]
Saving to: ‘nasa_19950801.tsv’

nasa_19950801.tsv   100%[===================>] 764.56K  --.-KB/s    in 0.008s

2022-03-08 11:08:26 (98.4 MB/s) - ‘nasa_19950801.tsv’ saved [782913/782913]

julien@ubuntu:/tmp/0x02$ head nasa_19950801.tsv
host    logname time    method  url     response        bytes
in24.inetnebr.com       -       807249601       GET     /shuttle/missions/sts-68/news/sts-68-mcc-05.txt 200     1839
uplherc.upl.com -       807249607       GET     /       304     0
uplherc.upl.com -       807249608       GET     /images/ksclogo-medium.gif      304     0
uplherc.upl.com -       807249608       GET     /images/MOSAIC-logosmall.gif    304     0
uplherc.upl.com -       807249608       GET     /images/USA-logosmall.gif       304     0
ix-esc-ca2-07.ix.netcom.com     -       807249609       GET     /images/launch-logo.gif 200     1713
uplherc.upl.com -       807249610       GET     /images/WORLD-logosmall.gif     304     0
slppp6.intermind.net    -       807249610       GET     /history/skylab/skylab.html     200     1687
piweba4y.prodigy.com    -       807249610       GET     /images/launchmedium.gif        200     11853
julien@ubuntu:/tmp/0x02$ ./103-the_biggest_fan < nasa_19950801.tsv 
www-relay.pa-x.dec.com
piweba3y.prodigy.com
www.thyssen.com
130.110.74.81
ix-min1-02.ix.netcom.com
uplherc.upl.com
reggae.iinet.net.au
seigate.sumiden.co.jp
ircgate1.rcc-irc.si
s150.phxslip4.indirect.com
torben.dou.dk
julien@ubuntu:/tmp/0x02$ 
```
Repo:

File: [103-the_biggest_fan]()

# References
**The Linux Command Line - William Shotts**
- **Chapter 6** - Redirection


