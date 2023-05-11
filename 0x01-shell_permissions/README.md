# 0x01. Shell, permissions

## Concepts I tackled🎯
### Owners, Group Members, and Everybody Else
```
[me@linuxbox ~]$ file /etc/shadow 
/etc/shadow: regular file, no read permission 
[me@linuxbox ~]$ less /etc/shadow
/etc/shadow: Permission denied 
```
The reason for this error message is that, as regular users, we do not have permission to read this file. In the Unix security model, a user may own files and directories. When a user owns a file or directory, the user has control over its access. Users can, in turn, belong to a group consisting of one or more users who are given access to files and directories by their owners. In addition to granting access to a group, an owner may also grant some set of access rights to everybody, which in Unix terms is referred to as the world. To find out information about your identity, use the `id` command. 
```
[me@linuxbox ~]$ id 
uid=500(me) gid=500(me) groups=500(me) 
```
Let's look at the output. When user accounts are created, users are assigned a number called a user ID (uid) which is then, for the sake of the humans, mapped to a username. 
The user is assigned a primary group ID (gid) and may belong to additional groups. The above example is from a Fedora system. On other systems, such as Ubuntu, the output 
may look a little different: 
```
[me@linuxbox ~]$ id 
uid=1000(me) gid=1000(me) 
groups=4(adm),20(dialout),24(cdrom),25(floppy),29(audio),30(dip),44(v 
ideo),46(plugdev),108(lpadmin),114(admin),1000(me) 
```
As we can see, the uid and gid numbers are different. This is simply because Fedora starts its numbering of regular user accounts at 500, while Ubuntu starts at 1000. We can also see that the Ubuntu user belongs to a lot more groups. This has to do with the way Ubuntu manages privileges for system devices and services. 
So where does this information come from? Like so many things in Linux, it comes from a couple of text files. User accounts are defined in the `/etc/passwd` file and groups 
are defined in the `/etc/group` file. When user accounts and groups are created, these files are modified along with `/etc/shadow` which holds information about the user's 
password. For each user account, the `/etc/passwd` file defines the user (login) name, uid, gid, account's real name, home directory, and login shell. If we examine the contents 
of `/etc/passwd` and `/etc/group`, we notice that besides the regular user accounts, there are accounts for the superuser (uid 0) and various other system users. 

### Reading, Writing, and Executing
Access rights to files and directories are defined in terms of read access, write access, and execution access. 
```
[me@linuxbox ~]$ > foo.txt 
[me@linuxbox ~]$ ls -l foo.txt 
-rw-rw-r-- 1 me me 0 2016-03-06 14:52 foo.txt 
```
The first 10 characters of the listing are the file attributes. 
The first of these characters is the file type. 

<table>
    <thead>
        <th>Attribute </th>
        <th>File Type  </th>
    </thead>
    <tr>
        <td><code>-</code></td>
        <td>A regular file. </td>
    </tr>
    <tr>
        <td><code>d</code></td>
        <td>A directory.  </td>
    </tr>
    <tr>
        <td><code>l</code> </td>
        <td>A symbolic link. Notice that with symbolic links, the remaining file attributes are always “<code>rwxrwxrwx</code>” and are dummy values. The real file attributes are those of the file the symbolic link points to.  </td>
    </tr>
    <tr>
        <td><code>c</code></td>
        <td>A character special file. This file type refers to a device that handles data as a stream of bytes, such as a terminal or <code>/dev/null</code>.  </td>
    </tr>
    <tr>
        <td><code>b</code></td>
        <td>A block special file. This file type refers to a device that handles data in blocks, such as a hard drive or DVD drive.  </td>
    </tr>
</table> 

The remaining nine characters of the file attributes, called the <mark>file mode</mark>, represent the read, write, and execute permissions for the file's owner, the file's group owner, and everybody else.
<table align="center">
    <thead>
        <tr>
            <th>Owner</th>
            <th>Group</th>
            <th>World</th>
        </tr>
    </thead>
    <tr>
        <td><code>rwx</code></td>
        <td><code>rwx</code></td>
        <td><code>rwx</code></td>
    </tr>
</table>

#### Permission Attributes 
<table>
    <thead>
        <th>Attribute </th>
        <th>Files </th>
        <th>Directories  </th>
    </thead>
    <tr>
        <td><code>r</code></td>
        <td>Allows a file to be opened and read. </td>
        <td>Allows a directory&#39;s contents to be listed if the execute attribute is also set.  </td>
    </tr>
    <tr>
        <td><code>w</code></td>
        <td>Allows a file to be written to or truncated, however this attribute does not allow files to be renamed or deleted. The ability to delete or rename files is determined by directory attributes. </td>
        <td>Allows files within a directory to be created, deleted, and renamed if the execute attribute is also set.  </td>
    </tr>
    <tr>
        <td><code>x</code></td>
        <td>Allows a file to be treated as a program and executed. Program files written in scripting languages must also be set as readable to be executed. </td>
        <td>Allows a directory to be entered, e.g., <code>cd directory</code>.  </td>
    </tr>
