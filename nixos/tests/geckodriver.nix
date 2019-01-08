import ./make-test.nix {

  machine =
    { config, pkgs, ... }:
    {
      imports = [ ./common/x11.nix ];

      environment.systemPackages = with pkgs; [
        (
          python3.withPackages(
            ps : [
              ps.selenium
            ]
          )
        )
        geckodriver
        firefox
      ];
    };

  testScript =
    let
      pythonScript =
        ''
        from selenium import webdriver

        webdriver.Firefox()
        '';
    in
      ''
        $machine->waitForX;

        subtest "selenium can launch Firefox", sub {
            $machine->succeed("python3 -c '${pythonScript}'");
            $machine->screenshot("Firefox");
        };
      '';
}
