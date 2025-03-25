# Course overview + the shell

[Lecture 1: The Shell](https://missing.csail.mit.edu/2020/course-shell/)

[Youtube lecture](https://youtu.be/Z56Jmr9Z34Q)

<iframe width="616" height="347" src="https://www.youtube.com/embed/Z56Jmr9Z34Q" title="Lecture 1: Course Overview + The Shell (2020)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen alias="Embedded video (not always supported)"></iframe>

## Motivation

As computer scientists, we know that computers are great at aiding in repetitive tasks. However, far too often, we forget that this applies just as much to our use of the computer as it does to the computations we want our programs to perform. We have a vast range of tools available at our fingertips that enable us to be more productive and solve more complex problems when working on any computer-related problem. Yet many of us utilize only a small fraction of those tools; we only know enough magical incantations by rote to get by, and blindly copy-paste commands from the internet when we get stuck.

This class is an attempt to address this.

We want to teach you how to make the most of the tools you know, show you new tools to add to your toolbox, and hopefully instill in you some excitement for exploring (and perhaps building) more tools on your own. This is what we believe to be the missing semester from most Computer Science curricula.

## Class Structure

The class consists of 11 1-hour lectures, each one centering on a particular topic. The lectures are largely independent, though as the semester goes on we will presume that you are familiar with the content from the earlier lectures. We have lecture notes online, but there will be a lot of content covered in class (e.g. in the form of demos) that may not be in the notes. We will be recording lectures and posting the recordings online.

We are trying to cover a lot of ground over the course of just 11 1-hour lectures, so the lectures are fairly dense. To allow you some time to get familiar with the content at your own pace, each lecture includes a set of exercises that guide you through the lecture’s key points. After each lecture, we are hosting office hours where we will be present to help answer any questions you might have. If you are attending the class online, you can send us questions at missing-semester@mit.edu.

Due to the limited time we have, we won’t be able to cover all the tools in the same level of detail a full-scale class might. Where possible, we will try to point you towards resources for digging further into a tool or topic, but if something particularly strikes your fancy, don’t hesitate to reach out to us and ask for pointers!

## Topic 1: The Shell
### What is the shell?
Computers these days have a variety of interfaces for giving them commands; fanciful graphical user interfaces, voice interfaces, and even AR/VR are everywhere. These are great for 80% of use-cases, but they are often fundamentally restricted in what they allow you to do — you cannot press a button that isn’t there or give a voice command that hasn’t been programmed. To take full advantage of the tools your computer provides, we have to go old-school and drop down to a textual interface: The Shell.

Nearly all platforms you can get your hands on have a shell in one form or another, and many of them have several shells for you to choose from. While they may vary in the details, at their core they are all roughly the same: they allow you to run programs, give them input, and inspect their output in a semi-structured way.

In this lecture, we will focus on the Bourne Again SHell, or “bash” for short. This is one of the most widely used shells, and its syntax is similar to what you will see in many other shells. To open a shell prompt (where you can type commands), you first need a *terminal*. Your device probably shipped with one installed, or you can install one fairly easily.

### Using the shell
When you launch your terminal, you will see a prompt that often looks a little like this:
```bash
missing:~$ 
```
This is the main textual interface to the shell. It tells you that you are on the machine `missing` and that your “current working directory”, or where you currently are, is `~` (short for “home”). The `$` tells you that you are not the root user (more on that later). At this prompt you can type a *command*, which will then be interpreted by the shell. The most basic command is to execute a program:
```bash
missing:~$ date
Fri 10 Jan 2020 11:49:31 AM EST
missing:~$ 
```

Here, we executed the `date` program, which (perhaps unsurprisingly) prints the current date and time. The shell then asks us for another command to execute. We can also execute a command with *arguments*:
```shell
missing:~$ echo hello
hello
```

In this case, we told the shell to execute the program `echo` with the argument `hello`. The echo program simply prints out its arguments. The shell parses the command by splitting it by whitespace, and then runs the program indicated by the first word, supplying each subsequent word as an argument that the program can access. If you want to provide an argument that contains spaces or other special characters (e.g., a directory named “My Photos”), you can either quote the argument with `'` or `"` ("My Photos"), or escape just the relevant characters with `\` (`My\ Photos`).

But how does the shell know how to find the `date` or `echo` programs? Well, the shell is a programming environment, just like Python or Ruby, and so it has variables, conditionals, loops, and functions (next lecture!). When you run commands in your shell, you are really writing a small bit of code that your shell interprets. If the shell is asked to execute a command that doesn’t match one of its programming keywords, it consults an *environment* variable called `$PATH` that lists which directories the shell should search for programs when it is given a command:

```bash
missing:~$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
missing:~$ which echo
/bin/echo
missing:~$ /bin/echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

When we run the `echo` command, the shell sees that it should execute the program echo, and then searches through the `:`-separated list of directories in `$PATH` for a file by that name. When it finds it, it runs it (assuming the file is executable; more on that later). We can find out which file is executed for a given program name using the `which` program. We can also bypass `$PATH` entirely by giving the *path* to the file we want to execute.

### Navigating in the shell
A path on the shell is a delimited list of *directories*; separated by `/` on Linux and macOS and `\` on Windows. On Linux and macOS, the path `/` is the “root” of the file system, under which all directories and files lie, whereas on Windows there is one root for each disk partition (e.g., `C:\`). We will generally assume that you are using a Linux filesystem in this class. A path that starts with `/` is called an *absolute path*. Any other path is a *relative path*. Relative paths are relative to the current working directory, which we can see with the `pwd` command and change with the `cd` command. In a path, `.` refers to the current directory, and `..` to its parent directory:

```bash
missing:~$ pwd
/home/missing
missing:~$ cd /home
missing:/home$ pwd
/home
missing:/home$ cd ..
missing:/$ pwd
/
missing:/$ cd ./home
missing:/home$ pwd
/home
missing:/home$ cd missing
missing:~$ pwd
/home/missing
missing:~$ ../../bin/echo hello
hello
```

Notice that our shell prompt kept us informed about what our current working directory was. You can configure your prompt to show you all sorts of useful information, which we will cover in a later lecture.

In general, when we run a program, it will operate in the current directory unless we tell it otherwise. For example, it will usually search for files there, and create new files there if it needs to.

To see what lives in a given directory, we use the `ls` command:

```bash
missing:~$ ls
missing:~$ cd ..
missing:/home$ ls
missing
missing:/home$ cd ..
missing:/$ ls
bin
boot
dev
etc
home
...
```

Unless a directory is given as its first argument, `ls` will print the contents of the current directory. Most commands accept *flags* and *options* (flags with values) that start with `-` to modify their behavior. Usually, running a program with the `-h` or `--help` flag will print some help text that tells you what flags and options are available. For example, `ls --help` tells us:

```bash
-l                         use a long listing format
```
```bash
missing:~$ ls -l /home
drwxr-xr-x 1 missing  users  4096 Jun 15  2019 missing
```

This gives us a bunch more information about each file or directory present. First, the `d` at the beginning of the line tells us that `missing` is a directory. Then follow three groups of three characters (`rwx`). These indicate what permissions the *owner* of the file (`missing`), the *owning group* (users), and everyone else respectively have on the relevant item. A `-` indicates that the given principal does not have the given permission. Above, only the owner is allowed to modify (`w`) the missing directory (i.e., add/remove files in it). To enter a directory, a user must have “search” (represented by “execute”: `x`) permissions on that directory (and its parents). To list its contents, a user must have read (`r`) permissions on that directory. For files, the permissions are as you would expect. Notice that nearly all the files in `/bin` have the `x` permission set for the last group, “everyone else”, so that anyone can execute those programs.

Some other handy programs to know about at this point are `mv` (to rename/move a file), `cp` (to copy a file), and `mkdir` (to make a new directory).

If you ever want more information about a program’s arguments, inputs, outputs, or how it works in general, give the `man` program a try. It takes as an argument the name of a program, and shows you its *manual* page. Press `q` to exit.

```bash
missing:~$ man ls
```

### Connecting Programs
In the shell, programs have two primary “streams” associated with them: their input stream and their output stream. When the program tries to read input, it reads from the input stream, and when it prints something, it prints to its output stream. Normally, a program’s input and output are both your terminal. That is, your keyboard as input and your screen as output. However, we can also rewire those streams!

The simplest form of redirection is `< file` and `> file`. These let you rewire the input and output streams of a program to a file respectively:

```bash
missing:~$ echo hello > hello.txt
missing:~$ cat hello.txt
hello
missing:~$ cat < hello.txt
hello
missing:~$ cat < hello.txt > hello2.txt
missing:~$ cat hello2.txt
hello
```

Demonstrated in the example above, `cat` is a program that concatenates files. When given file names as arguments, it prints the contents of each of the files in sequence to its output stream. But when `cat` is not given any arguments, it prints contents from its input stream to its output stream (like in the third example above).

You can also use `>>` to append to a file. Where this kind of input/output redirection really shines is in the use of *pipes*. The `|` operator lets you “chain” programs such that the output of one is the input of another:

```bash
missing:~$ ls -l / | tail -n1
drwxr-xr-x 1 root  root  4096 Jun 20  2019 var
missing:~$ curl --head --silent google.com | grep --ignore-case content-length | cut --delimiter=' ' -f2
219
```

We will go into a lot more detail about how to take advantage of pipes in the lecture on data wrangling.

## Next steps
At this point you know your way around a shell enough to accomplish basic tasks. You should be able to navigate around to find files of interest and use the basic functionality of most programs. In the next lecture, we will talk about how to perform and automate more complex tasks using the shell and the many handy command-line programs out there.

## Exercises

<p>All classes in this course are accompanied by a series of exercises. Some give
you a specific task to do, while others are open-ended, like “try using X and Y
programs”. We highly encourage you to try them out.</p>

<p>We have not written solutions for the exercises. If you are stuck on anything
in particular, feel free to send us an email describing what you’ve tried so
far, and we will try to help you out.</p>

<ol>
  <li>For this course, you need to be using a Unix shell like Bash or ZSH. If you
are on Linux or macOS, you don’t have to do anything special. If you are on
Windows, you need to make sure you are not running cmd.exe or PowerShell;
you can use <a href="https://docs.microsoft.com/en-us/windows/wsl/">Windows Subsystem for
Linux</a> or a Linux virtual
machine to use Unix-style command-line tools. To make sure you’re running
an appropriate shell, you can try the command <code class="language-plaintext highlighter-rouge">echo $SHELL</code>. If it says
something like <code class="language-plaintext highlighter-rouge">/bin/bash</code> or <code class="language-plaintext highlighter-rouge">/usr/bin/zsh</code>, that means you’re running the
right program.</li>
  <li>Create a new directory called <code class="language-plaintext highlighter-rouge">missing</code> under <code class="language-plaintext highlighter-rouge">/tmp</code>.</li>
  <li>Look up the <code class="language-plaintext highlighter-rouge">touch</code> program. The <code class="language-plaintext highlighter-rouge">man</code> program is your friend.</li>
  <li>Use <code class="language-plaintext highlighter-rouge">touch</code> to create a new file called <code class="language-plaintext highlighter-rouge">semester</code> in <code class="language-plaintext highlighter-rouge">missing</code>.</li>
  <li>Write the following into that file, one line at a time:
    <div class="language-plaintext highlighter-rouge"><div class="highlight"><pre class="highlight"><code>#!/bin/sh
curl --head --silent https://missing.csail.mit.edu
</code></pre></div>    </div>
    <p>The first line might be tricky to get working. It’s helpful to know that
<code class="language-plaintext highlighter-rouge">#</code> starts a comment in Bash, and <code class="language-plaintext highlighter-rouge">!</code> has a special meaning even within
double-quoted (<code class="language-plaintext highlighter-rouge">"</code>) strings. Bash treats single-quoted strings (<code class="language-plaintext highlighter-rouge">'</code>)
differently: they will do the trick in this case. See the Bash
<a href="https://www.gnu.org/software/bash/manual/html_node/Quoting.html">quoting</a>
manual page for more information.</p>
  </li>
  <li>Try to execute the file, i.e. type the path to the script (<code class="language-plaintext highlighter-rouge">./semester</code>)
into your shell and press enter. Understand why it doesn’t work by
consulting the output of <code class="language-plaintext highlighter-rouge">ls</code> (hint: look at the permission bits of the
file).</li>
  <li>Run the command by explicitly starting the <code class="language-plaintext highlighter-rouge">sh</code> interpreter, and giving it
the file <code class="language-plaintext highlighter-rouge">semester</code> as the first argument, i.e. <code class="language-plaintext highlighter-rouge">sh semester</code>. Why does
this work, while <code class="language-plaintext highlighter-rouge">./semester</code> didn’t?</li>
  <li>Look up the <code class="language-plaintext highlighter-rouge">chmod</code> program (e.g. use <code class="language-plaintext highlighter-rouge">man chmod</code>).</li>
  <li>Use <code class="language-plaintext highlighter-rouge">chmod</code> to make it possible to run the command <code class="language-plaintext highlighter-rouge">./semester</code> rather than
having to type <code class="language-plaintext highlighter-rouge">sh semester</code>. How does your shell know that the file is
supposed to be interpreted using <code class="language-plaintext highlighter-rouge">sh</code>? See this page on the
<a href="https://en.wikipedia.org/wiki/Shebang_(Unix)">shebang</a> line for more
information.</li>
  <li>Use <code class="language-plaintext highlighter-rouge">|</code> and <code class="language-plaintext highlighter-rouge">&gt;</code> to write the “last modified” date output by
<code class="language-plaintext highlighter-rouge">semester</code> into a file called <code class="language-plaintext highlighter-rouge">last-modified.txt</code> in your home
directory.</li>
  <li>Write a command that reads out your laptop battery’s power level or your
desktop machine’s CPU temperature from <code class="language-plaintext highlighter-rouge">/sys</code>. Note: if you’re a macOS
user, your OS doesn’t have sysfs, so you can skip this exercise.</li>
</ol>

## Glossary

- **Argument**: A value or parameter passed to a command to modify its behavior. Arguments typically follow the command name and can include filenames, directories, or other input values.

- **Bash**: A Unix shell and command language used for scripting and interacting with the operating system. Bash (Bourne Again SHell) is the default shell for many Linux distributions and macOS.

- **Command**: An instruction given to the shell to perform a specific task. Commands can be built-in shell functions, external programs, or user-defined scripts.

- **Environment**: A collection of variables that define system-wide or session-specific settings. Environment variables influence how commands and programs behave. Examples include `$PATH`, `$HOME`, and `$USER`.

- **Flags**: Special options or switches that modify the behavior of a command. Flags are usually preceded by a single `-` (short option) or `--` (long option).  
  **Example:** `ls -l` (where `-l` enables long listing format)

- **Options**: A type of flag that requires an additional value. Unlike simple flags, these options take an argument to specify their effect.  
  **Example:** `grep -i "text" file.txt` (where `-i` is a flag and `"text"` is its value)

- **Path**: A string representing the location of a file or directory in the filesystem. Paths can be absolute or relative.
    - **Absolute Path**: A file or directory location specified from the root (`/`) directory. It provides the full address of a file, regardless of the current working directory.  
  **Example:** `/home/user/documents/file.txt` 
  - **Relative Path**: A file or directory location specified based on the current working directory. It does not start with `/`.  
    **Example:** `documents/file.txt` (if the current directory is `/home/user/`)

- **Pipes**: A mechanism that allows the output of one command to be used as input for another command. Represented by the `|` symbol.  
  **Example:** `ls -l | grep "txt"` (lists files and filters for `.txt` files)

- **Streams**: Data channels used for input and output in Unix-like systems. The three standard streams are:  
  - **stdin (0)** – Standard input (keyboard input by default)  
  - **stdout (1)** – Standard output (normal command output)  
  - **stderr (2)** – Standard error output (error messages)

- **Terminal**: A text-based interface that allows users to interact with the operating system by entering commands. It serves as an interface to the shell, such as Bash.


## Bash Commands
- **cat**: Displays the contents of a file. Can also be used to concatenate multiple files.  

- **cd**: Changes the current directory.  

- **cp**: Copies files or directories.  

- **date**: Displays the current date and time.  

- **echo**: Prints text or variables to the terminal.  

- **ls**: Lists files and directories in the current location.  

- **man**: Displays the manual page for a command.  

- **mkdir**: Creates a new directory.  

- **mv**: Moves or renames files and directories.  

- **pwd**: Prints the current working directory.  

- **touch**: Creates an empty file or updates the timestamp of an existing file.  

- **which**: Shows the full path of a command's executable.  
