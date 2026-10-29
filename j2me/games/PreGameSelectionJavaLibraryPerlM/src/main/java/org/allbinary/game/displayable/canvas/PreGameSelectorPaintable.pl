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

package org::allbinary::game::displayable::canvas::PreGameSelectorPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::InitUpdatePaintable';


sub _init_fields {
    my ($self) = @_;
    $self->{title} = undef;
    $self->{canvasDrawLineString} = undef;
    $self->{preGameScrollSelectionForm} = undef;
}


sub new {
    my ($class, $title, $preGameScrollSelectionForm) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{title} = $title;
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        $self->{canvasDrawLineString} = 'org::allbinary::graphics::draw::CanvasDrawLineString'->new($displayInfo->getLastHalfWidth(), 0);
        $self->{preGameScrollSelectionForm} = $preGameScrollSelectionForm;
    return $self;
}


sub update {
    my ($self) = @_;
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        $self->{canvasDrawLineString} = 'org::allbinary::graphics::draw::CanvasDrawLineString'->new($displayInfo->getLastHalfWidth(), 0);
}


sub paint {
    my ($self, $graphics) = @_;
        $graphics->setColor(int('org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE}));
        $self->{canvasDrawLineString}->paint($graphics, $self->{title}, 0);
        $self->getPreGameSelectionForm()->paint($graphics);
}


sub getPreGameSelectionForm {
    my ($self) = @_;
        return $self->{preGameScrollSelectionForm};
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::draw::CanvasDrawLineString;
use org::allbinary::graphics::paint::InitUpdatePaintable;

1;

