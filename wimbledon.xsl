<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="tournament">
        <html>
            <head>
        <style type="text/css">
            body { font-weight: normal;}
            table {border: 3px solid black; }
            td, th {border: 3px groove black; width: 100px; background-color: lawngreen}
            th { background-color: green;}
        </style>
            </head>
            <body>


        <table>
            <tr>
               <th>Round</th>
               <th>Name</th>
               <th>set1</th>
               <th>set2</th>
               <th>set3</th>
               <xsl:if test="name = 'Wimbledon Men'">
                  <th>set4</th>
                  <th>set5</th>
               </xsl:if>
            </tr>
        </table>
        <xsl:for-each select="match">
            <xsl:sort select="round" order="ascending"/>
            <table>
               <xsl:for-each select="player">
                  <tr>
                     <td><xsl:value-of select="../round"/></td>
                     <xsl:if test="outcome = 'won'">
                        <td><b><xsl:value-of select="name"/></b></td>
                     </xsl:if>
                     <xsl:if test="outcome = 'lost'">
                        <td><xsl:value-of select="name"/></td>
                     </xsl:if>
                     <xsl:for-each select="set">
                        <td><xsl:value-of select="."/></td>
                     </xsl:for-each>
                  </tr>
                  <tr></tr>
               </xsl:for-each>
            </table>
        </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>