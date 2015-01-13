<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
   >
   <xsl:output method="html" indent="yes"/>
   <xsl:template match="/">
      <html>
         <head>
            <title>ZAP Scanning Report</title>
            <style>
              body{
                text:#000000
              }
               .alertssummarytable{
               width:45%;
               border:0;
               }
               .alertssummarytableheaderrow
               {
               background-color:#666666;
               }
               .font1{
               font-size:83%;
               font-family:Arial, Helvetica, sans-serif;
               }
               .fontwhite{
               color:#FFFFFF;
               font-size:83%;
               font-family:Arial, Helvetica, sans-serif;
               }
               .fontblack{
               color:#000000;
               font-size:83%;
               font-family:Arial, Helvetica, sans-serif;
               }
               .greyrow
               {
               background-color:#e8e8e8
               }
               .alertdetailtable
               {
               width:100%";
               border:0;
               }
               #highrishalert
               {

               }
               #mediumriskalert
               {

               }
               #lowriskalert
               {

               }
               #informationalalert
               {
               
               }
            </style>
         </head>
         <body>
            <p>
               <strong>ZAP Scanning Report</strong>
            </p>
            <p>
            </p>
            <p>
               <strong>Summary of Alerts</strong>
            </p>
            <xsl:for-each select="//alerts">
               <xsl:variable name="high-count" select="count(current()//alertitem/riskcode[.='3'])" />
               <xsl:variable name="medium-count" select="count(current()//alertitem/riskcode[.='2'])" />
               <xsl:variable name="low-count" select="count(current()//alertitem/riskcode[.='1'])" />
               <xsl:variable name="informational-count" select="count(current()//alertitem/riskcode[.='0'])" />
               <!--<table width="45%" border="0">-->
               <table class="alertssummarytable">
                  <tr class="alertssummarytableheaderrow">
                     <td width="45%" height="24"><strong><font class="fontwhite">Risk 
                        Level</font></strong>
                     </td>
                     <td width="55%" align="center"><strong><font class="fontwhite">Number 
                        of Alerts</font></strong>
                     </td>
                  </tr>
                  <tr class="greyrow">
                     <td><font class="font1"><a href="#high">High</a></font></td>
                     <td align="center">
                        <font class="font1">
                           <xsl:value-of select="$high-count" />
                        </font>
                     </td>
                  </tr>
                  <tr class="greyrow">
                     <td><font class="font1"><a href="#medium">Medium</a></font></td>
                     <td align="center">
                        <font class="font1">
                           <xsl:value-of select="$medium-count" />
                           <br/>
                        </font>
                     </td>
                  </tr>
                  <tr class="greyrow">
                     <td><font class="font1"><a href="#low">Low</a></font></td>
                     <td align="center">
                        <font class="font1">
                           <xsl:value-of select="$low-count" />
                           <br/>
                        </font>
                     </td>
                  </tr>
                  <tr class="greyrow">
                     <td><font class="font1"><a href="#info">Informational</a></font></td>
                     <td align="center">
                        <font class="font1">
                           <xsl:value-of select="$informational-count" />
                        </font>
                     </td>
                  </tr>
               </table>
            </xsl:for-each>
            <p>
               <strong>Alert Detail</strong>
            </p>
            <xsl:for-each select="//alertitem">
               <xsl:sort select="current()/riskcode" order="descending" data-type="number" />
               <p></p>
               <table class="alertdetailtable">
                  <xsl:variable name="currentriskcode" select="current()/riskcode" />
                  <xsl:choose>
                     <xsl:when test="$currentriskcode = 3">
                        <tr bgcolor="red" height="24">
                           <td width="20%" valign="top">
                              <strong>
                                 <font class="fontwhite">
                                    <a name="high"></a>
                                    <xsl:value-of select="current()/riskdesc" />
                                 </font>
                              </strong>
                           </td>
                           <td width="80%">
                              <strong>
                                 <font class="fontwhite">
                                    <xsl:value-of select="current()/alert" />
                                 </font>
                              </strong>
                           </td>
                        </tr>
                     </xsl:when>
                     <xsl:when test="$currentriskcode = 2">
                        <tr bgcolor="orange" height="24">
                           <td width="20%" valign="top">
                              <strong>
                                 <font class="fontwhite">
                                    <a name="medium"></a>
                                    <xsl:value-of select="current()/riskdesc" />
                                 </font>
                              </strong>
                           </td>
                           <td width="80%">
                              <strong>
                                 <font class="fontwhite">
                                    <xsl:value-of select="current()/alert" />
                                 </font>
                              </strong>
                           </td>
                        </tr>
                     </xsl:when>
                     <xsl:when test="$currentriskcode = 1">
                        <tr bgcolor="yellow" height="24">
                           <a name="low"></a>
                           <td width="20%" valign="top">
                              <strong>
                                 <font class="fontblack">
                                    <xsl:value-of select="current()/riskdesc" />
                                 </font>
                              </strong>
                           </td>
                           <td width="80%">
                              <strong>
                                 <font class="fontblack">
                                    <xsl:value-of select="current()/alert" />
                                 </font>
                              </strong>
                           </td>
                        </tr>
                     </xsl:when>
                     <xsl:when test="$currentriskcode = 0">
                        <tr bgcolor="blue" height="24">
                           <td width="20%" valign="top">
                              <strong>
                                 <font class="fontwhite">
                                    <a name="info"></a>
                                    <xsl:value-of select="current()/riskdesc" />
                                 </font>
                              </strong>
                           </td>
                           <td width="80%">
                              <strong>
                                 <font class="fontwhite">
                                    <xsl:value-of select="current()/alert" />
                                 </font>
                              </strong>
                           </td>
                        </tr>
                     </xsl:when>
                  </xsl:choose>
                  <tr class="greyrow" valign="top">
                     <td width="20%">
                        <font class="font1">
                           <p>Description</p>
                        </font>
                     </td>
                     <td width="80%">
                        <font class="font1">
                           <p align="justify">
                              <xsl:value-of select="current()/desc" />
                           </p>
                        </font>
                     </td>
                  </tr>
                  <TR vAlign="top">
                     <TD colspan="2"></TD>
                  </TR>
                  <tr class="greyrow" valign="top">
                     <td width="20%">
                        <blockquote>
                           <font class="font1">URL</font>
                        </blockquote>
                     </td>
                     <td width="80%">
                        <font class="font1">
                           <xsl:value-of select="current()/uri" />
                        </font>
                     </td>
                  </tr>
                  <tr class="greyrow" valign="top">
                     <td width="20%">
                        <blockquote>
                           <font class="font1">Parameter</font>
                        </blockquote>
                     </td>
                     <td width="80%">
                        <font class="font1">
                           <xsl:value-of select="current()/param" />
                        </font>
                     </td>
                  </tr>
                  <tr class="greyrow" valign="top">
                     <td width="20%">
                        <blockquote>
                           <font class="font1">Attack</font>
                        </blockquote>
                     </td>
                     <td width="80%">
                        <font class="font1">
                           <xsl:value-of select="current()/attack" />
                        </font>
                     </td>
                  </tr>
                  <tr class="greyrow" valign="top">
                     <td width="20%">
                        <blockquote>
                           <font class="font1">Other information</font>
                        </blockquote>
                     </td>
                     <td width="80%">
                        <font class="font1">
                           <xsl:value-of select="current()/otherinfo" />
                        </font>
                     </td>
                  </tr>
                  <TR vAlign="top">
                     <TD colspan="2"></TD>
                  </TR>
                  <tr class="greyrow" valign="top">
                     <td width="20%">
                        <font class="font1">
                           <p>Solution</p>
                        </font>
                     </td>
                     <td width="80%">
                        <font class="font1">
                           <p align="justify">
                              <xsl:value-of select="current()/solution" />
                           </p>
                        </font>
                     </td>
                  </tr>
                  <TR vAlign="top">
                     <TD colspan="2"></TD>
                  </TR>
                  <tr class="greyrow" valign="top">
                     <td width="20%">
                        <font class="font1">
                           <p>Reference</p>
                        </font>
                     </td>
                     <td width="80%">
                        <font class="font1">
                           <xsl:value-of select="current()/reference" />
                        </font>
                     </td>
                  </tr>
                  <tr class="greyrow" valign="top">
                     <td width="20%">
                        <font class="font1">
                           <p>WASC Id</p>
                        </font>
                     </td>
                     <td width="80%">
                        <font class="font1">
                           <xsl:value-of select="current()/wascid" />
                        </font>
                     </td>
                  </tr>
               </table>
               <p></p>
            </xsl:for-each>
            <p></p>
            <p></p>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>