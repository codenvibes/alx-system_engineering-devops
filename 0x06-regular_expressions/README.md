<h1 align="center"><b>0x06. REGULAR EXPRESSION</b></h1>
<div align="center"><code>Regex</code> <code>DevOps</code></div>

# Background Context
For this project, you have to build your regular expression using Oniguruma, a regular expression library that which is used by Ruby by default. Note that other regular expression libraries sometimes have different properties.

Because the focus of this exercise is to play with regular expressions (regex), here is the Ruby code that you should use, just replace the regexp part, meaning the code in between the `//`:
```bash
sylvain@ubuntu$ cat example.rb
#!/usr/bin/env ruby
puts ARGV[0].scan(/127.0.0.[0-9]/).join
sylvain@ubuntu$
sylvain@ubuntu$ ./example.rb 127.0.0.2
127.0.0.2
sylvain@ubuntu$ ./example.rb 127.0.0.1
127.0.0.1
sylvain@ubuntu$ ./example.rb 127.0.0.a
```

# Resources
- [Regular Expression](https://intranet.alxswe.com/concepts/29)
- [Regular expressions - basics](https://www.slideshare.net/neha_jain/introducing-regular-expressions)
- [Regular expressions - advanced](https://www.slideshare.net/neha_jain/advanced-regular-expressions-80296518)
- [Rubular is your best friend](https://rubular.com/)
- [Use a regular expression against a problem: now you have 2 problems](https://blog.codinghorror.com/regular-expressions-now-you-have-two-problems/)
- [Learn Regular Expressions with simple, interactive exercises](https://regexone.com/)

<!-- **man or help:**
- `` -->

# Requirements
- Allowed editors: `vi`, `vim`, `emacs`
- All your files will be interpreted on Ubuntu 20.04 LTS
- All your files should end with a new line
- A `README.md` file, at the root of the folder of the project, is mandatory
- All your Bash script files must be executable
- The first line of all your Bash scripts should be exactly `#!/usr/bin/env ruby`
- All your regex must be built for the Oniguruma library

<!-- # More Info -->

# Quiz questions
<details>
<summary><h3>Question 0</h3></summary>

What is the `/Scho*l/` regexp matching?
- [ ] Schoo.l
- [ ] Scho.l
- [x] Schoool
</details>

<details>
<summary><h3>Question 1</h3></summary>

What is the `/Scho.l/` regexp matching?
- [ ] school
- [x] School
- [x] Scho.l
</details>

<details>
<summary><h3>Question 2</h3></summary>

What is the `/school/` regexp matching?
- [x] school
- [ ] School
- [ ] schoOl
</details>

# Tasks
<details>
<summary>

### 0. Simply matching School
`mandatory`

File: [0-simply_match_school.rb]()
</summary>

<img src="https://s3.amazonaws.com/alx-intranet.hbtn.io/uploads/medias/2020/9/ec65557f0da1fbfbff6659413885e4d4822f5b1d.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARDDGGGOUSBVO6H7D%2F20231003%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20231003T175903Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=a87c9051b09e6f1727dca6488c369ee9d324e2c494a341e4ee608b06669e003a">
Requirements:
- The regular expression must match `School`
- Using the project instructions, create a Ruby script that accepts one argument and pass it to a regular expression matching method
Example:
```bash
sylvain@ubuntu$ ./0-simply_match_school.rb School | cat -e
School$
sylvain@ubuntu$ ./0-simply_match_school.rb "Best School" | cat -e
School$
sylvain@ubuntu$ ./0-simply_match_school.rb "School Best School" | cat -e
SchoolSchool$
sylvain@ubuntu$ ./0-simply_match_school.rb "Grace Hopper" | cat -e
$
```
</details>

<details>
<summary>

### 1. Repetition Token #0
`mandatory`

File: [1-repetition_token_0.rb]()
</summary>


</details>

<details>
<summary>

### 2. Repetition Token #1
`mandatory`

File: [2-repetition_token_1.rb]()
</summary>


</details>

<details>
<summary>

### 3. Repetition Token #2
`mandatory`

File: [3-repetition_token_2.rb]()
</summary>


</details>

<details>
<summary>

### 4. Repetition Token #3
`mandatory`

File: [4-repetition_token_3.rb]()
</summary>


</details>

<details>
<summary>

### 5. Not quite HBTN yet
`mandatory`

File: [5-beginning_and_end.rb]()
</summary>


</details>

<details>
<summary>

### 6. Call me maybe
`mandatory`

File: [6-phone_number.rb]()
</summary>


</details>

<details>
<summary>

### 7. OMG WHY ARE YOU SHOUTING?
`mandatory`

File: [7-OMG_WHY_ARE_YOU_SHOUTING.rb]()
</summary>


</details>

<details>
<summary>

### 8. Textme
`#advanced`

File: [100-textme.rb]()
</summary>


</details>

