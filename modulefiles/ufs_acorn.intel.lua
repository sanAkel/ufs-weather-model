help([[
Load environment to build UFS on Acorn with Intel compiler
]])

prepend_path("MODULEPATH", "/lfs/h1/emc/nceplibs/noscrub/spack-stack/spack-stack-1.9.2/envs/ue-intel-19/install/modulefiles/Core")
prepend_path("MODULEPATH", "/lfs/h1/emc/nems/noscrub/georgios.britzolakis/ProgramFiles/modulefiles")

load("stack-intel")
load("stack-cray-mpich")

--Avoid production installations; use spack-stack only:
remove_path("MODULEPATH", "/apps/ops/prod/libs/modulefiles/compiler/intel/19.1.3.304")
remove_path("MODULEPATH", "/apps/ops/prod/libs/modulefiles/mpi/intel/19.1.3.304/cray-mpich/8.1.4")
remove_path("MODULEPATH", "/apps/ops/prod/libs/modulefiles/mpi/intel/19.1.3.304/cray-mpich/8.1.7")
remove_path("MODULEPATH", "/apps/prod/lmodules/intel/19.1.3.304")
remove_path("MODULEPATH", "/apps/prod/lmodules/INTEL_cray_mpich/19.1.3.304/cray-mpich/8.1.4")

load("cmake")
load("ufs_common")

scalasca_ver="scalasca_2.6.2_intel_19.1.3.304"
load(pathJoin("scalasca", scalasca_ver))

setenv("CC", "scorep cc")
setenv("CXX", "scorep CC")
setenv("FC", "scorep ftn")

setenv("I_MPI_F90","scorep ftn")
setenv("SERIAL_FC", "scorep ftn")
setenv("I_MPI_F77", "scorep ftn")
setenv("I_MPI_FC", "scorep ftn")
setenv("SERIAL_F77", "scorep ftn")
setenv("F77", "scorep ftn")

setenv("CMAKE_Platform", "acorn")

setenv("SCOREP_WRAPPER_INSTRUMENTER_FLAGS", "--thread=omp")
setenv("SCOREP_WRAPPER_COMPILER_FLAGS_REJECT", "-MD:-MT:-MF")


whatis("Description: UFS build environment")
