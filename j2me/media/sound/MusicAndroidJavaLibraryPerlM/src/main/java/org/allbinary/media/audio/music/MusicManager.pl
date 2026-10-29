# Generated Code Do Not Modify

package org::allbinary::media::audio::music::MusicManager;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{PLAY} = "Play ";
    $self->{FOR} = " for: ";
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{musicStrings} = 'org::allbinary::media::audio::music::MusicStrings'->getInstance();
    $self->{commonStateStrings} = 'org::allbinary::string::CommonStateStrings'->getInstance();
    $self->{basicArrayListUtil} = 'org::allbinary::util::BasicArrayListUtil'->getInstance();
    $self->{resourceUtil} = 'org::allbinary::data::resource::ResourceUtil'->getInstance();
    $self->{androidServicesUtil} = 'org::allbinary::android::AndroidServicesUtil'->getInstance();
    $self->{gameTickTimeDelayHelper} = 'org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance();
    $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(0);
    $self->{timeDelayHelper2} = 'org::allbinary::time::TimeDelayHelper'->new(1200);
    $self->{songList} = undef;
    $self->{currentSongSound} = 'org::allbinary::media::audio::NoSound'->getInstance();
    $self->{nextSongSound} = 'org::allbinary::media::audio::NoSound'->getInstance();
    $self->{leftVolume} = 100;
    $self->{rightVolume} = 100;
    $self->{musicServiceClass} = undef;
    $self->{currentIntent} = undef;
}


sub new {
    my ($class, $musicServiceClass, $songList) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{commonStateStrings}->{CONTEXT} + $self->{resourceUtil}->getContext(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->{musicServiceClass} = $musicServiceClass;
        $self->{currentIntent} = 'android::content::Intent'->new($self->{resourceUtil}->getContext(), $musicServiceClass);
        $self->{songList} = $songList;
    return $self;
}


sub nextSong {
    my ($self, $nextSongSound, $leftVolume, $rightVolume) = @_;
        if (!defined($nextSongSound)) {
            $nextSongSound = 'org::allbinary::media::audio::NoSound'->getInstance();
        }
        $self->{nextSongSound} = $nextSongSound;
        $self->{leftVolume} = $leftVolume;
        $self->{rightVolume} = $rightVolume;
        $self->reset();
}


sub reset {
    my ($self) = @_;
        $self->{timeDelayHelper}->{delay} = 0;
}


sub process {
    my ($self) = @_;
        if ($self->{songList}->size() == 0) {
            return;
        }
        if ($self->{timeDelayHelper}->isTime($self->{gameTickTimeDelayHelper}->{startTime})) {
            $self->startNewSong();
            return;
        }
        if ($self->{timeDelayHelper2}->isTime($self->{gameTickTimeDelayHelper}->{startTime})) {
            if ($self->{androidServicesUtil}->isServiceRunning($self->{musicServiceClass}->getName())) {
            } else {
                $self->startNewSong();
            }
        }
}


sub show {
    my ($self) = @_;
        for (my $index = $self->{songList}->size(); --$index >= 0; ) {
            my $sound = $self->{songList}->get($index);
            my $duration = int($sound->getDuration());
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{PLAY})->append($sound->getResource())->append($self->{FOR})->appendlong($duration)->toString(), $self, $self->{commonStrings}->{PROCESS});
        }
}


sub startNewSong {
    my ($self) = @_;
        try {
            $self->{resourceUtil}->getContext()->stopService($self->{currentIntent});
            if ($self->{nextSongSound} == 'org::allbinary::media::audio::NoSound'->getInstance()) {
                $self->{currentSongSound} = $self->{basicArrayListUtil}->getRandom($self->{songList});
            } else {
                $self->{currentSongSound} = $self->{nextSongSound};
                $self->{nextSongSound} = 'org::allbinary::media::audio::NoSound'->getInstance();
            }
            my $duration = int($self->{currentSongSound}->getDuration());
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{PLAY})->append($self->{currentSongSound}->getResource())->append($self->{FOR})->appendlong($duration)->toString(), $self, $self->{commonStrings}->{PROCESS});
            $self->{timeDelayHelper}->{delay} = $duration;
            $self->{currentIntent}->putExtra($self->{musicStrings}->{SONG_EXTRA}, int($self->{resourceUtil}->getResourceId($self->{currentSongSound}->getResource())));
            $self->{currentIntent}->putExtra($self->{musicStrings}->{LEFT_VOLUME}, $self->{leftVolume});
            $self->{currentIntent}->putExtra($self->{musicStrings}->{RIGHT_VOLUME}, $self->{rightVolume});
            $self->{resourceUtil}->getContext()->startService($self->{currentIntent});
        } catch ($e) {
            my $resource = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
            if (defined($self->{currentSongSound})) {
                $resource = $self->{currentSongSound}->getResource();
            }
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION_LABEL} . $resource, $self, $self->{commonStrings}->{PROCESS}, $e);
        }
}


# throws Exception
sub stop {
    my ($self) = @_;
        $self->{resourceUtil}->getContext()->stopService($self->{currentIntent});
}


sub pause {
    my ($class, $activity, $musicServiceClass) = @_;
        my $commonStateStrings = 'org::allbinary::string::CommonStateStrings'->getInstance();
        my $musicPauseIntent = 'android::content::Intent'->new($activity, $musicServiceClass);
        $musicPauseIntent->putExtra($commonStateStrings->{ON_START_COMMAND}, 1);
        $activity->startService($musicPauseIntent);
}


sub resume {
    my ($class, $activity, $musicServiceClass) = @_;
        if ('org::allbinary::android::AndroidServicesUtil'->getInstance()->isServiceRunning($musicServiceClass->getName())) {
            my $commonStateStrings = 'org::allbinary::string::CommonStateStrings'->getInstance();
            my $musicResumeIntent = 'android::content::Intent'->new($activity, $musicServiceClass);
            $musicResumeIntent->putExtra($commonStateStrings->{ON_START_COMMAND}, 2);
            $activity->startService($musicResumeIntent);
        }
}

use android::app::Activity;
use android::content::Context;
use android::content::Intent;
use org::allbinary::android::AndroidServicesUtil;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::media::audio::NoSound;
use org::allbinary::media::audio::Sound;
use org::allbinary::string::CommonStateStrings;
use org::allbinary::string::CommonStrings;
use org::allbinary::time::GameTickTimeDelayHelper;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::media::audio::music::MusicStrings;

1;

