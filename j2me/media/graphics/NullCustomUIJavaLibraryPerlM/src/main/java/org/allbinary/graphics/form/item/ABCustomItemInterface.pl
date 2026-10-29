# Generated Code Do Not Modify

# Java interface
package org::allbinary::graphics::form::item::ABCustomItemInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getMinimumWidth {
    my ($self) = @_;
    die "abstract method getMinimumWidth";
}


sub getMinimumHeight {
    my ($self) = @_;
    die "abstract method getMinimumHeight";
}


sub getLabel {
    my ($self) = @_;
    die "abstract method getLabel";
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
    die "abstract method paintXY";
}


sub paintUnselected {
    my ($self, $graphics, $x, $y) = @_;
    die "abstract method paintUnselected";
}

# use javax::microedition::lcdui::Graphics;

1;

