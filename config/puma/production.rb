#!/usr/bin/env puma
# frozen_string_literal: true

# Puma production configuration

# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum, this matches the default thread size of Active Record.
#
threads_count = 5
threads threads_count, threads_count

bind 'tcp://localhost:8081'

workers 4

pidfile '/home/rails_services/rails_services.pid'
