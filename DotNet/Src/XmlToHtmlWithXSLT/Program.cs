/*
 * Usage        |   XmlToHtmlWithXSLT.exe xmlfilepath xsltfilepath htmloutputpath
 * 
 * XmlToHtmlWithXSLT.exe transforms an xmlfile using an xslt to a htmlfile
 * 
 * Author       |   http://renouncedthoughts.wordpress.com
 */
using System;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Xsl;

namespace XmlToHtmlWithXSLT
{
    class Program
    {
        static void Main(string[] args)
        {
            string inputXmlFileName = args[0];
            string xsltfile = args[1];
            string outputHtmlFileName = args[2];

            XslCompiledTransform transform = LoadXsltTransform(xsltfile);

            StringWriter transformedToHtml = ApplyXsltTransform(inputXmlFileName, transform);

            WriteHtmlToFile(outputHtmlFileName, transformedToHtml);

            PrintStatus(outputHtmlFileName);
        }


        private static XslCompiledTransform LoadXsltTransform(string xsltfile)
        {
            XslCompiledTransform transform = new XslCompiledTransform();
            using (XmlReader reader = XmlReader.Create(xsltfile, new XmlReaderSettings() { DtdProcessing = DtdProcessing.Ignore }))
            {
                transform.Load(reader);
            }
            return transform;
        }

        private static StringWriter ApplyXsltTransform(string inputXmlFileName, XslCompiledTransform transform)
        {
            StringWriter transformedToHtml = new StringWriter();
            using (XmlReader reader = XmlReader.Create(inputXmlFileName, new XmlReaderSettings() { DtdProcessing = DtdProcessing.Ignore }))
            {
                transform.Transform(reader, null, transformedToHtml);
            }
            return transformedToHtml;
        }

        private static void WriteHtmlToFile(string outputHtmlFileName, StringWriter transformedToHtml)
        {
            using (StreamWriter outputFileStream = new StreamWriter(new FileStream(outputHtmlFileName, FileMode.Create)))
            {
                outputFileStream.Write(transformedToHtml.ToString());
            }
        }

        private static void PrintStatus(string outputHtmlFileName)
        {
            Console.WriteLine("Output Written to {0}", outputHtmlFileName);
        }
    }
}
