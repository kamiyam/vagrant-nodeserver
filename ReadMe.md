vagrant-node-server
---

# setup

    $ cp Vagrantfile.sample Vagrantfile
    $ cp config.sample config
    $ vagrant up


access to [http://localhost:4567](http://localhost:4567)

"hello world" Sample Server is starting



## Attribute

### sample

    {
        "node-simple-server":{
            "server_dir": "/var/node",
            "listen_ports": 3000,
            // package.json
            "apps"{
                "name": "simple-server",
                "version": "0.0.0",,
                "description": "",
                "main": "app.js",
                "scripts":{
                    "preinstall": "sudo npm i -g forever",
                    "start": "sudo forever start app.js",
                    "test": "npm debug"
                },
                "repository": "",
                "author": "",
                "license": "BSD"

            }

        }
    }

## extension

If you want to install their own original recipe, and place to site-cookbooks

