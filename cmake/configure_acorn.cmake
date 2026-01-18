set(PARALLEL_NETCDF ON  CACHE BOOL "Enable parallel NetCDF" FORCE)
set(AVX2            ON  CACHE BOOL "Enable AVX2 instruction set" FORCE)

if(FASTER)
  set(DISABLE_FMA OFF  CACHE BOOL "Disable Fused Multiply-Add instructions (workaround needed for AMD EPYC)" FORCE)
endif()
