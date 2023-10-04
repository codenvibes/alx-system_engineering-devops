<h1 align="center"><b>0x06. REGULAR EXPRESSION</b></h1>
<div align="center"><code>Regex</code> <code>DevOps</code></div>

# Notes
<details>
<summary><h3>Python vs Ruby</h3></summary>

Python and Ruby are both high-level programming languages, but they have distinct syntax and design philosophies. While there are some similarities, such as their readability and focus on simplicity, there are also significant differences in how they handle various language constructs. Here are some key points of comparison regarding their syntax:

1. **Indentation vs. Braces:**
   - Python: Python uses indentation (whitespace) to denote code blocks, making it easy to read. Indentation is a fundamental part of Python's syntax.
   - Ruby: Ruby uses braces (`do...end` for multi-line blocks and `{...}` for single-line blocks) to define code blocks. Indentation is not significant for block structure.

   Example in Python:
   ```python
   for i in range(5):
       print(i)
   ```

   Example in Ruby:
   ```ruby
   5.times do |i|
     puts i
   end
   ```

2. **Variables and Data Types:**
   - Both languages have dynamically typed variables, meaning you don't need to declare the data type explicitly.
   - Ruby variable names start with lowercase letters or underscores, while Python variable names typically use lowercase letters with underscores (snake_case).

3. **Strings:**
   - Both languages use double (`"`) and single (`'`) quotes to define strings.
   - In Python, you can use triple-quotes for multi-line strings.
   - In Ruby, you can interpolate strings using `#{...}`.

4. **Conditional Statements:**
   - Python uses `if`, `elif`, and `else` for conditional branching.
   - Ruby also uses `if`, `elsif`, and `else`, but it doesn't require colons.

5. **Loops:**
   - Python has `for` and `while` loops.
   - Ruby has similar loops, but it also provides iterators like `each` for collections.

6. **Lists/Arrays:**
   - Python uses lists and tuples for collections. Lists are mutable, and tuples are immutable.
   - Ruby uses arrays, which are mutable and can hold different types of objects.

7. **Dictionaries/Hashes:**
   - Python uses dictionaries (`dict`) for key-value pairs.
   - Ruby uses hashes (`Hash`) for the same purpose.

8. **Classes and Objects:**
   - Both languages support object-oriented programming with classes and objects.
   - Ruby has more dynamic features, like open classes, that allow you to modify classes at runtime.

9. **Comments:**
   - Both languages use the `#` symbol for single-line comments.

While Python and Ruby have differences in syntax and design, they share some common principles, like readability and a focus on developer friendliness. The choice between Python and Ruby often depends on the specific needs of a project, the existing ecosystem, and personal preferences. Developers who are proficient in one language can generally pick up the other relatively quickly due to their high-level and human-readable nature.
</details>

<details>
<summary><h3>Ruby Shebang</h3></summary>

```ruby
#!/usr/bin/env ruby
```
</details>

<details>
<summary><h3>Ruby Basics</h3></summary>

Certainly! Here are some fundamental concepts and syntax basics in the Ruby programming language:

1. **Hello, World!:**
   In Ruby, you can print "Hello, World!" to the console with a simple `puts` statement:

   ```ruby
   puts "Hello, World!"
   ```

2. **Comments:**
   You can add comments to your Ruby code using the `#` symbol. Comments are ignored by the Ruby interpreter and are useful for adding explanations to your code:

   ```ruby
   # This is a single-line comment
   ```

3. **Variables:**
   Ruby uses dynamic typing, meaning you don't need to specify variable types explicitly. Variable names are case-sensitive, and they start with a lowercase letter or an underscore.

   ```ruby
   name = "John"
   age = 30
   ```

4. **Data Types:**
   Ruby has several data types, including:
   - Strings: Enclosed in single or double quotes, e.g., `"Hello"`.
   - Numbers: Integers (`1`, `42`) and floating-point numbers (`3.14`).
   - Booleans: `true` or `false`.
   - Arrays: Ordered collections of items.
   - Hashes: Key-value pairs.

