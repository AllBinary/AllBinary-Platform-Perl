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

package org::allbinary::game::ag::layer::pickup::points::PointsResources;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::game::ag::layer::pickup::points::PointsResources'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{RESOURCE} = "points_drop_20_by_20.png";
    $self->{RESOURCE_2} = "points_2_drop_20_by_20.png";
    $self->{RESOURCE_3} = "points_3_drop_20_by_20.png";
    $self->{RESOURCE_4} = "points_4_drop_20_by_20.png";
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::ag::layer::pickup::points::PointsResources::SINGLETON;
}


1;

