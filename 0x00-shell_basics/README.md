# **0x00. SHELL, BASICS**

# Concepts I tackled🎯
## [What Is “The Shell”?](http://linuxcommand.org/lc3_lts0010.php)
<p>The shell is a program that takes commands from the keyboard and gives them to the operating system to perform. It serves as an intermediary between the terminal and the underlying O.S. </p>

<p>The terminal is a text-based / command-line interface that gives the user access to shell sessions / allows the user to interact with the shell.</p>

<p>A shell prompt is a command line interface that allows a user to interact with a shell program, such as Bash or Zsh, in order to execute commands and perform various tasks. The prompt is typically a text string that appears at the beginning of a line, indicating that the shell is ready to accept input. The prompt usually displays information about the current working directory, the user's login name, and the hostname of the system. The user can then type in a command or a series of commands, which the shell will interpret and execute accordingly. The shell prompt is a fundamental part of using a command line interface, and mastering it is an important skill for any system administrator or developer.</p>

```
[me@linuxbox ~]$
```
<p>This is called a shell prompt and it will appear whenever the shell is ready to accept input. While it may vary in appearance somewhat depending on the distribution, it will typically include your <code>username@machinename</code>, followed by the current working directory and a dollar sign.</p>

<p>The name “bash” is an acronym for “Bourne Again Shell”, a reference to the fact bash is an enhanced replacement for sh, the original Unix shell program written by Steve Bourne.</p>

![Image 1](https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x00-shell_basics/resources/Image-1.png)

