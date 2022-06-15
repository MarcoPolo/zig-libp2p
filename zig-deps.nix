{ pkgs }:
rec {
  base32 = {
    src = pkgs.fetchFromGitHub {
      owner = "gernest";
      repo = "base32";
      rev = "bde0b9d167446f92bc220084c055687ac65e0800";
      sha256 = "sha256-LmW9Cwlr0yui9ofFytMwVt4eHrqAT8XXUGDak211usg=";
    };
  };

  depsWrapper = pkgs.writeTextFile
    {
      name = "deps.zig";
      text = ''
        const pkgs = struct {
            const base32 = std.build.pkg{
                .name = "base32",
                .path = .{ .path = "${base32.src}/src/base32.zig" },
            };
        };
      '';
    };
  depsJson = pkgs.writeTextFile
    {
      name = "deps.json";
      text = ''
        { "base32": "${base32.src}/src/base32.zig" }
      '';
    };
}
