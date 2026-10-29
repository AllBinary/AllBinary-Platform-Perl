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

package org::allbinary::game::layer::RTSLayer2LogHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::layer::RTSLayer2LogHelper'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::RTSLayer2LogHelper::instance;
}


sub steeringUp {
    my ($self, $pathFindingLayerInterface) = @_;
}


sub steeringFireOrStop {
    my ($self, $pathFindingLayerInterface) = @_;
}


sub buildingAbove {
    my ($self, $pathFindingLayerInterface) = @_;
}


sub buildingChaseLeft {
    my ($self, $pathFindingLayerInterface, $angle) = @_;
}


sub buildingChaseRight {
    my ($self, $pathFindingLayerInterface, $angle) = @_;
}


sub buildingDown {
    my ($self, $pathFindingLayerInterface) = @_;
}


sub buildingChaseDown {
    my ($self, $pathFindingLayerInterface, $angle) = @_;
}


sub buildingChaseUp {
    my ($self, $pathFindingLayerInterface, $angle) = @_;
}


sub buildingLeft {
    my ($self) = @_;
}


sub buildingRight {
    my ($self) = @_;
}


1;

