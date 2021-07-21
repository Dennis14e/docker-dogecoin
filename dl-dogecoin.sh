#!/usr/bin/env sh

DOGECOIN_VERSION="1.14.3"

case `uname -m` in
    x86_64)
        archive="https://github.com/dogecoin/dogecoin/releases/download/v${DOGECOIN_VERSION}/dogecoin-${DOGECOIN_VERSION}-x86_64-linux-gnu.tar.gz"
        ;;

    i386|i686)
        archive="https://github.com/dogecoin/dogecoin/releases/download/v${DOGECOIN_VERSION}/dogecoin-${DOGECOIN_VERSION}-i686-pc-linux-gnu.tar.gz"
        ;;

    armv6l|armv7l)
        archive="https://github.com/dogecoin/dogecoin/releases/download/v${DOGECOIN_VERSION}/dogecoin-${DOGECOIN_VERSION}-arm-linux-gnueabihf.tar.gz"
        ;;

    aarch64)
        archive="https://github.com/dogecoin/dogecoin/releases/download/v${DOGECOIN_VERSION}/dogecoin-${DOGECOIN_VERSION}-aarch64-linux-gnu.tar.gz"
        ;;

    *)
        echo "Unsupported architecture"
        exit 1
esac

wget -O - "$archive" | tar -xvzf - -C /opt

mv dogecoin-* dogecoin
