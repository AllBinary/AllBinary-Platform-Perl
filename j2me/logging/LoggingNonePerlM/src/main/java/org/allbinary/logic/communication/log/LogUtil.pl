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
package org::allbinary::logic::communication::log::LogUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::log::LogUtil'->new() };


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::log::LogUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub putP {
    my ($self, $log) = @_;
}


sub putF {
    my ($self, $specialMessage, $anyType, $functionName) = @_;
}


sub putFS {
    my ($self, $specialMessage, $className, $functionName) = @_;
}


sub put {
    my ($self, $specialMessage, $anyType, $functionName, $exception) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();

1;

