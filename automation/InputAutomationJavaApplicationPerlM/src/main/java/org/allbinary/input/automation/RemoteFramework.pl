#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

# Java interface
package org::allbinary::input::automation::RemoteFramework;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub connect {
    my ($self, $host) = @_;
    die "abstract method connect";
}


sub disconnect {
    my ($self, $bc) = @_;
    die "abstract method disconnect";
}


sub getSystemProperties {
    my ($self, $bc) = @_;
    die "abstract method getSystemProperties";
}

# use java::util::Map;
use org::osgi::framework::BundleContext;

1;

