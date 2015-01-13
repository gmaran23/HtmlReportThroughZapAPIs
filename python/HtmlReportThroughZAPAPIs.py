#
# Method:       InsertXSLTSheetIntoXmlReport
#               Inserts a given stylesheet to the xml report obtained from OWASP ZAP APIs
# Parameter:    xmlreportfile
#               Location of the xml report received from OWASP ZAP API    
# Parameter:    xsltfile
#               a stylesheet to apply on the xml report. You may choose to use the ZapReport.xslt sample
# Parameter:    xmlreportfileout
#               location of the modefied xml file to write to. The location of the output xml file should be 
#               same as the location of the xslt file.   
#
# Open the modified xml file in Firefox or IE to see a formatted xml.
# If the formatted xml needs to be sent to a development team, zip the modified xml output, and the xslt together
# and send
#
#
# Author:       http://renouncedthoughts.wordpress.com
#

def InsertXSLTSheetIntoXmlReport(xmlreportfile, xsltfile, xmlreportfileout):
    texttofind = '<?xml version="1.0" encoding="UTF-8"?>'
    texttoreplace = '<?xml version="1.0" encoding="UTF-8"?><?xml-stylesheet type="text/xsl" href="{0}" ?>'.format(xsltfile)
    with open(xmlreportfile, 'r', encoding="utf8") as f:
        xmlreport = f.read()
    xmlreportstyleinserted = xmlreport.replace(texttofind, texttoreplace)
    with open(xmlreportfileout, 'w', encoding="utf8") as f:
        f.write(xmlreportstyleinserted)


InsertXSLTSheetIntoXmlReport('SampleOWASPZAPReport.xml', 'ZapReport.xslt', 'SampleOWASPZAPReport-Mod.xml')
