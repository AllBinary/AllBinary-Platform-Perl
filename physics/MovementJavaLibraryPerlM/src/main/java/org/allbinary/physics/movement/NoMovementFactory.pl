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

package org::allbinary::physics::movement::NoMovementFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::physics::movement::NoMovementFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{movement} = 'org::allbinary::physics::movement::Movement'->new();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::physics::movement::NoMovementFactory::instance;
}


sub getMovmentInstance {
    my ($self) = @_;
        return $self->{movement};
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::physics::movement::Movement ();

1;

