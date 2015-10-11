#!/usr/bin/env sh
set -e

run_rake() {
    echo "Running $1";
    cd "$1";
    bundle install;
    bundle exec rake;
    cd ..;
}

run_rake ejemplo_banco
run_rake chopper
run_rake rock-paper-scissors
run_rake battleship
