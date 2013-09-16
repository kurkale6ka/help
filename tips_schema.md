One can customize all labels in a XForm:
----------------------------------------

```xml
<xs:element name="description">
   <xs:annotation>
      <xs:appinfo>
         <alf:label>Description</alf:label>
         <alf:alert>A description is required, length restriction: 250 characters</alf:alert>
         <alf:appearance>+minimal+</alf:appearance>
      </xs:appinfo>
   </xs:annotation>
   <xs:simpleType>
      <xs:restriction base="xs:string">
         <xs:minLength value="0"/>
         <xs:maxLength value="250"/>
      </xs:restriction>
   </xs:simpleType>
</xs:element>
```

The above would create a basic textarea form field (not a rich text editor).

Make sure you position the annotation element immediately after the opening `xs:element` tag, no other elements can go in between.

*Note:* be careful with use of minimal, don't add it unless it is needed.

If a value starts with "$\{" and ends with "\}", the Form UI will look up for the key/value pair in a chain of property files
-----------------------------------------------------------------------------------------------------------------------------

These default configured property file locations from highest to lowest precedence are:
* /Company Home/Data Dictionary/Web Forms/\{form name\}/*strings.properties*
* /Company Home/Data Dictionary/Web Forms/*strings.properties*
* *webclient.properties* (within the Alfresco webapp)

key1=val1
key2=val2

Webscripts:
-----------

Importing or including within an imported or included schema is a known Alfresco bug. Your imports or includes must be one level deep atmost.

Your webscripts must reside within: 'Data Dictionary/Web Scripts' and you can test them using urls of the sort:

[https://.../folder?f1=typeZprint&storeid=ORG]

**Note:** be aware that the iSite team need to refresh the webscripts' index before you can test a newly created script.

Save Location for your schema:
------------------------------

If you want to use a normalizedString field for defining the name under which your schema should be saved, here is the kind of Freemaker output pattern to be used:

/${webapp}/brand/${xml['org:org']['org:brand']['org:name_id']}.xml

See: [Output Path Pattern Examples|http://wiki.alfresco.com/wiki/WCM_Forms_Developer_Guide#Output_Path_Pattern_Examples]

Links:
------

[xml schemas](http://www.learn-xml-schema-tutorial.com/ "xsd tutorial")
[schema namespaces](http://www.ibm.com/developerworks/library/xml-schema/ "The basics of using XML Schema to define elements")
[Forms Authoring Guide](http://wiki.alfresco.com/wiki/Forms_Authoring_Guide#Overview_of_supported_XML_Schema_structures_and_data_types "Supported structures and data types")
[Alfresco Widgets](http://wiki.alfresco.com/wiki/Creating_XForms_Widgets "Creating XForms Widgets")
[Unbeatable JavaScript Tools](http://docs.dojocampus.org/quickstart/index "Dojo")
[Alfresco Developers](http://wiki.alfresco.com/wiki/Main_Page "Alfresco wiki")
[Learning Alfresco Web Forms by Examples](http://drquyong.com/myblog/?p=65 "Dr. Q's Workshop")
