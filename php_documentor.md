﻿h1. DocBlock:

{code}
/**
 * Short Description
 *
 * Long Description: this line
 * and this one are part of the same paragraph
 * use a dot or an empty line if you want to start on a new line
 *
 * @author  this is a valid tag
 * @author: this is NOT (because of the colon)
 *
 * This {@author} is a valid tag
 * This  @author  is NOT (you need braces)
 */
{code}
{color:#cc0033}{_}Warning:_{color} /\*\* This explanation is *NOT* parsed \*/ (2 lines is the minimum)

h2. A DocBlock is valid {color:#cc0033}only{color} when the following element is one of:

* class
* class method
* class variable (A variable local to a function can *NOT* be documented)
* global variable
* function
* define statement
* include statement

See [Documentable PHP Elements|http://manual.phpdoc.org/HTMLSmartyConverter/HandS/phpDocumentor/tutorial_elements.pkg.html]

h2. Package DocBlock:

A @package tag should reside in it's own DocBlock and that DocBlock should be the very first in the file
{code}
/**
 * @package Controllers
 */
{code}

h1. Links:

[PHP Documentor  Documentation|http://manual.phpdoc.org/]

h1. Tags:

{code}
 /**
  * The short description
  *
  * As many lines of extendend description as you want {@link element}
  * links to an element
  * {@link http://www.example.com Example hyperlink inline link} links to
  * a website. The inline
  * source tag displays function source code in the description:
  * {@source }
  *
  * In addition, in version 1.2+ one can link to extended documentation like this
  * documentation using {@tutorial phpDocumentor/phpDocumentor.howto.pkg}
  * In a method/class var, {@inheritdoc may be used to copy documentation from}
  * the parent method
  * {@internal
  * This paragraph explains very detailed information that will only
  * be of use to advanced developers, and can contain
  * {@link http://www.example.com Other inline links!} as well as text}}}
  *
  * Here are the tags:
  *
  * @abstract
  * @access       public or private
  * @author       author name <author@email>
  * @copyright    name date
  * @deprecated   description
  * @deprec       alias for deprecated
  * @example      /path/to/example
  * @exception    Javadoc-compatible, use as needed
  * @global       type $globalvarname
    or
  * @global       type description of global variable usage in a function
  * @ignore
  * @internal     private information for advanced developers only
  * @param        type [$varname] description
  * @return       type description
  * @link         URL
  * @name         procpagealias
    or
  * @name         $globalvaralias
  * @magic        phpdoc.de compatibility
  * @package      package name
  * @see          name of another element that can be documented,
  *                produces a link to it in the documentation
  * @since        a version or a date
  * @static
  * @staticvar    type description of static variable usage in a function
  * @subpackage    sub package name, groupings inside of a project
  * @throws       Javadoc-compatible, use as needed
  * @todo         phpdoc.de compatibility
  * @var        type    a data type for a class variable
  * @version    version
  */
 function if_there_is_an_inline_source_tag_this_must_be_a_function()
 {
 // ...
 }
{code}
