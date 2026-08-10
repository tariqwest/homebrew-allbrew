class Csharprepl < Formula
  desc "Install CSharpRepl .NET global tool"
  homepage "https://www.nuget.org/packages/CSharpRepl/"
  url "https://www.nuget.org/api/v2/package/CSharpRepl/0.9.2"
  sha256 "bb733046663d90f59477793ccc3dec0cb78d0fcbeab47171f3148f58212f8a79"
  version "0.9.2"

  livecheck do
    url "https://api.nuget.org/v3-flatcontainer/csharprepl/index.json"
    regex(/"([^"\d]+)?v?(\d+(?:\.\d+)+)"/)
  end

  depends_on "dotnet"

  def install
    # NuGet local sources require <id>.<version>.nupkg naming.
    nupkg_dir = buildpath/"nupkg"
    nupkg_dir.mkpath
    package_id = "CSharpRepl"
    nupkg = nupkg_dir/"#{package_id}.#{version}.nupkg"
    cp cached_download, nupkg

    # Install into libexec so the apphost and .store/ stay co-located.
    # Using bin + env_script_all_files moves only the shim and leaves .store in
    # bin, which breaks the apphost with "application to execute does not exist".
    system "dotnet", "tool", "install", package_id,
           "--tool-path", libexec,
           "--version", version.to_s,
           "--add-source", nupkg_dir

    (bin/"csharprepl").write_env_script libexec/"csharprepl",
                                              DOTNET_ROOT: Formula["dotnet"].opt_libexec
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/csharprepl --version")
  end
end
