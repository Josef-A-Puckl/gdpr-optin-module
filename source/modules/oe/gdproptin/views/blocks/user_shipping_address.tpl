[{$smarty.block.parent}]

[{if !isset($oConfig)}]
    [{assign var="oConfig" value=$oViewConf->getConfig()}]
[{/if}]

[{if $oxcmp_user}]
    [{assign var="delivadr" value=$oxcmp_user->getSelectedAddress()}]
[{/if}]

[{if true == $oConfig->getConfigParam('blOeGdprOptinDeliveryAddress')}]

    [{if $delivadr}]
        [{oxscript add="$('#showShipAddress').change( function() { $('#GdprShippingAddressOptin, #shippingAddressForm').hide($(this).is(':checked'));});"}]
        [{oxscript add="$('#addressId').change(function() { $('#GdprShippingAddressOptin').toggle($('#addressId').val() == -1 ); }); "}]
        [{oxscript add="$('#userChangeShippingAddress').click(function(){ $('#GdprShippingAddressOptin').toggle($(this).is(':not(:checked)')); document.getElementById('oegdproptin_changeDelAddress').value=1; });"}]
    [{else}]
       [{oxscript add="$('#showShipAddress').change( function() { $('#GdprShippingAddressOptin').toggle($(this).is(':not(:checked)')); });"}]
    [{/if}]

[{/if}]
