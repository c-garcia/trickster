#!/bin/sh
npx mb start --allowInjection > /var/log/mountebank.log 2>&1 &
exec /bin/sh -c "$@"
