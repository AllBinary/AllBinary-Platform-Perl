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
package org::allbinary::logic::communication::log::LogUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::log::LogUtil'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::log::LogUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub putL {
    my ($self, $log) = @_;
        die ("RuntimeException");
}


sub putF {
    my ($self, $specialMessage, $anyType, $functionName) = @_;
}


# Java overloaded method: Perl keeps the last definition
sub putF {
    my ($self, $specialMessage, $className, $functionName) = @_;
}


sub put {
    my ($self, $specialMessage, $anyType, $functionName, $exception) = @_;
        die ("RuntimeException");
}


1;