5. **String Manipulation:**
   Ruby provides many methods for working with strings, such as concatenation, interpolation, and length:

   ```ruby
   greeting = "Hello"
   name = "Alice"
   message = "#{greeting}, #{name}!" # String interpolation
   puts message # Output: Hello, Alice!
   ```

6. **Conditional Statements:**
   Ruby supports `if`, `elsif`, and `else` for conditional branching:

   ```ruby
   x = 10
   if x > 5
     puts "x is greater than 5"
   elsif x == 5
     puts "x is equal to 5"
   else
     puts "x is less than 5"
   end
   ```

7. **Loops:**
   Ruby supports various types of loops, including `while`, `for`, and iterators like `each` for iterating over collections:

   ```ruby
   # Using a while loop
   i = 0
   while i < 5
     puts i
     i += 1
   end

   # Using an iterator
   colors = ["red", "green", "blue"]
   colors.each do |color|
     puts color
   end
   ```

8. **Methods:**
   You can define your own methods to encapsulate reusable code:

   ```ruby
   def greet(name)
     puts "Hello, #{name}!"
   end

   greet("Bob") # Output: Hello, Bob!
   ```

9. **Arrays and Hashes:**
   Arrays are ordered collections of items, and hashes are collections of key-value pairs:

   ```ruby
   # Array
   fruits = ["apple", "banana", "orange"]
   puts fruits[0] # Accessing elements

   # Hash
   person = { "name" => "Alice", "age" => 30 }
   puts person["name"] # Accessing values by key
   ```

10. **Classes and Objects:**
    Ruby is an object-oriented language, and you can define classes to create objects:

    ```ruby
    class Person
      def initialize(name, age)
        @name = name
        @age = age
      end

      def introduce
        puts "My name is #{@name} and I am #{@age} years old."
      end
    end

    alice = Person.new("Alice", 25)
    alice.introduce
    ```
</details>

<details>
<summary><h3>What are Regular Expressions</h3></summary>

Regular expressions, often abbreviated as "regex" or "regexp," are a powerful tool for pattern matching and text manipulation. They are a sequence of characters that define a search pattern. Regular expressions are used in various programming languages, text editors, and utilities to perform tasks such as searching, extracting, validating, and replacing text based on specific patterns.

Here are some key concepts and elements commonly used in regular expressions:

1. **Literals:** Characters in a regular expression that match themselves. For example, the regular expression `hello` matches the exact sequence "hello" in a text.

2. **Metacharacters:** Special characters in a regular expression that have meanings beyond their literal characters. Common metacharacters include `.` (matches any character except a newline), `*` (matches zero or more occurrences of the preceding character), `+` (matches one or more occurrences of the preceding character), `?` (matches zero or one occurrence of the preceding character), and more.

3. **Character Classes:** Square brackets `[ ]` define a character class, which matches any single character within the brackets. For example, `[aeiou]` matches any vowel, and `[0-9]` matches any digit.

4. **Quantifiers:** These specify how many times a character or group should be repeated. Common quantifiers include `{n}` (matches exactly n occurrences), `{n,}` (matches n or more occurrences), `{n,m}` (matches between n and m occurrences), and `*` (matches zero or more occurrences).

5. **Anchors:** Anchors specify the position in the text where a match should occur. Common anchors include `^` (matches the start of a line) and `$` (matches the end of a line).

