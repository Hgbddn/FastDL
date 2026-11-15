hook.Add( "PreLoadAnimations", "DynaBase.wosloadam", function( gender )
  if gender == WOS_DYNABASE.MALE or gender == WOS_DYNABASE.FEMALE or gender == WOS_DYNABASE.ZOMBIE or gender == WOS_DYNABASE.SHARED then
    IncludeModel( "models/player/wiltos/amod_wos_pack.mdl" )
    IncludeModel( "models/player/wiltos/amod_wos_pack_2.mdl" )
  end
end )