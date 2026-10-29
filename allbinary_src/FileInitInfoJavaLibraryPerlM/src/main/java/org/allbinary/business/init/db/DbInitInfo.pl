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

package org::allbinary::business::init::db::DbInitInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::init::db::DbConnectionInfo';


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{directory} = 'org::allbinary::logic::io::file::directory::Directory'->getInstance();
    $self->{httpData} = 'org::allbinary::logic::communication::http::HttpData'->getInstance();
    $self->{GET_URL} = "getUrl";
    $self->{PACKAGE} = 'org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{DBINITPATH};
    $self->{initFileName} = undef;
    $self->{hasRead} = 0;
}


sub new {
    my ($class, $initFileName, $read) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        $self->{initFileName} = $initFileName;
        if ($read) {
            $self->updateIfNeeded();
        } else {
            $self->setHasRead(1);
        }
    return $self;
}


sub getUrl {
    my ($self) = @_;
        my $url = $self->SUPER::getUrl();
        if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADER})) {
            'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{httpData}->{URL_LABEL} . $url, $self, $self->{GET_URL});
        }
        return $url;
}


# throws Exception
sub write {
    my ($self) = @_;
        my $PATH = 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getWebappPath() . $self->{PACKAGE}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        $self->{directory}->create($PATH);
        my $FILEABPATH = 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getWebappPath() . $self->{PACKAGE}, $self->{initFileName});
        try {
            my $newFile = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($FILEABPATH);
            $newFile->createNewFile();
            my $dataOutputStream = 'org::allbinary::logic::io::DataOutputStreamFactory'->getInstance()->getInstanceForAbFile($newFile);
            try {
                my $cryptedJdbcDriver = 'org::allbinary::logic::system::security::crypt::WeakCrypt'->new(1)->encrypt($self->getJdbcDriver())->getBytes();
                my $cryptedName = 'org::allbinary::logic::system::security::crypt::WeakCrypt'->new(2)->encrypt($self->getName())->getBytes();
                my $cryptedUserName = 'org::allbinary::logic::system::security::crypt::WeakCrypt'->new(3)->encrypt($self->getUserName())->getBytes();
                my $cryptedPassword = 'org::allbinary::logic::system::security::crypt::WeakCrypt'->new(4)->encrypt($self->getPassword())->getBytes();
                my $cryptedSchema = 'org::allbinary::logic::system::security::crypt::WeakCrypt'->new(5)->encrypt($self->getSchema())->getBytes();
                my $cryptedServer = 'org::allbinary::logic::system::security::crypt::WeakCrypt'->new(6)->encrypt($self->getServer())->getBytes();
                my $cryptedPort = 'org::allbinary::logic::system::security::crypt::WeakCrypt'->new(7)->encrypt($self->getPort())->getBytes();
                $dataOutputStream->writeUTF('org::allbinary::logic::system::security::crypt::DatabaseEncoder'->encode($cryptedJdbcDriver));
                $dataOutputStream->writeUTF('org::allbinary::logic::system::security::crypt::DatabaseEncoder'->encode($cryptedName));
                $dataOutputStream->writeUTF('org::allbinary::logic::system::security::crypt::DatabaseEncoder'->encode($cryptedUserName));
                $dataOutputStream->writeUTF('org::allbinary::logic::system::security::crypt::DatabaseEncoder'->encode($cryptedPassword));
                $dataOutputStream->writeUTF('org::allbinary::logic::system::security::crypt::DatabaseEncoder'->encode($cryptedSchema));
                $dataOutputStream->writeUTF('org::allbinary::logic::system::security::crypt::DatabaseEncoder'->encode($cryptedServer));
                $dataOutputStream->writeUTF('org::allbinary::logic::system::security::crypt::DatabaseEncoder'->encode($cryptedPort));
                $self->{hasRead} = 0;
            } catch ($exception) { die $exception; } finally {
                'org::allbinary::logic::io::StreamUtil'->getInstance()->close($dataOutputStream);
            }
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADERERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE("Failed Write: " . $FILEABPATH->toString(), $self, "write", $e);
            }
        }
}


