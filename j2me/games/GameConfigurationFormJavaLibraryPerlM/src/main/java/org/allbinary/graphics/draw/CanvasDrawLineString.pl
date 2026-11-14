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

package org::allbinary::graphics::draw::CanvasDrawLineString;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::graphics::font::UpdateMyFontInterface';

tie our $NULL_CANVAS_DRAW_LINE_STRING, 'java::lang::LazyStatic', sub { 'org::allbinary::graphics::draw::CanvasDrawLineString'->new(0, 0) };

sub _init_fields {
    my ($self) = @_;
    $self->{drawStringUtil} = 'org::allbinary::graphics::draw::DrawStringUtil'->getInstance();
    $self->{myFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{x} = undef;
    $self->{y} = undef;
    $self->{fontHeight} = 0;
}


sub new {
    my ($class, $x, $y) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{x} = $x;
        $self->{y} = $y;
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{fontHeight} = $font->getHeight();
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub paint {
    my ($self, $graphics, $string, $line) = @_;
        $self->{myFontProcessor}->process($graphics);
        $self->{drawStringUtil}->drawCenterString($graphics, $string, 0, length($string), $self->{x}, $self->{y} + ($line * $self->{fontHeight}));
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use javax::microedition::lcdui::Font ();
use javax::microedition::lcdui::Graphics ();
use org::allbinary::graphics::font::MyFontProcessor ();
use org::allbinary::graphics::font::UpdateMyFontInterface ();
use org::allbinary::graphics::font::UpdateMyFontProcessor ();
use org::allbinary::graphics::draw::DrawStringUtil ();

1;