</table> 
 
#### Some examples of file attribute settings 
<table>
    <thead>
        <th>File Attributes</th>
        <th>Meaning</th>
    </thead>
    <tr>
        <td><code>-rwx------</code></td>
        <td>A regular file that is readable, writable, and executable by the file&#39;s owner. No one else has any access.  </td>
    </tr>
    <tr>
        <td><code>-rw-------</code></td>
        <td>A regular file that is readable and writable by the file&#39;s owner. No one else has any access.  </td>
    </tr>
    <tr>
        <td><code>-rw-r--r--</code></td>
        <td>A regular file that is readable and writable by the file&#39;s owner. Members of the file&#39;s owner group may read the file. The file is world-readable.  </td>
    </tr>
    <tr>
        <td><code>-rwxr-xr-x</code></td>
        <td>A regular file that is readable, writable, and executable by the file&#39;s owner. The file may be read and executed by everybody else.  </td>
    </tr>
    <tr>
        <td><code>-rw-rw----</code></td>
        <td>A regular file that is readable and writable by the file&#39;s owner and members of the file&#39;s group owner only.  </td>
    </tr>
    <tr>
        <td><code>lrwxrwxrwx</code></td>
        <td>A symbolic link. All symbolic links have “dummy” permissions. The real permissions are kept with the actual file pointed to by the symbolic link.  </td>
    </tr>
    <tr>
        <td><code>drwxrwx---</code></td>
        <td>A directory. The owner and the members of the owner group may enter the directory and create, rename and remove files within the directory.  </td>
    </tr>
    <tr>
        <td><code>drwxr-x---</code></td>
        <td>A directory. The owner may enter the directory and create, rename, and delete files within the directory. Members of the owner group may enter the directory but cannot create, delete, or rename files.  </td>
    </tr>
</table>
 
#### `chmod` – Change File Mode 
To change the mode (permissions) of a file or directory, the `chmod` command is used. Be aware that only the file’s owner or the superuser can change the mode of a file or directory. `chmod` supports two distinct ways of specifying mode changes: octal number representation, or symbolic representation. 
We use octal numbers to set the pattern of desired permissions. Since each digit in an octal number represents three binary digits, this maps nicely to the scheme used to store the file mode. 
<table align="center">
    <thead>
        <th>Octal</th>
        <th>Binary</th>
        <th>File Mode</th>
    </thead>
    <tr>
        <td><code>0</code></td>
        <td><code>000</code></td>
        <td><code>---</code></td>
    </tr>
    <tr>
        <td><code>1</code></td>
        <td><code>001</code></td>
        <td><code>--x</code></td>
    </tr>
    <tr>
        <td><code>2</code></td>
        <td><code>010</code></td>
        <td><code>-w-</code></td>
    </tr>
    <tr>
        <td><code>3</code></td>
        <td><code>011</code></td>
        <td><code>-wx</code></td>
    </tr>
    <tr>
        <td><code>4</code></td>
        <td><code>100</code></td>
        <td><code>r--</code></td>
    </tr>
    <tr>
        <td><code>5</code></td>
        <td><code>101</code></td>
        <td><code>r-x</code></td>
    </tr>
    <tr>
        <td><code>6</code></td>
        <td><code>110</code></td>
        <td><code>rw-</code></td>
    </tr>
    <tr>
        <td><code>7</code></td>
        <td><code>111</code></td>
        <td><code>rwx</code></td>
    </tr>
</table>

By using three octal digits, we can set the file mode for the owner, group owner, and world. 
```
[me@linuxbox ~]$ > foo.txt 
[me@linuxbox ~]$ ls -l foo.txt 
-rw-rw-r-- 1 me me 0 2016-03-06 14:52 foo.txt 
[me@linuxbox ~]$ chmod 600 foo.txt 
[me@linuxbox ~]$ ls -l foo.txt 
-rw------- 1 me me 0 2016-03-06 14:52 foo.txt 
```
The line <code>> foo.txt</code> in the shell creates a new file called `foo.txt` in the current directory or overwrites the contents of an existing foo.txt file with an empty string. 
This line is an example of shell input/output redirection. The `>` symbol is a shell operator that redirects the output of a command to a file instead of the standard output. In this case, since there is no command before the `>`, the output being redirected is empty, resulting in the creation of an empty `foo.txt` file. 
If you want to append data to an existing file instead of overwriting it, you can use the `>>` operator instead, like this: `>> foo.txt`. This operator will append the output of a command to the end of the `foo.txt` file, instead of overwriting its contents.
  
