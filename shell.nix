{pkgs ? import <nixpkgs> {}}:

let
  ruby = pkgs.ruby_3_1;
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    ruby
    bundler
    nodejs
    pkg-config
    openssl
    zlib
  ];

  shellHook = ''
    # Clear any existing Ruby/Bundler environment variables
    unset GEM_HOME
    unset GEM_PATH
    unset BUNDLE_PATH
    unset BUNDLE_GEMFILE
    
    # Set up clean environment
    export GEM_HOME="$PWD/.gems"
    export GEM_PATH="$GEM_HOME"
    export PATH="$GEM_HOME/bin:$PATH"
    export BUNDLE_PATH="$GEM_HOME"
    
    # Remove existing Gemfile.lock and gems to ensure clean state
    rm -f Gemfile.lock
    rm -rf .gems
    
    # Install a fresh version of Bundler
    gem install bundler --no-document
    
    # Install dependencies
    bundle install

    echo "Jekyll development environment ready!"
    echo "To start the server, run: bundle exec jekyll serve"
  '';

  # Ensure we use UTF-8 encoding
  LANG = "en_US.UTF-8";
}