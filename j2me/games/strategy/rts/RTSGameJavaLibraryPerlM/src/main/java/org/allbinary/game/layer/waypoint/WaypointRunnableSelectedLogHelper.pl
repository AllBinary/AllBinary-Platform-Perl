# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::game::layer::waypoint::WaypointRunnableSelectedLogHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::waypoint::WaypointRunnableLogHelper';

our $instanceC = 'org::allbinary::game::layer::waypoint::WaypointRunnableSelectedLogHelper'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::waypoint::WaypointRunnableSelectedLogHelper::instanceC;
}


sub start {
    my ($self, $pathFindingLayerInterface) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($pathFindingLayerInterface->getName())->append($self->{commonStrings}->{START_RUNNABLE})->toString(), $self, $self->{commonStrings}->{RUN});
}


sub end {
    my ($self, $pathFindingLayerInterface) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($pathFindingLayerInterface->getName())->append($self->{commonStrings}->{END_RUNNABLE})->toString(), $self, $self->{commonStrings}->{RUN});
}

use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::game::layer::waypoint::WaypointRunnableLogHelper;

1;

