<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" doctype-public="-//W3C//DTD XHTML 1.1//EN"/>

<xsl:template name="break-replace">
      <xsl:param name="value" />
	 
	  <xsl:variable name="color">
		<xsl:choose>
			<xsl:when test="starts-with($value,'ÿc0')">
				#ffffff
			</xsl:when>
			<xsl:when test="starts-with($value,'ÿc1')">
				#dc143c
			</xsl:when>
			<xsl:when test="starts-with($value,'ÿc2')">
				#00C408
			</xsl:when>
			<xsl:when test="starts-with($value,'ÿc3')">
				#4850B8
			</xsl:when>
			<xsl:when test="starts-with($value,'ÿc4')">
				#908858
			</xsl:when>
			<xsl:when test="starts-with($value,'ÿc7')">
				#908858
			</xsl:when>
			<xsl:when test="starts-with($value,'ÿc5')">
				#000000
			</xsl:when>
			<xsl:when test="starts-with($value,'ÿc6')">
				#000000
			</xsl:when>
			<xsl:when test="starts-with($value,'ÿc8')">
				#FF8000
			</xsl:when>
			<xsl:when test="starts-with($value,'ÿc9')">
				#FFFF00
			</xsl:when>
			<xsl:otherwise>
				#ffffff
			</xsl:otherwise>
	  </xsl:choose>
	  </xsl:variable>
	  <xsl:choose>
         <xsl:when test="contains($value,'|')">
            <div style= "text-align: center;color: {$color};"> 
				<xsl:choose>
					<xsl:when test="starts-with($value,'ÿc')">
						<xsl:value-of select="substring-after(substring-before($value,'|'),substring($value,1,3))"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="substring-before($value,'|')"/>
						<!-- <xsl:value-of select="substring-after(substring-before($value,'|'),substring($value,1,3))"/> -->
					</xsl:otherwise>
				</xsl:choose>
				<br />
			</div>
            <xsl:call-template name="break-replace">
               <xsl:with-param name="value" select="substring-after($value,'|')" />
            </xsl:call-template>
         </xsl:when>
         <xsl:otherwise>
            <div style= "text-align: center;color: {$color};"> 
				<xsl:choose>
					<xsl:when test="starts-with($value,'ÿc')">
						<xsl:value-of select="substring-after($value,substring($value,1,3))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$value"/>
						<!--<xsl:value-of select="substring-after(substring-before($value,'|'),substring($value,1,3))"/>-->
					</xsl:otherwise>
				</xsl:choose>
				<br />
				<!--<xsl:value-of select="substring-after($value,substring($value,1,3))" />-->
			</div>
         </xsl:otherwise>
      </xsl:choose>
	  
</xsl:template>

<xsl:template name="get-stats">
	 <xsl:param name="typedesc" />
	 <xsl:value-of select="@typedesc" />
</xsl:template>

