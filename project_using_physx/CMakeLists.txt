cmake_minimum_required(VERSION 3.13)
project(hello_physx)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
MESSAGE("CMAKE_MODULE_PATH:" ${CMAKE_MODULE_PATH})

set(CMAKE_CXX_FLAGS "-Wl,--no-as-needed -ldl -lpthread")
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(PhysX REQUIRED)

add_executable(SnippetHelloWorld
    ./source/SnippetUtils.cpp
    ./source/ClassicMain.cpp
    ./source/SnippetHelloWorld.cpp
    )
target_include_directories(SnippetHelloWorld PUBLIC 
    include
    ${PhysX_INCLUDE_DIRS}
)
target_link_libraries(SnippetHelloWorld PUBLIC
    ${PhysX_LIBS}
)

# Render Example
find_package(OpenGL REQUIRED)
find_package(GLUT REQUIRED)

add_library(SnippetCameraRender
    ./source/SnippetCamera.cpp
    ./source/SnippetRender.cpp
    )
target_include_directories(SnippetCameraRender PUBLIC ./include)
target_link_libraries(SnippetCameraRender PUBLIC
    ${PhysX_LIBS})
target_link_libraries(SnippetCameraRender PUBLIC
    ${OPENGL_LIBRARIES}
    ${GLUT_LIBRARY}
    )

add_executable(SnippetHelloWorldRender
    ./source/ClassicMain.cpp
    ./source/SnippetHelloWorld.cpp
    ./source/SnippetHelloWorldRender.cpp
    )
target_compile_definitions(SnippetHelloWorldRender PRIVATE RENDER_SNIPPET)
target_include_directories(SnippetHelloWorldRender PRIVATE ./include)
target_link_libraries(SnippetHelloWorldRender PRIVATE SnippetCameraRender ${PhysX_LIBS})
