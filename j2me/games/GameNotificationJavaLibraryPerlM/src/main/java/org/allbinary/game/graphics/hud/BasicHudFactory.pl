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

package org::allbinary::game::graphics::hud::BasicHudFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::graphics::hud::BasicHudFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{DIRECTION_EXCEPTION} = "Only Horizontal Direction is Allowed Currently";
    $self->{VERTICAL} = 0;
    $self->{HORIZONTAL} = 1;
    $self->{BOTTOMLEFT} = 0;
    $self->{BOTTOMRIGHT} = 1;
    $self->{TOPLEFT} = 2;
    $self->{TOPRIGHT} = 3;
    $self->{BOTTOMCENTER} = 4;
    $self->{TOPCENTER} = 5;
    $self->{ABSOLUTE} = 6;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::graphics::hud::BasicHudFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


1;

