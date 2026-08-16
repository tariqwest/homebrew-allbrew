class DotnetStryker < Formula
  desc "Install dotnet-stryker .NET global tool"
  homepage "https://www.nuget.org/packages/dotnet-stryker/"
  url "https://www.nuget.org/api/v2/package/dotnet-stryker/4.16.0"
  sha256 "6a71a817b67ae06a128d5edad93ebd35bbf549eb233e30d82c92408627694440"
  version "4.16.0"

  livecheck do
    url "https://api.nuget.org/v3-flatcontainer/dotnet-stryker/index.json"
    regex(/"([^"\d]+)?v?(\d+(?:\.\d+)+)"/)
  end

  depends_on "dotnet"

  def install
    # NuGet local sources require <id>.<version>.nupkg naming.
    nupkg_dir = buildpath/"nupkg"
    nupkg_dir.mkpath
    package_id = "dotnet-stryker"
    nupkg = nupkg_dir/"#{package_id}.#{version}.nupkg"
    cp cached_download, nupkg

    # Install into libexec so the apphost and .store/ stay co-located.
    # Using bin + env_script_all_files moves only the shim and leaves .store in
    # bin, which breaks the apphost with "application to execute does not exist".
    system "dotnet", "tool", "install", package_id,
           "--tool-path", libexec,
           "--version", version.to_s,
           "--add-source", nupkg_dir

    tool_bin = libexec/"dotnet-stryker"
    target_bin = bin/"dotnet-stryker"
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
        (bin/"dotnet-stryker").write_env_script libexec/"dotnet-stryker",
                                                  DOTNET_ROOT: Formula["dotnet"].opt_libexec,
                                                  DOTNET_ROLL_FORWARD: "LatestMajor"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dotnet-stryker --version")
  end
end