![Image 2](https://cdn.educba.com/academy/wp-content/uploads/2020/01/Bash-Shell-in-Linux-2.jpg)

## [Navigation](http://linuxcommand.org/lc3_lts0020.php)
<p><code>rm -r</code> will recursively delete a directory and all its contents (normally rm will not delete directories, while rmdir will only delete empty directories) </p>

<p>If we type <code>cd</code> followed by nothing, <code>cd</code> will change the working directory to our home directory. 
    <div> A related shortcut is to type <code>cd ~user_name</code>. In this case, <code>cd</code> will change the working directory to the home directory of the specified user. Typing <code>cd -</code> changes the working directory to the previous one.</div>
</p>

<p>File names in Linux, like Unix, are case sensitive. The file names "File1" and "file1" refer to different files.  
    <div> Case sensitivity determines whether uppercase (FOO.txt) and lowercase (foo.txt) letters are handled as distinct (case-sensitive) or equivalent (case-insensitive) in a file name or directory. </div> 
    <div>Case-sensitive: FOO.txt ≠ foo.txt ≠ Foo.txt</div> <div>Case-insensitive: FOO.txt = foo.txt = Foo.txt </div>
    <div>Windows file system treats file and directory names as case-insensitive. FOO.txt and foo.txt will be treated as equivalent files.</div>
</p>

![Image 3](https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x00-shell_basics/resources/Image-3.png)
    
<p> 
    <div>Command options, like filenames in Linux, are case-sensitive. </div>
</p>
<p>We can specify pathnames in one of two different ways; as absolute pathnames or as relative pathnames. Where an absolute pathname starts from the root directory and leads to its destination, a relative pathname starts from the working directory.</p>

<p>
    <div>The working directory is the directory in which the user is currently working. </div>
    <div>The root directory is the top-level directory in the file system hierarchy.</div>
    <div>The home directory is the default directory for a user when they log in.</div>
</p>


## [Looking Around](http://linuxcommand.org/lc3_lts0030.php)
### `ls` Options
<table align="center">
    <tr>
        <td><code>-A</code></td>
        <td><code>--almost-all </code></td>
        <td>Like the <code>-a</code> option above except it does not list <code>.</code> (current directory) and <code>..</code> (parent directory). </td>
    </tr>
    <tr>
        <td><code>-d</code></td>
        <td><code>--directory</code></td>
        <td>Ordinarily, if a directory is specified, <code>ls</code> will list the contents of the directory, not the directory itself. Use this option in conjunction with the <code>-l</code> option to see details about the directory rather than its contents. </td>
    </tr>
    <tr>
        <td><code>-F</code></td>
        <td><code>--classify</code></td>
        <td>This option will append an indicator character to the end of each listed name. For example, a forward slash (<code>/</code>) if the name is a directory. </td>
    </tr>
    <tr>
        <td><code>-h</code></td>
        <td><code>--human-readable</code></td>
        <td>In long format listings, display file sizes in human readable format rather than in bytes. </td>
    </tr>
    <tr>
        <td><code>-S</code></td>
        <td><code>null</code></td>
        <td>Sort results by file size. </td>
    </tr>
</table>
| -A | --almost-all     | Like the -a option above except it does not list . (current directory) and .. (parent directory).                                                                                                                             |
|----|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| -d | --directory      | Ordinarily, if a directory is specified, ls will list the contents of the directory, not the directory itself. Use this option in conjunction with the -l option to see details about the directory rather than its contents. |
| -F | --classify       | This option will append an indicator character to the end of each listed name. For example, a forward slash (/) if the name is a directory.                                                                                   |
| -h | --human-readable | In long format listings, display file sizes in human readable format rather than in bytes.                                                                                                                                    |
| -S | null             | Sort results by file size.                                                                                                                                                                                                    |

### A Longer Look at Long Format 
<table align="center">
    <thead >
        <th>Field </th>
        <th>Meaning  </th>
    </thead>
    <tr>
        <td><code> -rw-r--r-- </code></td>
        <td>Access rights to the file. The first character indicates the type of file. Among the different types, a leading dash means a regular file, while a “d” indicates a directory. The next three characters are the access rights for the file's owner, the next three are for members of the file's group, and the final three are for everyone else. Chapter 9 "Permissions" discusses the full meaning of this in more detail.  </td>
    </tr>
    <tr>
        <td><code> 1 </code></td>
        <td>File's number of hard links. See the sections "Symbolic Links" and "Hard Links" later in this chapter.  </td>
    </tr>
    <tr>
        <td><code> root </code></td>
        <td>The username of the file's owner.  </td>
    </tr>
    <tr>
        <td><code> root </code></td>
        <td>The name of the group that owns the file.  </td>
    </tr>
    <tr>
        <td><code> 32059 </code></td>
        <td>Size of the file in bytes.  </td>
    </tr>
    <tr>
        <td><code> 2007-04-03 11:05 </code></td>
        <td>Date and time of the file's last modification.  </td>
    </tr>
    <tr>
        <td><code> oo-cd-cover.odf </code></td>
        <td>Name of the file.  </td>
    </tr>
</table>

### Determining a File's Type with `file` 
We can invoke the file command this way: `file filename` 

### Viewing File Contents with `less`
<p><div>What Is “Text”? </div>
There are many ways to represent information on a computer. All methods involve defining a relationship between the information and some numbers that will be used to represent it. Computers, after all, only understand numbers and all data is converted to numeric representation.  
Some of these representation systems are very complex (such as compressed video files), while others are rather simple. One of the earliest and simplest is called ASCII text. ASCII (pronounced "As-Key") is short for American Standard Code for Information Interchange. This is a simple encoding scheme that was first used on Teletype machines to map keyboard characters to numbers. 
Text is a simple one-to-one mapping of characters to numbers. It is very compact. Fifty characters of text translates to fifty bytes of data. It is important to understand that text only contains a simple mapping of characters to numbers. It is not the same as a word processor document such as one created by Microsoft Word or LibreOffice Writer. Those files, in contrast to simple ASCII text, contain many non-text elements that are used to describe its structure and formatting. Plain ASCII text files contain only the characters themselves and a few rudimentary control codes such as tabs, carriage returns and line feeds. 
<div>Throughout a Linux system, many files are stored in text format and there are many Linux tools that work with text files. Even Windows recognizes the importance of this format. The well-known NOTEPAD.EXE program is an editor for plain ASCII text files.</div> </p>

Why would we want to examine text files? Because many of the files that contain system settings (called configuration files) are stored in this format, and being able to read them gives us insight about how the system works. In addition, some of the actual programs that the system uses (called scripts) are stored in this format.

<p><div>Less Is More:</div>
The less program was designed as an improved replacement of an earlier Unix program called more. The name “less” is a play on the phrase “less is more” — a motto of modernist architects and designers. less falls into the class of programs called “pagers,” programs that allow the easy viewing of long text documents in a page-by-page manner. Whereas the more program could only page forward, the less program allows paging both forward and backward and has many other features as well.</p>

### Symbolic Links
As we look around, we are likely to see a directory listing (for example, /lib) with an entry like this: 
```
lrwxrwxrwx 1 root root 11 2007-08-11 07:34 libc.so.6 -> libc-2.6.so 
```

Notice how the first letter of the listing is “`l`” and the entry seems to have two filenames? This is a special kind of a file called a symbolic link (also known as a soft link or sym-link). In most Unix-like systems it is possible to have a file referenced by multiple names. While the value of this might not be obvious, it is really a useful feature. 

Picture this scenario: A program requires the use of a shared resource of some kind contained in a file named “foo,” but “foo” has frequent version changes. It would be good to include the version number in the filename so the administrator or other interested party could see what version of “foo” is installed. This presents a problem. If we change the name of the shared resource, we have to track down every program that might use it and change it to look for a new resource name every time a new version of the resource is installed. That doesn't sound like fun at all. 

Here is where symbolic links save the day. Suppose we install version 2.6 of “foo,” which has the filename “foo-2.6” and then create a symbolic link simply called “foo” that points to “foo-2.6.” This means that when a program opens the file “foo”, it is actually opening the file “foo-2.6”. Now everybody is happy. The programs that rely on “foo” can find it and we can still see what actual version is installed. When it is time to upgrade to “foo-2.7,” we just add the file to our system, delete the symbolic link “foo” and create a new one that points to the new version. Not only does this solve the problem of the version upgrade, but it also allows us to keep both versions on our machine. Imagine that “foo-2.7” has a bug (damn those developers!) and we need to revert to the old version. Again, we just delete the symbolic link pointing to the new version and create a new symbolic link pointing to the old version. The directory listing at the beginning of this section (from the /lib directory of a Fedora system) shows a symbolic link called libc.so.6 that points to a shared library file called libc-2.6.so. This means that programs looking for libc.so.6 will actually get the file libc-2.6.so.



## [A Guided Tour](http://linuxcommand.org/lc3_lts0040.php)

## [Manipulating Files](http://linuxcommand.org/lc3_lts0050.php)
Some of the tasks performed by these commands are more easily done with a graphical file manager. With a file manager, we can drag and drop a file from one directory to another, cut and paste files, delete files, and so on. So why use these old command line programs? 
The answer is power and flexibility. While it is easy to perform simple file manipulations with a graphical file manager, complicated tasks can be easier with the command line programs. For example, how could we copy all the HTML files from one directory to another but only copy files that do not exist in the destination directory or are newer than the versions in the destination directory? It's pretty hard with a file manager but pretty easy with the command line. 
```
cp -u *.html destination
```

### Wildcards
Using wildcards (which is also known as **globbing**) allows us to select filenames based on patterns of characters.
<table align="center">
    <thead>
        <th>Wildcard </th>
        <th>Meaning  </th>
    </thead>
    <tr>
        <td><code>*</code></td>
        <td>Matches any characters  </td>
    </tr>
    <tr>
        <td><code>?</code></td>
        <td>Matches any single character  </td>
    </tr>
    <tr>
        <td><code>[characters]</code></td>
        <td>Matches any character that is a member of the set characters  </td>
    </tr>
    <tr>
        <td><code>[!characters]</code></td>
        <td>Matches any character that is not a member of the set characters  </td>
    </tr>
    <tr>
        <td><code>[[:class:]]</code></td>
        <td>Matches any character that is a member of the specified class  </td>
    </tr>
</table>

### Commonly Used Character Classes
<table align="center">
    <thead>
        <th>Character Class </th>
        <th>Meaning  </th>
    </thead>
    <tr>
        <td><code>[:alnum:]</code></td>
        <td>Matches any alphanumeric character  </td>
    </tr>
    <tr>
        <td><code>[:alpha:]</code></td>
        <td>Matches any alphabetic character  </td>
    </tr>
    <tr>
        <td><code>[:digit:]</code></td>
        <td>Matches any numeral  </td>
    </tr>
    <tr>
        <td><code>[:lower:]</code></td>
        <td>Matches any lowercase letter  </td>
    </tr>
    <tr>
        <td><code>[:upper:]</code></td>
        <td>Matches any uppercase letter  </td>
    </tr>
</table>
Using wildcards makes it possible to construct sophisticated selection criteria for filenames. The table below provides some examples of patterns and what they match.
<table align="center">
    <thead>
        <th>Pattern </th>
        <th>Matches  </th>
    </thead>
    <tr>
        <td><code>*</code></td>
        <td>All files  </td>
    </tr>
    <tr>
        <td><code>g*</code></td>
        <td>Any file beginning with “g”  </td>
    </tr>
    <tr>
        <td><code>b*.txt</code></td>
        <td>Any file beginning with “b” followed by any characters and ending with “.txt”  </td>
    </tr>
    <tr>
        <td><code>Data???</code></td>
        <td>Any file beginning with “Data” followed by exactly three characters  </td>
    </tr>
    <tr>
        <td><code>[abc]*</code></td>
        <td>Any file beginning with either an “a”, a “b”, or a “c”  </td>
    </tr>
    <tr>
        <td><code>BACKUP.[0-9][0-9][0-9]</code></td>
        <td>Any file beginning with “BACKUP.” followed by exactly three numerals  </td>
    </tr>
    <tr>
        <td><code>[[:upper:]]*</code></td>
        <td>Any file beginning with an uppercase letter  </td>
    </tr>
    <tr>
        <td><code>[![:digit:]]*</code></td>
        <td>Any file not beginning with a numeral  </td>
    </tr>
    <tr>
        <td><code>*[[:lower:]123]</code></td>
        <td>Any file ending with a lowercase letter or the numerals “1”, “2”, or “3”  </td>
    </tr>
</table>

### `ln` – Create hard and symbolic links
```
ln file link 
```
The following creates a symbolic link: 
```
ln -s item link 
```
to create a symbolic link where item is either a file or a directory.

### Hard Links
Hard links are the original Unix way of creating links, compared to symbolic links, which are more modern. By default, every file has a single hard link that gives the file its name. When we create a hard link, we create an additional directory entry for a file. Hard links have two important limitations: 
1. A hard link cannot reference a file outside its own file system. This means a link cannot reference a file that is not on the same disk partition as the link itself. 
2. A hard link may not reference a directory. 

A hard link is indistinguishable from the file itself. Unlike a symbolic link, when we list a directory containing a hard link we will see no special indication of the link. When a hard link is deleted, the link is removed but the contents of the file itself continue to exist (that is, its space is not deallocated) until all links to the file are deleted. It is important to be aware of hard links because you might encounter them from time to time, but modern practice prefers symbolic links. 
<p><div>Creating Hard Links </div>
We’ll first create some hard links to our data file like so:</p>

```
[me@linuxbox playground]$ ln fun fun-hard 
[me@linuxbox playground]$ ln fun dir1/fun-hard 
[me@linuxbox playground]$ ln fun dir2/fun-hard 
```
So now we have four instances of the file `fun`. Let's take a look at our playground directory. 
```
[me@linuxbox playground]$ ls -l 
total 16 
drwxrwxr-x 2 me me 4096 2018-01-14 16:17 dir1 
drwxrwxr-x 2 me me 4096 2018-01-14 16:17 dir2 
-rw-r--r-- 4 me me 1650 2018-01-10 16:33 fun 
-rw-r--r-- 4 me me 1650 2018-01-10 16:33 fun-hard 
```
One thing we notice is that both the second fields in the listings for fun and fun-hard contain a 4 which is the number of hard links that now exist for the file. Remember that a file will always have at least one link because the file's name is created by a link. So, how do we know that fun and fun-hard are, in fact, the same file? In this case, ls is not very helpful. While we can see that fun and fun-hard are both the same size (field 5), our listing provides no way to be sure. To solve this problem, we're going to have to dig a little deeper. 
When thinking about hard links, it is helpful to imagine that files are made up of two parts. 
1.	The data part containing the file's contents. 
2.	The name part that holds the file's name. 

When we create hard links, we are actually creating additional name parts that all refer to the same data part. The system assigns a chain of disk blocks to what is called an inode, which is then associated with the name part. Each hard link therefore refers to a specific inode containing the file's contents. The `ls` command has a way to reveal this information. It is invoked with the `-i` option.
```
[me@linuxbox playground]$ ls -li 
total 16 
12353539 drwxrwxr-x 2 me me 4096 2018-01-14 16:17 dir1 
12353540 drwxrwxr-x 2 me me 4096 2018-01-14 16:17 dir2 
12353538 -rw-r--r-- 4 me me 1650 2018-01-10 16:33 fun 
12353538 -rw-r--r-- 4 me me 1650 2018-01-10 16:33 fun-hard 
```
In this version of the listing, the first field is the inode number and, as we can see, both `fun` and `fun-hard` share the same inode number, which confirms they are the same file

### Symbolic Links
Symbolic links were created to overcome the limitations of hard links. Symbolic links work by creating a special type of file that contains a text pointer to the referenced file or directory. In this regard, they operate in much the same way as a Windows shortcut, though of course they predate the Windows feature by many years. 

A file pointed to by a symbolic link, and the symbolic link itself are largely indistinguishable from one another. For example, if we write something to the symbolic link, the referenced file is written to. However, when we delete a symbolic link, only the link is deleted, not the file itself. If the file is deleted before the symbolic link, the link will continue to exist but will point to nothing. In this case, the link is said to be broken. In many implementations, the `ls` command will display broken links in a distinguishing color, such as red, to reveal their presence.

<p><div>Creating Symbolic Links:</div>
Symbolic links were created to overcome the two disadvantages of hard links.
<ul><li>Hard links cannot span physical devices.</li>
<li>Hard links cannot reference directories, only files.</li> </ul>
Symbolic links are a special type of file that contains a text pointer to the target file or directory. 
<div>Creating symbolic links is similar to creating hard links.</div>
</p> 

```
[me@linuxbox playground]$ ln -s fun fun-sym 
[me@linuxbox playground]$ ln -s ../fun dir1/fun-sym 
[me@linuxbox playground]$ ln -s ../fun dir2/fun-sym 
```
The first example is pretty straightforward; we simply add the “`-s`” option to create a symbolic link rather than a hard link. But what about the next two? Remember, when we create a symbolic link, we are creating a text description of where the target file is relative to the symbolic link. It's easier to see if we look at the `ls` output shown here: 
```
[me@linuxbox playground]$ ls -l dir1 
total 4 
-rw-r--r-- 4 me me 1650 2018-01-10 16:33 fun-hard 
lrwxrwxrwx 1 me me 6 2018-01-15 15:17 fun-sym -> ../fun
```
The listing for `fun-sym` in `dir1` shows that it is a symbolic link by the leading `l` in the first field and that it points to `../fun`, which is correct. Relative to the location of `fun-sym`, `fun` is in the directory above it. Notice too, that the length of the symbolic link file is 6, the number of characters in the string `../fun` rather than the length of the file to which it is pointing. 

When creating symbolic links, we can either use absolute pathnames, as shown here:
```
[me@linuxbox playground]$ ln -s /home/me/playground/fun dir1/fun-sym 
```
or relative pathnames, as we did in our earlier example. In most cases, using relative pathnames is more desirable because it allows a directory tree containing symbolic links and their referenced files to be renamed and/or moved without breaking the links. In addition to regular files, symbolic links can also reference directories. 
```
[me@linuxbox playground]$ ln -s dir1 dir1-sym 
[me@linuxbox playground]$ ls -l 
total 16 
drwxrwxr-x 2 me me 4096 2018-01-15 15:17 dir1 
lrwxrwxrwx 1 me me 4 2018-01-16 14:45 dir1-sym -> dir1 
drwxrwxr-x 2 me me 4096 2018-01-15 15:17 dir2 
-rw-r--r-- 4 me me 1650 2018-01-10 16:33 fun 
-rw-r--r-- 4 me me 1650 2018-01-10 16:33 fun-hard 
lrwxrwxrwx 1 me me 3 2018-01-15 15:15 fun-sym -> fun
```

### [Linux - /tmp](https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/tmp.html)

## [Working With Commands](http://linuxcommand.org/lc3_lts0060.php)
### What Exactly Are Commands? 
A command can be one of four different things: 
1.	An executable program like all those files we saw in `/usr/bin`. Within this category, programs can be compiled binaries such as programs written in C and C++, or programs written in scripting languages such as the shell, Perl, Python, Ruby, and so on. 
2.	A command built into the shell itself. `bash` supports a number of commands internally called shell builtins. The `cd` command, for example, is a shell builtin. 
3.	A shell function. Shell functions are miniature shell scripts incorporated into the environment. 
4.	An alias. Aliases are commands that we can define ourselves, built from other commands. 

### Identifying Commands 
<table>
    <tr>
        <td><code>type</code> – Display a Command's Type </td>
        <td><code>type command</code></td>
    </tr>
    <tr>
        <td><code>which</code> – Display an Executable's Location </td>
        <td>Sometimes there is more than one version of an executable program installed on a system. While this is not common on desktop systems, it's not unusual on large servers. To determine the exact location of a given executable, the <code>which</code> command is used. 
        <div><code>[me@linuxbox ~]$ which ls /bin/ls</code></div> 
        <code>which</code> only works for executable programs, not builtins nor aliases that are substitutes for actual executable programs. When we try to use <code>which</code> on a shell builtin for example, cd, we either get no response or get an error message: 
        <div><code>[me@linuxbox ~]$ which cd <div>/usr/bin/which: no cd in</div> <div>(/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games)</div></code></div> 
        This response is a fancy way of saying “command not found.” 
        </td>
    </tr>
</table>

### Getting a Command's Documentation 
<ol>
    <li>`help` – Get Help for Shell Builtins</li> 
    <li>`--help` – Display Usage Information</li> 
    <li>`man` – Display a Program's Manual Page Sometimes we need to refer to a specific section of the manual to find what we are looking for. This is particularly true if we are looking for a file format that is also the name of a command. Without specifying a section number, we will always get the first instance of a match, probably in section 1. To specify a section number, we use `man` like this:
    <div><code>man section search_term </code></div>
    Here's an example: 
    <div><code>[me@linuxbox ~]$ man 5 passwd </code></div>
    This will display the man page describing the file format of the /etc/passwd file.</li> 
    <li>`apropos` – Display Appropriate Commands
    It is also possible to search the list of man pages for possible matches based on a search term. It's crude but sometimes helpful. Here is an example of a search for man pages using the search term partition: 
    [me@linuxbox ~]$ apropos partiton 
    addpart (8) - simple wrapper around the "add partition"... 
    all-swaps (7) - event signalling that all swap partitions... 
    cfdisk (8) - display or manipulate disk partition table 
    cgdisk (8) - Curses-based GUID partition table (GPT)... 
    delpart (8) - simple wrapper around the "del partition"... 
    fdisk (8) - manipulate disk partition table 
    fixparts (8) - MBR partition table repair utility 
    gdisk (8) - Interactive GUID partition table (GPT)... 
mpartition (1) - partition an MSDOS hard disk 
partprobe (8) - inform the OS of partition table changes 
partx (8) - tell the Linux kernel about the presence... 
resizepart (8) - simple wrapper around the "resize partition... 
sfdisk (8) - partition table manipulator for Linux 
sgdisk (8) - Command-line GUID partition table (GPT)... 
The first field in each line of output is the name of the man page, and the second field shows the section. Note that the man command with the “-k” option performs the same function as apropos.</li> 
    <li>whatis – Display One-line Manual Page Descriptions 
The whatis program displays the name and a one-line description of a man page matching a specified keyword: 
[me@linuxbox ~]$ whatis ls 
ls (1) 		- list directory contents</li>
    <li>info – Display a Program's Info Entry 
The GNU Project provides an alternative to man pages for their programs, called “info.” 
Info manuals are displayed with a reader program named, appropriately enough, info. Info pages are hyperlinked much like web pages. To invoke info, type info followed optionally by the name of a program.</li> 
</ol>

## [Reading Man pages](http://linuxcommand.org/lc3_man_pages/man1.html)

## [Keyboard shortcuts for Bash](https://www.howtogeek.com/181/keyboard-shortcuts-for-bash-command-shell-for-ubuntu-debian-suse-redhat-linux-etc/)

## [LTS](https://wiki.ubuntu.com/LTS)

## [Shebang](https://en.wikipedia.org/wiki/Shebang_%28Unix%29)


# Tasks📃
## ☑️ 0. Where am I?
`mandatory`

Write a script that prints the absolute path name of the current working directory.

## ☑️ 1. What’s in there?
`mandatory`

Display the contents list of your current directory.

## ☑️ 2. There is no place like home
`mandatory`

Write a script that changes the working directory to the user’s home directory.
- You are not allowed to use any shell variables

## ☑️ 3. The long format
`mandatory`

Display current directory contents in a long format

## ☑️ 4. Hidden files
`mandatory`

Display current directory contents, including hidden files (starting with `.`). Use the long format.

## ☑️ 5. I love numbers
`mandatory`

Display current directory contents.
- Long format
- with user and group IDs displayed numerically
- And hidden files (starting with .)

## ☑️ 6. Welcome
`mandatory`

Create a script that creates a directory named `my_first_directory` in the `/tmp/` directory.

## ☑️ 7. Betty in my first directory
`mandatory`

Move the file `betty` from `/tmp/` to `/tmp/my_first_directory`.

## ☑️ 8.  Bye bye Betty
`mandatory`

Delete the file `betty`.
- The file `betty` is in `/tmp/my_first_directory`.

## ☑️ 9. Bye bye My first directory
`mandatory`

Delete the directory `my_first_directory` that is in the `/tmp` directory.

## ☑️ 10. Back to the future
`mandatory`

Write a script that changes the working directory to the previous one.

## ☑️ 11. Lists
`mandatory`

Write a script that lists all files (even ones with names beginning with a period character, which are normally hidden) in the current directory and the parent of the working directory and the `/boot` directory (in this order), in long format.

## ☑️ 12. File type
`mandatory`

Write a script that prints the type of the file named `iamafile`. The file `iamafile` will be in the `/tmp` directory when we will run your script.

## ☑️ 13. We are symbols, and inhabit symbols
`mandatory`

Create a symbolic link to `/bin/ls`, named `__ls__`. The symbolic link should be created in the current working directory.

## ☑️ 14. Copy HTML files
`mandatory`

Create a script that copies all the HTML files from the current working directory to the parent of the working directory, but only copy files that did not exist in the parent of the working directory or were newer than the versions in the parent of the working directory.

You can consider that all HTML files have the extension `.html`

## ☑️ 15. Let’s move
`#advanced`

Create a script that moves all files beginning with an uppercase letter to the directory `/tmp/u`.

You can assume that the directory `/tmp/u` will exist when we will run your script

## ☑️ 16. Clean Emacs
`#advanced`

Create a script that deletes all files in the current working directory that end with the character `~`.

## ☑️ 17. Tree
`#advanced`
Score: 100.0% (Checks completed: 100.0%)
Create a script that creates the directories `welcome/`, `welcome/to/` and `welcome/to/school` in the current directory.

You are only allowed to use two spaces (and lines) in your script, not more.

## ☑️ 18. Life is a series of commas, not periods
`#advanced`

Write a command that lists all the files and directories of the current directory, separated by commas (`,`).
- Directory names should end with a slash (`/`)
- Files and directories starting with a dot (`.`) should be listed
- The listing should be alpha ordered, except for the directories `.` and `..` which should be listed at the very beginning
- Only digits and letters are used to sort; Digits should come first
- You can assume that all the files we will test with will have at least one letter or one digit
- The listing should end with a new line

## ☑️ 19. File type: School
`#advanced`

Create a magic file `school.mgc` that can be used with the command `file` to detect `School` data files. `School` data files always contain the string `SCHOOL` at offset 0.

