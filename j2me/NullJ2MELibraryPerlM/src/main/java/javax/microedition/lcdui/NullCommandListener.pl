# Generated Code Do Not Modify

package javax::microedition::lcdui::NullCommandListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::lcdui::CommandListener';

our $NULL_COMMAND_LISTENER = 'javax::microedition::lcdui::NullCommandListener'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub commandAction {
    my ($self, $c, $d) = @_;
}

use javax::microedition::lcdui::CommandListener;

1;

