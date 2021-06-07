#!/usr/bin/env sh

case `uname -m` in
    x86_64)
        archive="https://github.com/dogecoin/dogecoin/releases/download/v1.14.3/dogecoin-1.14.3-x86_64-linux-gnu.tar.gz"
        ;;

    i386|i686)
        archive="https://github.com/dogecoin/dogecoin/releases/download/v1.14.3/dogecoin-1.14.3-i686-pc-linux-gnu.tar.gz"
        ;;

    armv6l|armv7l)
        archive="https://github.com/dogecoin/dogecoin/releases/download/v1.14.3/dogecoin-1.14.3-arm-linux-gnueabihf.tar.gz"
        ;;

    aarch64)
        archive="https://github.com/dogecoin/dogecoin/releases/download/v1.14.3/dogecoin-1.14.3-aarch64-linux-gnu.tar.gz"
        ;;

    *)
        echo "Unsupported architecture"
        exit 1
esac

curl -s "$archive" | tar -xvz - -C /opt

mv dogecoin-* dogecoin
