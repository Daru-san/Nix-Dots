{ ... }:
  # with pkgs;
  with import <nixpkgs> {};
   let
        # pkgs = import nixpkgs {
             # system = "x86_64-linux";
           # };
        mkDerivation = pkgs.libsForQt5.callPackage ({ mkDerivation }: mkDerivation) {};
        in mkDerivation rec {
          # buildCommand = ''
          #    touch $out
          #     '';
        pname = "whatsie";
        version = "4.14.1";
         src = pkgs.fetchFromGitHub {
        owner = "keshavbhatt";
        repo = pname;
         rev = "v${version}";
       sha256 = "+Y6HaxwfsDo8+Zz1tSF606zHSWq3tdPRuIssDhlIIRg=";
  };

  nativeBuildInputs = with pkgs; [ libsForQt5.qt5.qtbase libsForQt5.qt5.qtwebengine];
  # buildInputs = [ wrapQtAppsHook ];

  postUnpack = ''
    export sourceRoot=$sourceRoot/src
  '';

    # defaultPackage.x86_64-linux = self.packages.x86_64-linux.whatsie; # <- add this
}

