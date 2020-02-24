#!/usr/bin/env ruby
raw = ARGV[0].scan(/(from:)(\+?[A-Za-z0-9]+)(...)(to:)(\+?[A-Za-z0-9]+)(...)(flags:)((-?[0|1]:?)+)/)
puts raw[0][1] + "," + raw[0][4] + "," + raw[0][7]
