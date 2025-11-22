hook.Add( "PreLoadAnimations", "DynaBase.dareloadam", function( gender )
  if gender == WOS_DYNABASE.MALE then
    IncludeModel( "models/player/gorillazdare/anim_gorillaz_am.mdl" )
  elseif gender == WOS_DYNABASE.FEMALE then
    IncludeModel( "models/player/gorillazdare/anim_gorillaz_am.mdl" )
  elseif gender == WOS_DYNABASE.ZOMBIE then
    IncludeModel( "models/player/gorillazdare/anim_gorillaz_am.mdl" )  
  end
end )

hook.Add( "PreLoadAnimations", "DynaBase.dareloadam", function( gender )
  if gender == WOS_DYNABASE.SHARED then
    IncludeModel( "models/player/gorillazdare/anim_gorillaz_am.mdl" )
  end
end )