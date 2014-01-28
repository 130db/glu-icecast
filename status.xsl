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
<xsl:output omit-xml-declaration="no" method="html" indent="yes" encoding="UTF-8" />
<xsl:template match = "/icestats" >
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html></xsl:text>

<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" user-scalable="no"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

	<title>Status - <xsl:if test="host"><xsl:value-of select="host" /></xsl:if></title>
	<link rel="stylesheet" type="text/css" href="boilerplate.min.css" />
	<link rel="stylesheet" type="text/css" href="style.css" />
	<script src="modernizr-2.6.2.min.js"></script>
	<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,200,700&amp;subset=latin,latin-ext" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="container">
	<header role="banner">
		<h1 id="site-title"><xsl:if test="host"><xsl:value-of select="host" /></xsl:if></h1>
		<p class="site-info"><span class="radio-station">Localhost radio.</span> <xsl:if test="location"><span class="location"><xsl:value-of select="location" /></span></xsl:if></p>
	</header>

<xsl:for-each select="source">
<xsl:choose>
<xsl:when test="listeners">

	<section class="mount-point">
		<header class="mount-point-header clearfix">
			<h1 class="mount-header clearfix">
				<xsl:if test="server_name"><span class="stripe lt"></span><span class="server-name"><xsl:value-of select="server_name" /></span><span class="stripe rt"></span></xsl:if>
			</h1>
			<xsl:if test="server_description">
				<p class="stream-description" title="Stream Description"><xsl:value-of select="server_description" /></p>
			</xsl:if>
		</header>

		<div class="mount-point-data">
			<xsl:if test="title">
				<p class="current-song" title="Current Song"><xsl:if test="artist"><xsl:value-of select="artist" /> - </xsl:if><xsl:value-of select="title" /></p>
			</xsl:if>
			<div class="more-info">
			<xsl:if test="genre">
				<p class="stream-genre" title="Stream Genre"><xsl:value-of select="genre" /></p>
			</xsl:if>
			<xsl:if test="server_type">
				<p class="content-type" title="Content Type"><xsl:value-of select="server_type" /></p>
			</xsl:if>
			<xsl:if test="quality">
				<p class="stream-quality" title="Stream Quality"><xsl:value-of select="quality" /></p>
			</xsl:if>
			<xsl:if test="bitrate">
				<p class="stream-bitrate" title="Stream Bitrate"><xsl:value-of select="bitrate" /> Kbps</p>
			</xsl:if>
			<xsl:if test="video_quality">
				<p class="video-quality" title="Video Quality"><xsl:value-of select="video_quality" /></p>
			</xsl:if>
			<xsl:if test="frame_size">
				<p class="frame-size" title="Frame Size"><xsl:value-of select="frame_size" /></p>
			</xsl:if>
			<xsl:if test="frame_rate">
				<p class="frame-rate" title="Frame Rate"><xsl:value-of select="frame_rate" /></p>
			</xsl:if>
			<xsl:if test="server_url">
				<p class="server-url" title="Server URL"><a target="_blank" href="{server_url}"><xsl:value-of select="server_url" /></a></p>
			</xsl:if>
			<!--<xsl:if test="stream_start">
				<p class="stream-start" title="Mount Started"><xsl:value-of select="stream_start" /></p>
			</xsl:if>-->
			</div>
		</div>
			<p class="listen">
				<!--<xsl:choose>
					<xsl:when test="authenticator">
						<a class="auth" href="/auth.xsl">Login</a>
					</xsl:when>
					<xsl:otherwise>
						<a class="playlist" href="{@mount}.m3u">M3U</a>
						<a class="playlist" href="{@mount}.xspf">XSPF</a>
					</xsl:otherwise>
				</xsl:choose>-->
				<a class="playlist" href="{@mount}.m3u">M3U</a>
				<a class="playlist" href="{@mount}.xspf">XSPF</a>
				<xsl:if test="title">
					<a class="playlist" href="https://www.youtube.com/results?search_query={title}" rel="external">YouTube</a>
				</xsl:if>
				<span class="mount-name">
					<span class="mount"><xsl:value-of select="@mount" /></span> <sup class="visuallyhidden"><xsl:if test="listeners"><xsl:value-of select="listeners" /></xsl:if><xsl:if test="listener_peak">/<xsl:value-of select="listener_peak" /></xsl:if></sup>
				</span>
			</p>
	</section>

</xsl:when>
<xsl:otherwise>
<section class="mount-point">
	<header class="mount-point-header clearfix">
		<h1><xsl:value-of select="@mount" /> - Not Connected</h1>
	</header>
</section>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>

<footer id="site-footer" class="clearfix">
	<p>Icecast status page theme by <a href="http://twitter.com/130db" rel="external">@130db</a>.</p>
</footer>
</div>

</body>
</html>
</xsl:template>
</xsl:stylesheet>
