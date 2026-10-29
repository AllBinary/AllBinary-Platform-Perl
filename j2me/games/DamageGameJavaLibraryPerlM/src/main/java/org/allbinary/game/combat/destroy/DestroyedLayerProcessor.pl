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

package org::allbinary::game::combat::destroy::DestroyedLayerProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::BasicLayerProcessor';

our $DESTROYED_LAYER_PROCESSOR = $org::allbinary::layer::BasicLayerProcessor::NULL_LAYER_PROCESSOR;


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub init {
    my ($class) = @_;
        $org::allbinary::game::combat::destroy::DestroyedLayerProcessor::DESTROYED_LAYER_PROCESSOR = 'org::allbinary::game::combat::destroy::DestroyedLayerProcessor'->new();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::combat::destroy::DestroyedLayerProcessor::DESTROYED_LAYER_PROCESSOR;
}


# throws Exception
sub process {
    my ($self, $allBinaryLayerManager) = @_;
        my $list = $self->getList();
        my $size = $list->size();
        my $destroyedEventHandler = 'org::allbinary::game::combat::destroy::event::DestroyedEventHandler'->getInstance();
        my $destroyEventCircularStaticPool = 'org::allbinary::game::combat::destroy::event::DestroyEventCircularStaticPool'->getInstance();
        my $destroyedEvent = undef;
        my $layerInterface = undef;
        for (my $index = 0; $index < $size; $index++) {
            my $layerInterfaceCanBeNull = $list->{objectArray}->[$index];
            if (defined($layerInterfaceCanBeNull)) {
                $layerInterface = $layerInterfaceCanBeNull;
                $allBinaryLayerManager->remove($layerInterface);
                $destroyedEvent = $destroyEventCircularStaticPool->getInstanceForLayer($layerInterface);
                $destroyedEventHandler->fireEvent($destroyedEvent);
            } else {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            }
        }
        $list->clear();
}

use org::allbinary::game::combat::destroy::event::DestroyEventCircularStaticPool;
use org::allbinary::game::combat::destroy::event::DestroyedEvent;
use org::allbinary::game::combat::destroy::event::DestroyedEventHandler;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::layer::BasicLayerProcessor;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;

1;

