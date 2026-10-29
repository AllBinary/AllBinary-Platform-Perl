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

#ActualPlatform
package org::allbinary::logic::system::os::SystemProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::os::SystemProperties'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{OS_NAME} = "os.name";
    $self->{OS_ARCH} = "os.arch";
    $self->{OS_VERSION} = "os.version";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::os::SystemProperties::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getName {
    my ($self) = @_;
        return 'java::lang::System'->getProperty($self->{OS_NAME});
}


sub getArch {
    my ($self) = @_;
        return 'java::lang::System'->getProperty($self->{OS_ARCH});
}


sub getVersion {
    my ($self) = @_;
        return 'java::lang::System'->getProperty($self->{OS_VERSION});
}


sub getUserHomePath {
    my ($self) = @_;
        die ("RuntimeException");
}

use java::lang::System;

1;

