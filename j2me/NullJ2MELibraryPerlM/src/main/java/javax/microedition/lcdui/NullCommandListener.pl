# Generated Code Do Not Modify

package javax::microedition::lcdui::NullCommandListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','javax::microedition::lcdui::CommandListener';

tie our $NULL_COMMAND_LISTENER, 'java::lang::LazyStatic', sub { 'javax::microedition::lcdui::NullCommandListener'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub commandAction {
    my ($self, $c, $d) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use javax::microedition::lcdui::CommandListener ();

1;

