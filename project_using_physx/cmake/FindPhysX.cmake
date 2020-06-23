
set(TARGET_PLATFORM "linux" CACHE STRING "Platform")
message("TARGET_PLATFORM: " ${TARGET_PLATFORM})

set(PhysX_COMPILER  "clang" CACHE STRING "Compiler to build the PhysX")
message("PhysX_COMPILER: " ${PhysX_COMPILER})

set(PhysX_ROOT_DIR  "$ENV{HOME}/PhysX" CACHE STRING "")
message("PhysX_ROOT_DIR: " ${PhysX_ROOT_DIR})

# Find include paths
find_path(PhysX_INCLUDE_DIR PxPhysicsAPI.h
    PATHS ${PhysX_ROOT_DIR}/physx/include/
)
message("PhysX_INCLUDE_DIR: " ${PhysX_INCLUDE_DIR})

find_path(PhysX_FOUNDATION_INCLUDE_DIR PsAtomic.h
    PATHS ${PhysX_ROOT_DIR}/physx/source/foundation/include
)
message("PhysX_FOUNDATION_INCLUDE_DIR: " ${PhysX_FOUNDATION_INCLUDE_DIR})

find_path(PhysX_SHARED_INCLUDE_DIR foundation/PxTransform.h
    PATHS ${PhysX_ROOT_DIR}/pxshared/include
)
message("PhysX_SHARED_INCLUDE_DIR: " ${PhysX_SHARED_INCLUDE_DIR})

# !Not a nice solution. Need to improve.
include_directories(
    ${PhysX_INCLUDE_DIR} 
    ${PhysX_SHARED_INCLUDE_DIR}
    ${PhysX_FOUNDATION_INCLUDE_DIR}
)

# Find libraries
find_library(PhyX_CHARACTER_LIB 
    NAMES libPhysXCharacterKinematic_static_64.a
    PATHS ${PhysX_ROOT_DIR}/physx/bin/${TARGET_PLATFORM}.${PhysX_COMPILER}/release
)

find_library(PhyX_COMMON_LIB 
    NAMES libPhysXCommon_static_64.a
    PATHS ${PhysX_ROOT_DIR}/physx/bin/${TARGET_PLATFORM}.${PhysX_COMPILER}/release
)

find_library(PhyX_COOKING_LIB 
    NAMES libPhysXCooking_static_64.a
    PATHS ${PhysX_ROOT_DIR}/physx/bin/${TARGET_PLATFORM}.${PhysX_COMPILER}/release
)

find_library(PhyX_EXTENTIONS_LIB 
    NAMES libPhysXExtensions_static_64.a
    PATHS ${PhysX_ROOT_DIR}/physx/bin/${TARGET_PLATFORM}.${PhysX_COMPILER}/release
)

find_library(PhyX_FOUNDATION_LIB 
    NAMES libPhysXFoundation_static_64.a
    PATHS ${PhysX_ROOT_DIR}/physx/bin/${TARGET_PLATFORM}.${PhysX_COMPILER}/release
)

find_library(PhyX_PVDSDK_LIB 
    NAMES libPhysXPvdSDK_static_64.a
    PATHS ${PhysX_ROOT_DIR}/physx/bin/${TARGET_PLATFORM}.${PhysX_COMPILER}/release
)

find_library(PhyX_LIB 
    NAMES libPhysX_static_64.a
    PATHS ${PhysX_ROOT_DIR}/physx/bin/${TARGET_PLATFORM}.${PhysX_COMPILER}/release
)

find_library(PhyX_VEHICLE_LIB 
    NAMES libPhysXVehicle_static_64.a
    PATHS ${PhysX_ROOT_DIR}/physx/bin/${TARGET_PLATFORM}.${PhysX_COMPILER}/release
)

set(PhysX_LIBS 
    ${PhyX_LIB}
    ${PhyX_PVDSDK_LIB}
    ${PhyX_VEHICLE_LIB}
    ${PhyX_CHARACTER_LIB}
    ${PhyX_EXTENTIONS_LIB}
    ${PhyX_COOKING_LIB}
    ${PhyX_COMMON_LIB}
    ${PhyX_FOUNDATION_LIB}
)

