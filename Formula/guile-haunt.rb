class GuileHaunt < Formula
  desc "a simple, functional, hackable static site generator that gives authors the ability to treat websites as Scheme programs"
  homepage "https://dthompson.us/projects/haunt.html"
  url "https://files.dthompson.us/haunt/haunt-0.2.6.tar.gz"
  sha256 "bcf28b43d84325d8a61005f02011a045195e7ccf3fefbc4542823ed09fe590db"
  license "GPLv3+"

  head do
    url "https://git.dthompson.us/haunt.git"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "gettext" => :build
  end

  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "bdw-gc"
  depends_on "gmp"
  depends_on "guile-commonmark"
  depends_on "guile@2"

  def install
    ENV.deparallelize
    ENV['GUILE_AUTO_COMPILE'] = '0'
    ENV['GUILE_LOAD_PATH'] = '/opt/homebrew/share/guile/site/2.2'

    system "./bootstrap" unless build.stable?
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "false"
  end
end
