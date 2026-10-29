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

package org::allbinary::game::score::HighScoresPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::graphics::paint::Paintable','org::allbinary::graphics::color::ColorChangeListener','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{displayInfoSingleton} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{myFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{basicColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE};
    $self->{highScores} = 'org::allbinary::game::score::NullHighScoresSingletonFactory'->getInstance();
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
    $self->{charHeight} = 0;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{charHeight} = $font->getHeight();
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub onEvent {
    my ($self, $eventObject) = @_;
        my $colorChangeEvent = $eventObject;
        $self->{basicColor} = $colorChangeEvent->getBasicColorP();
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        my $width = $self->{displayInfoSingleton}->getLastWidth();
        my $height = $self->{displayInfoSingleton}->getLastHeight();
        $graphics->setColor(int($self->getBasicColorP()));
        my $heading = $self->{highScores}->getHeading();
        my $topScoresWidth = (POSIX::floor(($graphics->getFont()->stringWidth($heading)) / (2 ** (1))));
        my $charHeight = $self->{charHeight};
        $graphics->drawString($heading, (POSIX::floor(($width) / (2 ** (1)))) - $topScoresWidth, $charHeight, $self->{anchor});
        $graphics->drawString($self->{highScores}->getColumnOneHeading(), 10, $charHeight * 3, $self->{anchor});
        my $columnTwoHeading = $self->{highScores}->getColumnTwoHeading();
        my $columnTwoHeadingWidth = $graphics->getFont()->stringWidth($columnTwoHeading);
        $graphics->drawString($columnTwoHeading, $width - 10 - $columnTwoHeadingWidth, $charHeight * 3, $self->{anchor});
        my $index = 4;
        my $largestSecondColumnWidth = $columnTwoHeadingWidth;
        my $list = $self->{highScores}->getList();
        my $size = $list->size();
        my $vectorIndex = 0;
        my $highScore = undef;
        while ($vectorIndex < $size && $charHeight * $index < $height - ($charHeight * 2)) {
            $highScore = $list->{objectArray}->[$vectorIndex];
            my $nextScoreWidth = $graphics->getFont()->stringWidth($highScore->getScoreString());
            if ($nextScoreWidth > $largestSecondColumnWidth) {
                $largestSecondColumnWidth = $nextScoreWidth;
            }
            $vectorIndex++;
        }
        $vectorIndex = 0;
        while ($vectorIndex < $size && $charHeight * $index < $height - ($charHeight * 2)) {
            $highScore = $list->{objectArray}->[$vectorIndex];
            $graphics->drawString($highScore->getName(), 10, $charHeight * $index, $self->{anchor});
            $graphics->drawString($highScore->getScoreString(), $width - 10 - $largestSecondColumnWidth, $charHeight * $index, $self->{anchor});
            $index++;
            $vectorIndex++;
        }
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        $self->{basicColor} = $basicColor;
}


sub getBasicColorP {
    my ($self) = @_;
        return $self->{basicColor};
}


sub setHighScores {
    my ($self, $highScores) = @_;
        $self->{highScores} = $highScores;
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::Anchor;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::color::ColorChangeEvent;
use org::allbinary::graphics::color::ColorChangeListener;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::score::NullHighScoresSingletonFactory;

1;

