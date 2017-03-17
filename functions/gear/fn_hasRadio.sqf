_ret = ( "ItemRadio" in linkItems player || { addonTFAR && { ARTR_TF_defaultBackpack in (items player) || { {_x in linkItems player} count ARTR_TF_defaultRadios > 0 } } } );

_ret;
