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
package org::allbinary::logic::java::exception::ExceptionUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = ("ExceptionUtil");

sub _init_fields {
    my ($self) = @_;
    $self->{PRETEND_EXCEPTION} = ("Not Really An Exception");
    $self->{NONE} = "No Stack Trace";
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
        my $bs = 'java::io::ByteArrayOutputStream'->new();
        print(STDERR $e, "\n");
        my $output = $bs->toString();
        if (defined($output)) {
            return ("" . $output);
        }
        return $self->{NONE};
}

# use java::io::ByteArrayOutputStream;

1;

