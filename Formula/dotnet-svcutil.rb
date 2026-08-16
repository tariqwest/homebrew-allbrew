class DotnetSvcutil < Formula
  desc "Install dotnet-svcutil .NET global tool"
  homepage "https://www.nuget.org/packages/dotnet-svcutil/"
  url "https://www.nuget.org/api/v2/package/dotnet-svcutil/8.0.0"
  sha256 "b889780662e42d0e132e91c1821d1dcf810728a3775af226a1c8cca0ea6a2d8a"
  version "8.0.0"

  livecheck do
    url "https://api.nuget.org/v3-flatcontainer/dotnet-svcutil/index.json"
    regex(/"([^"\d]+)?v?(\d+(?:\.\d+)+)"/)
  end

  depends_on "dotnet"

  def install
    # NuGet local sources require <id>.<version>.nupkg naming.
    nupkg_dir = buildpath/"nupkg"
    nupkg_dir.mkpath
    package_id = "dotnet-svcutil"
    nupkg = nupkg_dir/"#{package_id}.#{version}.nupkg"
    cp cached_download, nupkg

    # Install into libexec so the apphost and .store/ stay co-located.
    # Using bin + env_script_all_files moves only the shim and leaves .store in
    # bin, which breaks the apphost with "application to execute does not exist".
    system "dotnet", "tool", "install", package_id,
           "--tool-path", libexec,
           "--version", version.to_s,
           "--add-source", nupkg_dir

    tool_bin = libexec/"dotnet-svcutil"
    target_bin = bin/"dotnet-svcutil"
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
        (bin/"dotnet-svcutil").write_env_script libexec/"dotnet-svcutil",
                                                  DOTNET_ROOT: Formula["dotnet"].opt_libexec,
                                                  DOTNET_ROLL_FORWARD: "LatestMajor"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dotnet-svcutil --version")
  end
end
