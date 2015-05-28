<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  
  <head>
	<title><xsl:value-of select="project/unit/name"/></title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
  </head>
  
  <body>
  <div id="slide">
   <div id="project_title">
	<div id="project_title">
	        <h1><xsl:value-of select="project/unit/name"/></h1>
	</div>
    </div>
    <div id="column_project_top">
	     <div id="column_project_l">
		<xsl:variable name="URL" select="project/unit/video/url"/>
		<iframe  height="100%" width="100%" type="text/html"  src="{$URL}"  />
	     </div>
	     <div id="column_project_r">
		<p class="para1"><xsl:value-of select="project/unit/description/abstract"/></p>
	     </div>
    </div>
    <div id="column_project_bot">
	     <div id="column_project_b1">
		<h2>What?</h2>
		<p class="para2"><xsl:value-of select="project/unit/description/what"/></p>
	     </div>
	     <div id="column_project_b2">
		<h2>Why?</h2>
		<p class="para2"><xsl:value-of select="project/unit/description/why"/></p>
	     </div>
	     <div id="column_project_b3">
		<h2>How?</h2>
		<p class="para2"><xsl:value-of select="project/unit/description/how"/></p>
             </div>
    </div>
   </div>
   
   <div id="slide">
             <div id="parts_title">
	        <h2>COMPLETE BILL OF MATERIALS</h2>
             </div>

	<div id="instructions_parts">

	  <div class="table_parts">
                  <table>
                  <tr style="background-color: rgba(41,60,78,1)">
                  <th>MODULE</th>
                  <th>SUB-MODULE</th>
                  <th>PART - DESCRIPTION</th>
                  <th>QUANTITY</th>
                  <th>DESIGNATOR</th>
                  <th>FILES</th>
                  <th>OPTIONS</th>
                  </tr>
                      <xsl:for-each select="project/unit/logic_parts/logic_part">
                      <tr style="background-color:rgba(41,60,78,1)">
                      <td/>
                      <td/>
                      <td><xsl:value-of select="name"/> - <xsl:value-of select="description"/></td>
                      <td><xsl:value-of select="quantity"/></td>
                      <td><xsl:value-of select="designator"/></td>
                      <td>
                       <xsl:for-each select="digital_part">
                        <xsl:for-each select="file">
                              <a href="{url}" target="_blank">File</a>
                        </xsl:for-each>
                       </xsl:for-each>
                      </td>
                      <td>
                       <xsl:for-each select="physical_part_tags">
                              <xsl:value-of select="part_tag"/>
                        </xsl:for-each>
                      </td>

                      </tr>
                     </xsl:for-each>
                     <tr>
                     <th/>
                     <th/>
                     <th/>
                     <th/>
                     </tr>
                  <xsl:for-each select="project/unit/children/unit">

                  <xsl:variable name="color">
                  <xsl:choose>
                  <xsl:when test="@order=1">
                  rgba(55,80,105,1)
                  </xsl:when>
                  <xsl:when test="@order=2">
                  rgba(53,94,129,1)
                  </xsl:when>
                  </xsl:choose>
                  </xsl:variable>




                      <xsl:for-each select="logic_parts/logic_part">
                      <tr style="background-color:{$color}">
                      <td><xsl:value-of select="../../name"/></td>
                      <td/>
                      <td><xsl:value-of select="name"/> - <xsl:value-of select="description"/></td>
                      <td><xsl:value-of select="quantity"/></td>
                      <td><xsl:value-of select="designator"/></td>
                      <td>
                       <xsl:for-each select="digital_part">
                        <xsl:for-each select="file">
                              <a href="{url}" target="_blank">File</a>
                        </xsl:for-each>
                       </xsl:for-each>
                      </td>
                      <td>
                       <xsl:for-each select="physical_part_tags">
                              <xsl:value-of select="part_tag"/>
                        </xsl:for-each>
                      </td>
                      </tr>
                     </xsl:for-each>
                     <xsl:for-each select="children/unit/logic_parts/logic_part">
                      <tr style="background-color:{$color}">
                      <td><xsl:value-of select="../../../../name"/></td>
                      <td><xsl:value-of select="../../name"/></td>
                      <td><xsl:value-of select="name"/> - <xsl:value-of select="description"/></td>
                      <td><xsl:value-of select="quantity"/></td>
                      <td><xsl:value-of select="designator"/></td>
                      <td>
                       <xsl:for-each select="digital_part">
                        <xsl:for-each select="file">
                              <a href="{url}" target="_blank">File</a>
                        </xsl:for-each>
                       </xsl:for-each>
                      </td>
                      <td>
                       <xsl:for-each select="physical_part_tags">
                              <xsl:value-of select="part_tag"/>
                        </xsl:for-each>
                      </td>
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
   
   <div id="slide">
             <div id="instruction_title">
	        <h2>ASSEMBLY INSTRUCTION - SYSTEM</h2>
             </div>
             
             <xsl:for-each select="project/unit/assembly_instruction/step">
        	<div class="step_image_box">

                    <xsl:if test="image">
                    <xsl:variable name="img" select="image"/>
                                  <img src="{$img}" class="image"/>
                    </xsl:if>

        	</div>
         <div class="step_description" style="background-color:rgba(53,94,129,1)">
                  <div class="step_description_text" style="background-color:rgba(53,94,129,1)">
                        <p><xsl:value-of select="description"/></p>
                  </div>
                  <div class="step_description_parts" style="background-color:rgba(53,94,129,1)">
                     <table class="step_table" style="color:rgba(53,94,129,1)">
                          <tr class="ss1" style="background-color:white; border-color:rgba(53,94,129,1)">

                          <th class="ss1" style="border-color:rgba(53,94,129,1)">PART</th>
                          <th class="ss1" style="border-color:rgba(53,94,129,1)">DESCRIPTION</th>
                          <th class="ss1" style="border-color:rgba(53,94,129,1)">QUANTITY</th>
                          </tr>
                     </table>
                  </div>

                </div>
        	</xsl:for-each>
   </div>
   
   <div id="slide">
             <div id="instruction_title">
	        <h2>TEST INSTRUCTION - SYSTEM</h2>
             </div>
             
             <xsl:for-each select="project/unit/test_instruction/step">
        	<div class="step_image_box">
                   <xsl:if test="image">
                    <xsl:variable name="img" select="image"/>
                                  <img src="{$img}" class="image"/>
                    </xsl:if>
        	</div>
         <div class="step_description" style="background-color:rgba(53,94,129,1)">
                  <div class="step_description_text" style="background-color:rgba(53,94,129,1)">
                        <p><xsl:value-of select="description"/></p>
                  </div>
                  <div class="step_description_parts" style="background-color:rgba(53,94,129,1)">
                     <table class="step_table" style="color:rgba(53,94,129,1)">
                          <tr class="ss1" style="background-color:white; border-color:rgba(53,94,129,1)">

                          <th class="ss1" style="border-color:rgba(53,94,129,1)">PART</th>
                          <th class="ss1" style="border-color:rgba(53,94,129,1)">DESCRIPTION</th>
                          <th class="ss1" style="border-color:rgba(53,94,129,1)">QUANTITY</th>
                          </tr>
                     </table>
                  </div>

                </div>
        	</xsl:for-each>
   </div>
   
   <div id="slide">
             <div id="instruction_title">
	        <h2>USER MANUAL - SYSTEM</h2>
             </div>
             
             <xsl:for-each select="project/unit/user_manual/step">
        	<div class="step_image_box">
                   <xsl:if test="image">
                    <xsl:variable name="img" select="image"/>
                                  <img src="{$img}" class="image"/>
                    </xsl:if>
        	</div>
         <div class="step_description" style="background-color:rgba(53,94,129,1)">
                  <div class="step_description_text" style="background-color:rgba(53,94,129,1)">
                        <p><xsl:value-of select="description"/></p>
                  </div>
                  <div class="step_description_parts" style="background-color:rgba(53,94,129,1)">
                     <table class="step_table" style="color:rgba(53,94,129,1)">
                          <tr class="ss1" style="background-color:white; border-color:rgba(53,94,129,1)">

                          <th class="ss1" style="border-color:rgba(53,94,129,1)">PART</th>
                          <th class="ss1" style="border-color:rgba(53,94,129,1)">DESCRIPTION</th>
                          <th class="ss1" style="border-color:rgba(53,94,129,1)">QUANTITY</th>
                          </tr>
                     </table>
                  </div>

                </div>
        	</xsl:for-each>
   </div>
   
   <div id="slide">
             <div id="instruction_title">
	        <h2>LICENSING - SYSTEM</h2>
             </div>
   </div>
   
   <div id="slide">
             <div id="instruction_title">
	        <h2>SAFETY - SYSTEM </h2>
             </div>
   </div>
   
   
     <xsl:for-each select="project/unit/children/unit">

        <xsl:variable name="bcolor">
          <xsl:choose>
          <xsl:when test="@order=1">
                  rgba(41,60,78,1)
                  </xsl:when>
                  <xsl:when test="@order=2">
                  rgba(55,80,105,1)
                  </xsl:when>
                  <xsl:when test="@order=3">
                  rgba(53,94,129,1)
                  </xsl:when>
                  <xsl:when test="@order=4">
                  rgba(53,111,162,1)
                  </xsl:when>
                  <xsl:when test="@order=5">
                  rgba(75,138,191,1)
                  </xsl:when>
                  <xsl:when test="@order=6">
                  rgba(95,156,208,1)
                  </xsl:when>
                  <xsl:otherwise>
                  rgba(119,179,229,1)
                  </xsl:otherwise>
          </xsl:choose>
          </xsl:variable>

          <xsl:variable name="ccolor">
          <xsl:choose>
          <xsl:when test="@order=5">
                  rgba(41,60,78,1)
                  </xsl:when>
                  <xsl:when test="@order=4">
                  rgba(55,80,105,1)
                  </xsl:when>
                  <xsl:when test="@order=5">
                  rgba(53,94,129,1)
                  </xsl:when>
                  <xsl:when test="@order=1">
                  rgba(53,111,162,1)
                  </xsl:when>
                  <xsl:when test="@order=2">
                  rgba(75,138,191,1)
                  </xsl:when>
                  <xsl:when test="@order=6">
                  rgba(95,156,208,1)
                  </xsl:when>
                  <xsl:otherwise>
                  rgba(119,179,229,1)
                  </xsl:otherwise>
          </xsl:choose>
          </xsl:variable>

      <div id="slide">


			<div class="module_title" style="background-color:{$bcolor}">
				<h1><xsl:value-of select="@order"/>. <xsl:value-of select="name"/></h1>
			</div>
			<div class="column_module_l">
                          <xsl:variable name="URL" select="video/url"/>
		          <iframe  height="100%" width="100%" type="text/html"  src="{$URL}"  />

			</div>
			<div class="column_module_r" style="background-color:{$bcolor}">
				<p><xsl:value-of select="description/long_description"/></p>

			</div>
			<div id="column_project_bot">
                	     <div id="column_project_b1">
                		<h2>What?</h2>
                		<p class="para2"><xsl:value-of select="description/what"/></p>
                	     </div>
                	     <div id="column_project_b2">
                		<h2>Why?</h2>
                		<p class="para2"><xsl:value-of select="description/why"/></p>
                	     </div>
                	     <div id="column_project_b3">
                		<h2>How?</h2>
                		<p class="para2"><xsl:value-of select="description/how"/></p>
                             </div>
                    </div>
             <div class="module_container">
             <xsl:for-each select="children/unit">

			<div class="submodule" style="background-color:{$ccolor}">
				<h3><xsl:value-of select="../../@order"/>.<xsl:value-of select="@order"/> <xsl:value-of select="name"/></h3>
				<p><xsl:value-of select="description/abstract"/></p>
			</div>
             </xsl:for-each>
             </div>

	 </div>
	 
	 <div id="slide">
	 <div id="parts_title1" style="background-color:{$bcolor}">
	        <h2>BILL OF MATERIALS - <xsl:value-of select="name"/></h2>
             </div>
         <div class="module_parts">

         <div class="module_parts_table">
                  <table>
                  <tr style="background-color: {$bcolor}">
                  <th>MODULE</th>
                  <th>SUB-MODULE</th>
                  <th>PART - DESCRIPTION</th>
                  <th>QUANTITY</th>
                  <th>DESIGNATOR</th>
                  <th>FILES</th>
                  <th>OPTIONS</th>
                  </tr>
                  <xsl:for-each select="logic_parts/logic_part">
                      <tr style="background-color:{$bcolor}">
                      <td/>
                      <td/>
                      <td><xsl:value-of select="name"/> - <xsl:value-of select="description"/></td>
                      <td><xsl:value-of select="quantity"/></td>
                      <td><xsl:value-of select="designator"/></td>
                      <td>
                       <xsl:for-each select="digital_part">
                        <xsl:for-each select="file">
                              <a href="{url}" target="_blank">File</a>
                        </xsl:for-each>
                       </xsl:for-each>
                      </td>
                      <td>
                       <xsl:for-each select="physical_part_tags">
                              <xsl:value-of select="part_tag"/>
                        </xsl:for-each>
                      </td>

                      </tr>
                     </xsl:for-each>
                  </table>
          </div>



        </div>

         </div>
         
            <div id="slide">
             <div id="instruction_title" style="background-color:{$bcolor}">
	        <h2>ASSEMBLY INSTRUCTION - <xsl:value-of select="name"/></h2>
             </div>

             <xsl:for-each select="assembly_instruction/step">
        	<div class="step_image_box">

                    <xsl:if test="image">
                    <xsl:variable name="img" select="image"/>
                                  <img src="{$img}" class="image"/>
                    </xsl:if>

        	</div>
         <div class="step_description" style="background-color:{$ccolor}">
                  <div class="step_description_text" style="background-color:{$ccolor}">
                        <p><xsl:value-of select="description"/></p>
                  </div>
                  <div class="step_description_parts" style="background-color:{$ccolor}">
                     <table class="step_table" style="color:{$ccolor}">
                          <tr class="ss1" style="background-color:white; border-color:{$ccolor}">

                          <th class="ss1" style="border-color:{$ccolor}">PART</th>
                          <th class="ss1" style="border-color:{$ccolor}">DESCRIPTION</th>
                          <th class="ss1" style="border-color:{$ccolor}">QUANTITY</th>
                          </tr>
                     </table>
                  </div>

                </div>
        	</xsl:for-each>
   </div>

   <div id="slide">
             <div id="parts_title1" style="background-color:{$bcolor}">
	        <h2>TEST INSTRUCTION - <xsl:value-of select="name"/></h2>
             </div>

             <xsl:for-each select="test_instruction/step">
        	<div class="step_image_box">
                   <xsl:if test="image">
                    <xsl:variable name="img" select="image"/>
                                  <img src="{$img}" class="image"/>
                    </xsl:if>
        	</div>
          <div class="step_description" style="background-color:{$ccolor}">
                  <div class="step_description_text" style="background-color:{$ccolor}">
                        <p><xsl:value-of select="description"/></p>
                  </div>
                  <div class="step_description_parts" style="background-color:{$ccolor}">
                     <table class="step_table" style="color:{$ccolor}">
                          <tr class="ss1" style="background-color:white; border-color:{$ccolor}">

                          <th class="ss1" style="border-color:{$ccolor}">PART</th>
                          <th class="ss1" style="border-color:{$ccolor}">DESCRIPTION</th>
                          <th class="ss1" style="border-color:{$ccolor}">QUANTITY</th>
                          </tr>
                     </table>
                  </div>

                </div>
        	</xsl:for-each>
   </div>

   <div id="slide">
             <div id="parts_title1" style="background-color:{$bcolor}">
	        <h2>USER MANUAL - <xsl:value-of select="name"/></h2>
             </div>

             <xsl:for-each select="user_manual/step">
        	<div class="step_image_box">
                   <xsl:if test="image">
                    <xsl:variable name="img" select="image"/>
                                  <img src="{$img}" class="image"/>
                    </xsl:if>
        	</div>
          <div class="step_description" style="background-color:{$ccolor}">
                  <div class="step_description_text" style="background-color:{$ccolor}">
                        <p><xsl:value-of select="description"/></p>
                  </div>
                  <div class="step_description_parts" style="background-color:{$ccolor}">
                     <table class="step_table" style="color:{$ccolor}">
                          <tr class="ss1" style="background-color:white; border-color:{$ccolor}">

                          <th class="ss1" style="border-color:{$ccolor}">PART</th>
                          <th class="ss1" style="border-color:{$ccolor}">DESCRIPTION</th>
                          <th class="ss1" style="border-color:{$ccolor}">QUANTITY</th>
                          </tr>
                     </table>
                  </div>

                </div>
        	</xsl:for-each>
   </div>

   <div id="slide">
             <div id="parts_title1" style="background-color:{$bcolor}">
	        <h2>LICENSING - SYSTEM</h2>
             </div>
   </div>

   <div id="slide">
             <div id="parts_title1" style="background-color:{$bcolor}">
	        <h2>SAFETY - SYSTEM </h2>
             </div>
   </div>
   
   <div id="slide">

                <xsl:for-each select="children/unit">

			<div class="submodule_title" style="background-color:{$bcolor}">
				<h2><xsl:value-of select="../../@order"/>.<xsl:value-of select="@order"/><xsl:value-of select="name"/></h2>
			</div>
                        <div class="column_submodule_l">
                        <xsl:variable name="URL" select="video/url"/>
		        <iframe  height="100%" width="100%" type="text/html"  src="{$URL}"  />
			</div>
			<div class="column_submodule_r" style="background-color:{$bcolor}">
				<p><xsl:value-of select="description/abstract"/></p>

			</div>
			
			<div id="column_project_bot">
                	     <div id="column_project_b1">
                		<h2>What?</h2>
                		<p class="para2"><xsl:value-of select="description/what"/></p>
                	     </div>
                	     <div id="column_project_b2">
                		<h2>Why?</h2>
                		<p class="para2"><xsl:value-of select="description/why"/></p>
                	     </div>
                	     <div id="column_project_b3">
                		<h2>How?</h2>
                		<p class="para2"><xsl:value-of select="description/how"/></p>
                             </div>
                    </div>

                    <div id="parts_title1" style="background-color:{$bcolor}">
	            <h2>BILL OF MATERIALS - <xsl:value-of select="name"/></h2>
                    </div>
         <div class="module_parts">

         <div class="module_parts_table">
                  <table>
                  <tr style="background-color: {$bcolor}">
                  <th>MODULE</th>
                  <th>SUB-MODULE</th>
                  <th>PART - DESCRIPTION</th>
                  <th>QUANTITY</th>
                  <th>DESIGNATOR</th>
                  <th>FILES</th>
                  <th>OPTIONS</th>
                  </tr>
                  <xsl:for-each select="logic_parts/logic_part">
                      <tr style="background-color:{$bcolor}">
                      <td/>
                      <td/>
                      <td><xsl:value-of select="name"/> - <xsl:value-of select="description"/></td>
                      <td><xsl:value-of select="quantity"/></td>
                      <td><xsl:value-of select="designator"/></td>
                      <td>
                       <xsl:for-each select="digital_part">
                        <xsl:for-each select="file">
                              <a href="{url}" target="_blank">File</a>
                        </xsl:for-each>
                       </xsl:for-each>
                      </td>
                      <td>
                       <xsl:for-each select="physical_part_tags">
                              <xsl:value-of select="part_tag"/>
                        </xsl:for-each>
                      </td>

                      </tr>
                     </xsl:for-each>
                  </table>
          </div>



        </div>
        

             <div id="instruction_title" style="background-color:{$bcolor}">
	        <h2>ASSEMBLY INSTRUCTION - <xsl:value-of select="name"/></h2>
             </div>

             <xsl:for-each select="assembly_instruction/step">
        	<div class="step_image_box">

                    <xsl:if test="image">
                    <xsl:variable name="img" select="image"/>
                                  <img src="{$img}" class="image"/>
                    </xsl:if>

        	</div>
         <div class="step_description" style="background-color:{$ccolor}">
                  <div class="step_description_text" style="background-color:{$ccolor}">
                        <p><xsl:value-of select="description"/></p>
                  </div>
                  <div class="step_description_parts" style="background-color:{$ccolor}">
                     <table class="step_table" style="color:{$ccolor}">
                          <tr class="ss1" style="background-color:white; border-color:{$ccolor}">

                          <th class="ss1" style="border-color:{$ccolor}">PART</th>
                          <th class="ss1" style="border-color:{$ccolor}">DESCRIPTION</th>
                          <th class="ss1" style="border-color:{$ccolor}">QUANTITY</th>
                          </tr>
                     </table>
                  </div>

                </div>
        	</xsl:for-each>



             <div id="parts_title1" style="background-color:{$bcolor}">
	        <h2>TEST INSTRUCTION - <xsl:value-of select="name"/></h2>
             </div>

             <xsl:for-each select="test_instruction/step">
        	<div class="step_image_box">
                   <xsl:if test="image">
                    <xsl:variable name="img" select="image"/>
                                  <img src="{$img}" class="image"/>
                    </xsl:if>
        	</div>
          <div class="step_description" style="background-color:{$ccolor}">
                  <div class="step_description_text" style="background-color:{$ccolor}">
                        <p><xsl:value-of select="description"/></p>
                  </div>
                  <div class="step_description_parts" style="background-color:{$ccolor}">
                     <table class="step_table" style="color:{$ccolor}">
                          <tr class="ss1" style="background-color:white; border-color:{$ccolor}">

                          <th class="ss1" style="border-color:{$ccolor}">PART</th>
                          <th class="ss1" style="border-color:{$ccolor}">DESCRIPTION</th>
                          <th class="ss1" style="border-color:{$ccolor}">QUANTITY</th>
                          </tr>
                     </table>
                  </div>

                </div>
        	</xsl:for-each>


             <div id="parts_title1" style="background-color:{$bcolor}">
	        <h2>USER MANUAL - <xsl:value-of select="name"/></h2>
             </div>

             <xsl:for-each select="user_manual/step">
        	<div class="step_image_box">
                   <xsl:if test="image">
                    <xsl:variable name="img" select="image"/>
                                  <img src="{$img}" class="image"/>
                    </xsl:if>
        	</div>
          <div class="step_description" style="background-color:{$ccolor}">
                  <div class="step_description_text" style="background-color:{$ccolor}">
                        <p><xsl:value-of select="description"/></p>
                  </div>
                  <div class="step_description_parts" style="background-color:{$ccolor}">
                     <table class="step_table" style="color:{$ccolor}">
                          <tr class="ss1" style="background-color:white; border-color:{$ccolor}">

                          <th class="ss1" style="border-color:{$ccolor}">PART</th>
                          <th class="ss1" style="border-color:{$ccolor}">DESCRIPTION</th>
                          <th class="ss1" style="border-color:{$ccolor}">QUANTITY</th>
                          </tr>
                     </table>
                  </div>

                </div>
        	</xsl:for-each>



             <div id="parts_title1" style="background-color:{$bcolor}">
	        <h2>LICENSING - SYSTEM</h2>
             </div>



             <div id="parts_title1" style="background-color:{$bcolor}">
	        <h2>SAFETY - SYSTEM </h2>
             </div>


                </xsl:for-each>
       </div>
    </xsl:for-each>

   </body>
  </html>
</xsl:template>
</xsl:stylesheet>






