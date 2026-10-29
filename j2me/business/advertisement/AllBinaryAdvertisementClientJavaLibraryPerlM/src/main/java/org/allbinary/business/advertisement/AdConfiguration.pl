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

package org::allbinary::business::advertisement::AdConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{INNERACTIVE} = undef;
    $self->{LEADBOLT} = undef;
    $self->{ADMOB} = undef;
}


sub new {
    my ($class, $advertIdArray) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{INNERACTIVE} = $advertIdArray->[0];
        $self->{ADMOB} = $advertIdArray->[1];
        $self->{LEADBOLT} = $advertIdArray->[2];
    return $self;
}


sub getValidAdSpots {
    my ($self) = @_;
        return [(undef) x (0)];
}


sub process {
    my ($self, $gameState) = @_;
}


sub processDemo {
    my ($self, $state) = @_;
}


sub setShowAds {
    my ($self) = @_;
}


sub setToggleAds {
    my ($self, $showAds) = @_;
}


sub isShowAds {
    my ($self) = @_;
        return 1;
}

use org::allbinary::direction::Direction;
use org::allbinary::game::state::GameState;

1;

