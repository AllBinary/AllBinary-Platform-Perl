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

package org::allbinary::android::input::motion::SingleAnalogControllerVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::input::motion::AnalogControllerVisitor';


sub _init_fields {
    my ($self) = @_;
    $self->{playerInputId} = undef;
}


sub new {
    my ($class, $playerInputId) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{playerInputId} = $playerInputId;
    return $self;
}


sub process {
    my ($self, $allbinaryLayerManager, $analogLocationInputProcessor) = @_;
        my $analogLocationInput = 'org::allbinary::game::input::analog::AnalogLocationInputFactory'->getInstance()->getInstanceForPlayer($self->{playerInputId});
        $analogLocationInputProcessor->process($allbinaryLayerManager, $analogLocationInput);
}

use org::allbinary::game::input::analog::AnalogLocationInput;
use org::allbinary::game::input::analog::AnalogLocationInputFactory;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::android::input::motion::AnalogControllerVisitor;

1;

