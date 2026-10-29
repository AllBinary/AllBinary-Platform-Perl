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

#AndroidMediaMIDPLibrary
package org::allbinary::media::audio::AllBinaryMediaManager;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();

our $THIS = "AllBinaryMediaManagerAndroid";
our $mostUsedTotal = 0;


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub isMuted {
    my ($class) = @_;
        return 0;
}


sub setMuted {
    my ($class, $aMuted) = @_;
}


sub update {
    my ($class) = @_;
        return 1;
}


# throws Exception
sub init {
    my ($class, $soundsFactoryInterface) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $commonString = 'org::allbinary::string::CommonStrings'->getInstance();
        $logUtil->putF($commonString->{START}, $org::allbinary::media::audio::AllBinaryMediaManager::THIS, $commonString->{INIT});
        'org::allbinary::media::audio::AllBinaryMediaManager'->shutdown($soundsFactoryInterface);
        'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance()->addNormalPortion(50, "Media Manager");
        'org::allbinary::TsUtil'->getInstance()->gc();
        'org::allbinary::media::audio::Sounds'->new($soundsFactoryInterface)->init();
        $logUtil->putF($commonString->{END}, $org::allbinary::media::audio::AllBinaryMediaManager::THIS, $commonString->{INIT});
}


# throws Exception
sub shutdown {
    my ($class, $soundsFactoryInterface) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $commonString = 'org::allbinary::string::CommonStrings'->getInstance();
        $logUtil->putF($commonString->{START}, $org::allbinary::media::audio::AllBinaryMediaManager::THIS, "shutdown");
        if ($soundsFactoryInterface->isInitialized()) {
            'org::allbinary::media::audio::Sounds'->new($soundsFactoryInterface)->stopAll();
            my $soundInterfaceArray = $soundsFactoryInterface->getSoundInterfaceArray();
            my $player = undef;
            my $player2 = undef;
            my $androidMediaPlayerWrapper = undef;
            for (my $i = 0; $i < scalar(@{$soundInterfaceArray}); $i++) {
                if (defined($soundInterfaceArray->[$i])) {
                    $player = $soundInterfaceArray->[$i]->getPlayerP();
                    if (defined($player)) {
                        $player2 = ($player)->getPlayerP();
                        if ((Scalar::Util::blessed($player2) && $player2->isa('org::allbinary::media::audio::AndroidMediaPlayerWrapper'))) {
                            $androidMediaPlayerWrapper = $player2;
                            'org::allbinary::media::audio::MediaPlayerUtil'->getInstance()->waitForMediaPlayer($androidMediaPlayerWrapper->getMediaPlayer());
                        } else {
                            die ("Unknown Property Player: " . ref($player));
                        }
                    }
                }
            }
            'org::allbinary::media::audio::Sounds'->new($soundsFactoryInterface)->closeAll();
            'org::allbinary::TsUtil'->getInstance()->gc();
            $soundsFactoryInterface->setInitialized(0);
            $org::allbinary::media::audio::AllBinaryMediaManager::mostUsedTotal = 0;
        }
        $logUtil->putF($commonString->{START}, $org::allbinary::media::audio::AllBinaryMediaManager::THIS, "shutdown");
}


# throws Exception
sub createPlayer {
    my ($class, $resource) = @_;
        $org::allbinary::media::audio::AllBinaryMediaManager::mostUsedTotal++;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance()->{SOUND})) {
            try {
                return 'org::allbinary::media::audio::AndroidMediaPlayerWrapper'->new($resource);
            } catch ($e) {
                $logUtil->put("Could not create AndroidMediaPlayerWrapper using NoPlayer at " . 'org::allbinary::string::CommonLabels'->getInstance()->{TOTAL_LABEL} . $org::allbinary::media::audio::AllBinaryMediaManager::mostUsedTotal, $org::allbinary::media::audio::AllBinaryMediaManager::THIS, "createPlayer", $e);
                return $org::allbinary::media::audio::NoPlayer::NO_PLAYER;
            }
        } else {
            return $org::allbinary::media::audio::NoPlayer::NO_PLAYER;
        }
}


# throws IOException, MediaException
sub createPlayerFromInputStream {
    my ($class, $stream, $type) = @_;
        die ("No Input Stream Player");
}


# throws MediaException
sub playTone {
    my ($class, $frequency, $time, $volume) = @_;
        die ("No Tone Player");
}


sub isInitialized {
    my ($class) = @_;
        return 1;
}

# use java::io::IOException;
# use java::io::InputStream;
# use javax::microedition::media::MediaException;
# use javax::microedition::media::Player;
use org::allbinary::TsUtil;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureFactory;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::logic::ABSystemWrapper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::audio::Sounds;
use org::allbinary::media::audio::MediaPlayerUtil;
use org::allbinary::media::audio::NoPlayer;
use org::allbinary::media::audio::AndroidMediaPlayerWrapper;

1;

