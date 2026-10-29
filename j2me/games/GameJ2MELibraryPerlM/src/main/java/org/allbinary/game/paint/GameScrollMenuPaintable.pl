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

package org::allbinary::game::paint::GameScrollMenuPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::paint::BasicGameDemoPaintable','org::allbinary::graphics::color::ColorChangeListener';



sub new {
    my ($class, $mainDemoStatePaintable, $ownershipPaintable, $helpPaintableInterface, $basicColor) = @_;
    my $self = $class->SUPER::new($mainDemoStatePaintable, $ownershipPaintable, $helpPaintableInterface);
        # super(...) made $self above
        $self->setColor($basicColor);
        'org::allbinary::graphics::color::ColorChangeEventHandler'->getInstance()->addListenerInterface($self);
    return $self;
}


sub setState {
    my ($self, $state) = @_;
        $self->setCurrentStatePaintable($self->getMainDemoStatePaintable());
}


sub onEvent {
    my ($self, $eventObject) = @_;
}


sub setColor {
    my ($self, $basicColor) = @_;
        my $mainGameDemoStatePaintable = $self->getMainDemoStatePaintable();
        my $formPaintable = $mainGameDemoStatePaintable->getMenuPaintableInterface();
        my $scrollSelectionForm = $formPaintable->getForm();
        $mainGameDemoStatePaintable->getOwnershipPaintableInterface()->setBasicColorP($basicColor);
        $scrollSelectionForm->setButtonBasicColor($basicColor);
        my $item = undef;
        my $stringComponent = undef;
        for (my $index = $scrollSelectionForm->size() - 1; $index >= 0; $index--) {
            $item = $scrollSelectionForm->get($index);
            $stringComponent = $item->getLabelStringComponent();
            if (defined($stringComponent)) {
                $stringComponent->setForegroundBasicColor($basicColor);
            }
        }
}

use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::ColorChangeEventHandler;
use org::allbinary::graphics::color::ColorChangeListener;
use org::allbinary::graphics::form::FormPaintable;
use org::allbinary::graphics::form::ScrollSelectionForm;
use org::allbinary::graphics::form::item::ABStringComponent;
use org::allbinary::graphics::form::item::ABTextItem;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::game::paint::BasicGameDemoPaintable;

1;

