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

package org::allbinary::game::score::remote::RemoteHighScoresProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::score::remote::RemoteHighScoresProcessorInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{noCrypt} = 'org::allbinary::logic::system::security::crypt::jcehelper::NoCrypt'->new();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub process {
    my ($self, $remoteHighScores, $abeClientInformation, $gameInfo) = @_;
        $self->{logUtil}->putF("Begin Remote HighScores Retrieval", $self, $self->{commonStrings}->{PROCESS});
        my $gameInfoData = 'org::allbinary::game::GameInfoData'->getInstance();
        my $hashtable = $abeClientInformation->toHashtable();
        'org::allbinary::util::HashtableUtil'->getInstance()->putAll($gameInfo->toHashtable(), $hashtable);
        $hashtable->put($gameInfoData->{SOFTWARE_INFORMATION}, $remoteHighScores->getSoftwareInformation()->toString());
        $hashtable->put($remoteHighScores->{ASCENDING}, $remoteHighScores->getAscending()->toString());
        my $displayInfoSingleton = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        $hashtable->put($displayInfoSingleton->{ORIENTATION}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->toStringb($displayInfoSingleton->isPortrait()));
        $hashtable->put('org::allbinary::game::score::remote::RemoteHighScoresData'->getInstance()->{GAME_CONFIGURATION}, 'org::allbinary::game::configuration::GameConfigurationCentral'->getInstance()->toString());
        if ($org::allbinary::logic::communication::xmlrpc::XmlRpcAbeClient::isOnline) {
            my $resultHashtable = 'org::allbinary::game::score::remote::XmlRpcRemoteHighScoresClient'->new($abeClientInformation, "highscoresservicessl.php", "HighScoresService.process")->get($hashtable, $self->{noCrypt});
            $remoteHighScores->update($resultHashtable);
        }
}

use org::allbinary::game::GameInfo;
use org::allbinary::game::GameInfoData;
use org::allbinary::game::configuration::GameConfigurationCentral;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::xmlrpc::XmlRpcAbeClient;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::system::security::crypt::jcehelper::NoCrypt;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::HashtableUtil;
use org::allbinary::game::score::remote::RemoteHighScoresProcessorInterface;
use org::allbinary::game::score::remote::RemoteHighScoresData;
use org::allbinary::game::score::remote::XmlRpcRemoteHighScoresClient;

1;

