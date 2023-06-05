<?xml version="1.0" encoding="utf-8"?>
			<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
			<xsl:template match="/">
			<html>
			<head>
			<title></title>
			<script language="JavaScript">
			
			    var preClickRow = null;
			    function rowClick(oRow, force) 
			    {
			         try{
			             if (!force &amp;&amp; preClickRow == oRow)
			                return;
			             changeBgColor(oRow);
			             var parseFrame = parent.frames[1];
			             parseFrame.location.href = "detail" + oRow.getAttribute("id") + ".txt";
			         }
			         catch(e){
			         }
			    }

			    var preClickRow = null;
			    function changeBgColor(oRow)
			    {
			        if (null != preClickRow)
			             preClickRow.bgColor = "#FFFFFF";
			             
			        if (null != oRow)
			             oRow.bgColor = "#CFDFDF";
			        
			        preClickRow = oRow;
			    }
			    
			    function showCode() 
			    {
			         try{
			            var parseFrame = parent.frames[1];
			            parseFrame.location.href = "code" + preClickRow.getAttribute("id") + ".txt";
			         }
			         catch (e){
			         }
			    }
				
				function filter_data() {
					var input = document.getElementById("filter_input");					
					var table = document.getElementById("data_table");
					for(var i=1;i&lt;table.rows.length;++i) {
						var row_matched = false;
					    for(var j=0;j&lt;table.rows[i].cells.length;++j) {
							if(table.rows[i].cells[j].innerText.indexOf(input.value)&gt;=0){
								row_matched = true;
								break;
							}
						}
						table.rows[i].style.display=row_matched?"":"none";
					}
				}
				
				function clear_filter() {				
					var table = document.getElementById("data_table");
					for(var i=1;i&lt;table.rows.length;++i) {
						table.rows[i].style.display="";
					}
				}				
			</script>
			</head>
			
			<body>
			<div id="DataLayer" name="DataLayer"><xsl:apply-templates select="DATAS"/></div> 
			<div id="PageLayer" name="PageLayer" align="right"/>
			</body>
			</html>
			</xsl:template>
			
			<xsl:template match="DATAS">
			<p align="center">				
				<span><xsl:value-of select="@description"/>
					<input style="margin-left:5px;" id="filter_input" type="text" />
					<a style="color:#9acd32;text-decoration:none;margin-right:5px;margin-left:5px;" href="javascript:filter_data()">????</a>
					<a style="color:#9acd32;text-decoration:none" href="javascript:clear_filter()">????</a>
				</span>
			</p> 
			<table id="data_table" border="1" align="center" cellpadding="1"  bordercolordark="#ffffff" bordercolorlight="rgb(52,97,139)">
			<tr bgcolor="#9acd32" align="center">
			<td/>
			<!--????,????-->
			<td nowrap="nowrap" width="60">No.</td>
<td nowrap="nowrap" width="160">Time</td>
<td nowrap="nowrap" width="90">Protocol Type</td>
<td nowrap="nowrap" width="80">Direction</td>
<td nowrap="nowrap" width="180">Event</td>
<td nowrap="nowrap" width="70">Sub Event</td>
<td nowrap="nowrap" width="110">IMSI</td>
<td nowrap="nowrap" width="110">MSISDN</td>
<td nowrap="nowrap" width="60">Source</td>
<td nowrap="nowrap" width="80">Source Address</td>
<td nowrap="nowrap" width="80">Destination Address</td>
<td nowrap="nowrap" width="80">Source Port</td>
<td nowrap="nowrap" width="80">Destination Port</td>
<td nowrap="nowrap" width="80">Extend ID</td>
<td nowrap="nowrap" width="80">eNodeB ID</td>
<td nowrap="nowrap" width="80">PDP IP</td>

			</tr>
			<xsl:apply-templates select="DATA"/>
			</table>
			</xsl:template>
			
			<xsl:template match="DATA">
			<tr onclick="rowClick(this,false)" ondblclick="rowClick(this,true)">
			<xsl:attribute name="id"><xsl:apply-templates select="id"/></xsl:attribute>
			<td><input type="button" onclick="showCode()" value="Primitive Code"/></td>
			<!--????,????-->
			<xsl:apply-templates select="__NO__"/>
<xsl:apply-templates select="TIME"/>
<xsl:apply-templates select="MSGID"/>
<xsl:apply-templates select="BDIRECTION"/>
<xsl:apply-templates select="EVENT"/>
<xsl:apply-templates select="SUBEVENT"/>
<xsl:apply-templates select="TIMSI"/>
<xsl:apply-templates select="TISDN"/>
<xsl:apply-templates select="SOURCE"/>
<xsl:apply-templates select="TSRCIP"/>
<xsl:apply-templates select="TDESTIP"/>
<xsl:apply-templates select="__COL11__"/>
<xsl:apply-templates select="__COL12__"/>
<xsl:apply-templates select="EXTENDID"/>
<xsl:apply-templates select="DWENODEBID"/>
<xsl:apply-templates select="TPDPIP"/>

			</tr>
			</xsl:template>
			
			<xsl:template match="id"><xsl:value-of select="."/></xsl:template> 
			
			<!--????-->
			<xsl:template match="__NO__">
<td nowrap="nowrap"><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="TIME">
<td nowrap="nowrap"><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="MSGID">
<td nowrap="nowrap"><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="BDIRECTION">
<td nowrap="nowrap"><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="EVENT">
<td nowrap="nowrap"><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="SUBEVENT">
<td nowrap="nowrap"><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="TIMSI">
<td nowrap="nowrap"><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="TISDN">
<td nowrap="nowrap"><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="SOURCE">
<td nowrap="nowrap"><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="TSRCIP">
<td nowrap="nowrap"><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="TDESTIP">
<td nowrap="nowrap"><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="__COL11__">
<td nowrap="nowrap"><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="__COL12__">
<td nowrap="nowrap"><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="EXTENDID">
<td nowrap="nowrap"><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="DWENODEBID">
<td nowrap="nowrap"><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="TPDPIP">
<td nowrap="nowrap"><xsl:value-of select="."/></td>
</xsl:template>


			
			</xsl:stylesheet>
			