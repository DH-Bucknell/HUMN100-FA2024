<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs tei xhtml"
    version="2.0">
    
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
        method="xhtml" omit-xml-declaration="yes" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="tei:TEI">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <xsl:comment>This document is generated from a TEI Master--do not edit!</xsl:comment>
                <title><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></title>
                <link rel="stylesheet" type="text/css" href="../CSS/taylor_style.css"/>
                <style type="text/css">
                    @import url("../CSS/taylor_style.css");
                </style>
            </head>
            
            <body>
                <xsl:apply-templates select="tei:text/tei:body"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:head">
        <hr/>
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <xsl:template match="tei:byline">
        <h4><xsl:text>
        Encoded by: 
    </xsl:text>
        <xsl:apply-templates/>
        </h4>
    </xsl:template>
    
    <xsl:template match="tei:persName">
        <span style="color: blue;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:placeName">
        <span style="color: red">
            <xsl:apply-imports/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:orgName">
        <span style="color: orange">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:objectName">
        <span style="color: green">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:persName[@ref] | tei:placeName[@type] | tei:orgName[@type] | tei:objectName[@type]">
        <span class="hovertext" data-hover="{@type}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
</xsl:stylesheet>