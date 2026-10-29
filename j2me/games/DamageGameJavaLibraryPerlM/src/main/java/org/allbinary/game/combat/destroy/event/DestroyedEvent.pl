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

package org::allbinary::game::combat::destroy::event::DestroyedEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';


sub _init_fields {
    my ($self) = @_;
    $self->{allBinaryGameCanvas} = 'org::allbinary::game::displayable::canvas::NullGameCanvas'->getInstance();
    $self->{allBinaryLayerInterface} = $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER;
}


sub new {
    my ($class, $combatGameCanvas) = @_;
    my $self = $class->SUPER::new('org::allbinary::game::combat::destroy::event::DestroyedEventHandler'->getInstance());
    $self->_init_fields();
        # super(...) made $self above
        $self->setAllBinaryGameCanvas($combatGameCanvas);
    return $self;
}


sub getAllBinaryGameCanvas {
    my ($self) = @_;
        return $self->{allBinaryGameCanvas};
}


sub getLayerInterface {
    my ($self) = @_;
        return $self->{allBinaryLayerInterface};
}


sub setAllBinaryGameCanvas {
    my ($self, $allBinaryGameCanvas) = @_;
        $self->{allBinaryGameCanvas} = $allBinaryGameCanvas;
}


sub setLayerInterfaceForCircularStaticPool {
    my ($self, $allBinaryLayerInterface) = @_;
        $self->{allBinaryLayerInterface} = $allBinaryLayerInterface;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("DestroyedEvent: \n");
        $stringBuffer->append("AllBinaryLayerInterface: ");
        $stringBuffer->append($self->{allBinaryLayerInterface}->toString());
        $stringBuffer->append("\nAllBinaryGameCanvas: ");
        $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($self->getAllBinaryGameCanvas()));
        return $stringBuffer->toString();
}

use org::allbinary::game::displayable::canvas::AllBinaryGameCanvas;
use org::allbinary::game::displayable::canvas::NullGameCanvas;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::game::combat::destroy::event::DestroyedEventHandler;

1;

