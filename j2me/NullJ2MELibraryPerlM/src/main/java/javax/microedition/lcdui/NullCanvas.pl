# Generated Code Do Not Modify

package javax::microedition::lcdui::NullCanvas;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::lcdui::Canvas';

our $NULL_CANVAS = 'javax::microedition::lcdui::NullCanvas'->new();


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub setFullScreenMode {
    my ($self, $mode) = @_;
}


sub sizeChanged {
    my ($self, $w, $h) = @_;
}


sub getCommandStack {
    my ($self) = @_;
        die ("RuntimeException");
}


sub isCommand {
    my ($self, $command) = @_;
        die ("RuntimeException");
}


sub addCommand {
    my ($self, $command) = @_;
}


sub removeCommand {
    my ($self, $command) = @_;
}


sub removeAllCommands {
    my ($self) = @_;
}


sub setCommandListener {
    my ($self, $l) = @_;
}


sub getCustomCommandListener {
    my ($self) = @_;
        die ("RuntimeException");
}


sub isPaused {
    my ($self) = @_;
        die ("RuntimeException");
}


sub removePauseCommand {
    my ($self) = @_;
}


sub pause {
    my ($self) = @_;
}


sub unPause {
    my ($self) = @_;
}


# throws Exception
sub process {
    my ($self) = @_;
}


sub paint {
    my ($self, $graphics) = @_;
}


sub destroy {
    my ($self) = @_;
}


sub setPaused {
    my ($self, $isPaused) = @_;
        die ("RuntimeException");
}


sub pointerDragged {
    my ($self, $x, $y) = @_;
}


sub pointerPressed {
    my ($self, $x, $y) = @_;
}


sub pointerReleased {
    my ($self, $x, $y) = @_;
}

use java::util::Stack;
use javax::microedition::lcdui::Canvas;

1;

