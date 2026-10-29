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

#NotDeviceSpecificNoMediaMIDP1Library
package org::allbinary::media::audio::AllBinaryMediaManager;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $THIS = "AllBinaryMediaManagerNoMediaMIDP1";


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


sub createPlayerFromInputStream {
    my ($class, $stream, $type) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $commonString = 'org::allbinary::string::CommonStrings'->getInstance();
        $logUtil->putF($commonString->{START}, $org::allbinary::media::audio::AllBinaryMediaManager::THIS, "creatPlayer(InputStream)");
        return $org::allbinary::media::audio::NoPlayer::NO_PLAYER;
}


sub createPlayer {
    my ($class, $locator) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $commonString = 'org::allbinary::string::CommonStrings'->getInstance();
        $logUtil->putF($commonString->{START}, $org::allbinary::media::audio::AllBinaryMediaManager::THIS, "creatPlayer(locator)");
        return $org::allbinary::media::audio::NoPlayer::NO_PLAYER;
}


sub playTone {
    my ($class, $frequency, $time, $volume) = @_;
}


sub getSupportedContentTypes {
    my ($class, $protocol) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->getArrayInstance();
}


sub getSupportedProtocols {
    my ($class, $content_type) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->getArrayInstance();
}

# use java::io::InputStream;
# use javax::microedition::media::Player;
use org::allbinary::TsUtil;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::audio::Sounds;
use org::allbinary::media::audio::NoPlayer;

1;

