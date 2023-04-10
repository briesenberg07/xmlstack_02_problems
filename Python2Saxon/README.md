# Running XSLT from a Python script

A current use case for this is running stylesheet transformations for [sinopia_maps](https://github.com/uwlib-cams/sinopia_maps). For these transformations, I would like to select things such as:

- the Sinopia platform (production, stage, or development) where resource templates (RTs) will be loaded (RT IRIs vary depending on this)
- whether all [sinopia_maps RTs](https://github.com/uwlib-cams/sinopia_maps/blob/main/xml/sinopia_maps.xml) should be output, or only some

Storing basic Python syntax needed to run a Saxon transformation here, including for passing params to a stylesheet.

## Resources
- [SAXON: The XSLT and XQuery processor](http://saxon.sourceforge.net/): Saxon HE is a free version, and sinopia_maps stylesheets may be run using it; latest version at time of writing is [Saxon-HE 11](http://saxon.sourceforge.net/#F11HE)
- Python [os library](https://docs.python.org/3.8/library/os.html)\* (\*link for v3.8): Using [os.system](https://docs.python.org/3.8/library/os.html#os.system) to pass a command to Saxon
- Saxonica documentation > [Running XSLT from the Command Line](https://www.saxonica.com/documentation10/index.html#!using-xsl/commandline): This provides the needed command syntax 
