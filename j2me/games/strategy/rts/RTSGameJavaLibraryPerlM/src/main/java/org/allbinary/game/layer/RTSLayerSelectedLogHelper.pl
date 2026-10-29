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

package org::allbinary::game::layer::RTSLayerSelectedLogHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::RTSLayerLogHelper';

our $instanceC = 'org::allbinary::game::layer::RTSLayerSelectedLogHelper'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{positionStrings} = 'org::allbinary::math::PositionStrings'->getInstance();
    $self->{TRACKTO_TURNTO} = "trackTo:turnTo";
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::RTSLayerSelectedLogHelper::instanceC;
}


sub setClosestGeographicMapCellHistory {
    my ($self, $associatedAdvancedRTSGameLayer, $pathsList) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append('org::allbinary::string::CommonLabels'->getInstance()->{START});
        $stringBuffer->appendint($pathsList->size());
        $stringBuffer->append(" -> ");
        $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($pathsList));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: setClosestGeographicMapCellHistory");
}


sub trackTo {
    my ($self, $associatedAdvancedRTSGameLayer, $nextUnvisitedPathGeographicMapCellPosition, $dx, $dy, $reason) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($nextUnvisitedPathGeographicMapCellPosition));
        $stringBuffer->append($self->{positionStrings}->{DX_LABEL});
        $stringBuffer->appendint($dx);
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($self->{positionStrings}->{DY_LABEL});
        $stringBuffer->appendint($dy);
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($reason);
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "selected: trackTo");
}


sub turnTo {
    my ($self, $associatedAdvancedRTSGameLayer, $dx, $dy, $angleInfo, $angle, $movementAngle, $evading, $targetAngle) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($associatedAdvancedRTSGameLayer->getName());
        $stringBuffer->append(" steering - ");
        $stringBuffer->append($self->{positionStrings}->{DX_LABEL});
        $stringBuffer->appendint($dx);
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($self->{positionStrings}->{DY_LABEL});
        $stringBuffer->appendint($dy);
        $stringBuffer->append(" angle: ");
        $stringBuffer->appendint($angle);
        $stringBuffer->append(" movementAngle: ");
        $stringBuffer->append($movementAngle->{name});
        $stringBuffer->append($self->{commonSeps}->{FORWARD_SLASH});
        $stringBuffer->appendshort(((int($movementAngle->getValue()) + 32768) % 65536 - 32768));
        if (defined($angleInfo)) {
            my $angleIncrement = $angleInfo->getAngleIncrementInfo()->getAngleIncrement();
            $stringBuffer->append(" angleIncrement: ");
            $stringBuffer->appendshort($angleIncrement);
        }
        $stringBuffer->append(" Evading: ");
        $stringBuffer->appendboolean($evading);
        $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{TRACKTO_TURNTO});
}


sub doneMoving {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" steering - done moving 0,0")->toString(), $self, $self->{TRACKTO_TURNTO});
}


sub closeEnough {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" steering - close enough")->toString(), $self, $self->{TRACKTO_TURNTO});
}


sub movingLeft {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" steering - allow movingLeft")->toString(), $self, $self->{TRACKTO_TURNTO});
}


sub movingRight {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" steering - allow movingRight")->toString(), $self, $self->{TRACKTO_TURNTO});
}


sub movingUp {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" steering - allow movingUp")->toString(), $self, $self->{TRACKTO_TURNTO});
}


sub movingDown {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" steering - allow movingDown")->toString(), $self, $self->{TRACKTO_TURNTO});
}


sub currentMoveEnded {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" steering - correct angle, but movement not needed for current deltas so reseting movement angle")->toString(), $self, $self->{TRACKTO_TURNTO});
}


sub evade {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" steering - evade")->toString(), $self, $self->{TRACKTO_TURNTO});
}


sub rotateLeft {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" steering - rotating left")->toString(), $self, $self->{TRACKTO_TURNTO});
}


sub rotateRight {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" steering - rotating right")->toString(), $self, $self->{TRACKTO_TURNTO});
}


sub handle {
    my ($self, $associatedAdvancedRTSGameLayer, $movementAngle) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" steering - movementAngle: ")->append($movementAngle->{name})->append($self->{commonSeps}->{FORWARD_SLASH})->appendshort(((int($movementAngle->getValue()) + 32768) % 65536 - 32768))->toString(), $self, $self->{TRACKTO_TURNTO});
}


sub noRotation {
    my ($self, $associatedAdvancedRTSGameLayer) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append(" steering - Do not rotate")->toString(), $self, $self->{TRACKTO_TURNTO});
}


sub notOnPath {
    my ($self, $associatedAdvancedRTSGameLayer, $geographicMapCellHistory, $currentGeographicMapCellPosition, $pathList) = @_;
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($associatedAdvancedRTSGameLayer->getName())->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->appendint(int($geographicMapCellHistory->getTotalVisited()))->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($stringUtil->toString($currentGeographicMapCellPosition))->append(" - trying to move but not on path: ")->append($stringUtil->toString($pathList))->toString(), $self, "turnTo");
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::math::AngleInfo;
use org::allbinary::math::NamedAngle;
use org::allbinary::math::PositionStrings;
use org::allbinary::media::graphics::geography::map::GeographicMapCellHistory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::layer::RTSLayerLogHelper;

1;

