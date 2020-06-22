A 091717 project that uses Nvida PhysX to build a simulator.

## Building `PhysX`
Add the following line to `<PhysX_ROOT_DIR>/physx/buildtools/presets/public/<linux or mac64>.xml` and rebuild `PhysX`. 
```xml
<cmakeParam name="CMAKE_POSITION_INDEPENDENT_CODE" value="ON" comment="Generate position independent code"/> 
```

## Building you own `cmake` project
```bash
cd project_using_physx/
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
```
For machine other than `Ubuntu 18.04`, look for `project_using_physx/cmake/FindPhysX.cmake` and set the flags below according to your setup.
* TARGET_PLATFORM
* PhysX_COMPILER
* PhysX_ROOT_DIR
* PhysX_INSTALL_DIR
