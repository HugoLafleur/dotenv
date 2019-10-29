# !/bin/bash

# SSH
sp () { /usr/bin/ssh -i ~/.ssh/prod.pem -R 52698:localhost:52698 root@"$@"; }
st () { /usr/bin/ssh -i ~/.ssh/test.pem -R 52698:localhost:52698 root@"$@"; }
sd () { /usr/bin/ssh -i ~/.ssh/dev.pem -R 52698:localhost:52698 root@"$@"; }
sro () { /usr/bin/ssh -i ~/.ssh/octavelive-prod.pem root@"$@"; }
sre () { /usr/bin/ssh -i ~/.ssh/octavelive-prod.pem ec2-user@"$@"; }

spc () { HOST="$1"; SRC="$2"; DST="$3"; scp -i ~/.ssh/prod.pem root@"$HOST":"$SRC" "$DST"; }
stc () { HOST="$1"; SRC="$2"; DST="$3"; scp -i ~/.ssh/test.pem root@"$HOST":"$SRC" "$DST"; }
sdc () { HOST="$1"; SRC="$2"; DST="$3"; scp -i ~/.ssh/dev.pem root@"$HOST":"$SRC" "$DST"; }
