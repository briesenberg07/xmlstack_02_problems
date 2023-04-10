import os

directory = input("Provide the name of the home directory containing the Saxon HE .jar file\n> ")
version = input("Prove the version number of the Saxon HE .jar file\n> ")

# filepaths in the os.system command below are evaluated from *directory where the terminal is open*
# filepaths in the .xsl file are evaluated from that file's location
os.system(f"java -cp ~/{directory}/saxon-he-{version}.jar net.sf.saxon.Transform -s:test_py2xsl.xsl -xsl:test_py2xsl.xsl word=theBird")
