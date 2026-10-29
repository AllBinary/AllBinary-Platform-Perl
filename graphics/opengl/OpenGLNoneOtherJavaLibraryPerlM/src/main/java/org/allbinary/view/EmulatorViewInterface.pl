# Generated Code Do Not Modify

# Java interface
package org::allbinary::view::EmulatorViewInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub setMidlet {
    my ($self, $midlet) = @_;
    die "abstract method setMidlet";
}


sub onEmulatorInitComplete {
    my ($self, $midletActivity) = @_;
    die "abstract method onEmulatorInitComplete";
}


sub onSetDisplayable {
    my ($self, $displayable) = @_;
    die "abstract method onSetDisplayable";
}

# use javax::microedition::lcdui::Displayable;
# use javax::microedition::midlet::MIDlet;

1;

