# ChefDK Packer Inspec Example

[ChefDK](https://downloads.chef.io/chefdk) (aka The Chef Development Kit)
contains all the tools you need to develop and test your infrastructure,
 built by the awesome Chef community.  We will be using chef-solo, test-kitchen
 and berks in this demo.

[Packer](http://www.packer.io/) is a tool for creating machine and container
images for multiple platforms from a single source configuration. But it doesn't
 natively support a testing framework...

[Inspec](http://inspec.io/) is an open-source testing framework for infrastructure
 with a human-readable language for specifying compliance, security and other
 policy requirements. Easily integrate automated tests that check for adherence
 to policy into any stage of your deployment pipeline.

This repo is an example workflow of how a person could use ChefDK+Kitchen+Inspec to
build and test locally, then have your pipeline use packer+berks+chef-solo+Inspec
to bake, test, and upload it.


## Installation

First you need to install [ChefkDK](https://downloads.chef.io/chefdk).

Next install [Packer](http://www.packer.io/intro/getting-started/setup.html).

In this example, I also used [Vagrant](https://www.vagrantup.com/downloads.html)
and [Oracle Virtual Box](https://www.virtualbox.org/wiki/Downloads), but you
could just as easily update the .kitchen.yml to use Docker or almost any other
cloud provider.

## Configuration

You will need to have an account setup on Google Cloud and a ssh key configured for it.

Then, you will need to update the project_id value in the builders section of
the gce-centos.json with your own project_id from Google Cloud.

    "project_id": "insert_your_gce_project_id_here"

## Usage

First download this repo!

Next, run all of the steps from inside the fastrobot_centos_base_example directory

* test the cookbooks with kitchen:

    ```kitchen test```

* run packer to verify that the new image is not published:

    ```packer build gce-centos.json```

* update the default recipe to allow the test to pass:

    ```package %w( tmux sysstat tree )```

* re-run test-kitchen to verify everything works:

    ```kitchen test```

* re-run packer to publish your new image:

    ```packer build gce-centos.json```

This should build our new instance, run the tests, and publish a new Machine Image
in Google Cloud.
