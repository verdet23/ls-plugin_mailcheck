<div id="email-suggestion">
    {$aLang.mailcheck_seems} <a href="#" class="apply" title="{$aLang.mailcheck_replace}"><span>user</span>@<b>domain.com</b></a>? <a href="#" class="close" title="{$aLang.mailcheck_right}">✖</a>
</div>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="{$sTemplateWebPathPluginMailcheck}js/jquery.mailcheck.min.js"></script>
<link rel="stylesheet" type="text/css" href="{$sTemplateWebPathPluginMailcheck}css/mailcheck.css" media="all" />
<script>
jQuery.noConflict()
var domains = {json var=$aDomains};
{literal}
jQuery(document).ready(function(){
    
    jQuery('#email-suggestion').insertAfter(jQuery('input[name=mail]'));

    jQuery('input[name=mail]').on('focusout', function(){
        var email = jQuery(this);
        var suggest = jQuery('#email-suggestion');
        jQuery(this).mailcheck(domains, {
            suggested: function(el, suggestion){
                suggest.find('span').text(suggestion.address);
                suggest.find('b').text(suggestion.domain);
                suggest.slideDown('fast');
            },
            empty: function(){
                suggest.slideUp('fast');
            }
        });
        suggest.find('a').on('click', function(){
            jQuery(this).hasClass('apply') && email.val(jQuery(this).text());
            suggest.slideUp('fast');
            return false;
        });
    });
});
{/literal}
</script>