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

#J2SEMediaMIDPMinimalJavaLibrary
package org::allbinary::media::audio::AllBinaryMediaManager;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $THIS = "AllBinaryMediaManagerPC";
our $CREATE_PLAYER = "createPlayer";


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
        if ((index($resource, $javax::microedition::media::Manager::TONE_DEVICE_LOCATOR) == 0)) {
            return 'org::allbinary::media::audio::AllBinaryMediaManager'->createPlayerFromInputStream('java::io::ByteArrayInputStream'->new('org::allbinary::logic::NullUtil'->getInstance()->{NULL_BYTE_ARRAY}), 'org::allbinary::audio::AudioContentTypeDataFactory'->getInstance()->{MIME_AUDIO_TONE}->getName());
        } elsif ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance()->{SOUND})) {
            try {
                my $inputStream = 'org::allbinary::data::resource::ResourceUtil'->getInstance()->getResourceAsStream($resource);
                my $bufferedInputStream = 'java::io::BufferedInputStream'->new($inputStream);
                return 'org::allbinary::media::audio::PCClipWavPlayer'->new($bufferedInputStream);
            } catch ($e) {
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                my $commonString = 'org::allbinary::string::CommonStrings'->getInstance();
                $logUtil->put($commonString->{EXCEPTION}, $org::allbinary::media::audio::AllBinaryMediaManager::THIS, $CREATE_PLAYER, $e);
                return $org::allbinary::media::audio::NoPlayer::NO_PLAYER;
            }
        } else {
            return $org::allbinary::media::audio::NoPlayer::NO_PLAYER;
        }
}


# throws IOException, MediaException
sub createPlayerFromInputStream {
    my ($class, $stream, $type) = @_;
        die ("No Impl");
}


# throws MediaException
sub playTone {
    my ($class, $frequency, $time, $volume) = @_;
        die ("No Impl");
}


sub isInitialized {
    my ($class) = @_;
        return 1;
}

# use java::io::BufferedInputStream;
# use java::io::ByteArrayInputStream;
# use java::io::IOException;
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
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::audio::Sounds;
use org::allbinary::media::audio::NoPlayer;
use org::allbinary::media::audio::PCClipWavPlayer;

1;

