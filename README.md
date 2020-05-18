Obeliks4J
===

Sentence splitting & tokenization
===

Build on Linux
---

Compile (execute from `Obeliks4J`):
```
javac src/main/java/org/obeliks/*.java -d target/classes
cp src/main/resources/* target/classes/org/obeliks/
jar -cef org.obeliks.Tokenizer obeliks.jar -C target/classes org
```
You can now run Obeliks either with specified classpath:
```
java -cp target/classes org.obeliks.Tokenizer [params...]
```
or with jar (simpler, not location dependent):
```
java -jar obeliks.jar [params...]
```

Command line parameters
---

```
-if <name*>	read input from one or more files
-sif		read input from list of files, specified via stdin
-o <name>	write output to file <name>
-tei		produce XML-TEI output
-c		produce CoNLL-U output
-d		pass "newdoc id" to output (enables CoNLL-U)
```

Usage examples on Linux
---

Tokenize texts 
```
java -jar obeliks.jar "To je stavek." "Tudi to je stavek."
```
or
```
echo -e "To je stavek.\nTudi to je stavek." | java -jar obeliks.jar
```

Tokenize to output file
```
java -jar obeliks.jar "To je stavek." "Tudi to je stavek." -o output.txt
```
or
```
echo -e "To je stavek.\nTudi to je stavek." | java -jar obeliks.jar > output.txt
```

Tokenize from files 
```
java -jar obeliks.jar -if text*.txt
```
or
```
cat text*.txt | java -jar obeliks.jar
```
or
```
ls -A1 text*.txt | java -jar obeliks.jar -sif
```

Output XML-TEI
```
java -jar obeliks.jar "To je stavek." "Tudi to je stavek." -o output.xml -tei
```
or
```
echo -e "To je stavek.\nTudi to je stavek." | java -jar obeliks.jar -tei > output.xml
```

Output CoNLL-U
```
java -jar obeliks.jar "To je stavek." "Tudi to je stavek." -o output.conllu -c
```
If you want to pass "**# newdoc id = ...**" comment unchanged from input to output,
use ```-d``` switch. Using ```-d``` switch alone implies ```-c```.

Build on Windows
---

Compile (execute from `Obeliks4J`)
```
javac src\main\java\org\obeliks\*.java -d target/classes
copy src\main\resources\* target\classes\org\obeliks\
jar -cef org.obeliks.Tokenizer obeliks.jar -C target\classes org
```
You can now run Obeliks either with specified classpath:
```
java -cp target\classes org.obeliks.Tokenizer [params...]
```
or with jar (simpler, not location dependent):
```
java -jar obeliks.jar [params...]
```

Usage examples on Windows
---

Tokenize texts 
```
java -jar obeliks.jar "To je stavek." "Tudi to je stavek."
```

Tokenize to output file
```
java -jar obeliks.jar "To je stavek." "Tudi to je stavek." -o output.txt
```

Tokenize from files 
```
java -jar obeliks.jar -if text1.txt text2.txt text3.txt
```
or
```
java -jar obeliks.jar -if text*.txt
```
All other examples from Linux section should also run on Windows (except
for specifying directory separator).

Docker
---

Building the image:
```
docker build -t obeliks4j:latest .
```

Create container from the newly built image and run it:
```
echo -e "To je stavek.\nTudi to je stavek." | docker run --name obeliks4j -i obeliks4j:latest
```

When working with files it is recommended to use volumes. For example if we have our input text files inside ~/data/:
```
docker run --name obeliks4j -i -v ~/data:/data --entrypoint /bin/sh obeliks4j:latest -c "java -jar obeliks.jar -if /data/text*.txt -o /data/output.txt"
```
To make use of shell expansion inside the container, we had to override the default entrypoint to run the command as "/bin/sh -c ...".

You can reuse an existing container by using the "docker start" command.

Remove container:
```
docker rm obeliks4j
```

