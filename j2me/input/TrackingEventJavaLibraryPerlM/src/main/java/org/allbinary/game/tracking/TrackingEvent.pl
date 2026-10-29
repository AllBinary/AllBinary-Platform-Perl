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

package org::allbinary::game::tracking::TrackingEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';


sub _init_fields {
    my ($self) = @_;
    $self->{layerInterface} = $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER;
}


sub new {
    my ($class, $allBinaryLayerInterface) = @_;
    my $self = $class->SUPER::new($allBinaryLayerInterface);
    $self->_init_fields();
        # super(...) made $self above
        if ($allBinaryLayerInterface != 'org::allbinary::game::tracking::TrackingEventHandler'->getInstance()) {
            $self->setLayerInterface($allBinaryLayerInterface);
        }
    return $self;
}


sub init {
    my ($self, $anyType) = @_;
        $self->setSource($anyType);
}


sub getLayerInterface {
    my ($self) = @_;
        return $self->{layerInterface};
}


sub setLayerInterface {
    my ($self, $layerInterface) = @_;
        $self->{layerInterface} = $layerInterface;
}


sub setLayerInterfaceForCircularStaticPool {
    my ($self, $layerInterface) = @_;
        $self->{layerInterface} = $layerInterface;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("TrackingEvent: \n");
        $stringBuffer->append("LayerInterface: ");
        $stringBuffer->append($self->{layerInterface}->toString());
        return $stringBuffer->toString();
}

use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::game::tracking::TrackingEventHandler;

1;

