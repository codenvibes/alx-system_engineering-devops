**What is `sed`?**

- A powerful stream editor used for text manipulation in Unix-like systems.
- Processes text line by line, applying specified editing commands.
- Can modify files directly or output the changes to the console.

**Basic Syntax:**

```bash
sed [options] 'command' file
```

**Common Options:**

- **`-n`:** Suppresses default output.
- **`-i`:** Edits the file in place (modifies the original file).
- **`-e`:** Executes multiple commands.
- **`-f`:** Reads commands from a file.

**Essential Commands:**

- **`p`:** Prints the current line.
- **`d`:** Deletes the current line.
- **`s`:** Substitutes a pattern with a replacement string.
- **`a`:** Appends text after a line.
- **`i`:** Inserts text before a line.
- **`c`:** Replaces the entire line with new text.

**Examples:**

- **Print lines containing "error":**
   ```bash
   sed -n '/error/p' file.txt
   ```
- **Delete lines starting with "#":**
   ```bash
   sed '/^#/d' file.txt
   ```
- **Replace "foo" with "bar":**
   ```bash
   sed 's/foo/bar/g' file.txt
   ```
- **Append text to the end of the file:**
   ```bash
   sed '$a New text to append' file.txt
   ```
- **Insert text before line 5:**
   ```bash
   sed '5i This text is inserted before line 5' file.txt
   ```

**Addressing Specific Lines:**

- Use regular expressions or line numbers to target specific lines.
- Examples:
   ```bash
   # Target lines starting with "http":
   sed '/^http/' file.txt
   # Target line number 10:
   sed '10' file.txt
   ```

**Remember:**

- Practice regularly to master `sed`'s capabilities.
- Always back up files before editing them with `sed`.
- Use `man sed` or online resources for more comprehensive documentation.
