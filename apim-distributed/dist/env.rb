# Copyright 2008 Tim Dysinger
# Distributed under the same license as Facter
#
require 'facter'
ENV.each do |k,v| 
  Facter.add("#{k.downcase}".to_sym) do 
    setcode do 
      v
    end
  end
end

