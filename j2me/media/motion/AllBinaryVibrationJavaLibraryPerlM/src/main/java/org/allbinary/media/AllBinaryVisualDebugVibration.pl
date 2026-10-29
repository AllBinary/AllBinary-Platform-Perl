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

package org::allbinary::media::AllBinaryVisualDebugVibration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::media::AllBinaryVibrationME','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{displayInfoSingleton} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(2147483647);
    $self->{VIBRATING} = "Vibrating";
    $self->{myFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
    $self->{width} = 0;
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
        $self->{width} = $font->stringWidth($self->{VIBRATING});
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub vibrate {
    my ($self, $duration, $type, $volume) = @_;
        $self->{timeDelayHelper}->{delay} = $duration;
}


sub paint {
    my ($self, $graphics) = @_;
        if ($self->{timeDelayHelper}->isTimeTNT()) {
            $self->{timeDelayHelper}->{delay} = 2147483647;
            $self->{myFontProcessor}->process($graphics);
            $graphics->drawString($self->{VIBRATING}, $self->{displayInfoSingleton}->getLastHalfWidth() - (POSIX::floor(($self->{width}) / (2 ** (1)))), 0, $self->{anchor});
        }
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::Anchor;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::media::AllBinaryVibrationME;

1;

