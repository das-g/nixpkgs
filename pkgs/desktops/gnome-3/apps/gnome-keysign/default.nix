{ lib, pythonPackages, fetchFromGitHub }:

pythonPackages.buildPythonApplication rec {
  pname = "gnome-keysign";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "GNOME-Keysign";
    repo = pname;
    rev = version;
    sha256 = "0iy70dskd7wly37lpb2ypd9phhyml5j3c7rzajii4f2s7zgb3abg";
  };

  buildInputs = with pythonPackages; [
    lxml
    Babel
  ];

  propagatedBuildInputs = with pythonPackages; [ 
    requests
    qrcode
    twisted
    future
    magic-wormhole
    gst-python
    pycairo
  ];

  checkInputs = with pythonPackages; [
    nose
    tox
    pycodestyle
    pylint
  ];

  meta = with lib; {
    homepage = https://wiki.gnome.org/Apps/Keysign;
    description = "OpenPGP Keysigning helper";
    license = licenses.gpl3;
    maintainers = with maintainers; [ das-g ];
  };
}
