class GuileCommonmark < Formula
  desc "Implementation of CommonMark for Guile"
  homepage "https://github.com/OrangeShark/guile-commonmark"
  url "https://github.com/OrangeShark/guile-commonmark/releases/download/v0.1.2/guile-commonmark-0.1.2.tar.gz"
  license "LGPL-3.0"
  sha256 "56d518ece5e5d94c1b24943366149e9cb0f6abdb24044c049c6c0ea563d3999e"

  head do
    url "https://github.com/OrangeShark/guile-commonmark", branch: "master"
    sha256 "85815470e3d9b42c8b6ab5fd0b092e1c05bc9a015dd4a08d1ff75a07b0b02599"


    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "gettext" => :build
    uses_from_macos "flex" => :build
  end

  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "bdw-gc"
  depends_on "gmp"
  depends_on "guile" unless build.stable?
  depends_on "guile@2" if build.stable?
  depends_on "libffi"
  depends_on "libtool"
  depends_on "libunistring"
  depends_on "pkg-config" # guile-config is a wrapper around pkg-config.
  depends_on "readline"

  def install
    system "autoreconf", "-vif" unless build.stable?
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make", "install"
  end

  test do
    system "false"
  end
end