6. **Escape Sequences:** Backslashes `\` are used to escape metacharacters if you want to match them literally. For example, `\.` matches a period character, not any character as `.` does.

7. **Grouping:** Parentheses `()` are used to create capture groups within a regular expression. These groups allow you to extract specific parts of a matched string or apply quantifiers to a group of characters.

8. **Alternation:** The pipe character `|` allows you to specify alternative patterns. For example, `cat|dog` matches either "cat" or "dog."

Regular expressions are incredibly versatile and can be used for a wide range of tasks, including:

- **Searching:** Finding occurrences of a specific pattern in a text.
- **Validation:** Checking if a string conforms to a specific format or structure.
- **Extraction:** Capturing and extracting data from a string based on a pattern.
- **Replacement:** Replacing specific patterns with other text.
- **Parsing:** Breaking down structured data into meaningful components.
- **Filtering:** Selecting or excluding text based on patterns.

Regular expressions are supported in many programming languages, including Ruby, Python, JavaScript, and more, making them a valuable tool for text processing and manipulation tasks. However, they can be complex and require some practice to master effectively.
</details>

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
<br>
<p align="center">※※※※※※※※※※※※</p>
<br>

When you run this script with a command-line argument, it will search for and extract any IP addresses in the "127.0.0.x" format from that argument and then print them as a single string without spaces or other separators. For example, if you run the script with the argument "Hello 127.0.0.1 World 127.0.0.2", it will output "127.0.0.1127.0.0.2"..

<br>
<p align="center">※※※※※※※※※※※※</p>
<br>

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

<img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x06-regular_expressions/pics/task0.png">

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

<img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x06-regular_expressions/pics/task1.png">

Requirements:
- Find the regular expression that will match the above cases
- Using the project instructions, create a Ruby script that accepts one argument and pass it to a regular expression matching method
</details>

<details>
<summary>

### 2. Repetition Token #1
`mandatory`

File: [2-repetition_token_1.rb]()
</summary>

<img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x06-regular_expressions/pics/task2.png">

Requirements:
- Find the regular expression that will match the above cases
- Using the project instructions, create a Ruby script that accepts one argument and pass it to a regular expression matching method
</details>

<details>
<summary>

### 3. Repetition Token #2
`mandatory`

File: [3-repetition_token_2.rb]()
</summary>

<img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x06-regular_expressions/pics/task3.png">

Requirements:
- Find the regular expression that will match the above cases
- Using the project instructions, create a Ruby script that accepts one argument and pass it to a regular expression matching method
</details>

<details>
<summary>

### 4. Repetition Token #3
`mandatory`

File: [4-repetition_token_3.rb]()
</summary>

<img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x06-regular_expressions/pics/task4.png">

Requirements:
- Find the regular expression that will match the above cases
- Using the project instructions, create a Ruby script that accepts one argument and pass it to a regular expression matching method
- Your regex should not contain square brackets
</details>

<details>
<summary>

### 5. Not quite HBTN yet
`mandatory`

File: [5-beginning_and_end.rb]()
</summary>

Requirements:
- The regular expression must be exactly matching a string that starts with `h` ends with `n` and can have any single character in between
- Using the project instructions, create a Ruby script that accepts one argument and pass it to a regular expression matching method
Example:
```bash
sylvain@ubuntu$ ./5-beginning_and_end.rb 'hn' | cat -e
$
sylvain@ubuntu$ ./5-beginning_and_end.rb 'hbn' | cat -e
hbn$
sylvain@ubuntu$ ./5-beginning_and_end.rb 'hbtn' | cat -e
$
sylvain@ubuntu$ ./5-beginning_and_end.rb 'h8n' | cat -e
h8n$
sylvain@ubuntu$
$
```
</details>

<details>
<summary>

### 6. Call me maybe
`mandatory`

File: [6-phone_number.rb]()
</summary>

This task is brought to you by a professional advisor [Neha Jain](https://twitter.com/_nehajain), Senior Software Engineer at LinkedIn.

Requirement:
- The regular expression must match a 10 digit phone number
Example:
```bash
sylvain@ubuntu$ ./6-phone_number.rb 4155049898 | cat -e
4155049898$
sylvain@ubuntu$ ./6-phone_number.rb " 4155049898" | cat -e
$
sylvain@ubuntu$ ./6-phone_number.rb "415 504 9898" | cat -e
$
sylvain@ubuntu$ ./6-phone_number.rb "415-504-9898" | cat -e
$
sylvain@ubuntu$
```
</details>

<details>
<summary>

### 7. OMG WHY ARE YOU SHOUTING?
`mandatory`

File: [7-OMG_WHY_ARE_YOU_SHOUTING.rb]()
</summary>

<img src="https://github.com/codenvibes/alx-system_engineering-devops/blob/master/0x06-regular_expressions/pics/task7.jpg">

Requirement:
- The regular expression must be only matching: capital letters
Example:
```bash
sylvain@ubuntu$ ./7-OMG_WHY_ARE_YOU_SHOUTING.rb "I realLy hOpe VancouvEr posseSs Yummy Soft vAnilla Dupper Mint Ice Nutella cream" | cat -e
ILOVESYSADMIN$
sylvain@ubuntu$ ./7-OMG_WHY_ARE_YOU_SHOUTING.rb "WHAT do you SAY?" | cat -e
WHATSAY$
sylvain@ubuntu$ ./7-OMG_WHY_ARE_YOU_SHOUTING.rb "cannot read you" | cat -e
$
sylvain@ubuntu$
```
</details>

<details>
<summary>

### 8. Textme
`#advanced`

