# Project XSL Ideas

Using the [Schema Framework](https://www.github.com/cjungmann/schemafw),
I often have to write non-trivial XSL code.  From parsing values to
selecting from a set of options, XSL code can be difficult to write
due to the restrictions of the language.

There are some techniques I have found or developed that have been
very useful.  Unfortunately, I forget the details of the more unusual
solutions when I need them again.  This project will be the reference
of my solutions.

The examples should be in paired files, and XML and XSL file with the
same name that should be used together.

For the most part, the output will be text, though you should be
able to view the results by opening the XML file with a browser.
My preferred method to check the results is to use **xsltproc**:

~~~sh
 $ xsltproc parse_vals.xsl parse_vals.xml
~~~

Note the main two parameters of **xsltproc** are the XML file
and the XSL file.  Remember to put the XSL file first on the
command line.

## Parse Vals




## Dup_Doc

The focus of this idea is the XSL file, **dup_doc.xsl**.  The companion
file, **dup_doc.xml** is a simple document with a variety of XML items
to test and confirm how they are, or are not, duplicated.

