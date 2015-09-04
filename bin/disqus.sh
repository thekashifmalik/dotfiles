#!/bin/sh

mkdir projects

# clone repositories
git clone ssh://git@phabricator.local.disqus.net:69/diffusion/DISQUS/disqus.git projects/disqus
git clone ssh://git@phabricator.local.disqus.net:69/diffusion/OPS/ops.git projects/ops
git clone ssh://git@phabricator.local.disqus.net:69/diffusion/NEXT/next.git projects/next
git clone ssh://git@phabricator.local.disqus.net:69/diffusion/PUPPET/puppet.git projects/puppet

# install and configure arcanist
curl --location https://raw.github.com/disqus/disqus-arcanist/master/getarcanist.sh | sh
cd projects/disqus && arc install-certificate
