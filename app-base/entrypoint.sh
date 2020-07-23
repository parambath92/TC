#!/bin/bash
rails cequel:keyspace:create
rails cequel:migrate
rails s -b 0.0.0.0
