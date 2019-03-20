# Splunk Vagrant

This is a super quick and barebones way to get up an running with Splunk.

This is handy for an impromptu demo or maybe for a home lab.

**Note:** The resulting Splunk installation will come up with terrible default credentials.  You should change them.  You have been warned.

# What Prerequisites Do I Need?

 1. [Vagrant](https://www.vagrantup.com/), of course.
 2. Vagrant depends on [VirtualBox](https://www.virtualbox.org/), so
        you'll need that too.
 3. A Splunk Account, so that you can download the Free Splunk Enterprise rpm.  You get both of those things at [https://www.splunk.com/en_us/download/splunk-enterprise.html](https://www.splunk.com/en_us/download/splunk-enterprise.html) .
 4. Make sure you download the Splunk rpm to the same directory as this Vagrantfile

# What Do I Need to Change in The Vagrantfile?

Make sure to change the following line, so that the name of the rpm matches the one you downloaded:

    F=splunk-7.2.3-06d57c595b80-linux-2.6-x86_64.rpm

It goes without saying, but a typo here will prevent the Vagrantfile from actually installing Splunk.

Depending on your environment, you will likely have to change which network interface that you want Vagrant to bridge.  So, instead of:

    config.vm.network "public_network", :bridge => "eno1"

*eno1* may have to change to...whatever your NIC is called.

# Then What?

That's it!
Open a terminal, change to this directory, where the Vagrantfile is and:

    vagrant up

After a few minutes, the terminal should tell you where to access your new Splunk installation.

Default credentials are:
 - **Username:** admin
 - **Password:** password

