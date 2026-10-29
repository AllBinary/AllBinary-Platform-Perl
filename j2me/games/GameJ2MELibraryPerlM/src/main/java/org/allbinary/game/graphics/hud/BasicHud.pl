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

package org::allbinary::game::graphics::hud::BasicHud;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{canvasStrings} = 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance();
    $self->{basicSetColorUtil} = 'org::allbinary::graphics::color::BasicColorSetUtil'->getInstance();
    $self->{displayInfo} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{updateMyFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{myFontProcessor} = $self->{updateMyFontProcessor};
    $self->{location} = 0;
    $self->{direction} = 0;
    $self->{bufferZone} = 0;
    $self->{bufferZoneY} = 0;
    $self->{hudGraphicsPosition} = $org::allbinary::game::graphics::hud::HudGraphicsPosition::NULL_HUD_GRAPHICS_POSITION;
    $self->{x} = 0;
    $self->{y} = 0;
    $self->{basicColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK};
    $self->{color} = undef;
    $self->{updateMaxWidth} = 0;
    $self->{updateMaxHeight} = 0;
    $self->{offsetY} = 0;
}


sub new {
    my ($class, $location, $direction, $bufferZone, $basicColor) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setLocation($location);
        $self->setDirection($direction);
        $self->setBufferZone($bufferZone);
        $self->onDisplayChangeEvent('org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance()->{displayChangeEvent});
        $self->setBasicColorP($basicColor);
        $self->{color} = int($basicColor);
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        try {
            $self->{hudGraphicsPosition} = $self->getHudGraphicsPositionWH($self->{displayInfo}->getLastWidth(), $self->{displayInfo}->getLastHeight(), $self->{updateMaxWidth}, $self->{updateMaxHeight});
            $self->{x} = $self->{hudGraphicsPosition}->getPoint()->getX();
            $self->setY($self->{hudGraphicsPosition}->getPoint()->getY());
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $self->{canvasStrings}->{ON_DISPLAY_CHANGE_EVENT}, $e);
        }
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub getLocation {
    my ($self) = @_;
        return $self->{location};
}


sub getDirection {
    my ($self) = @_;
        return $self->{direction};
}


# throws Exception
sub getHudGraphicsPositionWH {
    my ($self, $width, $height, $maxWidth, $maxHeight) = @_;
        my $x = 0;
        my $y = 0;
        my $anchor = 0;
        my $basicHudFactory = 'org::allbinary::game::graphics::hud::BasicHudFactory'->getInstance();
        if ($basicHudFactory->{BOTTOMLEFT} == $self->getLocation()) {
            $x = $self->{bufferZone} + 2;
            $y = $height - $maxHeight - $self->{bufferZone};
            $anchor = $javax::microedition::lcdui::Graphics::BOTTOM & $javax::microedition::lcdui::Graphics::LEFT;
        } elsif ($basicHudFactory->{BOTTOMRIGHT} == $self->getLocation()) {
            $x = $width - $maxWidth;
            $y = $height - $maxHeight - $self->{bufferZone};
            $anchor = $javax::microedition::lcdui::Graphics::BOTTOM & $javax::microedition::lcdui::Graphics::RIGHT;
        } elsif ($basicHudFactory->{TOPLEFT} == $self->getLocation()) {
            $x = $self->{bufferZone} + 2;
            $y = $self->{bufferZoneY};
            $anchor = $org::allbinary::graphics::Anchor::TOP_LEFT;
        } elsif ($basicHudFactory->{TOPRIGHT} == $self->getLocation()) {
            $x = $width - $maxWidth;
            $y = $self->{bufferZoneY};
            $anchor = $javax::microedition::lcdui::Graphics::TOP & $javax::microedition::lcdui::Graphics::RIGHT;
        } elsif ($basicHudFactory->{TOPCENTER} == $self->getLocation()) {
            $x = (int(($width - $maxWidth) / 2));
            $y = $self->{bufferZoneY};
            $anchor = $javax::microedition::lcdui::Graphics::TOP & $javax::microedition::lcdui::Graphics::HCENTER;
        } elsif ($basicHudFactory->{BOTTOMCENTER} == $self->getLocation()) {
            $x = (int(($width - $maxWidth) / 2));
            $y = $height - $maxHeight - $self->{bufferZone};
            $anchor = $javax::microedition::lcdui::Graphics::BOTTOM & $javax::microedition::lcdui::Graphics::HCENTER;
        } elsif ($basicHudFactory->{ABSOLUTE} == $self->getLocation()) {
            $x = $maxHeight;
            $y = $maxWidth;
            $anchor = 0;
        }
        return 'org::allbinary::game::graphics::hud::HudGraphicsPosition'->new($self->getPoint($x, $y), $anchor);
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub onDisplayChangeEvent {
    my ($self, $displayChangeEvent) = @_;
        $self->{myFontProcessor} = $self->{updateMyFontProcessor};
}


sub getPoint {
    my ($self, $x, $y) = @_;
        return 'org::allbinary::graphics::PointFactory'->getInstance()->createXY($x, $y);
}


sub getBufferZone {
    my ($self) = @_;
        return $self->{bufferZone};
}


sub setBufferZone {
    my ($self, $bufferZone) = @_;
        $self->{bufferZone} = $bufferZone;
        if ('org::allbinary::J2MEUtil'->isHTML()) {
            $self->{bufferZoneY} = $self->{bufferZone};
        } else {
            $self->{bufferZoneY} = $self->{bufferZone} + 5;
        }
}


sub setLocation {
    my ($self, $location) = @_;
        $self->{location} = $location;
}


sub setDirection {
    my ($self, $direction) = @_;
        $self->{direction} = $direction;
}


sub getHudGraphicsPosition {
    my ($self) = @_;
        return $self->{hudGraphicsPosition};
}


sub getColor {
    my ($self) = @_;
        return $self->{color};
}


sub getX {
    my ($self) = @_;
        return $self->{x};
}


sub setX {
    my ($self, $x) = @_;
        $self->{x} = $x;
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        $self->{basicColor} = $basicColor;
}


sub getBasicColorP {
    my ($self) = @_;
        return $self->{basicColor};
}


sub setY {
    my ($self, $y) = @_;
        $self->{y} = $y;
}


sub getY {
    my ($self) = @_;
        return $self->{y};
}


sub paintSSO {
    my ($self, $graphics, $string, $string2, $offset) = @_;
        $self->{myFontProcessor}->process($graphics);
        $self->{basicSetColorUtil}->setBasicColorP($graphics, $self->getBasicColorP());
        $graphics->drawString($string, $self->{x}, $self->getY(), $self->{hudGraphicsPosition}->getAnchor());
        $graphics->drawString($string2, $self->{x} + $offset, $self->getY(), $self->{hudGraphicsPosition}->getAnchor());
}


sub paintSSOO {
    my ($self, $graphics, $string, $string2, $offset, $offset2) = @_;
        $self->{myFontProcessor}->process($graphics);
        $graphics->setColor($self->getColor());
        $graphics->drawString($string, $self->{x} + $offset, $self->getY(), $self->{hudGraphicsPosition}->getAnchor());
        $graphics->drawString($string2, $self->{x} + $offset2, $self->getY(), $self->{hudGraphicsPosition}->getAnchor());
}


sub paintDXY {
    my ($self, $graphics, $charArray, $offset, $len, $charArray2, $offset2, $len2, $xOffset, $xOffset2) = @_;
        $self->{myFontProcessor}->process($graphics);
        $self->{basicSetColorUtil}->setBasicColorP($graphics, $self->getBasicColorP());
        my $y = $self->getY();
        $graphics->drawChars($charArray, $offset, $len, $self->{x} + $xOffset, $y, $self->{hudGraphicsPosition}->getAnchor());
        $graphics->drawChars($charArray2, $offset2, $len2, $self->{x} + $xOffset2, $y, $self->{hudGraphicsPosition}->getAnchor());
}


sub paintDX {
    my ($self, $graphics, $charArray, $offset, $len, $charArray2, $offset2, $len2, $xOffset) = @_;
        $self->{myFontProcessor}->process($graphics);
        $self->{basicSetColorUtil}->setBasicColorP($graphics, $self->getBasicColorP());
        my $y = $self->getY();
        $graphics->drawChars($charArray, $offset, $len, $self->{x}, $y, $self->{hudGraphicsPosition}->getAnchor());
        $graphics->drawChars($charArray2, $offset2, $len2, $self->{x} + $xOffset, $y, $self->{hudGraphicsPosition}->getAnchor());
}


sub paintOffsetAndLength {
    my ($self, $graphics, $charArray, $offset, $len) = @_;
        $self->{myFontProcessor}->process($graphics);
        $self->{basicSetColorUtil}->setBasicColorP($graphics, $self->getBasicColorP());
        my $y = $self->getY();
        $graphics->drawChars($charArray, $offset, $len, $self->{x}, $y, $self->{hudGraphicsPosition}->getAnchor());
}


sub paintString {
    my ($self, $graphics, $string) = @_;
        $self->{myFontProcessor}->process($graphics);
        $self->{basicSetColorUtil}->setBasicColorP($graphics, $self->getBasicColorP());
        my $y = $self->getY() + $self->{offsetY};
        $graphics->drawString($string, $self->{x}, $y, $self->{hudGraphicsPosition}->getAnchor());
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::J2MEUtil;
use org::allbinary::graphics::Anchor;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::color::BasicColorSetUtil;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::displayable::event::DisplayChangeEvent;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::graphics::hud::HudGraphicsPosition;
use org::allbinary::game::graphics::hud::BasicHudFactory;

1;

