class DotnetProjectLicenses < Formula
  desc "Install dotnet-project-licenses .NET global tool"
  homepage "https://www.nuget.org/packages/dotnet-project-licenses/"
  url "https://www.nuget.org/api/v2/package/dotnet-project-licenses/2.7.1"
  sha256 "410cd3d7dd260124ff2525c6a7720cdb14eb424faee577753e406ebdb27a22ab"
  version "2.7.1"

  livecheck do
    url "https://api.nuget.org/v3-flatcontainer/dotnet-project-licenses/index.json"
    regex(/"([^"\d]+)?v?(\d+(?:\.\d+)+)"/)
  end

  depends_on "dotnet"

  def install
    # NuGet local sources require <id>.<version>.nupkg naming.
    nupkg_dir = buildpath/"nupkg"
    nupkg_dir.mkpath
    package_id = "dotnet-project-licenses"
    nupkg = nupkg_dir/"#{package_id}.#{version}.nupkg"
    cp cached_download, nupkg

    # Install into libexec so the apphost and .store/ stay co-located.
    # Using bin + env_script_all_files moves only the shim and leaves .store in
    # bin, which breaks the apphost with "application to execute does not exist".
    system "dotnet", "tool", "install", package_id,
           "--tool-path", libexec,
           "--version", version.to_s,
           "--add-source", nupkg_dir

    tool_bin = libexec/"dotnet-project-licenses"
    target_bin = bin/"dotnet-project-licenses"
    if tool_bin.exist?
      target_bin.write_env_script tool_bin,
                                 DOTNET_ROOT: Formula["dotnet"].opt_libexec,
                                 DOTNET_ROLL_FORWARD: "LatestMajor"
    else
      installed = Dir[libexec/"*"].find { |f| File.executable?(f) && !File.directory?(f) }
      if installed
        target_bin.write_env_script installed,
                                   DOTNET_ROOT: Formula["dotnet"].opt_libexec,
                                   DOTNET_ROLL_FORWARD: "LatestMajor"
      else
        (bin/"dotnet-project-licenses").write_env_script libexec/"dotnet-project-licenses",
                                                  DOTNET_ROOT: Formula["dotnet"].opt_libexec,
                                                  DOTNET_ROLL_FORWARD: "LatestMajor"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dotnet-project-licenses --version")
  end
end
