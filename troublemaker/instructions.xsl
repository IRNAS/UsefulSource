<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <head>
	<title><xsl:value-of select="instructions/name"/></title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
  </head>

  <body>
  
  <div id="slide">
        <div id="instructions_title">
	        <h1><xsl:value-of select="instructions/name"/></h1>
	</div>
	<div id="instructions_description">
		<h2><xsl:value-of select="instructions/description"/></h2>
	</div>
	<xsl:variable name="URL" select="instructions/video/url"/>
	<xsl:variable name="img" select="instructions/image"/>
	
	<xsl:if test="video">
	<div id="instructions_video">

		<iframe  height="100%" width="100%" type="text/html"  src="{$URL}"  />
	</div>
	</xsl:if>
	
        <xsl:if test="instructions/image">
           <div id="instructions_video">
                  <img src="{$img}" class="image"/>
           </div>
        </xsl:if>
        
        <div id="parts_title">
	        <h2>DELI</h2>
	</div>

	<div id="instructions_parts">

	  <div class="parts_table">
                  <table>
                  <tr style="background-color:rgba(55,80,105,255)">
                  <th>SKLOP</th>
                  <th>DEL/STORITEV</th>
                  <th>KOLIČINA</th>
                  <th>ENOTA</th>
                  </tr>
                  <xsl:for-each select="instructions/parts">
                  
                  <xsl:variable name="color">
                  <xsl:choose>
                  <xsl:when test="@order=1">
                  rgba(55,80,105,255)
                  </xsl:when>
                  <xsl:when test="@order=2">
                  rgba(73,113,147,1)
                  </xsl:when>
                  <xsl:when test="@order=3">
                  rgba(96,144,184,1)
                  </xsl:when>
                  <xsl:when test="@order=4">
                  rgba(95,156,208,1)
                  </xsl:when>
                  <xsl:when test="@order=5">
                  rgba(130,178,218,1)
                  </xsl:when>
                  <xsl:when test="@order=6">
                  rgba(161,190,214,1)
                  </xsl:when>
                  <xsl:otherwise>
                  rgba(168,191,207,1)
                  </xsl:otherwise>
                  </xsl:choose>
                  </xsl:variable>
                  

                  
                      <xsl:for-each select="part">
                      <tr style="background-color:{$color}">
                      <xsl:if test="@order=1">
                          <td><xsl:value-of select="module"/></td>
                      </xsl:if>
                      <xsl:if test="@order!=1">
                          <td><xsl:value-of select="color"/></td>
                      </xsl:if>
                      <td><xsl:value-of select="name"/></td>
                      <td><xsl:value-of select="quantity"/></td>
                      <td><xsl:value-of select="unit"/></td>
                      </tr>
                     </xsl:for-each>
                     <tr>
                     <th/>
                     <th/>
                     <th/>
                     <th/>
                     </tr>
                  </xsl:for-each>
                  </table>
	</div>
	</div>




</div>

<xsl:for-each select="instructions/steps/step">

  <xsl:variable name="color2">
  <xsl:choose>
  <xsl:when test="@order=1 or @order=6">
  rgba(55,80,105,255)
  </xsl:when>
  <xsl:when test="@order=2 or @order=7">
  rgba(73,113,147,1)
  </xsl:when>
  <xsl:when test="@order=3 or @order=8">
  rgba(96,144,184,1)
  </xsl:when>
  <xsl:when test="@order=4 or @order=9">
  rgba(95,156,208,1)
  </xsl:when>
  <xsl:when test="@order=5">
  rgba(130,178,218,1)
  </xsl:when>
  <xsl:otherwise>
  rgba(168,191,207,1)
  </xsl:otherwise>
  </xsl:choose>
  </xsl:variable>
  
<div class="step">
        <div class="step_title" style="background-color:{$color2}">
	        <h2><xsl:value-of select="name"/></h2>
	</div>
	
	<div class="step_parts">

	  <div class="step_parts_table">
                  <table>
                  <tr style="background-color:{$color2}">
                  <th>SKLOP</th>
                  <th>DEL/STORITEV</th>
                  <th>KOLIČINA</th>
                  <th>ENOTA</th>
                  </tr>
                  <xsl:for-each select="sub_steps/sub_step/step_parts/step_part">
                      <xsl:variable name="parts" select="parts"/>
                      <xsl:variable name="part" select="part"/>
                      <xsl:variable name="quantity" select="quantity"/>
                      
                       <xsl:for-each select="/instructions/parts[@order=$parts]">
                      <xsl:for-each select="part[@order=$part]">
                      <tr style="background-color:{$color2}">
                      <td><xsl:value-of select="module"/></td>
                      <td><xsl:value-of select="name"/></td>
                      <td><xsl:value-of select="quantity"/></td>
                      <td><xsl:value-of select="unit"/></td>
                      </tr>
                      </xsl:for-each>
                     </xsl:for-each>
                  </xsl:for-each>
                  </table>
	</div>
	</div>
	<xsl:for-each select="sub_steps/sub_step">
	<div class="sub_step_image">
            <xsl:variable name="img" select="image"/>
            <xsl:if test="image">
                          <img src="{$img}" class="image"/>
            </xsl:if>
	</div>
	<div class="sub_step_description" style="background-color:{$color2}">
          <div class="sub_step_description_text" style="background-color:{$color2}">
                <p><xsl:value-of select="description"/></p>
          </div>

          <div class="sub_step_description_parts" style="background-color:{$color2}">
             <table class="sub_step_table" style="color:{$color2}">
                  <tr class="ss1" style="background-color:white; border-color:{$color2}">
                  <th class="ss1" style="border-color:{$color2}">SKLOP</th>
                  <th class="ss1" style="border-color:{$color2}">DEL/STORITEV</th>
                  <th class="ss1" style="border-color:{$color2}">KOLIČINA</th>
                  <th class="ss1" style="border-color:{$color2}">ENOTA</th>
                  </tr>
                  
                  <xsl:for-each select="step_parts/step_part">
                      <xsl:variable name="parts" select="parts"/>
                      <xsl:variable name="part" select="part"/>
                      <xsl:variable name="quantity" select="quantity"/>

                       <xsl:for-each select="/instructions/parts[@order=$parts]">
                      <xsl:for-each select="part[@order=$part]">
                      <tr class="ss" style="background-color:white; border-color:{$color2}">
                      <td class="ss" style="border-color:{$color2}"><xsl:value-of select="module"/></td>
                      <td class="ss" style="border-color:{$color2}"><xsl:value-of select="name"/></td>
                      <td class="ss" style="border-color:{$color2}"><xsl:value-of select="quantity"/></td>
                      <td class="ss" style="border-color:{$color2}"><xsl:value-of select="unit"/></td>
                      </tr>
                      </xsl:for-each>
                     </xsl:for-each>
                  </xsl:for-each>
             </table>
          </div>
	</div>
	</xsl:for-each>
	
</div>
</xsl:for-each>
  
  </body>
  </html>
</xsl:template>





</xsl:stylesheet>








