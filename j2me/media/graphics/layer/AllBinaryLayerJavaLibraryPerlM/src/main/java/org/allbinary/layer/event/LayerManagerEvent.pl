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

package org::allbinary::layer::event::LayerManagerEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';


sub _init_fields {
    my ($self) = @_;
    $self->{layerInterface} = $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER;
    $self->{crud} = undef;
}


sub new {
    my ($class, $layerManager, $crud) = @_;
    my $self = $class->SUPER::new($layerManager);
    $self->_init_fields();
        # super(...) made $self above
        $self->{crud} = $crud;
    return $self;
}


sub getLayerInterface {
    my ($self) = @_;
        return $self->{layerInterface};
}


sub setLayerInterface {
    my ($self, $layerInterface) = @_;
        $self->{layerInterface} = $layerInterface;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("LayerManagerEvent: \n");
        $stringBuffer->append("LayerInterface: ");
        $stringBuffer->append($self->getLayerInterface()->toString());
        $stringBuffer->append("\nCRUD: ");
        $stringBuffer->append($self->{crud});
        return $stringBuffer->toString();
}

use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::LayerManager;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::event::AllBinaryEventObject;

1;

