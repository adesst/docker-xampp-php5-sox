#!/bin/bash

/opt/lampp/lampp startapache
/opt/lampp/lampp startmysql

## Run a shell so we don't exit
/bin/sh
