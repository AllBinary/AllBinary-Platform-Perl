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

package org::allbinary::game::physics::acceleration::GravityUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::physics::acceleration::GravityUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{GAME_GRAVITY_VELOCITY} = 1800;
    $self->{MAX_GAME_VELOCITY} = 18000;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::physics::acceleration::GravityUtil::instance;
}


sub process {
    my ($self, $velocityProperties, $customGravity) = @_;
        $velocityProperties->getVelocityYBasicDecimalP()->addint($customGravity);
}

use org::allbinary::game::physics::velocity::BasicVelocityProperties;

1;

