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

package org::allbinary::game::layer::RTSLayer2SelectedLogHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::RTSLayer2LogHelper';

our $instanceC = 'org::allbinary::game::layer::RTSLayer2SelectedLogHelper'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{TRACK_TO_FIRE_OR_MOVE} = "trackTo:fireOrMove";
    $self->{BUILDING_CHASE} = "buildingChase";
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::RTSLayer2SelectedLogHelper::instanceC;
}


sub steeringUp {
    my ($self, $pathFindingLayerInterface) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($pathFindingLayerInterface->getName())->append(" steering - Up")->toString(), $self, $self->{TRACK_TO_FIRE_OR_MOVE});
}


sub steeringFireOrStop {
    my ($self, $pathFindingLayerInterface) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($pathFindingLayerInterface->getName())->append(" steering - Fire/All Stop")->toString(), $self, $self->{TRACK_TO_FIRE_OR_MOVE});
}


sub buildingAbove {
    my ($self, $pathFindingLayerInterface) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($pathFindingLayerInterface->getName())->append(" Building Above")->toString(), $self, $self->{BUILDING_CHASE});
}


sub buildingChaseLeft {
    my ($self, $pathFindingLayerInterface, $angle) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($pathFindingLayerInterface->getName())->append(" steering - Going Left: ")->appendint($angle)->toString(), $self, $self->{BUILDING_CHASE});
}


sub buildingChaseRight {
    my ($self, $pathFindingLayerInterface, $angle) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($pathFindingLayerInterface->getName())->append(" steering - Going Right: ")->appendint($angle)->toString(), $self, $self->{BUILDING_CHASE});
}


sub buildingDown {
    my ($self, $pathFindingLayerInterface) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($pathFindingLayerInterface->getName())->append(" Building Below")->toString(), $self, $self->{BUILDING_CHASE});
}


sub buildingChaseDown {
    my ($self, $pathFindingLayerInterface, $angle) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($pathFindingLayerInterface->getName())->append(" steering - Going Down: ")->appendint($angle)->toString(), $self, $self->{BUILDING_CHASE});
}


sub buildingChaseUp {
    my ($self, $pathFindingLayerInterface, $angle) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($pathFindingLayerInterface->getName())->append(" steering - Going Up: ")->appendint($angle)->toString(), $self, $self->{BUILDING_CHASE});
}


sub buildingLeft {
    my ($self, $pathFindingLayerInterface) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($pathFindingLayerInterface->getName())->append(" Building Left")->toString(), $self, $self->{BUILDING_CHASE});
}


sub buildingRight {
    my ($self, $pathFindingLayerInterface) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($pathFindingLayerInterface->getName())->append(" Building Right")->toString(), $self, $self->{BUILDING_CHASE});
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::game::layer::RTSLayer2LogHelper;

1;

