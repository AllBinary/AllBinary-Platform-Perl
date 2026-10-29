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

package org::allbinary::game::layer::UpgradableWideRTSLayerPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::RTSLayerCompositePaintable';


sub _init_fields {
    my ($self) = @_;
    $self->{cost} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub new {
    my ($class, $upgradableRTSLayerHudPaintable) = @_;
    my $self = $class->SUPER::new($upgradableRTSLayerHudPaintable);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub update {
    my ($self, $rtsLayer) = @_;
        $self->SUPER::update($rtsLayer);
        $self->setCost('org::allbinary::logic::string::StringMaker'->new()->append($self->getUpgradeCost())->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($self->getDownGradeCost())->toString());
}


sub paint {
    my ($self, $graphics) = @_;
        $graphics->drawString($self->getCost(), $self->{upgradableRTSLayerHudPaintable}->{textX}, $self->{upgradableRTSLayerHudPaintable}->{costY}, 0);
}


sub setCost {
    my ($self, $cost) = @_;
        $self->{cost} = $cost;
}


sub getCost {
    my ($self) = @_;
        return $self->{cost};
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::game::layer::RTSLayerCompositePaintable;

1;

