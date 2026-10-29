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

#NoPlatform
package org::allbinary::logic::system::os::SystemProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::os::SystemProperties'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::os::SystemProperties::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getName {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getArch {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getVersion {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getUserHomePath {
    my ($self) = @_;
        die ("RuntimeException");
}


1;

