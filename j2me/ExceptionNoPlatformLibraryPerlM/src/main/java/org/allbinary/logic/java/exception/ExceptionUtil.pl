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
package org::allbinary::logic::java::exception::ExceptionUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = ("ExceptionUtil");

sub _init_fields {
    my ($self) = @_;
    $self->{PRETEND_EXCEPTION} = ("Not Really An Exception");
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::java::exception::ExceptionUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getStackTrace {
    my ($self, $e) = @_;
        die ("RuntimeException");
}


1;

