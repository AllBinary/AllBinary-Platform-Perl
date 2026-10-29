# Generated Code Do Not Modify

package org::allbinary::media::audio::music::BaseMusicService;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'android::app::Service';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{commonStateStrings} = 'org::allbinary::string::CommonStateStrings'->getInstance();
    $self->{ALREADY_PLAYING} = "This is one song per music service";
    $self->{WAITING_FOR_MUSIC_TO_END} = "Waiting for music to end";
    $self->{player} = $org::allbinary::android::NullAndroidCanvas::NULL_MEDIA_PLAYER;
    $self->{songId} = -1;
    $self->{leftVolume} = -1;
    $self->{rightVolume} = -1;
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub onBind {
    my ($self, $intent) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStateStrings}->{BIND});
        return undef;
}


sub onCreate {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStateStrings}->{CREATE});
}


sub onDestroy {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStateStrings}->{DESTROY});
        if ($self->{player} != $org::allbinary::android::NullAndroidCanvas::NULL_MEDIA_PLAYER) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStateStrings}->{PAUSE});
            $self->{player}->stop();
            $self->{player}->reset();
            $self->{player}->release();
        }
}


sub pause {
    my ($self) = @_;
        if ($self->{player} != $org::allbinary::android::NullAndroidCanvas::NULL_MEDIA_PLAYER) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStateStrings}->{PAUSE});
            $self->{player}->pause();
        }
}


sub resume {
    my ($self) = @_;
        if ($self->{player} != $org::allbinary::android::NullAndroidCanvas::NULL_MEDIA_PLAYER && !$self->{player}->isPlaying()) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStateStrings}->{RESUME});
            $self->{player}->start();
        }
}


sub start {
    my ($self) = @_;
        $self->{player} = 'android::media::MediaPlayer'->create($self, $self->{songId});
        $self->{player}->setVolume(($self->{leftVolume}) / 100.0, ($self->{rightVolume}) / 100.0);
        $self->{player}->setLooping(0);
        $self->{player}->start();
}


sub onStart {
    my ($self, $intent, $startid) = @_;
        $self->onStartCommandIntent($intent);
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStateStrings}->{START});
}


sub onStartCommand {
    my ($self, $intent, $flags, $startId) = @_;
        $self->onStartCommandIntent($intent);
        return $android::app::Service::START_STICKY;
}


sub onStartCommandIntent {
    my ($self, $intent) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStateStrings}->{ON_START_COMMAND});
        my $musicStrings = 'org::allbinary::media::audio::music::MusicStrings'->getInstance();
        if (defined($intent)) {
            my $command = $intent->getIntExtra($self->{commonStateStrings}->{ON_START_COMMAND}, -1);
            $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{COMMAND_LABEL} + $command, $self, $self->{commonStateStrings}->{ON_START_COMMAND});
            if ($command == 1) {
                $self->pause();
                return;
            } elsif ($command == 2) {
                $self->resume();
                return;
            } else {
                $self->{songId} = $intent->getIntExtra($musicStrings->{SONG_EXTRA}, -1);
                $self->{leftVolume} = $intent->getIntExtra($musicStrings->{LEFT_VOLUME}, -1);
                $self->{rightVolume} = $intent->getIntExtra($musicStrings->{RIGHT_VOLUME}, -1);
            }
        } else {
            die ("Started service without intent");
        }
        if ($self->{songId} != -1) {
            1;
            if ($self->{player} != $org::allbinary::android::NullAndroidCanvas::NULL_MEDIA_PLAYER && $self->{player}->isPlaying()) {
                my $player = $self->{player};
                $self->{logUtil}->putF($self->{ALREADY_PLAYING}, $self, $self->{commonStateStrings}->{ON_START_COMMAND});
                {
                package org::allbinary::media::audio::music::MusicRunnable;
                use strict;
                use warnings;
                use feature 'try';
                no warnings 'experimental::try';
                use Time::HiRes ();
                use parent -norequire,'org::allbinary::thread::ARunnable';
                

                sub _init_fields {
                    my ($self) = @_;
                    $self->{baseMusicService} = undef;
                }
                

                sub new {
                    my ($class, $baseMusicService) = @_;
                    my $self = $class->SUPER::new();
                    $self->_init_fields();
                        $self->{baseMusicService} = $baseMusicService;
                    return $self;
                }
                

                sub run {
                    my ($self) = @_;
                        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                        my $commonStateStrings = 'org::allbinary::string::CommonStateStrings'->getInstance();
                        try {
                            while ($self->{player}->isPlaying()) {
                                $logUtil->putF($self->{baseMusicService}->{WAITING_FOR_MUSIC_TO_END}, $self, $commonStateStrings->{ON_START_COMMAND});
                                Time::HiRes::sleep((1200) / 1000);
                            }
                            $self->{baseMusicService}->onStartCommandIntent($self->{intent});
                        } catch ($e) {
                            $logUtil->put($commonStrings->{EXCEPTION}, $self, $commonStateStrings->{ON_START_COMMAND}, $e);
                        }
                }
                }

                my $runnable = 'org::allbinary::media::audio::music::MusicRunnable'->new($self);
                my $thread = 'java::lang::Thread'->new($runnable);
                $thread->start();
                return;
            }
            $self->start();
        }
}

use android::app::Service;
use android::content::Intent;
use android::media::MediaPlayer;
use android::os::IBinder;
use org::allbinary::android::NullAndroidCanvas;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStateStrings;
use org::allbinary::string::CommonStrings;
use org::allbinary::thread::ARunnable;
use org::allbinary::media::audio::music::MusicStrings;
use java::lang::System;
use java::lang::Thread;

1;

