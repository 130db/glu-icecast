<!--
The MIT License (MIT)

Copyright (c) 2014 Aigars Sukurs

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
	<xsl:output omit-xml-declaration="yes" method="text" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="no" encoding="UTF-8" media-type="application/json" />
	<xsl:strip-space elements="*"/>

	<xsl:template match = "/icestats" >
	{
		"server": {
			<xsl:for-each select="*">
				<xsl:if test = "name()!='source'">
					"<xsl:value-of select="name()" />": "<xsl:value-of select="." />",
				</xsl:if>
			</xsl:for-each>

			"streams": {
				<xsl:for-each select="source">
					"<xsl:value-of select="@mount" />": {
						"name" : "<xsl:value-of select="server_name"/>",
						"listeners" : "<xsl:value-of select="listeners" />",
						"peak_listeners" : "<xsl:value-of select="listener_peak" />",
						"description" : "<xsl:value-of select="server_description" />",
						"title" : "<xsl:value-of select="title" />",
						"genre" : "<xsl:value-of select="genre" />",
						"url" : "<xsl:value-of select="server_url" />"
					}<xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
				</xsl:for-each>
			}
		}
	}
	</xsl:template>
</xsl:stylesheet>

