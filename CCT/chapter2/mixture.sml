abstype Mixture = mix of int * int * int
	with val cement = mix (6,0,0)
	and sand = mix (0,6,0)
	and gravel = mix (0,0,6)
	and mortar = mix (1,5,0)
	and infill = mix (1,2,3)
	fun compoound(parts:int, mix(c,s,g), parts':int, mix(c',s',g')) =
	    let val p = parts + parts'
	    val cp = (parts*c+parts'*c') div p
	    and sp = (parts*s+parts'*s') div p
	    and gp = (parts*g+parts'*g') div p
	in mix(cp,sp,gp) end
end