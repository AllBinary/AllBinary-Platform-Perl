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

package org::allbinary::game::score::HighScoresCanvasInputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::PlayerGameInput';


sub _init_fields {
    my ($self) = @_;
    $self->{highScoresCanvas} = undef;
}


sub new {
    my ($class, $highScoresCanvas) = @_;
    my $self = $class->SUPER::new('org::allbinary::util::BasicArrayListD'->new(), 'org::allbinary::util::BasicArrayListD'->new(), -1);
    $self->_init_fields();
        # super(...) made $self above
        $self->{highScoresCanvas} = $highScoresCanvas;
    return $self;
}


sub open {
    my ($self) = @_;
}


sub close {
    my ($self) = @_;
}


sub onPressGameKeyEvent {
    my ($self, $gameKeyEvent) = @_;
        $self->SUPER::onPressGameKeyEvent($gameKeyEvent);
        $self->update();
}


sub onDownGameKeyEvent {
    my ($self, $gameKeyEvent) = @_;
        $self->SUPER::onDownGameKeyEvent($gameKeyEvent);
        $self->update();
}


sub onUpGameKeyEvent {
    my ($self, $gameKeyEvent) = @_;
        $self->SUPER::onUpGameKeyEvent($gameKeyEvent);
        $self->update();
}


sub paint {
    my ($self, $graphics) = @_;
}


sub getHighScoresCanvas {
    my ($self) = @_;
        return $self->{highScoresCanvas};
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::input::PlayerGameInput;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::game::score::displayable::HighScoresCanvas;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

