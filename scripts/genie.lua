solution "GLFW"
	configurations {
		"Debug",
		"Release",
		"MinSizeRel",
		"RelWithDebInfo"
	}
	location("../.build")
	platforms { "x32", "x64" }

project "GLFW"
	targetname "glfw3"
	language "C"
	kind "StaticLib"

	includedirs {
		"../include"
	}

	files {
		"../include/GLFW/**",
		"../src/context.c",
		"../src/init.c",
		"../src/input.c",
		"../src/internal.h",
		"../src/mappings.h",
		"../src/monitor.c",
		"../src/window.c",
		"../src/xkb_unicode.c",
		"../src/xkb_unicode.h"
	}

	configuration "Debug"
		defines { "_DEBUG" }
		flags   { "Symbols" }

	configuration "Release"
		defines { "NDEBUG" }
		flags   { "Optimize" }

	configuration "RelMinSize"
		defines { "NDEBUG" }
		flags   { "OptimizeSize" }

	configuration "RelWithDebInfo"
		defines { "NDEBUG" }
		flags   { "Symbols", "Optimize" }

	configuration "windows"
		defines  {
			"_GLFW_WIN32",
			"WIN32",
			"_WINDOWS",
			"_CRT_SECURE_NO_WARNINGS"
		}
		files {
			"../src/wgl_context.c",
			"../src/wgl_context.h",
			"../src/win32_init.c",
			"../src/win32_joystick.c",
			"../src/win32_joystick.h",
			"../src/win32_platform.h",
			"../src/win32_thread.c",
			"../src/win32_time.c",
			"../src/win32_window.c"
		}
		links    { "gdi32" }
