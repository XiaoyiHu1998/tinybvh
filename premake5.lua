tinybvhIncludes = {}
tinybvhIncludes["glm"] = "../glm"

project "tinybvh"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-intermediate/" .. outputdir .. "/%{prj.name}")

	files
	{
		"tiny_bvh.h",
		"tiny_ocl.h",
		"tiny_bvh_lib.cpp",
	}

	includedirs
	{
		"external/OpenCL/inc",
		"%{tinybvhIncludes.glm}"
	}

	links
	{
		"external/OpenCL/lib/OpenCL.lib"
	}
    
	filter "configurations:Debug"
		defines "HZ_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "HZ_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "HZ_DIST"
		runtime "Release"
		optimize "on"