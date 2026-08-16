class DotnetOutdatedTool < Formula
  desc "Install dotnet-outdated-tool .NET global tool"
  homepage "https://www.nuget.org/packages/dotnet-outdated-tool/"
  url "https://www.nuget.org/api/v2/package/dotnet-outdated-tool/4.8.1"
  sha256 "7f9b2ed5eafed703f7e6bad4dd2faabf07cfa7f0b9e6d47bc59e1bbf8cfbccbd"
  version "4.8.1"

  livecheck do
    url "https://api.nuget.org/v3-flatcontainer/dotnet-outdated-tool/index.json"
    regex(/"([^"\d]+)?v?(\d+(?:\.\d+)+)"/)
  end

  depends_on "dotnet"

  def install
    # NuGet local sources require <id>.<version>.nupkg naming.
    nupkg_dir = buildpath/"nupkg"
    nupkg_dir.mkpath
    package_id = "dotnet-outdated-tool"
    nupkg = nupkg_dir/"#{package_id}.#{version}.nupkg"
    cp cached_download, nupkg

    # Install into libexec so the apphost and .store/ stay co-located.
    # Using bin + env_script_all_files moves only the shim and leaves .store in
    # bin, which breaks the apphost with "application to execute does not exist".
    system "dotnet", "tool", "install", package_id,
           "--tool-path", libexec,
           "--version", version.to_s,
           "--add-source", nupkg_dir

    tool_bin = libexec/"dotnet-outdated"
    target_bin = bin/"dotnet-outdated-tool"
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
        (bin/"dotnet-outdated-tool").write_env_script libexec/"dotnet-outdated",
                                                  DOTNET_ROOT: Formula["dotnet"].opt_libexec,
                                                  DOTNET_ROLL_FORWARD: "LatestMajor"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dotnet-outdated-tool --version")
  end
end