# throws Exception
sub load {
    my ($self) = @_;
        my $FILEABPATH = 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getWebappPath() . $self->{PACKAGE}, $self->{initFileName});
        try {
            my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($FILEABPATH);
            if ($file->isFile()) {
                my $iFile = 'org::allbinary::logic::io::AbFileInputStream'->new($file);
                my $iData = 'org::allbinary::logic::io::AbDataInputStream'->new($iFile);
                try {
                    my $decryptedJdbcDriver = ("" . 'org::allbinary::logic::system::security::crypt::DatabaseEncoder'->decode($iData->readUTF()));
                    my $decryptedName = ("" . 'org::allbinary::logic::system::security::crypt::DatabaseEncoder'->decode($iData->readUTF()));
                    my $decryptedUserName = ("" . 'org::allbinary::logic::system::security::crypt::DatabaseEncoder'->decode($iData->readUTF()));
                    my $decryptedPassword = ("" . 'org::allbinary::logic::system::security::crypt::DatabaseEncoder'->decode($iData->readUTF()));
                    my $decryptedSchema = ("" . 'org::allbinary::logic::system::security::crypt::DatabaseEncoder'->decode($iData->readUTF()));
                    my $decryptedServer = ("" . 'org::allbinary::logic::system::security::crypt::DatabaseEncoder'->decode($iData->readUTF()));
                    my $decryptedPort = ("" . 'org::allbinary::logic::system::security::crypt::DatabaseEncoder'->decode($iData->readUTF()));
                    $self->setJdbcDriver('org::allbinary::logic::system::security::crypt::WeakCrypt'->new(1)->decrypt($decryptedJdbcDriver));
                    $self->setName('org::allbinary::logic::system::security::crypt::WeakCrypt'->new(2)->decrypt($decryptedName));
                    $self->setUserName('org::allbinary::logic::system::security::crypt::WeakCrypt'->new(3)->decrypt($decryptedUserName));
                    $self->setPassword('org::allbinary::logic::system::security::crypt::WeakCrypt'->new(4)->decrypt($decryptedPassword));
                    $self->setSchema('org::allbinary::logic::system::security::crypt::WeakCrypt'->new(5)->decrypt($decryptedSchema));
                    $self->setServer('org::allbinary::logic::system::security::crypt::WeakCrypt'->new(6)->decrypt($decryptedServer));
                    $self->setPort('org::allbinary::logic::system::security::crypt::WeakCrypt'->new(7)->decrypt($decryptedPort));
                    my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
                } catch ($exception) { die $exception; } finally {
                    'org::allbinary::logic::io::StreamUtil'->getInstance()->close($iData);
                }
            } else {
                $self->{hasRead} = 0;
                if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADER})) {
                    'org::allbinary::logic::communication::log::PreLogUtil'->put("Not a File - Failed Loading: " . $FILEABPATH->toString(), $self, $self->{commonStrings}->{LOAD});
                }
            }
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADERERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE("Failed Loading: " . $FILEABPATH->toString(), $self, $self->{commonStrings}->{LOAD}, $e);
            }
        }
}


sub setHasRead {
    my ($self, $value) = @_;
        $self->{hasRead} = $value;
}


sub updateIfNeeded {
    my ($self) = @_;
        try {
            if (!$self->{hasRead}) {
                $self->{hasRead} = 1;
                $self->load();
            }
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADERERROR})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self, "updateIfNeeded", $e);
            }
        }
}


sub getName {
    my ($self) = @_;
        $self->updateIfNeeded();
        if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADER})) {
            'org::allbinary::logic::communication::log::PreLogUtil'->put("Name: " . $self->SUPER::getName(), $self, "getName");
        }
        return $self->SUPER::getName();
}


sub getUserName {
    my ($self) = @_;
        $self->updateIfNeeded();
        if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PRELOADER})) {
            'org::allbinary::logic::communication::log::PreLogUtil'->put("Name: " . $self->SUPER::getUserName(), $self, "getUserName");
        }
        return $self->SUPER::getUserName();
}


sub getPassword {
    my ($self) = @_;
        $self->updateIfNeeded();
        return $self->SUPER::getPassword();
}


sub getSchema {
    my ($self) = @_;
        $self->updateIfNeeded();
        return $self->SUPER::getSchema();
}


sub getServer {
    my ($self) = @_;
        $self->updateIfNeeded();
        return $self->SUPER::getServer();
}


sub getPort {
    my ($self) = @_;
        $self->updateIfNeeded();
        return $self->SUPER::getPort();
}

use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::http::HttpData;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory;
use org::allbinary::logic::communication::log::config::type::LogConfigTypes;
use org::allbinary::logic::io::AbDataInputStream;
use org::allbinary::logic::io::AbDataOutputStream;
use org::allbinary::logic::io::AbFileInputStream;
use org::allbinary::logic::io::DataOutputStreamFactory;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::directory::Directory;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::security::crypt::DatabaseEncoder;
use org::allbinary::logic::system::security::crypt::WeakCrypt;
use org::allbinary::string::CommonStrings;
use org::allbinary::business::init::db::DbConnectionInfo;

1;

