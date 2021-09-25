#!/bin/bash

echo "export PATH=\"$HOME/.local/bin:$PATH\"" >> ~/.zshrc
echo "export PATH=\"$HOME/.local/bin:$PATH\"" >> ~/.bashrc
echo "export PATH=\"$HOME/.local/bin:$PATH\"" >> ~/.profile

export PATH="$HOME/.local/bin:$PATH"

# The above line made me go scratching my head for a while, eventhough I myself had written it.
sed "s/=\".*\"/=\"$(echo $PATH | sed 's/\//\\\//g')\"/" < /etc/sudoers > /tmp/sudoers.tmp
visudo -c -f /tmp/sudoers.tmp
if [ "$?" -eq "0" ]; then
    mv /tmp/sudoers.tmp /etc/sudoers
fi

curl -sL https://github.com/penetrarnya-tm/WeaponizeKali.sh/raw/main/WeaponizeKali.sh | bash -s -- -idtw

rm /meta.sh
