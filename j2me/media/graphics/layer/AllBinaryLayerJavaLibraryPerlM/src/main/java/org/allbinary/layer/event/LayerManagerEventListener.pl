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

package org::allbinary::layer::event::LayerManagerEventListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::event::LayerManagerEventListenerInterface';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub onEvent {
    my ($self, $eventObject) = @_;
}


# throws Exception
sub onCreateLayerManagerEvent {
    my ($self, $layerManagerEvent) = @_;
}


# throws Exception
sub onDeleteLayerManagerEvent {
    my ($self, $layerManagerEvent) = @_;
}

use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::layer::event::LayerManagerEventListenerInterface;

1;