By passing the argument “600”, we were able to set the permissions of the owner to read and write while removing all permissions from the group owner and world. Though remembering the octal to binary mapping may seem inconvenient, we will usually have only to use a few common ones: 7 (`rwx`), 6 (`rw-`), 5 (`r-x`), 4 (`r--`), and 0 (`---`). 
`chmod` also supports a symbolic notation for specifying file modes. Symbolic notation is divided into three parts. 
- Who the change will affect. 
- Which operation will be performed.  
- What permission will be set. 
To specify who is affected, a combination of the characters “u”, “g”, “o”, and “a” is used as shown: 
<table align="center">
    <thead>
        <th>Symbol</th>
        <th>Meaning</th>
    </thead>
    <tr>
        <td><code>u</code></td>
        <td>Short for “user” but means the file or directory owner.  </td>
    </tr>
    <tr>
        <td><code>g</code></td>
        <td>Group owner.  </td>
    </tr>
    <tr>
        <td><code>o</code></td>
        <td>Short for “others” but means world.  </td>
    </tr>
    <tr>
        <td><code>a</code></td>
        <td>Short for “all.” This is the combination of “u”, “g”, and “o”.  </td>
    </tr>
</table>
    
If no character is specified, “all” will be assumed. The operation may be a “+” indicating that a permission is to be added, a “-” indicating that a permission is to be taken away, or 
a “=” indicating that only the specified permissions are to be applied and that all others are to be removed. 
Permissions are specified with the “r”, “w”, and “x” characters. 

#### `chmod` Symbolic Notation Examples: 
<table>
    <thead>
        <th>Notation</th>
        <th>Meaning</th>
    </thead>
    <tr>
        <td><code>u+x</code></td>
        <td>Add execute permission for the owner.  </td>
    </tr>
    <tr>
        <td><code>u-x</code></td>
        <td>Remove execute permission from the owner.  </td>
    </tr>
    <tr>
        <td><code>+x</code></td>
        <td>Add execute permission for the owner, group, and world. This is equivalent to <code>a+x</code>.</td>
    </tr>
    <tr>
        <td><code>o-rw</code></td>
        <td>Remove the read and write permissions from anyone besides the owner and group owner.  </td>
    </tr>
    <tr>
        <td><code>go=rw</code></td>
        <td>Set the group owner and anyone besides the owner to have read and write permission. If either the group owner or the world previously had execute permission, it is removed. <code>go</code> stands for group and others  </td>
    </tr>
    <tr>
        <td><code>u+x,go=rx</code></td>
        <td>Add execute permission for the owner and set the permissions for the group and others to read and execute. Multiple specifications may be separated by commas.  </td>
    </tr>
</table>
Some people prefer to use octal notation, and some folks really like the symbolic. Symbolic notation does offer the advantage of allowing us to set a single attribute without disturbing any of the others. 

#### Copy file permissions
You can use the "chmod" command to set the file permissions of a file to mimic the permission attributes of another file.
```
chmod --reference=file2 file1
```
In this example, the "--reference" option specifies that the file permissions of "file1" should be set to match the file permissions of "file2". After running this command, "file1" will have the same file permissions as "file2", including the user, group, and other permissions.

#### `umask` – Set Default Permissions 
The `umask` command controls the default permissions given to a file when it is created. It uses octal notation to express a mask of bits to be removed from a file's mode attributes. 
```
[me@linuxbox ~]$ rm -f foo.txt 
[me@linuxbox ~]$ umask 
0002 
[me@linuxbox ~]$ > foo.txt 
[me@linuxbox ~]$ ls -l foo.txt 
-rw-rw-r-- 1 me me 0 2018-03-06 14:53 foo.txt 
```
> *The command* `rm -f` *in the shell is used to remove files and directories forcibly, without asking for confirmation from the user. The* `-f` *flag stands for "force", and it instructs the* `rm` *(remove) command to delete files and directories without prompting the user for confirmation.* 

We first removed any old copy of `foo.txt` to make sure we were starting fresh. Next, we ran the `umask` command without an argument to see the current value. It responded 
with the value `0002` (the value `0022` is another common default value), which is the octal representation of our mask. We next create a new instance of the file `foo.txt` and observe its permissions. 
We can see that both the owner and group get read and write permission, while everyone else only gets read permission. The reason that world does not have write permission is because of the value of the mask. Let's repeat our example, this time setting the mask ourselves. 
```
[me@linuxbox ~]$ rm foo.txt 
[me@linuxbox ~]$ umask 0000 
[me@linuxbox ~]$ > foo.txt 
[me@linuxbox ~]$ ls -l foo.txt 
-rw-rw-rw- 1 me me 0 2018-03-06 14:58 foo.txt 
```
When we set the mask to `0000` (effectively turning it off), we see that the file is now world writable. To understand how this works, we have to look at octal numbers again. If we take the mask, expand it into binary, and then compare it to the attributes we can see what happens. 
<table align="center">
    <tr>
        <th>Original file mode</th>
        <td><code>--- rw- rw- rw-</code></td>
    </tr>
    <tr>
        <th>Mask</th>
        <td><code>000 000 000 010</code></td>
    </tr>
    <tr>
        <th>Result</th>
        <td><code>--- rw- rw- r--</code></td>
    </tr>
