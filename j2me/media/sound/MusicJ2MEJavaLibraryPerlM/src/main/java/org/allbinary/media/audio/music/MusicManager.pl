# Generated Code Do Not Modify

package org::allbinary::media::audio::music::MusicManager;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{basicArrayListUtil} = 'org::allbinary::util::BasicArrayListUtil'->getInstance();
    $self->{gameTickTimeDelayHelper} = 'org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance();
    $self->{playerStateUtil} = 'org::allbinary::media::audio::PlayerStateUtil'->getInstance();
    $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(0);
    $self->{playerListener} = 'org::allbinary::media::audio::music::MusicManagerPlayerListener'->new();
    $self->{PLAY} = "Play ";
    $self->{SONG} = " for: ";
    $self->{NEXT_SONG} = 'org::allbinary::string::CommonLabels'->getInstance()->{NEXT} . " Song: ";
    $self->{STOPPING} = "Stopping Current Song: ";
    $self->{ENDING} = "Ending Current Song: ";
    $self->{WAITING_FOR_MEDIA_TO_END} = "Waiting for media to end";
    $self->{ALREADY_PLAYING} = "Already Playing: ";
    $self->{ALREADY_ENDED} = "Last Song already ended: ";
    $self->{songList} = undef;
    $self->{currentSongSound} = 'org::allbinary::media::audio::NoSound'->getInstance();
    $self->{nextSongSound} = 'org::allbinary::media::audio::NoSound'->getInstance();
    $self->{reset} = 0;
    $self->{noDuration} = 0;
    $self->{stopped} = 1;
}


sub new {
    my ($class, $musicServiceClass, $songList) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{songList} = $songList;
    return $self;
}


sub startNewSong {
    my ($self) = @_;
        if ($self->{nextSongSound} == 'org::allbinary::media::audio::NoSound'->getInstance()) {
            my $randomSongSound = $self->{basicArrayListUtil}->getRandom($self->{songList});
            $self->nextSong($randomSongSound, 0, 0);
        }
        $self->process();
}


sub nextSong {
    my ($self, $nextSongSound, $leftVolume, $rightVolume) = @_;
        'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{NEXT_SONG})->append($nextSongSound->getResource())->toString(), $self, $self->{commonStrings}->{PROCESS});
        $self->{nextSongSound} = $nextSongSound;
        $self->reset();
        $self->{stopped} = 0;
}


sub reset {
    my ($self) = @_;
        $self->{reset} = 1;
}


sub process {
    my ($self) = @_;
        try {
            if ($self->{stopped}) {
                return;
            }
            if ($self->{songList}->size() == 0) {
                return;
            }
            if (($self->{timeDelayHelper}->isTime($self->{gameTickTimeDelayHelper}->{startTime}) && !$self->{noDuration}) || $self->{reset}) {
                $self->{reset} = 0;
                $self->{noDuration} = 0;
                my $endingCurrentSongSound = $self->{currentSongSound};
                my $nextSongSound = $self->{nextSongSound};
                $self->{nextSongSound} = 'org::allbinary::media::audio::NoSound'->getInstance();
                if ($nextSongSound == 'org::allbinary::media::audio::NoSound'->getInstance()) {
                    $self->{currentSongSound} = 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getRandom($self->{songList});
                } else {
                    $self->{currentSongSound} = $nextSongSound;
                }
                my $startingCurrentSongSound = $self->{currentSongSound};
                my $duration = int($self->{currentSongSound}->getDuration());
                $self->{timeDelayHelper}->{delay} = $duration;
                if ($duration <= 0) {
                    my $NO_DURATION_FOR = "No Duration for: ";
                    'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($NO_DURATION_FOR)->append($self->{currentSongSound}->getResource())->toString(), $self, $self->{commonStrings}->{PROCESS});
                    $self->{currentSongSound}->getPlayerP()->addPlayerListener($self->{playerListener});
                    $self->{noDuration} = 1;
                }
                if ($endingCurrentSongSound != 'org::allbinary::media::audio::NoSound'->getInstance()) {
                    if ($endingCurrentSongSound == $startingCurrentSongSound && $endingCurrentSongSound->getPlayerP()->getState() == $javax::microedition::media::Player::STARTED) {
                        'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{ALREADY_PLAYING})->append($endingCurrentSongSound->getResource())->toString(), $self, $self->{commonStrings}->{PROCESS});
                        'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{STOPPING})->append($endingCurrentSongSound->getResource())->append($self->{SONG})->appendlong($duration)->toString(), $self, $self->{commonStrings}->{PROCESS});
                        $endingCurrentSongSound->getPlayerP()->stop();
                        $self->waitForStateChange($endingCurrentSongSound, $startingCurrentSongSound);
                    } else {
                        if ($endingCurrentSongSound->getPlayerP()->getState() == $javax::microedition::media::Player::STARTED) {
                            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{STOPPING})->append($endingCurrentSongSound->getResource())->append($self->{SONG})->appendlong($duration)->toString(), $self, $self->{commonStrings}->{PROCESS});
                            $endingCurrentSongSound->getPlayerP()->stop();
                            $self->waitForStateChange($endingCurrentSongSound, $startingCurrentSongSound);
                        } else {
                            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{ALREADY_ENDED})->append($self->{PLAY})->append($startingCurrentSongSound->getResource())->toString(), $self, $self->{commonStrings}->{PROCESS});
                            if ('org::allbinary::AvianUtil'->isAvian()) {
                                $endingCurrentSongSound->getPlayerP()->stop();
                                $startingCurrentSongSound->getPlayerP()->stop();
                            }
                            $startingCurrentSongSound->getPlayerP()->start();
                        }
                    }
                } else {
                    'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{PLAY})->append($self->{currentSongSound}->getResource())->append($self->{SONG})->appendlong($duration)->toString(), $self, $self->{commonStrings}->{PROCESS});
                    $self->{currentSongSound}->getPlayerP()->start();
                }
            }
        } catch ($e) {
            my $resource = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
            if ($self->{currentSongSound} != 'org::allbinary::media::audio::NoSound'->getInstance()) {
                $resource = $self->{currentSongSound}->getResource();
            }
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION_LABEL} . $resource, $self, $self->{commonStrings}->{PROCESS}, $e);
        }
}


