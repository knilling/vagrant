#!/bin/bash

wget --quiet https://pypi.python.org/packages/e7/a8/7556133689add8d1a54c0b14aeff0acb03c64707ce100ecd53934da1aa13/pip-8.1.2.tar.gz
wget --quiet https://slackbuilds.org/slackbuilds/14.2/python/pip.tar.gz
tar xzf pip.tar.gz 
mv pip-8.1.2.tar.gz pip
pushd pip
./pip.SlackBuild 
installpkg --terse /tmp/pip-8.1.2-i586-1_SBo.tgz 
popd
rm -rf /tmp/pip-8.1.2-i586-1_SBo.tgz pip*
pip install doormouse
pip install django 
wget --quiet fastdl.mongodb.org/linux/mongodb-linux-i686-3.2.10.tgz
tar xzf mongodb-linux-i686-3.2.10.tgz 
pushd mongodb-linux-i686-3.2.10
mkdir -p /data/db/
chown vagrant /data/db 
bin/mongod --storageEngine=mmapv1 --fork --logpath /var/log/monogd.log
popd
pip install pymongo
wget --quiet https://doormouse.io/doormouse-platform.tar.gz
tar xzf doormouse-platform.tar.gz 
pushd doormouse-platform/src/
python manage.py migrate
expect <<'EXPECT_SCRIPT'
set timeout 5
spawn python manage.py createsuperuser
expect "Username:" { send "vagrant\n" }
expect "Email address:" { send "vagrant@foobarbaz99.com\n" }
expect "Password:" { send "password\n" }
expect "Password (again):" { send "password\n" }
EXPECT_SCRIPT
popd
echo "Still need to manually do the following:"
echo ""
echo "pushd doormouse-platform/src/"
echo "python manage.py runserver 0.0.0.0:80"
echo ""