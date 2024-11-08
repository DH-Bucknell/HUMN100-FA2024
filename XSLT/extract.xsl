<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <xsl:text>Byline,Type,Value,Attribute&#xA;</xsl:text>
        <xsl:apply-templates select="//tei:div[@type='interview']"/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='interview']">
        <xsl:variable name="byline" select="normalize-space(tei:byline)"/>
        <xsl:apply-templates select=".//tei:persName[@key]|.//tei:objectName[@type]|.//tei:placeName[@type]|.//tei:eventName[@type]|.//tei:orgName[@type]">
            <xsl:with-param name="byline" select="$byline"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="tei:persName[@key]|tei:objectName[@type]|tei:placeName[@type]|tei:eventName[@type]|tei:orgName[@type]">
        <xsl:param name="byline"/>
        <xsl:value-of select="$byline"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:text>,"</xsl:text>
        <xsl:value-of select="normalize-space(.)"/>
        <xsl:text>",</xsl:text>
        <xsl:value-of select="@*[local-name()='key' or local-name()='type']"/>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
</xsl:stylesheet>