# 
# AllBinary Open License Version 1 
# Copyright (c) 2003 AllBinary 
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

package org::allbinary::game::layer::RTSLayerCompositePaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::Paintable';


sub _init_fields {
    my ($self) = @_;
    $self->{upgradeCost} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{downGradeCost} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{UPGRADE} = "Up: \$";
    $self->{DOWNGRADE} = "Down: \$-";
    $self->{upgradableRTSLayerHudPaintable} = undef;
}


sub new {
    my ($class, $upgradableRTSLayerHudPaintable) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{upgradableRTSLayerHudPaintable} = $upgradableRTSLayerHudPaintable;
    return $self;
}


sub update {
    my ($self, $rtsLayer) = @_;
        if ($rtsLayer->isUpgradeable()) {
            $self->setUpgradeCost('org::allbinary::logic::string::StringMaker'->new()->append($self->{UPGRADE})->appendint(int($rtsLayer->getUpgradeCost()))->toString());
        } else {
            $self->setUpgradeCost('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        }
        if ($rtsLayer->isDowngradeable()) {
            $self->setDownGradeCost('org::allbinary::logic::string::StringMaker'->new()->append($self->{DOWNGRADE})->appendint(int($rtsLayer->getDowngradeCost()))->toString());
        } else {
            $self->setDownGradeCost('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        }
}


sub paint {
    my ($self, $graphics) = @_;
        $graphics->drawString($self->getDownGradeCost(), $self->{upgradableRTSLayerHudPaintable}->{textX}, $self->{upgradableRTSLayerHudPaintable}->{costY1}, 0);
        $graphics->drawString($self->getUpgradeCost(), $self->{upgradableRTSLayerHudPaintable}->{textX}, $self->{upgradableRTSLayerHudPaintable}->{costY}, 0);
}


sub setUpgradeCost {
    my ($self, $upgradeCost) = @_;
        $self->{upgradeCost} = $upgradeCost;
}


sub getUpgradeCost {
    my ($self) = @_;
        return $self->{upgradeCost};
}


sub setDownGradeCost {
    my ($self, $downGradeCost) = @_;
        $self->{downGradeCost} = $downGradeCost;
}


sub getDownGradeCost {
    my ($self) = @_;
        return $self->{downGradeCost};
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::logic::string::StringMaker;

1;

