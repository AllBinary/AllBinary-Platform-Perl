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

#NotDeviceSpecificMIDP2JavaLibrary
package org::allbinary::media::audio::AllBinaryMediaManager;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $THIS = "AllBinaryMediaManagerNoMIPD2";


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
        'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance()->addNormalPortion(50, "Media Manager");
        'org::allbinary::media::audio::Sounds'->new($soundsFactoryInterface)->init();
}


# throws Exception
sub shutdown {
    my ($class, $soundsFactoryInterface) = @_;
        'org::allbinary::media::audio::Sounds'->new($soundsFactoryInterface)->stopAll();
        'org::allbinary::media::audio::Sounds'->new($soundsFactoryInterface)->closeAll();
        'org::allbinary::TsUtil'->getInstance()->gc();
}


# throws Exception
sub createPlayer {
    my ($class, $resource) = @_;
        if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance()->{SOUND})) {
            if ('org::allbinary::TsUtil'->getInstance()->compareTo($resource, $javax::microedition::media::Manager::TONE_DEVICE_LOCATOR) == 0) {
                return 'javax::microedition::media::Manager'->createPlayer($resource);
            } else {
                my $inputStream = 'org::allbinary::data::resource::ResourceUtil'->getInstance()->getResourceAsStream($resource);
                return 'javax::microedition::media::Manager'->createPlayer($inputStream, 'org::allbinary::audio::AudioContentTypeDataFactory'->getInstance()->{MIME_AUDIO_WAV}->getName());
            }
        } else {
            return $org::allbinary::media::audio::NoPlayer::NO_PLAYER;
        }
}


# throws MediaException
sub playTone {
    my ($class, $frequency, $time, $volume) = @_;
        if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance()->{SOUND})) {
            'javax::microedition::media::Manager'->playTone($frequency, $time, $volume);
        }
}

# use java::io::InputStream;
# use javax::microedition::media::Manager;
# use javax::microedition::media::MediaException;
# use javax::microedition::media::Player;
use org::allbinary::TsUtil;
use org::allbinary::audio::AudioContentTypeDataFactory;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureFactory;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::audio::Sounds;
use org::allbinary::media::audio::NoPlayer;

1;

