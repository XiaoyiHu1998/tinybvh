tinybvhIncludes = {}
tinybvhIncludes["glm"] = "../glm"
tinybvhIncludes["GLFW"] = "../GLFW/include"

project "tinybvh"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"
	vectorextensions "AVX2"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-intermediate/" .. outputdir .. "/%{prj.name}")

	files
	{
		"tiny_bvh.h",
		"tiny_bvh_lib.cpp",
	}

	includedirs
	{
		"%{tinybvhIncludes.glm}"
	}

	links
	{

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

project "tinyocl"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"
	vectorextensions "AVX2"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-intermediate/" .. outputdir .. "/%{prj.name}")

	files
	{
		"tiny_ocl.h",
		"tiny_ocl_lib.cpp",
	}

	includedirs
	{
		"external/OpenCL/inc",
		"%{tinybvhIncludes.GLFW}"
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