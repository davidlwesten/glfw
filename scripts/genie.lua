-- select sdk version, genie defaults to 8.1
if _ACTION == "vs2017" then
	local action = premake.action.current()
	action.vstudio.windowsTargetPlatformVersion="10.0.17763.0"
end

solution "glfw"
	configurations {
		"Debug",
		"Release"
	}
	location("../.build")
	platforms { "x32", "x64" }

project "glfw"
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

	targetdir "../.build/lib"

	configuration "Debug"
		defines { "_DEBUG" }
		flags   { "Symbols" }

	configuration "Release"
		defines { "NDEBUG" }
		flags   { "Optimize" }

	configuration { "x32", "Debug" }
		targetsubdir "x86/Debug"
	
	configuration { "x32", "Release" }
		targetsubdir "x86/Release"

	configuration { "x64", "Debug" }
		targetsubdir "x64/Debug"

	configuration { "x64", "Release" }
		targetsubdir "x64/Release"

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
		flags { "FullSymbols" }
		links    { "gdi32" }
