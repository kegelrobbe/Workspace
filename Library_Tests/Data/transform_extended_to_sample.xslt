<?xml version="1.0" encoding="UTF-8"?>
<!--
    XSLT Transformation: EXTENDED_Fremdwaehrung.xml to SampleLetterDataWithOutputChannels.xml
    
    Purpose:
    Transforms ZUGFeRD invoice data (EXTENDED format) to SampleLetterData format,
    specifically mapping ShipToTradeParty address information to Recipient address fields.
    
    Mapping Rules:
    1. ShipToTradeParty/Name -> Recipient/Address/Line1
    2. ShipToTradeParty/PostalTradeAddress/LineOne -> Recipient/Address/Line2
    3. ShipToTradeParty/PostalTradeAddress/LineTwo -> Recipient/Address/Line3
    4. ShipToTradeParty/PostalTradeAddress/LineThree -> Recipient/Address/Line3
    5. CountryID, PostcodeCode, CityName (space-separated concatenation) -> Recipient/Address/Line4
    
    Author: Generated transformation
    Date: 2025
-->
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rsm="urn:un:unece:uncefact:data:standard:CrossIndustryInvoice:100"
    xmlns:ram="urn:un:unece:uncefact:data:standard:ReusableAggregateBusinessInformationEntity:100"
    xmlns:qdt="urn:un:unece:uncefact:data:standard:QualifiedDataType:100"
    xmlns:udt="urn:un:unece:uncefact:data:standard:UnqualifiedDataType:100"
    exclude-result-prefixes="rsm ram qdt udt">
    
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    
    <!--
        Root template: Creates the DATA root element and processes ShipToTradeParty data
    -->
    <xsl:template match="/">
        <DATA>
            <Recipient>
                <Address>
                    <!-- Mapping Rule 1: ShipToTradeParty/Name -> Recipient/Address/Line1 -->
                    <Line1>
                        <xsl:value-of select="normalize-space(
                            /rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/
                            ram:ApplicableHeaderTradeDelivery/ram:ShipToTradeParty/ram:Name
                        )"/>
                    </Line1>
                    
                    <!-- Mapping Rule 2: ShipToTradeParty/PostalTradeAddress/LineOne -> Recipient/Address/Line2 -->
                    <Line2>
                        <xsl:value-of select="normalize-space(
                            /rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/
                            ram:ApplicableHeaderTradeDelivery/ram:ShipToTradeParty/
                            ram:PostalTradeAddress/ram:LineOne
                        )"/>
                    </Line2>
                    
                    <!-- Mapping Rule 3: ShipToTradeParty/PostalTradeAddress/LineTwo -> Recipient/Address/Line3 -->
                    <Line3>
                        <xsl:variable name="lineTwo" select="normalize-space(
                            /rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/
                            ram:ApplicableHeaderTradeDelivery/ram:ShipToTradeParty/
                            ram:PostalTradeAddress/ram:LineTwo
                        )"/>
                        <xsl:variable name="lineThree" select="normalize-space(
                            /rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/
                            ram:ApplicableHeaderTradeDelivery/ram:ShipToTradeParty/
                            ram:PostalTradeAddress/ram:LineThree
                        )"/>
                        <!-- 
                            Mapping Rule 4: LineThree also maps to Line3.
                            If both LineTwo and LineThree exist, concatenate them with space.
                            Otherwise, use whichever exists.
                        -->
                        <xsl:choose>
                            <xsl:when test="$lineTwo != '' and $lineThree != ''">
                                <xsl:value-of select="concat($lineTwo, ' ', $lineThree)"/>
                            </xsl:when>
                            <xsl:when test="$lineTwo != ''">
                                <xsl:value-of select="$lineTwo"/>
                            </xsl:when>
                            <xsl:when test="$lineThree != ''">
                                <xsl:value-of select="$lineThree"/>
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                    </Line3>
                    
                    <!-- 
                        Mapping Rule 5: CountryID, PostcodeCode, CityName concatenated with spaces -> Recipient/Address/Line4
                        Order: CountryID, PostcodeCode, CityName (as specified)
                    -->
                    <Line4>
                        <xsl:variable name="countryID" select="normalize-space(
                            /rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/
                            ram:ApplicableHeaderTradeDelivery/ram:ShipToTradeParty/
                            ram:PostalTradeAddress/ram:CountryID
                        )"/>
                        <xsl:variable name="postcodeCode" select="normalize-space(
                            /rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/
                            ram:ApplicableHeaderTradeDelivery/ram:ShipToTradeParty/
                            ram:PostalTradeAddress/ram:PostcodeCode
                        )"/>
                        <xsl:variable name="cityName" select="normalize-space(
                            /rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/
                            ram:ApplicableHeaderTradeDelivery/ram:ShipToTradeParty/
                            ram:PostalTradeAddress/ram:CityName
                        )"/>
                        <xsl:variable name="parts">
                            <xsl:if test="$countryID != ''">
                                <part><xsl:value-of select="$countryID"/></part>
                            </xsl:if>
                            <xsl:if test="$postcodeCode != ''">
                                <part><xsl:value-of select="$postcodeCode"/></part>
                            </xsl:if>
                            <xsl:if test="$cityName != ''">
                                <part><xsl:value-of select="$cityName"/></part>
                            </xsl:if>
                        </xsl:variable>
                        <xsl:value-of select="string-join($parts/part, ' ')"/>
                    </Line4>
                    
                    <!-- Empty elements for remaining address lines -->
                    <Line5/>
                    <Line6/>
                    
                    <!-- SingleLine: Concatenation of Line1, Line2, Line3 with bullet separator -->
                    <SingleLine>
                        <xsl:variable name="l1" select="normalize-space(
                            /rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/
                            ram:ApplicableHeaderTradeDelivery/ram:ShipToTradeParty/ram:Name
                        )"/>
                        <xsl:variable name="l2" select="normalize-space(
                            /rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/
                            ram:ApplicableHeaderTradeDelivery/ram:ShipToTradeParty/
                            ram:PostalTradeAddress/ram:LineOne
                        )"/>
                        <xsl:variable name="l3" select="normalize-space(
                            /rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/
                            ram:ApplicableHeaderTradeDelivery/ram:ShipToTradeParty/
                            ram:PostalTradeAddress/ram:LineTwo
                        )"/>
                        <xsl:variable name="singleLineParts">
                            <xsl:if test="$l1 != ''">
                                <part><xsl:value-of select="$l1"/></part>
                            </xsl:if>
                            <xsl:if test="$l2 != ''">
                                <part><xsl:value-of select="$l2"/></part>
                            </xsl:if>
                            <xsl:if test="$l3 != ''">
                                <part><xsl:value-of select="$l3"/></part>
                            </xsl:if>
                        </xsl:variable>
                        <xsl:value-of select="string-join($singleLineParts/part, ' • ')"/>
                    </SingleLine>
                </Address>
            </Recipient>
            
            <!-- Copy remaining structure from target template (empty/default values) -->
            <Sender>
                <Address>
                    <Line1/>
                    <Line2/>
                    <Line3/>
                    <Line4/>
                    <Line5/>
                    <Line6/>
                    <SingleLine/>
                </Address>
                <Faksimile/>
                <FaksimileLabel/>
            </Sender>
            <SalutatoryAddress>
                <Line/>
                <Line/>
                <Line/>
                <GraphicLabel/>
                <GraphicBase64/>
                <GraphicName/>
            </SalutatoryAddress>
            <ComplimentaryClose>
                <Line/>
                <Line/>
                <Line/>
                <GraphicLabel/>
                <GraphicBase64/>
                <GraphicName/>
            </ComplimentaryClose>
            <Subject>
                <Line/>
                <Line/>
            </Subject>
            <Date/>
            <ContactDetails>
                <Line/>
                <Line/>
                <Line/>
                <Line/>
                <Line/>
                <Line/>
            </ContactDetails>
            <Header>
                <Line/>
                <Line/>
                <Line/>
                <GraphicLabel/>
                <GraphicBase64/>
                <GraphicName/>
            </Header>
            <Footer>
                <Line/>
                <Line/>
                <Line/>
                <GraphicLabel/>
                <GraphicBase64/>
                <GraphicName/>
            </Footer>
            <OutputControls>
                <SFTP>
                    <CertStore/>
                    <Endpoint/>
                </SFTP>
            </OutputControls>
            <EMail>
                <To/>
                <From/>
                <Subject/>
                <AsAttachment/>
            </EMail>
            <Messaging>
                <Type/>
                <To/>
                <GatewayParams/>
                <GatewayParams/>
            </Messaging>
            <BulkMail>
                <GatewayParams/>
                <GatewayParams/>
                <EMail>
                    <To/>
                    <From/>
                    <Subject/>
                    <AsAttachment/>
                </EMail>
            </BulkMail>
            <SMTP>
                <Server/>
                <Port/>
                <CertStore/>
                <EMail>
                    <To/>
                    <From/>
                    <Subject/>
                    <AsAttachment/>
                </EMail>
            </SMTP>
            <PrintedLetter>
                <GatewayParams/>
                <GatewayParams/>
            </PrintedLetter>
            <DVelopPostbox>
                <GatewayParams/>
                <GatewayParams/>
            </DVelopPostbox>
            <Archiv>
                <GatewayParams/>
                <GatewayParams/>
            </Archiv>
            <CloudStorage>
                <Endpoint/>
                <Token/>
                <GatewayParams/>
                <GatewayParams/>
            </CloudStorage>
            <Kafka>
                <Instance/>
                <Topic/>
                <Token/>
            </Kafka>
            <RestAPI>
                <Endpoint/>
                <Function/>
                <APIToken/>
            </RestAPI>
            <ControlConfiguration>
                <ScheduledPrintDate>
                    <MinDate/>
                    <MaxDate/>
                    <FixedDate/>
                </ScheduledPrintDate>
            </ControlConfiguration>
        </DATA>
    </xsl:template>
    
</xsl:stylesheet>
