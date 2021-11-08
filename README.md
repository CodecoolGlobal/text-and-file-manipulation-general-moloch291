# Text and File Manipulation

## Story

You've been given a big log file and asked to extract and filter some information from it. You already know about the Unix philosophy: "Write programs that do one thing and do it well" and you know that `sed`, `awk` and `grep` are quite good in text manipulation and filtering so there's no doubt that you'll need them.
A colleague comes to you in the coffee break and asks you to help him in extracting some data from a JSON file using `jq`. What a busy day, you can't even take a break.
Log files can grow quickly in size and they have to be compressed and archived so let's also check the tools that you'll need for that task.

## What are you going to learn?

- How to manipulate and filter text files using `sed`, `awk` and `grep`
- How to use `head` and `tail` commands
- How to get information from JSON files using `jq`
- How to compress/decompress files with `gzip`/`gunzip`, `bzip2`/`bunzip2`
- What is the difference between compressing and archiving
- How to create a compressed archive using `tar`

## Tasks

1. Manipulate text files with `sed`, `awk`, `grep`, `head` and `tail`.
Use `sed` to replace the first three octets of the IP address with XXX.XXX.XXX in the beginning of each line of the file `access.log`.
Use `awk` to print the information inside the first double quotes (Request type, URL and HTTP version). Next filter the output to include only the POST requests (using grep).
Print the lines between line 11 and line 20 of the file access.log.
    - The first three octets of the IP address in the file `access.log` are replaced with XXX.XXX.XXX.
    - The information inside the first double quotes (Request type, URL and HTTP version) for POST requests only is printed to stdout.
    - Lines between line 11 and line 20 of the file access.log are printed to stdout.

2. Process the file employees.json using `jq`.
Print the first name of each employee.
Print the first name of each employee followed by their phone number(s).
Print the first name of each employee and only their mobile phone number(s).
    - The first name of each employee from the file employees.json is printed.
    - The first name of each employee followed by their phone number(s) from the file employees.json is printed.
    - The first name of each employee and only their mobile phone number(s) from the file employees.json is printed.

3. Practice file compression with `gzip` and `bzip2`. Create a new directory and copy the files `access.log` and `employees.json` inside the new directory and list the contents using 'ls -lh'. Compress one file with `gzip` and the other with `bzip2`. List the contents of the directory once again and notice the difference in the size of each file. Decompress the files and compress them again but this time use the best (slowest) compression method and compare the difference in size once again. Decompress the files once again and this time compress both files by passing the directory name to the command with the option `-r`. List the contents of the directory once again to check if both files were compressed.
    - The two files `access.log` and `employees.json` are compressed.

4. Practice archiving and compressing using `tar`.
Create a new directory and copy the files `access.log` and `employees.json` inside the new directory and list the contents using 'ls -lh'.
Create a tar archive of the directory created in the previous step. Compare the size of the tar file and the size of the directory. Remove the tar file.
Create a tar.gz compressed archive of the directory created in a previous step. Compare the size of the compressed archive and the directory. Remove the tar.gz file.
    - A compressed archive is generated. Student has identified the differences between file archiving and file compressing.

## General requirements

None

## Hints

- Use `sed` with a regular expression (you can create your own or you can find one online) for the IP address.
- You can set the delimiter for `awk` to be `"`.
- Use `head` to output the first 20 lines of the file, then pipe the output to `tail` to print the last 10 lines, which will give you lines between 11 and 20 from the file.
- Notice the difference between the archiving and compressing tools. `tar` can preserve directory structure and permissions while the tools for compressing operate on the files directly. Another difference is that by default `gzip` and `bzip2` do not keep the original files (it can be achieved by passing the -k or --keep option) while `tar` keeps the the original files and directories. 

## Background materials

- <i class="far fa-exclamation"></i> [How to Use the sed Command on Linux](https://www.howtogeek.com/666395/how-to-use-the-sed-command-on-linux/)
- <i class="far fa-exclamation"></i> [How to Use the awk Command on Linux](https://www.howtogeek.com/562941/how-to-use-the-awk-command-on-linux/)
- <i class="far fa-exclamation"></i> [How to Use the grep Command on Linux](https://www.howtogeek.com/496056/how-to-use-the-grep-command-on-linux/)
- <i class="far fa-exclamation"></i> [How to Use the tail Command on Linux](https://www.howtogeek.com/481766/how-to-use-the-tail-command-on-linux/)
- <i class="far fa-exclamation"></i> [Guide to Linux jq Command for JSON Processing](https://www.baeldung.com/linux/jq-command-json)
- <i class="far fa-exclamation"></i> [How to use gzip and bzip2 Linux commands Explained](https://www.computernetworkingnotes.com/linux-tutorials/how-to-use-gzip-and-bzip2-linux-commands-explained.html)
- <i class="far fa-exclamation"></i> [18 Tar Command Examples in Linux](https://www.tecmint.com/18-tar-command-examples-in-linux/)
