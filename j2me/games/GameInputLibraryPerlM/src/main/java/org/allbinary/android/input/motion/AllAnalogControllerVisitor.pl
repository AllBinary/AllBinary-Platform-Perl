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

package org::allbinary::android::input::motion::AllAnalogControllerVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::input::motion::AnalogControllerVisitor';


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub process {
    my ($self, $allbinaryLayerManager, $analogLocationInputProcessor) = @_;
        my $analogLocationInputList = 'org::allbinary::game::input::analog::AnalogLocationInputFactory'->getInstance()->getList();
        my $analogLocationInput = undef;
        for (my $index = $analogLocationInputList->size() - 1; $index >= 0; $index--) {
            $analogLocationInput = $analogLocationInputList->get($index);
            $analogLocationInputProcessor->process($allbinaryLayerManager, $analogLocationInput);
        }
}

use org::allbinary::game::input::analog::AnalogLocationInput;
use org::allbinary::game::input::analog::AnalogLocationInputFactory;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::util::BasicArrayList;
use org::allbinary::android::input::motion::AnalogControllerVisitor;

1;

