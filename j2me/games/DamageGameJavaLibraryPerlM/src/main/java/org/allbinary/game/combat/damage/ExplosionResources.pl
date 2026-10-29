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

package org::allbinary::game::combat::damage::ExplosionResources;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::combat::damage::ExplosionResources'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{EXPLOSION_90_RESOURCE} = "/explosion_sprite_90_by_90.png";
    $self->{EXPLOSION_60_RESOURCE} = "/explosion_sprite_60_by_60.png";
    $self->{HALF_EXPLOSION_RESOURCE} = "/explosion_sprite_30_by_30.png";
    $self->{THIRD_EXPLOSION_RESOURCE} = "/explosion_sprite_15_by_15.png";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::combat::damage::ExplosionResources::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


1;

