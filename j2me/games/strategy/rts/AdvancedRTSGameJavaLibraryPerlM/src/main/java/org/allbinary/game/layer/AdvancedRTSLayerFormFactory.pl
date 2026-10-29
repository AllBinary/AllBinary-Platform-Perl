# 
# AllBinary Open License Version 1 
# Copyright (c) 2006 AllBinary 
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

package org::allbinary::game::layer::AdvancedRTSLayerFormFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::RTSLayerFormFactory';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{scrollSelectionForm} = undef;
}


sub new {
    my ($class, $label, $itemArrayFactoryInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $scrollSelectionForm = 'org::allbinary::graphics::form::ScrollSelectionForm'->getNullScrollSelectionForm();
        try {
            my $items = $itemArrayFactoryInterface->getItems();
            $scrollSelectionForm = 'org::allbinary::game::layer::RTSScrollSelectionFormFactory'->getInstance($label, $items);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{CONSTRUCTOR}, $e);
        }
        $self->{scrollSelectionForm} = $scrollSelectionForm;
    return $self;
}


sub getInstance {
    my ($self, $rtsLayer) = @_;
        return $self->{scrollSelectionForm};
}

use org::allbinary::game::input::RTSLayerFormFactory;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::graphics::form::ScrollSelectionForm;
use org::allbinary::graphics::form::item::ItemArraySingletonFactoryInterface;
use org::allbinary::game::layer::RTSScrollSelectionFormFactory;

1;

