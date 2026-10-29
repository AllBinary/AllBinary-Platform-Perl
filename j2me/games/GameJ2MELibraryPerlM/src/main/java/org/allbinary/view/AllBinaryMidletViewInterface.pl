# Generated Code Do Not Modify

# Java interface
package org::allbinary::view::AllBinaryMidletViewInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::midlet::MidletCompositeInterface','org::allbinary::view::EmulatorViewInterface','org::allbinary::game::midlet::DemoGameMidletEventListener','org::allbinary::game::configuration::event::GameInitializedListenerInterface';



sub onResume {
    my ($self) = @_;
    die "abstract method onResume";
}


sub onPause {
    my ($self) = @_;
    die "abstract method onPause";
}


sub onDestroy {
    my ($self) = @_;
    die "abstract method onDestroy";
}

use org::allbinary::game::configuration::event::GameInitializedListenerInterface;
use org::allbinary::game::midlet::DemoGameMidletEventListener;
use org::allbinary::midlet::MidletCompositeInterface;
use org::allbinary::view::EmulatorViewInterface;

1;