<xsl:template match="itemlog">
	<html>
		<title>ETAL Item Logger</title>
		<head>
			
			<title>Itemlog</title>
			<style type="text/css">
			.tooltip {
				opacity: 1;
				position: absolute;
				display: none;
				border-style:ridge;
				border-width:5px;
				background-color: #000000;
				padding: 10px;
			}
			</style>
			<script src="Rendering/tooltip.js"></script>
			<script>
				var keptitems = new Array();
				var solditems = new Array();
				var ignoreditems = new Array();
				var whiteitems = new Array();
				var magicitems = new Array();
				var setitems = new Array();
				var rareitems = new Array();
				var uniqueitems = new Array();
				var crafteditems = new Array();
				var allitems = new Array();
				var otheritems = new Array();
				var n = 0;
				var o = 0;
				var v = 0;
				var i = 0;
				var e = 0;
				var t = 0;
				var s = 0;
				var x = 0;
				var r = 0;
				var z = 0;
				var w = 0;
				<xsl:for-each select="/itemlog/item">
					<xsl:if test="@mode = '12'">
						keptitems[n] = new Array(2);
						keptitems[n]['id'] = <xsl:value-of select="@id"/>;
						keptitems[n]['name'] = "<xsl:value-of select="@name"/>";
						keptitems[n]['ilvl'] = "<xsl:value-of select="@ilvl"/>";
						keptitems[n]['type'] = "<xsl:value-of select="@type"/>";
						keptitems[n]['quality'] = "<xsl:value-of select="@quality"/>";
						keptitems[n]['mode'] = "<xsl:value-of select="@mode"/>";
						keptitems[n]['typedesc'] = "<xsl:value-of select="@typedesc"/>";
						keptitems[n]['location'] = "<xsl:value-of select="@location"/>";
						n++;
					</xsl:if>
					<xsl:if test="@mode = '13'">
						solditems[o] = new Array(2);
						solditems[o]['id'] = <xsl:value-of select="@id"/>;
						solditems[o]['name'] = "<xsl:value-of select="@name"/>";
						solditems[o]['ilvl'] = "<xsl:value-of select="@ilvl"/>";
						solditems[o]['type'] = "<xsl:value-of select="@type"/>";
						solditems[o]['quality'] = "<xsl:value-of select="@quality"/>";
						solditems[o]['mode'] = "<xsl:value-of select="@mode"/>";
						solditems[o]['typedesc'] = "<xsl:value-of select="@typedesc"/>";
						solditems[o]['location'] = "<xsl:value-of select="@location"/>";
						o++;
					</xsl:if>
					<xsl:if test="@mode = '14'">
						ignoreditems[v] = new Array(2);
						ignoreditems[v]['id'] = <xsl:value-of select="@id"/>;
						ignoreditems[v]['name'] = "<xsl:value-of select="@name"/>";
						ignoreditems[v]['ilvl'] = "<xsl:value-of select="@ilvl"/>";
						ignoreditems[v]['type'] = "<xsl:value-of select="@type"/>";
						ignoreditems[v]['quality'] = "<xsl:value-of select="@quality"/>";
						ignoreditems[v]['mode'] = "<xsl:value-of select="@mode"/>";
						ignoreditems[v]['typedesc'] = "<xsl:value-of select="@typedesc"/>";
						ignoreditems[v]['location'] = "<xsl:value-of select="@location"/>";
						v++;
					</xsl:if>
					<xsl:if test="@quality &lt; '4'">
						whiteitems[i] = new Array(2);
						whiteitems[i]['id'] = <xsl:value-of select="@id"/>;
						whiteitems[i]['name'] = "<xsl:value-of select="@name"/>";
						whiteitems[i]['ilvl'] = "<xsl:value-of select="@ilvl"/>";
						whiteitems[i]['type'] = "<xsl:value-of select="@type"/>";
						whiteitems[i]['quality'] = "<xsl:value-of select="@quality"/>";
						whiteitems[i]['mode'] = "<xsl:value-of select="@mode"/>";
						whiteitems[i]['typedesc'] = "<xsl:value-of select="@typedesc"/>";
						whiteitems[i]['location'] = "<xsl:value-of select="@location"/>";
						i++;
					</xsl:if>
					<xsl:if test="@quality = '4'">
						magicitems[e] = new Array(2);
						magicitems[e]['id'] = <xsl:value-of select="@id"/>;
						magicitems[e]['name'] = "<xsl:value-of select="@name"/>";
						magicitems[e]['ilvl'] = "<xsl:value-of select="@ilvl"/>";
						magicitems[e]['type'] = "<xsl:value-of select="@type"/>";
						magicitems[e]['quality'] = "<xsl:value-of select="@quality"/>";
						magicitems[e]['mode'] = "<xsl:value-of select="@mode"/>";
						magicitems[e]['typedesc'] = "<xsl:value-of select="@typedesc"/>";
						magicitems[e]['location'] = "<xsl:value-of select="@location"/>";
						e++;
					</xsl:if>
					<xsl:if test="@quality = '8'">
						crafteditems[w] = new Array(2);
						crafteditems[w]['id'] = <xsl:value-of select="@id"/>;
						crafteditems[w]['name'] = "<xsl:value-of select="@name"/>";
						crafteditems[w]['ilvl'] = "<xsl:value-of select="@ilvl"/>";
						crafteditems[w]['type'] = "<xsl:value-of select="@type"/>";
						crafteditems[w]['quality'] = "<xsl:value-of select="@quality"/>";
						crafteditems[w]['mode'] = "<xsl:value-of select="@mode"/>";
						crafteditems[w]['typedesc'] = "<xsl:value-of select="@typedesc"/>";
						crafteditems[w]['location'] = "<xsl:value-of select="@location"/>";
						w++;
					</xsl:if>
					<xsl:if test="@quality = '5'">
						setitems[t] = new Array(2);
						setitems[t]['id'] = <xsl:value-of select="@id"/>;
						setitems[t]['name'] = "<xsl:value-of select="@name"/>";
						setitems[t]['ilvl'] = "<xsl:value-of select="@ilvl"/>";
						setitems[t]['type'] = "<xsl:value-of select="@type"/>";
						setitems[t]['quality'] = "<xsl:value-of select="@quality"/>";
						setitems[t]['mode'] = "<xsl:value-of select="@mode"/>";
						setitems[t]['typedesc'] = "<xsl:value-of select="@typedesc"/>";
						setitems[t]['location'] = "<xsl:value-of select="@location"/>";
						t++;
					</xsl:if>
					<xsl:if test="@quality = '6'">
						rareitems[s] = new Array(2);
						rareitems[s]['id'] = <xsl:value-of select="@id"/>;
						rareitems[s]['name'] = "<xsl:value-of select="@name"/>";
						rareitems[s]['ilvl'] = "<xsl:value-of select="@ilvl"/>";
						rareitems[s]['type'] = "<xsl:value-of select="@type"/>";
						rareitems[s]['quality'] = "<xsl:value-of select="@quality"/>";
						rareitems[s]['mode'] = "<xsl:value-of select="@mode"/>";
						rareitems[s]['typedesc'] = "<xsl:value-of select="@typedesc"/>";
						rareitems[s]['location'] = "<xsl:value-of select="@location"/>";
						s++;
					</xsl:if>
					<xsl:if test="@quality = '7'">
						uniqueitems[x] = new Array(2);
						uniqueitems[x]['id'] = <xsl:value-of select="@id"/>;
						uniqueitems[x]['name'] = "<xsl:value-of select="@name"/>";
						uniqueitems[x]['ilvl'] = "<xsl:value-of select="@ilvl"/>";
						uniqueitems[x]['type'] = "<xsl:value-of select="@type"/>";
						uniqueitems[x]['quality'] = "<xsl:value-of select="@quality"/>";
						uniqueitems[x]['mode'] = "<xsl:value-of select="@mode"/>";
						uniqueitems[x]['typedesc'] = "<xsl:value-of select="@typedesc"/>";
						uniqueitems[x]['location'] = "<xsl:value-of select="@location"/>";
						x++;
					</xsl:if>
					<xsl:if test="@mode &gt; '10'">
						allitems[r] = new Array(2);
						allitems[r]['id'] = <xsl:value-of select="@id"/>;
						allitems[r]['name'] = "<xsl:value-of select="@name"/>";
						allitems[r]['char'] = "<xsl:value-of select="@char"/>";
						allitems[r]['ilvl'] = "<xsl:value-of select="@ilvl"/>";
						allitems[r]['type'] = "<xsl:value-of select="@type"/>";
						allitems[r]['quality'] = "<xsl:value-of select="@quality"/>";
						allitems[r]['mode'] = "<xsl:value-of select="@mode"/>";
						allitems[r]['typedesc'] = "<xsl:value-of select="@typedesc"/>";
						allitems[r]['location'] = "<xsl:value-of select="@location"/>";
						r++;
					</xsl:if>
					<xsl:if test="@ilvl = '1'">
						otheritems[z] = new Array(2);
						otheritems[z]['id'] = <xsl:value-of select="@id"/>;
						otheritems[z]['name'] = "<xsl:value-of select="@name"/>";
						otheritems[z]['ilvl'] = "<xsl:value-of select="@ilvl"/>";
						otheritems[z]['type'] = "<xsl:value-of select="@type"/>";
						otheritems[z]['quality'] = "<xsl:value-of select="@quality"/>";
						otheritems[z]['mode'] = "<xsl:value-of select="@mode"/>";
						otheritems[z]['typedesc'] = "<xsl:value-of select="@typedesc"/>";
						otheritems[z]['location'] = "<xsl:value-of select="@typedesc"/>";
						z++;
					</xsl:if>
				</xsl:for-each>
				
				var line = "";
				
				function showAll() {
					for(i=0;i &lt; allitems.length; i++) {
						line = document.getElementById("l" + allitems[i]['id']);
						line.style.display = "block";
					}
				}

				function showNone() {
					for(i=0;i &lt; keptitems.length; i++) {
						line = document.getElementById("l" + keptitems[i]['id']);
						line.style.display = "none";
					}
					for(i=0;i &lt; solditems.length; i++) {
						line = document.getElementById("l" + solditems[i]['id']);
						line.style.display = "none";
					}
					for(i=0;i &lt; ignoreditems.length; i++) {
						line = document.getElementById("l" + ignoreditems[i]['id']);
						line.style.display = "none";
					}
				}
				
				function searchName(e) {
					var ENTER_KEY = 13;
					var code = "";

					if (window.event) { // IE
						code = e.keyCode;
					} else if (e.which) { // Netscape/Firefox/Opera
						code = e.which;
					}

					if(code == ENTER_KEY) {
						var noresult = document.getElementById("noresult");
						noresult.style.display = "none";

						var input = document.getElementById("search");
						var string = input.value;
						var keptbox = document.getElementById("keptbox");
						var soldbox = document.getElementById("soldbox");
						var ignoredbox = document.getElementById("ignoredbox");
						var allbox = document.getElementById("allbox");
						var charbox = document.getElementById("charbox");
						var ilvlbox = document.getElementById("ilvlbox");
						var locationbox = document.getElementById("locationbox");
						var searchresults = 0;
						var search = eval("/" + string + "/i");
						showNone();
	
						if(keptbox.checked == true) {
							for(i=0;i &lt; keptitems.length; i++) {
								var itemname = keptitems[i]['name'];
								var result = search.test(itemname);
								if(result == true) {
									searchresults++;
									
									line = document.getElementById("l" + keptitems[i]['id']);
									line.style.display = "block";
								}
							}
						}

						if(soldbox.checked == true) {
							for(i=0;i &lt; solditems.length; i++) {
								var itemname = solditems[i]['name'];
								var result = search.test(itemname);
								if(result == true) {
									searchresults++;
						
									line = document.getElementById("l" + solditems[i]['id']);
									line.style.display = "block";
								}
							}
						}
						if(ignoredbox.checked == true) {
							for(i=0;i &lt; ignoreditems.length; i++) {
								var itemname = ignoreditems[i]['name'];
								var result = search.test(itemname);
								if(result == true) {
									searchresults++;
						
									line = document.getElementById("l" + ignoreditems[i]['id']);
									line.style.display = "block";
								}
							}
						}
						if(allbox.checked == true) {
							for(i=0;i &lt; allitems.length; i++) {
								var itemname = allitems[i]['name'];
								var result = search.test(itemname);
								if(result == true) {
									searchresults++;
						
									line = document.getElementById("l" + allitems[i]['id']);
									line.style.display = "block";
								}
							}
						}
						if(ilvlbox.checked == true) {
							for(i=0;i &lt; allitems.length; i++) {
								var itemname = allitems[i]['ilvl'];
								var result = search.test(itemname);
								if(result == true) {
									searchresults++;
						
									line = document.getElementById("l" + allitems[i]['id']);
									line.style.display = "block";
								}
							}
						}
						if(locationbox.checked == true) {
							for(i=0;i &lt; allitems.length; i++) {
								var itemname = allitems[i]['location'];
								var result = search.test(itemname);
								if(result == true) {
									searchresults++;
						
									line = document.getElementById("l" + allitems[i]['id']);
									line.style.display = "block";
								}
							}
						}
						if(charbox.checked == true) {
							for(i=0;i &lt; allitems.length; i++) {
								var itemname = allitems[i]['char'];
								var result = search.test(itemname);
								if(result == true) {
									searchresults++;
						
									line = document.getElementById("l" + allitems[i]['id']);
									line.style.display = "block";
								}
							}
						}
						if(searchresults == 0) {
							var noresult = document.getElementById("noresult");
							noresult.style.display = "block";
						}
					}
				}
				function searchMode(mode) {
					var noresult = document.getElementById("noresult");
							noresult.style.display = "none";
					var whitebox = document.getElementById("whitebox")
					var magicbox = document.getElementById("magicbox")
					var rarebox = document.getElementById("rarebox")
					var setbox = document.getElementById("setbox")
					var uniquebox = document.getElementById("uniquebox")
					var craftedbox = document.getElementById("craftedbox")
					var otherbox = document.getElementById("otherbox")
					var searchmoderesults = 0;
					var search2 = eval("/" + mode + "/i");
					showNone();

					if(whitebox.checked == true) {
						for(i=0;i &lt; whiteitems.length; i++) {
							var itemname = whiteitems[i]['mode'];
							var result = search2.test(itemname);
							if(result == true) {
								searchmoderesults++;
					
								line = document.getElementById("l" + whiteitems[i]['id']);
								line.style.display = "block";
							}
						}
					}
					if(magicbox.checked == true) {
						for(i=0;i &lt; magicitems.length; i++) {
							var itemname = magicitems[i]['mode'];
							var result = search2.test(itemname);
							if(result == true) {
								searchmoderesults++;
					
								line = document.getElementById("l" + magicitems[i]['id']);
								line.style.display = "block";
							}
						}
					}
					if(setbox.checked == true) {
						for(i=0;i &lt; setitems.length; i++) {
							var itemname = setitems[i]['mode'];
							var result = search2.test(itemname);
							if(result == true) {
								searchmoderesults++;
					
								line = document.getElementById("l" + setitems[i]['id']);
								line.style.display = "block";
							}
						}
					}
					if(rarebox.checked == true) {
						for(i=0;i &lt; rareitems.length; i++) {
							var itemname = rareitems[i]['mode'];
							var result = search2.test(itemname);
							if(result == true) {
								searchmoderesults++;
					
								line = document.getElementById("l" + rareitems[i]['id']);
								line.style.display = "block";
							}
						}
					}
					if(uniquebox.checked == true) {
						for(i=0;i &lt; uniqueitems.length; i++) {
							var itemname = uniqueitems[i]['mode'];
							var result = search2.test(itemname);
							if(result == true) {
								searchmoderesults++;
					
								line = document.getElementById("l" + uniqueitems[i]['id']);
								line.style.display = "block";
							}
						}
					}
					if(craftedbox.checked == true) {
						for(i=0;i &lt; crafteditems.length; i++) {
							var itemname = crafteditems[i]['mode'];
							var result = search2.test(itemname);
							if(result == true) {
								searchmoderesults++;
					
								line = document.getElementById("l" + crafteditems[i]['id']);
								line.style.display = "block";
							}
						}
					}
					if(otherbox.checked == true) {
						for(i=0;i &lt; otheritems.length; i++) {
							var itemname = otheritems[i]['mode'];
							var result = search2.test(itemname);
							if(result == true) {
								searchmoderesults++;
					
								line = document.getElementById("l" + otheritems[i]['id']);
								line.style.display = "block";
							}
						}
					}
					if(searchmoderesults == 0) {
						var noresult = document.getElementById("noresult");
						noresult.style.display = "block";
					}
				}

			</script>
		</head>
		<body style="font: 13px Verdana; background-color:#000000; border-style:ridge; border-width:5px;">
			<span style="padding-left: 360px;color: #800000;">Written for: Project ETAL Bot, by Noviets. Version 1.6</span><br />
				<span style="padding-left: 390px;color: #66FF00; font: 30px comic sans ms">ETAL ITEM LOGGER</span><br />
					<span style="padding-left: 715px;color: #ffffff;">
					Kept Items<input type="checkbox" id="keptbox"/>
					&#160;&#160;Sold Items<input type="checkbox" id="soldbox"/>
					&#160;&#160;Ignored Items<input type="checkbox" id="ignoredbox"/></span><br />
					<span style="padding-left: 175px;color: #ffffff;">Display Filters :
					<span style="padding-left: 476px;">
					&#160;&#160;All Items<input type="checkbox" id="allbox"/>
					&#160;&#160;Character Names<input type="checkbox" id="charbox"/></span><br />
					<span style="padding-left: 0px;">
					 <span style="color: #FFFFFF; font-weight: bold;">White<input type="checkbox" id="whitebox" checked="checked"/></span>
					 <span style="color: #4850B8; font-weight: bold;">&#160;&#160;Magic<input type="checkbox" id="magicbox" checked="checked"/></span>
					 <span style="color: #00C408; font-weight: bold;">&#160;&#160;Set<input type="checkbox" id="setbox" checked="checked"/></span>
					 <span style="color: #E0E000; font-weight: bold;">&#160;&#160;Rare<input type="checkbox" id="rarebox" checked="checked"/></span>
					 <span style="color: #908858; font-weight: bold;">&#160;&#160;Unique<input type="checkbox" id="uniquebox" checked="checked"/></span>
					 <span style="color: #FF8000; font-weight: bold;">&#160;&#160;Crafted<input type="checkbox" id="craftedbox" checked="checked"/></span>
					 <span style="color: #FF8000; font-weight: bold;">&#160;&#160;Other<input type="checkbox" id="otherbox" checked="checked"/></span>
					</span>
					<span style="padding-left: 335px;">
					&#160;&#160;iLvl<input type="checkbox" id="ilvlbox"/>
					&#160;&#160;Location<input type="checkbox" id="locationbox"/>
					</span>
				</span><br />
				<span style="padding-left: 25px;color: #ffffff;">
				<input type="submit" value="Show All" onClick="searchMode(1)"/>
				<input type="submit" value="Show Kept" onClick="searchMode(2)"/>
				<input type="submit" value="Show Sold" onClick="searchMode(3)"/>
				<input type="submit" value="Show Ignored" onClick="searchMode(4)"/>
				<input type="submit" value="Update" onClick="window.location.reload()"/>
				</span>
				<span style="padding-left: 290px;color: #ffffff; text-align: right;">
				Search : <input type="text" id="search" size="30" onkeypress="searchName(event)"/>
				</span>
				<br />
			<br/>
			<main>
			<span style="display: block; float: left; width: 180px; margin-right: 35px;margin-left: 20px; color: #FF0000; font-weight: bold; text-align: left;">
				Date time
			</span>
			<span style="display: block; float: left; width: 140px; margin-right: 0px;margin-left: 1px; color: #FF0000; font-weight: bold; text-align: left;">
				Character
			</span>
			<div style="float: left; width: 210px; margin-right: 1px;margin-left: 8px;color: #FF0000; font-weight: bold; text-align: left;">
				Location
 			</div>
			<div style="display: block; float: left; width: 50px; margin-right: 9px;;margin-left: 5px;color: #FF0000; font-weight: bold; text-align: left;">
					Action
			</div>
			<div style="display: block; float: left; width: 27px; margin-right: 0px; margin-left: 14px;color: #FF0000; font-weight: bold; text-align: left;">
					Ilvl
 			</div>
			<div style="display: block; float: left; width: 170px; margin-right: 0px;margin-left: 19px;color: #FF0000; font-weight: bold; text-align: left;">
					Type
			</div>
			<div style="display: block; float: left; margin-right: 5px; margin-left: 10px;color: #FF0000; font-weight: bold;text-align: left;">
					Name
 			</div>
			</main>
			<br/>
			
			<div id="results">
			<xsl:for-each select="/itemlog/item">
				<xsl:sort select="@id" order="descending" data-type="number" />
				<div id="noresult" style="display: none;font-weight: bold;color: #FF0000;text-align: center;">There are no results to display!</div>
				<div style="border-bottom:ridge; border-width:1px;">
				<xsl:attribute name="id">l<xsl:value-of select="@id"/></xsl:attribute>
				
				<!--<xsl:if test="@mode = '0'">
					<xsl:attribute name="style">display: none;</xsl:attribute>
				</xsl:if>
				<xsl:if test="@mode = '1'">
					<xsl:attribute name="style">display: none;</xsl:attribute>
				</xsl:if>
				<xsl:if test="@mode = '2'">
					<xsl:attribute name="style">display: none;</xsl:attribute>
				</xsl:if> -->
				<xsl:choose>
					<!-- Magic -->
					<xsl:when test="@quality = '4'">
						<div style="display: block;color: #ffffff; float: left; width: 175px; margin-right: 5px; text-align: right;">
							<xsl:value-of select="@time"/>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 175px; margin-right: 10px; margin-left: 10px; text-align: center;">
							<xsl:value-of select="@char"/>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 195px; margin-right: 10px; margin-left: 10px;">
							<xsl:value-of select="@location"/>
 						</div>
						<div style="display: block;color: #ffffff; float: left; width: 50px; margin-right: 10px; margin-left: 10px;">
							<xsl:choose>
								<xsl:when test="@mode = '12'">
									Kept
								</xsl:when>
								<xsl:when test="@mode = '13'">
									Sold
								</xsl:when>
								<xsl:when test="@mode = '14'">
									Ignored
								</xsl:when>
							</xsl:choose>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 30px; margin-right: 10px; margin-left: 10px;text-align: center;">
							<xsl:value-of select="@ilvl"/>
						</div> 
						<div style="display: block; color: #4850B8; font-weight: bold; float: left; width: 170px; margin-right: 10px; margin-left: 10px;text-align: left;">
							<xsl:value-of select="@typedesc"/>
						</div>
						<span style="color: #4850B8;font-weight: bold" onMouseOut="hideTT()">
						<xsl:attribute name="onMouseOver">showTT('<xsl:value-of select="@id"/>')</xsl:attribute>
							<xsl:value-of select="@name"/>
						</span>
						<br/>
						<div class="tooltip">
							<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
							<div style="color: #4850B8;font: 16px;text-align: center;">
								<xsl:value-of select="@name"/>
							</div>
							
							<span style="color: #ffffff; font: 15px;">
								<xsl:call-template name="break-replace">
									<xsl:with-param name="value" select="." />
								</xsl:call-template>
							</span>
						</div>

					</xsl:when>
					<!-- Set -->
					<xsl:when test="@quality = '5'">
						<div style="display: block;color: #ffffff; float: left; width: 175px; margin-right: 5px; text-align: right;">
							<xsl:value-of select="@time"/>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 175px; margin-right: 10px; margin-left: 10px; text-align: center;">
							<xsl:value-of select="@char"/>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 195px; margin-right: 10px; margin-left: 10px;">
							<xsl:value-of select="@location"/>
 						</div>
						<div style="display: block;color: #ffffff; float: left; width: 50px; margin-right: 10px; margin-left: 10px;">
							<xsl:choose>
								<xsl:when test="@mode = '12'">
									Kept
								</xsl:when>
								<xsl:when test="@mode = '13'">
									Sold
								</xsl:when>
								<xsl:when test="@mode = '14'">
									Ignored
								</xsl:when>
							</xsl:choose>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 30px; margin-right: 10px; margin-left: 10px;text-align: center;">
							<xsl:value-of select="@ilvl"/>
						</div> 
						<div style="display: block; color: #00C408; font-weight: bold; float: left; width: 170px; margin-right: 10px; margin-left: 10px;text-align: left;">
							<xsl:value-of select="@typedesc"/>
						</div>
						<div class="tooltip">
							<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
							<div style="color: #00C408;font: 16px;text-align: center;">
								<xsl:value-of select="@name"/>
							</div>
							<span style="color: #ffffff;font: 15px;">
								<xsl:call-template name="break-replace">
									<xsl:with-param name="value" select="." />
								</xsl:call-template>
							</span>
						</div>
						<div style="color: #00C408; font-weight: bold" onMouseOut="hideTT()">
							<xsl:attribute name="onMouseOver">showTT('<xsl:value-of select="@id"/>')</xsl:attribute>
							<xsl:value-of select="@name"/>
						</div>
					</xsl:when>
					<!-- Rare -->
					<xsl:when test="@quality = '6'">
						<div style="display: block;color: #ffffff; float: left; width: 175px; margin-right: 5px; text-align: right;">
							<xsl:value-of select="@time"/>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 175px; margin-right: 10px; margin-left: 10px; text-align: center;">
							<xsl:value-of select="@char"/>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 195px; margin-right: 10px; margin-left: 10px;">
							<xsl:value-of select="@location"/>
 						</div>
						<div style="display: block;color: #ffffff; float: left; width: 50px; margin-right: 10px; margin-left: 10px;">
							<xsl:choose>
								<xsl:when test="@mode = '12'">
									Kept
								</xsl:when>
								<xsl:when test="@mode = '13'">
									Sold
								</xsl:when>
								<xsl:when test="@mode = '14'">
									Ignored
								</xsl:when>
							</xsl:choose>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 30px; margin-right: 10px; margin-left: 10px;text-align: center;">
							<xsl:value-of select="@ilvl"/>
						</div> 
						<div style="display: block; color: #E0E000; font-weight: bold; float: left; width: 170px; margin-right: 10px; margin-left: 10px;text-align: left;">
							<xsl:value-of select="@typedesc"/>
						</div>
						<span style="color: #E0E000; font-weight: bold" onMouseOut="hideTT()">
							<xsl:attribute name="onMouseOver">showTT('<xsl:value-of select="@id"/>')</xsl:attribute>
							<xsl:value-of select="@name"/>
						</span>
						<br/>
						<div class="tooltip">
							<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
							<div style="color: #E0E000;font: 16px;text-align: center;">
								<xsl:value-of select="@name"/>
							</div>
							
							<span style="color: #ffffff;font: 15px;">
								<xsl:call-template name="break-replace">
									<xsl:with-param name="value" select="." />
								</xsl:call-template>
							</span>
						</div>
					</xsl:when>
					<!-- Unique -->
					<xsl:when test="@quality = '7'">
						<div style="display: block;color: #ffffff; float: left; width: 175px; margin-right: 5px; text-align: right;">
							<xsl:value-of select="@time"/>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 175px; margin-right: 10px; margin-left: 10px; text-align: center;">
							<xsl:value-of select="@char"/>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 195px; margin-right: 10px; margin-left: 10px;">
							<xsl:value-of select="@location"/>
 						</div>
						<div style="display: block;color: #ffffff; float: left; width: 50px; margin-right: 10px; margin-left: 10px;">
							<xsl:choose>
								<xsl:when test="@mode = '12'">
									Kept
								</xsl:when>
								<xsl:when test="@mode = '13'">
									Sold
								</xsl:when>
								<xsl:when test="@mode = '14'">
									Ignored
								</xsl:when>
							</xsl:choose>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 30px; margin-right: 10px; margin-left: 10px;text-align: center;">
							<xsl:value-of select="@ilvl"/>
						</div> 
						<div style="display: block; color: #908858; font-weight: bold; float: left; width: 170px; margin-right: 10px; margin-left: 10px;text-align: left;">
							<xsl:value-of select="@typedesc"/>
						</div>
						<span style="color: #908858; font-weight: bold" onMouseOut="hideTT()">
							<xsl:attribute name="onMouseOver">showTT('<xsl:value-of select="@id"/>')</xsl:attribute>
							<xsl:value-of select="@name"/>
						</span>
						<br/>
						<div class="tooltip">
							<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
							<div style="color: #908858;font: 16px;text-align: center;">
								<xsl:value-of select="@name"/>
							</div>
							
							<span style="color: #ffffff;font: 15px; ">
								<xsl:call-template name="break-replace">
									<xsl:with-param name="value" select="." />
								</xsl:call-template>
							</span>
						</div>
					</xsl:when>
					<!-- Crafted -->
					<xsl:when test="@quality = '8'">
						<div style="display: block;color: #ffffff; float: left; width: 175px; margin-right: 5px; text-align: right;">
							<xsl:value-of select="@time"/>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 175px; margin-right: 10px; margin-left: 10px; text-align: center;">
							<xsl:value-of select="@char"/>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 195px; margin-right: 10px; margin-left: 10px;">
							<xsl:value-of select="@location"/>
 						</div>
						<div style="display: block;color: #ffffff; float: left; width: 50px; margin-right: 10px; margin-left: 10px;">
							<xsl:choose>
								<xsl:when test="@mode = '12'">
									Kept
								</xsl:when>
								<xsl:when test="@mode = '13'">
									Sold
								</xsl:when>
								<xsl:when test="@mode = '14'">
									Ignored
								</xsl:when>
							</xsl:choose>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 30px; margin-right: 10px; margin-left: 10px;text-align: center;">
							<xsl:value-of select="@ilvl"/>
						</div> 
						<div style="display: block; color: #FF8000; font-weight: bold; float: left; width: 170px; margin-right: 10px; margin-left: 10px;text-align: left;">Crafted
							<xsl:value-of select="@typedesc"/>
						</div>
						<span style="color: #FF8000;font-weight: bold" onMouseOut="hideTT()">
						<xsl:attribute name="onMouseOver">showTT('<xsl:value-of select="@id"/>')</xsl:attribute>
							<xsl:value-of select="@name"/>
						</span>
						<br/>
						<div class="tooltip">
							<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
							<div style="color: #FF8000;font: 16px;text-align: center;">
								<xsl:value-of select="@name"/>
							</div>
							
							<span style="color: #ffffff; font: 15px;">
								<xsl:call-template name="break-replace">
									<xsl:with-param name="value" select="." />
								</xsl:call-template>
							</span>
						</div>

					</xsl:when>
					<!-- Default -->
					<xsl:otherwise>
						<div style="display: block;color: #ffffff; float: left; width: 175px; margin-right: 5px; text-align: right;">
							<xsl:value-of select="@time"/>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 175px; margin-right: 10px; margin-left: 10px; text-align: center;">
							<xsl:value-of select="@char"/>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 195px; margin-right: 10px; margin-left: 10px;">
							<xsl:value-of select="@location"/>
 						</div>
						<div style="display: block;color: #ffffff; float: left; width: 50px; margin-right: 10px; margin-left: 10px;">
							<xsl:choose>
								<xsl:when test="@mode = '12'">
									Kept
								</xsl:when>
								<xsl:when test="@mode = '13'">
									Sold
								</xsl:when>
								<xsl:when test="@mode = '14'">
									Ignored
								</xsl:when>
							</xsl:choose>
						</div>
						<div style="display: block;color: #ffffff; float: left; width: 30px; margin-right: 10px; margin-left: 10px;text-align: center;">
							<xsl:value-of select="@ilvl"/>
						</div> 
						<xsl:choose>
								<xsl:when test="@ethereal = 'true'">
									<div style="display: block;color: #808080; font-weight: bold; float: left; width: 170px; margin-right: 10px; margin-left: 10px;text-align: left;">
										<xsl:value-of select="@typedesc"/>
									</div>		
								</xsl:when>
								<xsl:when test="@ethereal = 'false'">
									<xsl:choose>
										<xsl:when test="@typedesc = 'Quest Item'">
											<div style="display: block;color: #FF8000; font-weight: bold; float: left; width: 170px; margin-right: 10px; margin-left: 10px;text-align: left;">
												<xsl:value-of select="@typedesc"/>
											</div>	
										</xsl:when>
										<xsl:when test="@typedesc = 'Rune'">
											<div style="display: block;color: #FF8000; font-weight: bold; float: left; width: 170px; margin-right: 10px; margin-left: 10px;text-align: left;">
												<xsl:value-of select="@typedesc"/>
											</div>	
										</xsl:when>	
										<xsl:when test="@typedesc = 'Essence'">
											<div style="display: block;color: #FF8000; font-weight: bold; float: left; width: 170px; margin-right: 10px; margin-left: 10px;text-align: left;">
												<xsl:value-of select="@typedesc"/>
											</div>	
										</xsl:when>
										<xsl:when test="@typedesc = 'Key'">
											<div style="display: block;color: #FF8000; font-weight: bold; float: left; width: 170px; margin-right: 10px; margin-left: 10px;text-align: left;">
												<xsl:value-of select="@typedesc"/>
											</div>
										</xsl:when>
										<xsl:otherwise>
											<div style="display: block;color: #ffffff; font-weight: bold; float: left; width: 170px; margin-right: 10px; margin-left: 10px;text-align: left;">
												<xsl:value-of select="@typedesc"/>
											</div>		
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
						</xsl:choose>
						<xsl:choose>
								<xsl:when test="@ethereal = 'true'">
									<span style="color: #808080; font-weight: bold" onMouseOut="hideTT()">
										<xsl:attribute name="onMouseOver">showTT('<xsl:value-of select="@id"/>')</xsl:attribute>
										<xsl:value-of select="@name"/>
									</span>	
								</xsl:when>
								<xsl:when test="@ethereal = 'false'">
									<xsl:choose>
										<xsl:when test="@typedesc = 'Quest Item'">
											<span style="color: #FF8000; font-weight: bold" onMouseOut="hideTT()">
												<xsl:attribute name="onMouseOver">showTT('<xsl:value-of select="@id"/>')</xsl:attribute>
													<xsl:value-of select="@name"/>
											</span>	
										</xsl:when>
										<xsl:when test="@typedesc = 'Rune'">
											<span style="color: #FF8000; font-weight: bold" onMouseOut="hideTT()">
												<xsl:attribute name="onMouseOver">showTT('<xsl:value-of select="@id"/>')</xsl:attribute>
													<xsl:value-of select="@name"/>
											</span>	
										</xsl:when>
										<xsl:when test="@typedesc = 'Essence'">
											<span style="color: #FF8000; font-weight: bold" onMouseOut="hideTT()">
												<xsl:attribute name="onMouseOver">showTT('<xsl:value-of select="@id"/>')</xsl:attribute>
													<xsl:value-of select="@name"/>
											</span>	
										</xsl:when>
										<xsl:when test="@typedesc = 'Key'">
											<span style="color: #FF8000; font-weight: bold" onMouseOut="hideTT()">
												<xsl:attribute name="onMouseOver">showTT('<xsl:value-of select="@id"/>')</xsl:attribute>
													<xsl:value-of select="@name"/>
											</span>	
										</xsl:when>	
										<xsl:otherwise>
											<span style="color: #ffffff; font-weight: bold" onMouseOut="hideTT()">
												<xsl:attribute name="onMouseOver">showTT('<xsl:value-of select="@id"/>')</xsl:attribute>
												<xsl:value-of select="@name"/>
											</span>	
											</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
						</xsl:choose>						
						<br/>
						<div class="tooltip">
							<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
								<xsl:choose>
									<xsl:when test="@typedesc = 'Quest Item'">
										<div style="color: #FF8000;font: 16px; font-weight: bold;text-align: center;">
											<xsl:value-of select="@name"/>
										</div>
									</xsl:when>
									<xsl:when test="@typedesc = 'Rune'">
										<div style="color: #FF8000; font-weight: bold;text-align: center;">
											<xsl:value-of select="@name"/>
										</div>	
									</xsl:when>	
									<xsl:when test="@typedesc = 'Essence'">
										<div style="color: #FF8000; font-weight: bold;text-align: center;">
											<xsl:value-of select="@name"/>
										</div>
									</xsl:when>	
										<xsl:when test="@typedesc = 'Key'">
										<div style="color: #FF8000; font-weight: bold;text-align: center;">
											<xsl:value-of select="@name"/>
										</div>	
									</xsl:when>	
									<xsl:otherwise>
										<div style="color: #ffffff;font: 16px;text-align: center;">
											<xsl:value-of select="@name"/>
										</div>	
									</xsl:otherwise>
								</xsl:choose>
								<span style="color: #ffffff;font: 15px;">
									<xsl:call-template name="break-replace">
										<xsl:with-param name="value" select="." />
									</xsl:call-template>
								</span>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			</xsl:for-each>
			</div>
		</body>
		<span style="padding-left: 330px;color: #190517;">Credits to Jinnay, doomknight, bajazzle, and agor. for the Original code.</span>
	</html>
</xsl:template>

</xsl:stylesheet>