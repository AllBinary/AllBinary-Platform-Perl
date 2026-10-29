# 
# AllBinary Open License Version 1 
# Copyright (c) 2002 AllBinary 
#  
# By agreeing to this license you and any business entity you represent are 
# legally bound to the AllBinary Open License Version 1 legal agreement. 
#  
# You may obtain the AllBinary Open License Version 1 legal agreement from 
# AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
#  
# Created By: Travis Berthelot  
# Generated Code Do Not Modify

package org::allbinary::game::layer::RTSLayerEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';


sub _init_fields {
    my ($self) = @_;
    $self->{rtsLayer} = $org::allbinary::game::layer::NullPathFindingLayer::NULL_PATH_FINDING_LAYER;
}


sub new {
    my ($class, $rtsLayer) = @_;
    my $self = $class->SUPER::new($rtsLayer);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("RTSLayerEvent: \n");
        $stringBuffer->append("RTSLayer: ");
        $stringBuffer->append($self->getRtsLayer()->toString());
        return $stringBuffer->toString();
}


sub getRtsLayer {
    my ($self) = @_;
        return $self->{rtsLayer};
}


sub setRtsLayer {
    my ($self, $rtsLayer) = @_;
        $self->{rtsLayer} = $rtsLayer;
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::game::layer::NullPathFindingLayer;

1;

