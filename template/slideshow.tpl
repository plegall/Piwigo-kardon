{html_head}
<link rel="stylesheet" type="text/css" href="themes/kardon/slideshow.css">
{/html_head}

<div id="imageHeaderBar">
  <div class="browsePath">
    {if isset($U_SLIDESHOW_STOP) }
    [ <a href="{$U_SLIDESHOW_STOP}">{'stop the slideshow'|@translate}</a> ]
    {/if}
  </div>
  <div class="imageNumber">{$PHOTO}</div>
  {if $SHOW_PICTURE_NAME_ON_TITLE }
  <h2 class="showtitle">{$current.TITLE}</h2>
  {/if}
</div>

<div id="imageToolBar">
  {include file='picture_nav_buttons.tpl'|@get_extent:'picture_nav_buttons'}
</div>

<div id="theImage">
{literal}
<script type="text/javascript">//<!--

var maxWidth = maxHeight  = margin =  0;
var finalW = w = {/literal}{$WIDTH_IMG}{literal}, finalH = h = {/literal}{$HEIGHT_IMG}{literal};
if( typeof( window.innerWidth ) == 'number' ) {
	//Non-IE
	maxWidth = window.innerWidth;
	maxHeight = window.innerHeight;
} else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
	//IE 6+ in 'standards compliant mode'
	maxWidth = document.documentElement.clientWidth;
	maxHeight = document.documentElement.clientHeight;
} else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
	//IE 4 compatible
	maxWidth = document.body.clientWidth;
	maxHeight = document.body.clientHeight;
}
maxHeight = maxHeight-32;
if ((h > maxHeight) || (w > maxWidth)) {
	if ((h > maxHeight) && (w > maxWidth)) {
		if (maxHeight-h < maxWidth-w) {
			finalH = maxHeight;
			finalW = w * finalH / h;
			}
		else {
			finalW = maxWidth;
			finalH = h * finalW / w;
		}
	} 
	else if ((h > maxHeight) && (w < maxWidth)) {
		finalH = maxHeight;
		finalW = w * finalH / h;
	} 
	else if ((h < maxHeight) && (w > maxWidth)) {
		finalW = maxWidth;
		finalH = h * finalW / w;
	}
}
if ((maxHeight-finalH) > 0) {
	margin =  Math.round((maxHeight-finalH) / 2)
}
document.writeln("<img style=\"margin-top:"+margin+"px; width:"+finalW+"px;height:"+finalH+"px\" src=\"{/literal}{$SRC_IMG}{literal}\" alt=\"\">");

//-->
</script>
{/literal}
<noscript>
  <div>
    <img src="{$SRC_IMG}" style="width:{$WIDTH_IMG}px;height:{$HEIGHT_IMG}px;" alt="{$ALT_IMG}">
  </div>
</noscript>
</div> <!-- theImage -->