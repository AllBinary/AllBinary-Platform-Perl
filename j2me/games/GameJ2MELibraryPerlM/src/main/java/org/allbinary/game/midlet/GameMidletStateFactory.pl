# Generated Code Do Not Modify

package org::allbinary::game::midlet::GameMidletStateFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $INSTANCE = 'org::allbinary::game::midlet::GameMidletStateFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{currentGameState} = 'org::allbinary::game::state::GameStateFactory'->getInstance()->{NO_GAME_STATE};
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::midlet::GameMidletStateFactory::INSTANCE;
}


sub getCurrentGameState {
    my ($self) = @_;
        return $self->{currentGameState};
}


sub setCurrentGameState {
    my ($self, $currentGameState) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{CURRENT})->append(" GameState: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($currentGameState))->toString(), $self, "setCurrentGameState");
        $self->{currentGameState} = $currentGameState;
}

use org::allbinary::game::state::GameState;
use org::allbinary::game::state::GameStateFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonLabels;

1;

