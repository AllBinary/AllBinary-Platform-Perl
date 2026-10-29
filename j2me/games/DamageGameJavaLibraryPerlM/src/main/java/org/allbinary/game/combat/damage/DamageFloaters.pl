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

package org::allbinary::game::combat::damage::DamageFloaters;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::Paintable';

our $SINGLETON = 'org::allbinary::game::combat::damage::DamageFloaters'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::combat::damage::DamageFloaters::SINGLETON;
}


sub add {
    my ($self, $damage) = @_;
}

use org::allbinary::graphics::paint::Paintable;

1;

