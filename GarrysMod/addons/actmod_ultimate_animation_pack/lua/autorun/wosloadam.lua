hook.Add( "PreLoadAnimations", "DynaBase.wosloadam", function( gender )
  if gender == WOS_DYNABASE.MALE then
    IncludeModel( "models/player/wiltos/amod_wos_pack.mdl" )
    IncludeModel( "models/player/wiltos/amod_wos_pack_2.mdl" )
  elseif gender == WOS_DYNABASE.FEMALE then
    IncludeModel( "models/player/wiltos/amod_wos_pack.mdl" )
    IncludeModel( "models/player/wiltos/amod_wos_pack_2.mdl" )
  elseif gender == WOS_DYNABASE.ZOMBIE then
    IncludeModel( "models/player/wiltos/amod_wos_pack.mdl" )
    IncludeModel( "models/player/wiltos/amod_wos_pack_2.mdl" )  
  end
end )

hook.Add( "PreLoadAnimations", "DynaBase.wosloadam", function( gender )
  if gender == WOS_DYNABASE.SHARED then
    IncludeModel( "models/player/wiltos/amod_wos_pack.mdl" )
    IncludeModel( "models/player/wiltos/amod_wos_pack_2.mdl" )
  end
end )