# throws Exception
sub waitForStateChange {
    my ($self, $endingCurrentSongSound, $startingCurrentSongSound) = @_;
        while ($endingCurrentSongSound->getPlayerP()->getState() == $javax::microedition::media::Player::STARTED) {
            'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{WAITING_FOR_MEDIA_TO_END}, $self, $self->{commonStrings}->{PROCESS});
            Time::HiRes::sleep((100) / 1000);
        }
        'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{playerStateUtil}->convert($endingCurrentSongSound->getPlayerP()->getState()))->append($self->{commonSeps}->{SPACE})->append($self->{PLAY})->append($startingCurrentSongSound->getResource())->toString(), $self, $self->{commonStrings}->{PROCESS});
        $startingCurrentSongSound->getPlayerP()->start();
}


# throws Exception
sub stop {
    my ($self) = @_;
        try {
            my $currentSongSound = $self->{currentSongSound};
            if ($currentSongSound != 'org::allbinary::media::audio::NoSound'->getInstance()) {
                $self->{stopped} = 1;
                'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{ENDING})->append($currentSongSound->getResource())->toString(), $self, $self->{commonStrings}->{PROCESS});
                $currentSongSound->getPlayerP()->stop();
            }
            $self->{timeDelayHelper}->setStartTime(0);
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{END})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($currentSongSound))->toString(), $self, $self->{commonStrings}->{END});
        } catch ($e) {
            my $resource = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
            if ($currentSongSound != 'org::allbinary::media::audio::NoSound'->getInstance()) {
                $resource = $currentSongSound->getResource();
            }
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION_LABEL} . $resource, $self, $self->{commonStrings}->{END}, $e);
        }
}
{
    #Handle Media ending for Avian
    package org::allbinary::media::audio::music::MusicManagerPlayerListener;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use Time::HiRes ();
    use parent -norequire,'javax::microedition::media::PlayerListener';
    

    sub new {
        my ($class) = @_;
        my $self = bless({}, $class);
        return $self;
    }
    

    sub playerUpdate {
        my ($self, $player, $event, $eventData) = @_;
            'org::allbinary::logic::communication::log::PreLogUtil'->put($event, $self, $self->{commonStrings}->{PROCESS});
            if ($event eq $javax::microedition::media::PlayerListener::END_OF_MEDIA || $event eq $javax::microedition::media::PlayerListener::STOPPED || $event eq $javax::microedition::media::PlayerListener::CLOSED) {
                $self->reset();
            }
    }
    }


use org::allbinary::thread::ARunnable;
# use javax::microedition::media::Player;
# use javax::microedition::media::PlayerListener;
use org::allbinary::AvianUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::media::audio::NoSound;
use org::allbinary::media::audio::PlayerStateUtil;
use org::allbinary::media::audio::Sound;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::time::GameTickTimeDelayHelper;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListUtil;
use java::lang::Thread;

1;

