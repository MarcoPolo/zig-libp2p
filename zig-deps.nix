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

  benchmark = {
    src = pkgs.fetchFromGitHub {
      owner = "Hejsil";
      repo = "zig-bench";
      rev = "f6e73fbad86274899bd2aa9757fe43567b714948";
      sha256 = "sha256-wy1NKGy8Z2a9fIr3drd26lGlJiBblYDMAfw5Aiitkwg=";
    };
  };

  gotta-go-fast = {
    src = pkgs.fetchFromGitHub {
      owner = "ziglang";
      repo = "gotta-go-fast";
      rev = "1cdae5e99e2c93da461c22f3c96debe2d4a7ebec";
      sha256 = "sha256-HLVaqmbJSDcnEf2aAonZFFuC77ur+iP4MiYNucHD6b4=";
    };
  };

  depsJson = pkgs.writeTextFile
    {
      name = "deps.json";
      checkPhase = ''
        chmod 755 $out
      '';
      text = ''
        { 
          "base32": "${base32.src}/src/base32.zig",
          "benchmark": "${benchmark.src}/bench.zig",
          "gotta-go-fast": "${gotta-go-fast.src}/bench.zig"
        }
      '';
    };
}
