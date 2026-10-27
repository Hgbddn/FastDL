hook.Add( "PreLoadAnimations", "DynaBase.gatopackloadanims", function( gender )
  if gender == WOS_DYNABASE.MALE then
    IncludeModel( "models/player/anims/amod_gatopack_emotes.mdl" )
  elseif gender == WOS_DYNABASE.FEMALE then
    IncludeModel( "models/player/anims/amod_gatopack_emotes.mdl" )
  elseif gender == WOS_DYNABASE.ZOMBIE then
    IncludeModel( "models/player/anims/amod_gatopack_emotes.mdl" )  
  end
end )