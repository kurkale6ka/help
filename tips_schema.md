h2. 1. One can customize all labels in a XForm:

*<xs:element name="description">*
&nbsp;&nbsp;&nbsp; {color:#0099ff}<xs:annotation>{color}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <xs:appinfo>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <alf:label>Description</alf:label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <alf:alert>A description is required, length restriction: 250 characters</alf:alert>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <alf:appearance>+minimal+</alf:appearance>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </xs:appinfo>
&nbsp;&nbsp;&nbsp; {color:#0099ff}</xs:annotation>{color}
&nbsp;&nbsp;&nbsp; <xs:simpleType>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <xs:restriction base="xs:string">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <xs:minLength value="0"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <xs:maxLength value="250"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </xs:restriction>
&nbsp;&nbsp;&nbsp; </xs:simpleType>
*</xs:element>*

The above would create a basic textarea form field (not a rich text editor).

Make sure you position the annotation element immediately after the opening *{_}xs:element{_}* tag, no other elements can go in between.

*Note:* be careful with use of minimal, don't add it unless it is needed.
\\

h2. 2. If a value starts with "$\{" and ends with "\}", the Form UI will look up for the key/value pair in a chain of property files

These default configured property file locations from highest to lowest precedence are:
* /Company Home/Data Dictionary/Web Forms/\{form name\}/*strings.properties*
* /Company Home/Data Dictionary/Web Forms/*strings.properties*
* *webclient.properties* (within the Alfresco webapp)

key1=val1
key2=val2
\\

h2. 3. You can update a schema in Alfresco without going through all the steps again:

{color:#ff0000}\[root@pal.sandbox\] ~ (\!879 - %0, 11:53){color}
{color:#ff0000}\#{color} iurl \-s test brand (for org_brand.xsd)
{color:#ff0000}\#{color} iurl \-l test building_blocks (for org_building_blocks.xsd)
{color:#ff0000}\#{color} iurl \-w test item_title.get.js (for item_title.get.js)

*iurl script*:
{code}
...
{code}
{color:}{*}The alternative when using the GUI is:*{color}

{color:}&nbsp;{color} !schema.jpg|align=left!
{color:}&nbsp;{color}\\ {color:}&nbsp;{color} {color:}{*}instead of:*{color}
{color:}&nbsp;{color}\\ {color:}&nbsp;{color} !settings.jpg|align=left!
{color:}&nbsp;{color}\\
\\

h2. {color:}4. Webscripts:{color}

{color:}Importing or including within an imported or included schema is a known Alfresco bug. Your imports or includes must be one level deep atmost.{color}

{color:}Your webscripts must reside within: 'Data Dictionary/Web Scripts' and you can test them using urls of the sort:{color}

{color:}[https://.../folder?f1=typeZprint&storeid=ORG]{color}

{color:}{*}Note:*{color} {color:}be aware that the iSite team need to refresh the webscripts' index before you can test a newly created script.{color}\\

h2. {color:}5. Save Location for your schema:{color}

{color:}If you want to use a normalizedString field for defining the name under which your schema should be saved, here is the kind of Freemaker output pattern to be used:{color}

{color:#0000ff}/${webapp}/brand/${xml['org:org']['org:brand']['org:name_id']}.xml{color}

See:&nbsp; [Output Path Pattern Examples|http://wiki.alfresco.com/wiki/WCM_Forms_Developer_Guide#Output_Path_Pattern_Examples]\\

h2. 6. Links:

[xml schemas|http://www.learn-xml-schema-tutorial.com/|xsd tutorial]

[schema namespaces|http://www.ibm.com/developerworks/library/xml-schema/|The basics of using XML Schema to define elements]

[Forms Authoring Guide|http://wiki.alfresco.com/wiki/Forms_Authoring_Guide#Overview_of_supported_XML_Schema_structures_and_data_types|Supported structures and data types]

[Alfresco Widgets|http://wiki.alfresco.com/wiki/Creating_XForms_Widgets|Creating XForms Widgets]

[Unbeatable JavaScript Tools|http://docs.dojocampus.org/quickstart/index|Dojo]

[Alfresco Developers|http://wiki.alfresco.com/wiki/Main_Page|Alfresco wiki]

[Learning Alfresco Web Forms by Examples|http://drquyong.com/myblog/?p=65|Dr. Q's Workshop]