File: [100-textme.rb]()
</summary>

This exercise was prepared for you by [Guillaume Plessis](https://www.linkedin.com/error_pages/500.html), VP of Infrastructure at TextMe. It is something he uses daily. You can thank Guillaume for his project [on Twitter](https://twitter.com/gui).

For this task, you’ll be taking over Guillaume’s responsibilities: one afternoon, a TextMe VoIP Engineer comes to you and explains she wants to run some statistics on the TextMe app text messages transactions.

Requirements:
- Your script should output: [SENDER],[RECEIVER],[FLAGS]
    - The sender phone number or name (including country code if present)
    - The receiver phone number or name (including country code if present)
    - The flags that were used

You can find a [[log file here]]().

Example:
```bash
$ ./100-textme.rb 'Feb 1 11:00:00 ip-10-0-0-11 mdr: 2016-02-01 11:00:00 Receive SMS [SMSC:SYBASE1] [SVC:] [ACT:] [BINF:] [FID:] [from:Google] [to:+16474951758] [flags:-1:0:-1:0:-1] [msg:127:This planet has - or rather had - a problem, which was this: most of the people on it were unhappy for pretty much of the time.] [udh:0:]'
Google,+16474951758,-1:0:-1:0:-1
$
$
$ ./100-textme.rb 'Feb 1 11:00:00 ip-10-0-64-10 mdr: 2016-02-01 11:00:00 Receive SMS [SMSC:SYBASE2] [SVC:] [ACT:] [BINF:] [FID:] [from:+17272713208] [to:+19172319348] [flags:-1:0:-1:0:-1] [msg:136:Orbiting this at a distance of roughly ninety-two million miles is an utterly insignificant little blue green planet whose ape-descended] [udh:0:]'
+17272713208,+19172319348,-1:0:-1:0:-1
$
$ ./100-textme.rb 'Feb 1 11:00:00 ip-10-0-64-11 mdr: 2016-02-01 11:00:00 Sent SMS [SMSC:SYBASE1] [SVC:backendtextme] [ACT:] [BINF:] [FID:] [from:18572406905] [to:14022180266] [flags:-1:0:-1:-1:-1] [msg:136:Far out in the uncharted backwaters of the unfashionable end of the western spiral arm of the Galaxy lies a small unregarded yellow sun.] [udh:0:]'
18572406905,14022180266,-1:0:-1:-1:-1
$
$
$ ./100-textme.rb 'Feb 1 11:00:00 ip-10-0-64-11 mdr: 2016-02-01 11:00:00 Sent SMS [SMSC:SYBASE1] [SVC:backendtextme] [ACT:] [BINF:] [FID:] [from:12392190384] [to:19148265919] [flags:-1:0:-1:-1:-1] [msg:99:life forms are so amazingly primitive that they still think digital watches are a pretty neat idea.] [udh:0:]'
12392190384,19148265919,-1:0:-1:-1:-1
$
```
</details>