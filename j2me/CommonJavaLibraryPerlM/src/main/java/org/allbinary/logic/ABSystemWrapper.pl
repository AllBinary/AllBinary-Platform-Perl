# 
# AllBinary Open License Version 1 
# Copyright (c) 2026 AllBinary 
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

package org::allbinary::logic::ABSystemWrapper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();

our $instance = 'org::allbinary::logic::ABSystemWrapper'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::ABSystemWrapper::instance;
}


sub arraycopy {
    my ($self, $src, $srcPos, $dest, $destPos, $length) = @_;
        @{$dest}[$destPos .. $destPos + $length - 1] = @{$src}[$srcPos .. $srcPos + $length - 1];
}


sub currentTimeMillis {
    my ($self) = @_;
        return int(Time::HiRes::time() * 1000);
}

# use jsinterop::annotations::JsType;
use java::lang::System;

1;

