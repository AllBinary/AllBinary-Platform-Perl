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

package org::allbinary::logic::java::bool::BooleanFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::java::bool::BooleanFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{TRUE} = 1;
    $self->{FALSE} = 0;
    $self->{TRUE_STRING} = ($self->{TRUE} ? "true" : "false");
    $self->{FALSE_STRING} = ($self->{FALSE} ? "true" : "false");
    $self->{YES} = "yes";
    $self->{NO} = "no";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::java::bool::BooleanFactory::instance;
}


sub toStringb {
    my ($self, $bool) = @_;
        if ($bool) {
            return $self->{TRUE_STRING};
        } else {
            return $self->{FALSE_STRING};
        }
}

use java::lang::Object ();
use java::lang::LazyStatic ();

1;

