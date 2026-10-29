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

package org::allbinary::game::combat::damage::DamageableBaseBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::combat::damage::DamageableInterface';

our $instance = 'org::allbinary::game::combat::damage::DamageableBaseBehavior'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::combat::damage::DamageableBaseBehavior::instance;
}


sub getName {
    my ($self) = @_;
        return ref($self);
}


# throws Exception
sub damage {
    my ($self, $damage, $damageType) = @_;
}


# throws Exception
sub getDamage {
    my ($self, $damageType) = @_;
        return 6000;
}

use org::allbinary::game::combat::damage::DamageableInterface;

1;

