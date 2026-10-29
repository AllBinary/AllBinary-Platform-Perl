# Generated Code Do Not Modify

package org::allbinary::game::configuration::feature::MultiPlayerGameFeatureFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::configuration::feature::MultiPlayerGameFeatureFactory'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::feature::MultiPlayerGameFeatureFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub addCommands {
    my ($self, $anyType) = @_;
        my $gameCommandsFactory = 'org::allbinary::game::commands::GameCommandsFactory'->getInstance();
        my $canvas = $anyType;
        $canvas->addCommand($gameCommandsFactory->{QUIT_COMMAND});
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::game::commands::GameCommandsFactory;

1;

