# Generated Code Do Not Modify

#OpenGLESBaseJavaLibrary
package org::allbinary::graphics::font::FontDebugBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instanceBase, 'java::lang::LazyStatic', sub { 'org::allbinary::graphics::font::FontDebugBase'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{SET_FONT} = "setFont";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
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

use java::lang::Object ();
use java::lang::LazyStatic ();
use javax::microedition::lcdui::Font ();
use org::allbinary::logic::string::StringMaker ();

1;

