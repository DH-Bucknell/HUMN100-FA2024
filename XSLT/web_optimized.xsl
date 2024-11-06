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
    
    <!-- Root template -->
    <xsl:template match="tei:TEI">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <xsl:comment>This document is generated from a TEI Master--do not edit!</xsl:comment>
                <title><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></title>
                <style type="text/css">
                    /* Base styles for named entities */
                    .entity {
                    position: relative;
                    display: inline-block;
                    padding: 2px;
                    border-radius: 3px;
                    transition: background-color 0.3s;
                    }
                    
                    /* Color-coding for different entity types */
                    .persName { color: #2563eb; }
                    .placeName { color: #dc2626; }
                    .orgName { color: #ea580c; }
                    .objectName { color: #16a34a; }
                    
                    /* Hover effect for attributes */
                    .entity[data-hover]:hover::after {
                    content: attr(data-hover);
                    position: absolute;
                    bottom: 100%;
                    left: 50%;
                    transform: translateX(-50%);
                    padding: 5px;
                    background: #333;
                    color: white;
                    border-radius: 4px;
                    font-size: 14px;
                    white-space: nowrap;
                    z-index: 1;
                    }
                    
                    /* Additional styling */
                    hr { margin: 20px 0; }
                    h2 { color: #1f2937; }
                    h4 { color: #4b5563; }
                </style>
            </head>
            <body>
                <xsl:apply-templates select="tei:text/tei:body"/>
            </body>
        </html>
    </xsl:template>
    
    <!-- Section headers -->
    <xsl:template match="tei:head">
        <hr/>
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <!-- Byline -->
    <xsl:template match="tei:byline">
        <h4>
            <xsl:text>Encoded by: </xsl:text>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>
    
    <!-- Named entities without attributes -->
    <xsl:template match="tei:persName[not(@*)]">
        <span class="entity person">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:placeName[not(@*)]">
        <span class="entity place">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:orgName[not(@*)]">
        <span class="entity org">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:objectName[not(@*)]">
        <span class="entity object">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- Named entities with attributes (hover effect) -->
    <xsl:template match="tei:persName[@ref] | tei:placeName[@type] | tei:orgName[@type] | tei:objectName[@type]">
        <span class="entity {local-name()}" data-hover="{@type|@ref}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- Default template for copying nodes and attributes -->
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>