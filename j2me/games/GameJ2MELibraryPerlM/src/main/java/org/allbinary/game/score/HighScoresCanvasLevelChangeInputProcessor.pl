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

package org::allbinary::game::score::HighScoresCanvasLevelChangeInputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::game::score::HighScoresCanvasInputProcessor','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{displayInfoSingleton} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{INSTRUCTIONS} = "(Right = Next Track, Left = Previous Track)";
    $self->{myFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
    $self->{fontHeight} = 0;
}


sub new {
    my ($class, $highScoresCanvas) = @_;
    my $self = $class->SUPER::new($highScoresCanvas);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{fontHeight} = $font->getHeight();
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub open {
    my ($self) = @_;
        'org::allbinary::game::input::event::GameKeyEventHandler'->getInstance()->addListener($self);
}


sub close {
    my ($self) = @_;
        'org::allbinary::game::input::event::GameKeyEventHandler'->getInstance()->removeListener($self);
}


sub update {
    my ($self) = @_;
        my $list = $self->getGameKeyEventList();
        my $size = $list->size();
        for (my $index = 0; $index < $size; $index++) {
            my $anyType = $list->{objectArray}->[$index];
            my $key = 'org::allbinary::game::input::event::GameKeyEventUtil'->getKey($anyType);
            if ($key == $javax::microedition::lcdui::Canvas::RIGHT) {
                $self->getHighScoresCanvas()->getGameInfo()->nextGameLevel();
            } elsif ($key == $javax::microedition::lcdui::Canvas::LEFT) {
                $self->getHighScoresCanvas()->getGameInfo()->previousGameLevel();
            }
            $self->getHighScoresCanvas()->executeUpdate();
        }
        $list->clear();
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        my $width = $self->{displayInfoSingleton}->getLastWidth();
        my $topScoresWidth = (POSIX::floor(($graphics->getFont()->stringWidth($self->{INSTRUCTIONS})) / (2 ** (1))));
        $graphics->drawString($self->{INSTRUCTIONS}, (POSIX::floor(($width) / (2 ** (1)))) - $topScoresWidth, $self->{fontHeight} * 2, $self->{anchor});
}

# use javax::microedition::lcdui::Canvas;
# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::input::event::GameKeyEventHandler;
use org::allbinary::game::input::event::GameKeyEventUtil;
use org::allbinary::game::score::displayable::HighScoresCanvas;
use org::allbinary::graphics::Anchor;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::score::HighScoresCanvasInputProcessor;

1;

