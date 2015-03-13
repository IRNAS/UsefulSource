<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <head>
	<title><xsl:value-of select="project/unit_description/name"/></title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
  </head>
  
  
  <body>
  
  
  <div id="slide">
	<div id="project_title">
	        <h1><xsl:value-of select="project/unit_description/name"/></h1>
	</div>
	<div id="column_project_l">
		<xsl:variable name="URL" select="project/unit_description/video/url"/>
		<iframe  height="100%" width="100%" type="text/html"  src="{$URL}"  />
	</div>
	<div id="column_project_r">
		<p class="para1"><xsl:value-of select="project/unit_description/description"/></p>
	</div>
	<div id="column_project_b1">
		<h2>What?</h2>
		<p class="para2"><xsl:value-of select="project/unit_description/what"/></p>
	</div>
	<div id="column_project_b2">
		<h2>Why?</h2>
		<p class="para2"><xsl:value-of select="project/unit_description/why"/></p>
	</div>
	<div id="column_project_b3">
		<h2>How?</h2>
		<p class="para2"><xsl:value-of select="project/unit_description/how"/></p>
	</div>
  </div>
  
  <div id="slide">
	<div id="system_title">
	        <h1>SYSTEM DIAGRAM</h1>
	</div>
	<div id="system_img">
	        <img src="system.png" class="system" alt=""/>
	</div>
	<xsl:for-each select="project/modules/module">
                <div>
                     <xsl:for-each select="unit_description">
   
                             <xsl:variable name="bcolor">
                                  <xsl:choose>
                                        <xsl:when test="color">
                                                <xsl:value-of select="color"/>
                                        </xsl:when>
                                  </xsl:choose>
                             </xsl:variable>
     
                             <div class="system_modules" style="color:{$bcolor}">
                                <h3><xsl:value-of select="name"/></h3>
                                <p><xsl:value-of select="description"/></p>
                             </div>

                    </xsl:for-each>
                </div>
        </xsl:for-each>
        </div>


  <xsl:for-each select="project/modules/module">
  <div id="slide">
		<xsl:for-each select="unit_description">
		
                          <xsl:variable name="bcolor">
                             <xsl:choose>
                                <xsl:when test="color">
                                    <xsl:value-of select="color"/>
                                 </xsl:when>
                             </xsl:choose>
                          </xsl:variable>

			<div class="module_title" style="background-color:{$bcolor}">
				<h1><xsl:value-of select="name"/></h1>
			</div>
			<div class="column_module_l">

                                 <xsl:variable name="img" select="image/file"/>
                        <xsl:variable name="url" select="video/url"/>
                        <xsl:if test="video">
                          <iframe  height="100%" width="100%" type="text/html"  src="{$URL}"  />
                        </xsl:if>
                        <xsl:if test="image">
                          <img src="{$img}" class="image"/>
                        </xsl:if>
			</div>
			<div class="column_module_r" style="background-color:{$bcolor}">
				<p><xsl:value-of select="long_description"/></p>

			</div>
		</xsl:for-each>
		
		<div class="module_container">
		<xsl:for-each select="sub_modules/sub_module">
                  <xsl:for-each select="unit_description">
                     <xsl:variable name="mcolor">
                             <xsl:choose>
                                <xsl:when test="color">
                                    <xsl:value-of select="color"/>
                                 </xsl:when>
                             </xsl:choose>
                     </xsl:variable>
                   

			<div class="submodule" style="background-color:{$mcolor}">
				<h3><xsl:value-of select="name"/></h3>
				<p><xsl:value-of select="description"/></p>
			</div>
			</xsl:for-each>
		</xsl:for-each>
                </div>
	 </div>

         <xsl:for-each select="sub_modules/sub_module">
         <div id="slide">
         
                <xsl:for-each select="unit_description">
                     <xsl:variable name="mcolor">
                             <xsl:choose>
                                <xsl:when test="color">
                                    <xsl:value-of select="color"/>
                                 </xsl:when>
                             </xsl:choose>
                          </xsl:variable>

			<div class="submodule_title" style="background-color:{$mcolor}">
				<h2><xsl:value-of select="name"/></h2>
			</div>
                        <div class="column_submodule_l">
                        
                        <xsl:variable name="img" select="image/file"/>
                        <xsl:variable name="url" select="video/url"/>
                        <xsl:if test="video">
                          <iframe  height="100%" width="100%" type="text/html"  src="{$URL}"  />
                        </xsl:if>
                        <xsl:if test="image">
                          <img src="{$img}" class="image"/>
                        </xsl:if>

			</div>
			<div class="column_submodule_r" style="background-color:{$mcolor}">
				<p><xsl:value-of select="description"/></p>

			</div>

                </xsl:for-each>

        <xsl:if test="logic_parts">
        <div class="table_parts">

        <table>
          <tr>
          <th>NAME</th>
          <th>DESCRIPTION</th>
          <th>QUANTITY</th>
          <th>OPTIONS</th>
          <th>ID</th>
          </tr>
          <xsl:for-each select="logic_parts/logic_part">
          <tr>
          <td><xsl:value-of select="part_name"/></td>
          <td><xsl:value-of select="description"/></td>
          <td><xsl:value-of select="quantity"/></td>
          <td>
            <xsl:for-each select="options/option">
              <xsl:value-of select="part_name"/>
              <p>
</p>
            </xsl:for-each>
          </td>
          <td><xsl:value-of select="shematic_id"/></td>

          </tr>
          </xsl:for-each>
          </table>
          </div>
          </xsl:if>
     </div>
     
    </xsl:for-each>

  </xsl:for-each>
  
  <div id="slide">
        <div id="system_title">
	        <h1>PHYISICAL PARTS</h1>
	</div>
        <div class="physical_parts_table">
                  <table>
                  <tr>
                  <th>NAME</th>
                  <th>DESCRIPTION</th>
                  <th>PRICE</th>
                  <th>URL</th>
                  <th>IMAGE</th>
                  </tr>
                  
                  <xsl:for-each select="project/physic_parts/physic_part">
                  <tr>
                  <td><xsl:value-of select="part_name"/></td>
                  <td><xsl:value-of select="description"/></td>
                  <td><xsl:value-of select="price"/></td>
                  <td>
                    blabla
                  </td>
                  <td>bla</td>

                  </tr>
                  </xsl:for-each>
                  </table>
	</div>
	

  </div>
  </body>
  </html>
</xsl:template>



</xsl:stylesheet>






