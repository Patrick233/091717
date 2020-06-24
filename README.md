A 091717 project that uses Nvida PhysX to build a simulator.

## Building `PhysX`
Add the following line to `<PhysX_ROOT_DIR>/physx/buildtools/presets/public/<linux or mac64>.xml` and rebuild `PhysX`. 
```xml
<cmakeParam name="CMAKE_POSITION_INDEPENDENT_CODE" value="ON" comment="Generate position independent code"/> 
```

## Building you own `cmake` project
For `Ubuntu 18.04`:
```bash
cd project_using_physx/
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
```

For `mac` replace the `cmake` command with:
```bash
cmake -DCMAKE_BUILD_TYPE=Release -DTARGET_PLATFORM=mac -DPhysX_COMPILER=x86_64 -DPhysX_ROOT_DIR=<path to PhysX> ..
```

## Running the snippet
```bash
cd <path to project_using_physx>/build
./SnippetHelloWorldRender 
```