</table>
Ignore for the moment the leading zeros (we'll get to those in a minute) and observe that where the 1 appears in our mask, an attribute was removed — in this case, the world write permission. That's what the mask does. Everywhere a 1 appears in the binary value of the mask, an attribute is unset. If we look at a mask value of 0022, we can see what it does. 
<table align="center">
    <tr>
        <th>Original file mode</th>
        <td><code>--- rw- rw- rw-</code></td>
    </tr>
    <tr>
        <th>Mask</th>
        <td><code>000 000 010 010</code></td>
    </tr>
    <tr>
        <th>Result</th>
        <td><code>--- rw- r-- r--</code></td>
    </tr>
</table>
Most of the time we won't have to change the mask; the default provided by the distribution will be fine. In some high-security situations, however, we will want to control it. 

### Changing Identities
At various times, we may find it necessary to take on the identity of another user. Often, we want to gain superuser privileges to carry out some administrative tasks, but it is also 
possible to “become” another regular user for such things as testing an account. There are three ways to take on an alternate identity. 
    1.	Log out and log back in as the alternate user. 
    2.	Use the `su` command. 
    3.	Use the `sudo` command. 
From within our own shell session, the `su` command allows us to assume the identity of another user and either start a new shell session with that user's ID, or to issue a single command as that user. The `sudo` command allows an administrator to set up a configuration file called `/etc/sudoers` and define specific commands that particular users are permitted to execute under an assumed identity. The choice of which command to use is largely determined by which Linux distribution you use. Your distribution probably includes both commands, but its configuration will favor either one or the other.
#### `su` – Run a Shell with Substitute User and Group IDs 
The `su` command is used to start a shell as another user. 
```
su [-[l]] [user] 
```
If the “`-l`” option is included, the resulting shell session is a login shell for the specified user. This means the user's environment is loaded and the working directory is changed to the user's home directory. This is usually what we want. If the user is not specified, the superuser is assumed. Notice that (strangely) the `-l` may be abbreviated as `-`, which is how it is most often used. To start a shell for the superuser, we would do this: 
```
[me@linuxbox ~]$ su - 
Password: 
[root@linuxbox ~]# 
```
After entering the command, we are prompted for the superuser's password. If it is successfully entered, a new shell prompt appears indicating that this shell has superuser privileges (the trailing `#` rather than a `$`), and the current working directory is now the home directory for the superuser (normally /root). Once in the new shell, we can carry out commands as the superuser. When finished, enter `exit` to return to the previous shell. 
It is also possible to execute a single command rather than starting a new interactive command by using su this way. 
```
su -c 'command' 
```
Using this form, a single command line is passed to the new shell for execution. It is important to enclose the command in quotes, as we do not want expansion to occur in our shell, but rather in the new shell. 
```
[me@linuxbox ~]$ su -c 'ls -l /root/*' 
Password: 
-rw------- 1 root root 754 2007-08-11 03:19 /root/anaconda-ks.cfg 
/root/Mail: 
total 0 
[me@linuxbox ~]$ 
```
 
#### `sudo` – Execute a Command as Another User 
The `sudo` command is like `su` in many ways but has some important additional capabilities. The administrator can configure `sudo` to allow an ordinary user to execute commands as a different user (usually the superuser) in a controlled way. In particular, a user may be restricted to one or more specific commands and no others. Another important difference is that the use of `sudo` does not require access to the superuser's password. Authentication using `sudo`, requires the users own password. Let's say, for example, that `sudo` has been configured to allow us to run a fictitious backup program called “backup_script”, which requires superuser privileges. With `sudo` it would be done like this: 
```
[me@linuxbox ~]$ sudo backup_script 
Password: 
System Backup Starting... 
```
After entering the command, we are prompted for our password (not the superuser's) and once the authentication is complete, the specified command is carried out. One important difference between `su` and `sudo` is that `sudo` does not start a new shell, nor does it load another user's environment. This means that commands do not need to be quoted any differently than they would be without using `sudo`. Note that this behaviour can be overridden by specifying various options. Note, too, that `sudo` can be used to start an interactive superuser session (much like `su -`) by using the `-i` option. See the sudo man page for details. 
To see what privileges are granted by `sudo`, use the `-l` option to list them: 
```
[me@linuxbox ~]$ sudo -l 
User me may run the following commands on this host: 
    (ALL) ALL 
```

#### `chown` – Change File Owner and Group 
The `chown` command is used to change the owner and group owner of a file or directory. Superuser privileges are required to use this command. The syntax of `chown` looks like this: 
```
chown [owner][:[group]] file... 
```
`chown` can change the file owner and/or the file group owner depending on the first argument of the command. 
`chown` Argument Examples: 
<table>
    <thead>
        <th>Argument </th>
        <th>Results  </th>
    </thead>
    <tr>
        <td><code>bob</code></td>
        <td>Changes the ownership of the file from its current owner to user <code>bob.</code></td>
    </tr>
    <tr>
        <td><code>bob:users</code></td>
        <td>Changes the ownership of the file from its current owner to user <code>bob</code> and changes the file group owner to group <code>users</code>.  </td>
    </tr>
    <tr>
        <td><code>:admins</code></td>
        <td>Changes the group owner to the group <code>admins</code>. The file owner is unchanged.  </td>
    </tr>
    <tr>
        <td><code>bob:</code></td>
        <td>Changes the file owner from the current owner to user <code>bob</code> and changes the group owner to the login group of user <code>bob</code>.</td>
    </tr>
</table> 

Let's say we have two users; `janet`, who has access to superuser privileges and `tony`, who does not. User `janet` wants to  copy a file from her home directory to the home directory of user `tony`. Since user `janet` wants tony to be able to edit the file, `janet` changes the ownership of the copied file from `janet` to `tony`.

```
[janet@linuxbox ~]$ sudo cp myfile.txt ~tony 
Password: 
[janet@linuxbox ~]$ sudo ls -l ~tony/myfile.txt 
 -rw-r--r-- 1 root root root 2018-03-20 14:30 /home/tony/myfile.txt 
[janet@linuxbox ~]$ sudo chown tony: ~tony/myfile.txt 
[janet@linuxbox ~]$ sudo ls -l ~tony/myfile.txt 
 -rw-r--r-- 1 tony tony tony 2018-03-20 14:30 /home/tony/myfile.txt 
 ```
 Here we see user `janet` copy the file from her directory to the home directory of user `tony`. Next, `janet` changes the ownership of the file from `root` (a result of using `sudo`) to `tony`. Using the trailing colon in the first argument, `janet` also changed the group ownership of the file to the login group of `tony`, which happens to be group `tony`. Notice that after the first use of `sudo`, `janet` was not prompted for her password. This is because `sudo`, in most configurations, “trusts” us for several minutes until its timer runs out. 

#### `chgrp` – Change Group Ownership 
In older versions of Unix, the `chown` command only changed file ownership, not group ownership. For that purpose, a separate command, `chgrp` was used. It works much the same way as `chown`, except for being more limited. 


### Other Commands: 
- `groups` : When you run the "groups" command in a terminal, it displays the names of the groups to which the current user belongs.
For example, if the current user "john" belongs to the groups "staff" and "developers", running the "groups" command will output:
    ```
    staff developers
    ```
    This command is useful when you need to know which groups a user belongs to, as it can help you determine the user's access rights and permissions. Additionally, the "groups" command can also be used with a username argument to display the groups to which a specific user belongs, like this:
    ```
    groups johndoe
    ```
- `whoami` : When you run the "whoami" command in a terminal, it displays the username of the current user who is logged in. For example, if the current user is "john", running the "`whoami`" command will output "john". This command can be useful in shell scripts or in situations where you need to know the current user's username.
- `adduser` :
    ```
    sudo adduser johndoe
    ```
    This command creates a new user account with the username "`johndoe`". When you run this command, the system will prompt you to enter the new user's password, full name, and other optional details. After providing the required information, the command will create the user account with a home directory in the /home/johndoe directory and the appropriate file permissions.
- `useradd` :
    ```
    sudo useradd johndoe
    ```
    This command creates a new user account with the username "johndoe". By default, the "useradd" command creates a home directory for the new user in the /home/johndoe directory and sets the appropriate file permissions.
    Unlike the "adduser" command, the "useradd" command does not prompt you for additional user details, such as the user's full name or password. To set the user's password, you need to use the "passwd" command after creating the user account, like this:
    ```
    sudo passwd johndoe
    ```
    This command prompts you to enter a new password for the user "johndoe". After setting the password, the new user account is ready for use.
- `addgroup` : 
    ```
    sudo addgroup developers
    ```
    This command creates a new group with the name "developers". By default, the "addgroup" command creates a new group with the same name as the group and creates a group ID (GID) that is the next available number in the system.
    To add users to the group, you can use the "`usermod`" command. Here's an example that adds the user "johndoe" to the "developers" group:
    sudo usermod -a -G developers johndoe
    In this example, the command adds the user "johndoe" to the "developers" group by appending the group name to the user's list of secondary groups (`-a`) using the "`-G`" option.

## Tasks📃
### ☑️ 0. My name is Betty
`mandatory`

Create a script that switches the current user to the user `betty`.
- You should use exactly 8 characters for your command (+1 character for the new line)
- You can assume that the user `betty` will exist when we will run your script
```
julien@ubuntu:/tmp/h$ tail -1 0-iam_betty | wc -c
9
julien@ubuntu:/tmp/h$
```

File: [0-iam_betty]()

### ☑️ 1. Who am I
`mandatory`

Write a script that prints the effective username of the current user.
```
julien@ubuntu:/tmp/h$ ./1-who_am_i
julien
julien@ubuntu:/tmp/h$ 
```

File: [1-who_am_i]()

### ☑️ 2. Groups
`mandatory`

Write a script that prints all the groups the current user is part of.
```
julien@ubuntu:/tmp/h$ ./2-groups
julien adm cdrom sudo dip plugdev lpadmin sambashare
julien@ubuntu:/tmp/h$ 
Note: depending on the user, you will get a different output.
```

File: [2-groups]()

### ☑️ 3. New owner
`mandatory`

Write a script that changes the owner of the file `hello` to the user `betty`.
```
julien@ubuntu:/tmp/h$ ls -l
total 4
-rwxrw-r-- 1 julien julien 30 Sep 20 14:23 3-new_owner
-rw-rw-r-- 1 julien julien  0 Sep 20 14:18 hello
julien@ubuntu:/tmp/h$ sudo ./3-new_owner 
julien@ubuntu:/tmp/h$ ls -l
total 4
-rwxrw-r-- 1 julien julien 30 Sep 20 14:23 3-new_owner
-rw-rw-r-- 1 betty  julien  0 Sep 20 14:18 hello
julien@ubuntu:/tmp/h$
```

File: [3-new_owner]()

### ☑️ 4. Empty!
`mandatory`

Write a script that creates an empty file called `hello`.

File: [4-empty]()

### ☑️ 5. Execute
`mandatory`

Write a script that adds execute permission to the owner of the file `hello`.
- The file `hello` will be in the working directory
```
julien@ubuntu:/tmp/h$ ls -l
total 8
-rwxrw-r-- 1 julien julien 28 Sep 20 14:26 5-execute
-rw-rw-r-- 1 julien julien 23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ ./hello
bash: ./hello: Permission denied
julien@ubuntu:/tmp/h$ ./5-execute 
julien@ubuntu:/tmp/h$ ls -l
total 8
-rwxrw-r-- 1 julien julien 28 Sep 20 14:26 5-execute
-rwxrw-r-- 1 julien julien 23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ 
```
File: [5-execute]()

### ☑️ 6. Multiple permissions
`mandatory`

Write a script that adds execute permission to the owner and the group owner, and read permission to other users, to the file `hello`.
- The file `hello` will be in the working directory
```
julien@ubuntu:/tmp/h$ ls -l
total 8
-rwxrw-r-- 1 julien julien 36 Sep 20 14:31 6-multiple_permissions
-r--r----- 1 julien julien 23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ ./6-multiple_permissions 
julien@ubuntu:/tmp/h$ ls -l
total 8
-rwxrw-r-- 1 julien julien 36 Sep 20 14:31 6-multiple_permissions
-r-xr-xr-- 1 julien julien 23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ 
```
File: [6-multiple_permissions]()

### ☑️ 7. Everybody!
`mandatory`

Write a script that adds execution permission to the owner, the group owner and the other users, to the file `hello`
- The file `hello` will be in the working directory
- You are not allowed to use commas for this script
```
julien@ubuntu:/tmp/h$ ls -l
total 8
-rwxrw-r-- 1 julien julien 28 Sep 20 14:35 7-everybody
-rw-r----- 1 julien julien 23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ ./7-everybody 
julien@ubuntu:/tmp/h$ ls -l
total 8
-rwxrw-r-- 1 julien julien 28 Sep 20 14:35 7-everybody
-rwxr-x--x 1 julien julien 23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ 
```
File: [7-everybody]()

### ☑️ 8.  James Bond
`mandatory`

Write a script that sets the permission to the file `hello` as follows:
- Owner: no permission at all
- Group: no permission at all
- Other users: all the permissions
The file `hello` will be in the working directory You are not allowed to use commas for this script
```
julien@ubuntu:/tmp/h$ ls -l
total 8
-rwxrw-r-- 1 julien julien 28 Sep 20 14:40 8-James_Bond
-rwxr-x--x 1 julien julien 23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ ./8-James_Bond 
julien@ubuntu:/tmp/h$ ls -l
total 8
-rwxrw-r-- 1 julien julien 28 Sep 20 14:40 8-James_Bond
-------rwx 1 julien julien 23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ 
```
File: [8-James_Bond]()

### ☑️ 9. John Doe
`mandatory`

Write a script that sets the mode of the file `hello` to this:
```
-rwxr-x-wx 1 julien julien 23 Sep 20 14:25 hello
```
- The file `hello` will be in the working directory
- You are not allowed to use commas for this script

File: [9-John_Doe]()

### ☑️ 10. Look in the mirror
`mandatory`

Write a script that sets the mode of the file `hello` the same as `olleh`’s mode.
- The file `hello` will be in the working directory
- The file `olleh` will be in the working directory
```
julien@ubuntu:/tmp/h$ ls -l
total 8
-rwxrw-r-- 1 julien julien 42 Sep 20 14:45 10-mirror_permissions
-rwxr-x-wx 1 julien julien 23 Sep 20 14:25 hello
-rw-rw-r-- 1 julien julien  0 Sep 20 14:43 olleh
julien@ubuntu:/tmp/h$ ./10-mirror_permissions 
julien@ubuntu:/tmp/h$ ls -l
total 8
-rwxrw-r-- 1 julien julien 42 Sep 20 14:45 10-mirror_permissions
-rw-rw-r-- 1 julien julien 23 Sep 20 14:25 hello
-rw-rw-r-- 1 julien julien  0 Sep 20 14:43 olleh
julien@ubuntu:/tmp/h$ 
```
Note: the mode of `olleh` will not always be 664. Make sure your script works for any mode.

File: [10-mirror_permissions]()

### ☑️ 11. Directories
`mandatory`

Create a script that adds execute permission to all subdirectories of the <b>current directory</b> for the owner, the group owner and all other users.
Regular files should not be changed.
```
julien@ubuntu:/tmp/h$ ls -l
total 20
-rwxrwxr-x 1 julien julien   24 Sep 20 14:53 11-directories_permissions
drwx------ 2 julien julien 4096 Sep 20 14:49 dir0
drwx------ 2 julien julien 4096 Sep 20 14:49 dir1
drwx------ 2 julien julien 4096 Sep 20 14:49 dir2
-rw-rw-r-- 1 julien julien   23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ ./11-directories_permissions 
julien@ubuntu:/tmp/h$ ls -l
total 20
-rwxrwxr-x 1 julien julien   24 Sep 20 14:53 11-directories_permissions
drwx--x--x 2 julien julien 4096 Sep 20 14:49 dir0
drwx--x--x 2 julien julien 4096 Sep 20 14:49 dir1
drwx--x--x 2 julien julien 4096 Sep 20 14:49 dir2
-rw-rw-r-- 1 julien julien   23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ 
```
File: [11-directories_permissions]()

>`-R`*: This option stands for "recursive" and applies the command to all files and directories within the specified directory.*

>`+X`*: This option sets the execute permission* (`+X`) *on all directories and files, but only if they are already marked as executable. It does not set the execute permission on files that are not executable.*


### ☑️ 12. More directories
`mandatory`

Create a script that creates a directory called `my_dir` with permissions 751 in the working directory.
```
julien@ubuntu:/tmp/h$ ls -l
total 20
-rwxrwxr-x 1 julien julien   39 Sep 20 14:59 12-directory_permissions
drwx--x--x 2 julien julien 4096 Sep 20 14:49 dir0
drwx--x--x 2 julien julien 4096 Sep 20 14:49 dir1
drwx--x--x 2 julien julien 4096 Sep 20 14:49 dir2
-rw-rw-r-- 1 julien julien   23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ ./12-directory_permission s
julien@ubuntu:/tmp/h$ ls -l
total 24
-rwxrwxr-x 1 julien julien   39 Sep 20 14:59 12-directory_permissions
drwx--x--x 2 julien julien 4096 Sep 20 14:49 dir0
drwx--x--x 2 julien julien 4096 Sep 20 14:49 dir1
drwx--x--x 2 julien julien 4096 Sep 20 14:49 dir2
drwxr-x--x 2 julien julien 4096 Sep 20 14:59 my_dir
-rw-rw-r-- 1 julien julien   23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ 
```
File: [12-directory_permissions]()

### ☑️ 13. Change group
`mandatory`

Write a script that changes the group owner to `school` for the file `hello`
- The file `hello` will be in the working directory
```
julien@ubuntu:/tmp/h$ ls -l
total 24
-rwxrwxr-x 1 julien julien   34 Sep 20 15:03 13-change_group
drwx--x--x 2 julien julien 4096 Sep 20 14:49 dir0
drwx--x--x 2 julien julien 4096 Sep 20 14:49 dir1
drwx--x--x 2 julien julien 4096 Sep 20 14:49 dir2
drwxr-x--x 2 julien julien 4096 Sep 20 14:59 my_dir
-rw-rw-r-- 1 julien julien   23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ sudo ./13-change_group 
julien@ubuntu:/tmp/h$ ls -l
total 24
-rwxrwxr-x 1 julien julien      34 Sep 20 15:03 13-change_group
drwx--x--x 2 julien julien    4096 Sep 20 14:49 dir0
drwx--x--x 2 julien julien    4096 Sep 20 14:49 dir1
drwx--x--x 2 julien julien    4096 Sep 20 14:49 dir2
drwxr-x--x 2 julien julien    4096 Sep 20 14:59 my_dir
-rw-rw-r-- 1 julien school   23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ 
```
File: [13-change_group]()

### ☑️ 14. Owner and group
`#advanced`

Write a script that changes the owner to `vincent` and the group owner to `staff` for all the files and directories in the working directory.
```
julien@ubuntu:/tmp/h$ ls -l
total 24
-rwxrwxr-x 1 julien julien   36 Sep 20 15:06 100-change_owner_and_group
drwx--x--x 2 julien julien 4096 Sep 20 14:49 dir0
drwx--x--x 2 julien julien 4096 Sep 20 14:49 dir1
drwx--x--x 2 julien julien 4096 Sep 20 14:49 dir2
drwxr-x--x 2 julien julien 4096 Sep 20 14:59 my_dir
-rw-rw-r-- 1 julien julien   23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ sudo ./100-change_owner_and_group 
julien@ubuntu:/tmp/h$ ls -l
total 24
-rwxrwxr-x 1 vincent staff   36 Sep 20 15:06 100-change_owner_and_group
drwx--x--x 2 vincent staff 4096 Sep 20 14:49 dir0
drwx--x--x 2 vincent staff 4096 Sep 20 14:49 dir1
drwx--x--x 2 vincent staff 4096 Sep 20 14:49 dir2
drwxr-x--x 2 vincent staff 4096 Sep 20 14:59 my_dir
-rw-rw-r-- 1 vincent staff   23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ 
```
File: [100-change_owner_and_group]()

### ☑️ 15. Symbolic links
`#advanced`

Write a script that changes the owner and the group owner of `_hello` to `vincent` and `staff` respectively.
- The file `_hello` is in the working directory
- The file `_hello` is a symbolic link
```
julien@ubuntu:/tmp/h$ ls -l
total 24
-rwxrwxr-x 1 julien julien   44 Sep 20 15:12 101-symbolic_link_permissions
-rw-rw-r-- 1 julien julien   23 Sep 20 14:25 hello
lrwxrwxrwx 1 julien julien    5 Sep 20 15:10 _hello -> hello
julien@ubuntu:/tmp/h$ sudo ./101-symbolic_link_permissions 
julien@ubuntu:/tmp/h$ ls -l
total 24
-rwxrwxr-x 1 julien julien      44 Sep 20 15:12 101-symbolic_link_permissions
-rw-rw-r-- 1 julien julien      23 Sep 20 14:25 hello
lrwxrwxrwx 1 vincent  staff    5 Sep 20 15:10 _hello -> hello
julien@ubuntu:/tmp/h$ 
```
File: [101-symbolic_link_permissions]()

*To change the ownership of a symbolic link in shell, you can use the `chown` command along with the `-h` flag. The `-h` *flag tells* `chown` to change the ownership of the symbolic link itself rather than the file it points to.*

*Here's the basic syntax:*
```
chown -h new_owner symlink_name
```
*Replace new_owner with the new owner's username or UID, and symlink_name with the name of the symbolic link you want to change ownership for.*

*For example, if you want to change the ownership of a symbolic link named mylink to user john, you would run the following command:*
```
chown -h john mylink
```

### ☑️ 16. If only
`#advanced`

Write a script that changes the owner of the file `hello` to `betty` only if it is owned by the user `guillaume`.
- The file `hello` will be in the working directory
```
julien@ubuntu:/tmp/h$ ls -l
total 24
-rwxrwxr-x 1 julien    julien      47 Sep 20 15:18 102-if_only 
-rw-rw-r-- 1 guillaume julien      23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ sudo ./102-if_only 
julien@ubuntu:/tmp/h$ ls -l
total 24
-rwxrwxr-x 1 julien julien      47 Sep 20 15:18 102-if_only 
-rw-rw-r-- 1 betty  julien      23 Sep 20 14:25 hello
julien@ubuntu:/tmp/h$ 
```

File: [102-if_only]()

### ☑️ 17. Star Wars
`#advanced`

Write a script that will play the StarWars IV episode in the terminal.

File: [103-Star_Wars]()
