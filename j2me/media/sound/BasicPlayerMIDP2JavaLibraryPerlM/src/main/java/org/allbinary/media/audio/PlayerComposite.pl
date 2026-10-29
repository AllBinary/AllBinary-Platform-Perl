#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

#BasicPlayerMIDP2
package org::allbinary::media::audio::PlayerComposite;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::media::Controllable','javax::microedition::media::Player';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{player} = undef;
    $self->{timeElapsedHelper} = 'org::allbinary::time::TimeDelayHelper'->new(0);
    $self->{gameTickTimeDelayHelper} = 'org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance();
}


sub new {
    my ($class, $player, $repeatTime) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{player} = $player;
        $self->{timeElapsedHelper}->{delay} = $repeatTime;
    return $self;
}


sub addPlayerListener {
    my ($self, $playerListener) = @_;
        $self->{player}->addPlayerListener($playerListener);
}


sub removePlayerListener {
    my ($self, $playerListener) = @_;
        $self->{player}->removePlayerListener($playerListener);
}


sub close {
    my ($self) = @_;
        $self->{player}->close();
}


sub deallocate {
    my ($self) = @_;
        $self->{player}->deallocate();
}


sub getContentType {
    my ($self) = @_;
        return $self->{player}->getContentType();
}


sub getDuration {
    my ($self) = @_;
        return $self->{player}->getDuration();
}


sub getMediaTime {
    my ($self) = @_;
        return $self->{player}->getMediaTime();
}


sub getTimeBase {
    my ($self) = @_;
        return ($self->{player})->getTimeBase();
}


# throws MediaException
sub setTimeBase {
    my ($self, $timeBase) = @_;
        ($self->{player})->setTimeBase($timeBase);
}


sub prefetch {
    my ($self) = @_;
        try {
            $self->{player}->prefetch();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "prefetch", $e);
        }
}


sub realize {
    my ($self) = @_;
        try {
            $self->{player}->realize();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "realize", $e);
        }
}


sub getState {
    my ($self) = @_;
        return $self->{player}->getState();
}


sub setLoopCount {
    my ($self, $count) = @_;
        $self->{player}->setLoopCount($count);
}


sub setMediaTime {
    my ($self, $now) = @_;
        try {
            return $self->{player}->setMediaTime($now);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "setMediaTime", $e);
            return -1;
        }
}


sub start {
    my ($self) = @_;
        try {
            if ($self->{timeElapsedHelper}->isTime($self->{gameTickTimeDelayHelper}->{startTime})) {
                $self->{player}->start();
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{START_METHOD_NAME}, $e);
        }
}


sub stop {
    my ($self) = @_;
        try {
            $self->{player}->stop();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "stop", $e);
        }
}


sub getControl {
    my ($self, $controlType) = @_;
        return $self->{player}->getControl($controlType);
}


sub getControls {
    my ($self) = @_;
        die ("RuntimeException");
}


sub setVolume {
    my ($self, $leftVolume, $rightVolume) = @_;
        my $controllable2 = ($self->{player});
        $controllable2->setVolume($leftVolume, $rightVolume);
}


sub getPlayerP {
    my ($self) = @_;
        return $self->{player};
}

# use javax::microedition::media::Control;
# use javax::microedition::media::Controllable;
# use javax::microedition::media::MediaException;
# use javax::microedition::media::Player;
# use javax::microedition::media::PlayerListener;
# use javax::microedition::media::TimeBase;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::time::GameTickTimeDelayHelper;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::time::TimeDelayHelper;

1;

