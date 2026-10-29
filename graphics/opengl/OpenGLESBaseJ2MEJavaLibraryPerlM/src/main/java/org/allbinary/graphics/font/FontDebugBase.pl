# Generated Code Do Not Modify

#OpenGLESBaseJ2MEJavaLibrary
package org::allbinary::graphics::font::FontDebugBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instanceBase = 'org::allbinary::graphics::font::FontDebugBase'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{SET_FONT} = "setFont";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::font::FontDebugBase::instanceBase;
}


sub debugMetrics {
    my ($self, $currentFont, $convertedTextSize, $displayMetrics, $stringBuffer) = @_;
}


sub debugDpi {
    my ($self, $densityDpi, $stringBuffer) = @_;
}


sub debugDimension {
    my ($self, $currentFont, $convertedTextSize, $longestDimensionTotalPixels, $stringBuffer) = @_;
}

# use javax::microedition::lcdui::Font;
use org::allbinary::logic::string::StringMaker;

1;

