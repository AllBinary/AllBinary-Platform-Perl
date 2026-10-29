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

package org::allbinary::business::init::InstallerInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::init::InstallerInfo'->new();
our $INITFILENAME = "installerdata.dat";
our $PACKAGE = 'org::allbinary::globals::PATH_GLOBALS'->getInstance()->{INIT_PATH};
our $userName = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
our $password = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
our $hasRead = 0;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub write {
    my ($self) = @_;
        my $FILEABPATH = 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getMainPath() + $org::allbinary::business::init::InstallerInfo::PACKAGE, $org::allbinary::business::init::InstallerInfo::INITFILENAME);
        try {
            my $newFile = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($FILEABPATH);
            $newFile->createNewFile();
            my $dataOutputStream = 'org::allbinary::logic::io::DataOutputStreamFactory'->getInstance()->getInstanceForAbFile($newFile);
            my $cryptedUserName = 'org::allbinary::logic::system::security::crypt::WeakCrypt'->new(1)->encrypt($self->getUserName())->getBytes();
            my $cryptedPassword = 'org::allbinary::logic::system::security::crypt::WeakCrypt'->new(2)->encrypt($self->getPassword())->getBytes();
            $dataOutputStream->writeUTF('org::allbinary::logic::system::security::crypt::DatabaseEncoder'->encode($cryptedUserName));
            $dataOutputStream->writeUTF('org::allbinary::logic::system::security::crypt::DatabaseEncoder'->encode($cryptedPassword));
            $org::allbinary::business::init::InstallerInfo::hasRead = 0;
        } catch ($e) {
            if ($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRELOADERERROR})) {
                $self->{logUtil}->putF("Failed", $self, "write");
            }
            die $e;
        }
}


# throws Exception
sub read {
    my ($self) = @_;
        my $FILEABPATH = 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getMainPath() + $org::allbinary::business::init::InstallerInfo::PACKAGE, $org::allbinary::business::init::InstallerInfo::INITFILENAME);
        try {
            my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($FILEABPATH);
            if ($file->isFile()) {
                my $iFile = 'org::allbinary::logic::io::AbFileLocalInputStream'->new($file);
                my $iData = 'org::allbinary::logic::io::AbDataInputStream'->new($iFile);
                my $decryptedUserName = ("" . 'org::allbinary::logic::system::security::crypt::DatabaseEncoder'->decode($iData->readUTF()));
                my $decryptedPassword = ("" . 'org::allbinary::logic::system::security::crypt::DatabaseEncoder'->decode($iData->readUTF()));
                $self->setUserName('org::allbinary::logic::system::security::crypt::WeakCrypt'->new(1)->decrypt($decryptedUserName));
                $self->setPassword('org::allbinary::logic::system::security::crypt::WeakCrypt'->new(2)->decrypt($decryptedPassword));
            } else {
                if ($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRELOADER})) {
                    $self->{logUtil}->putF("Not a File - Failed Loading: " . $FILEABPATH->toString(), $self, "read");
                }
            }
        } catch ($e) {
            if ($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRELOADERERROR})) {
                $self->{logUtil}->putF("Failed", $self, "read");
            }
        }
}


sub setHasRead {
    my ($class, $value) = @_;
        $org::allbinary::business::init::InstallerInfo::hasRead = $value;
}


sub setUserName {
    my ($self, $userName) = @_;
        $org::allbinary::business::init::InstallerInfo::userName = $userName;
}


sub setPassword {
    my ($self, $password) = @_;
        $org::allbinary::business::init::InstallerInfo::password = $password;
}


# throws Exception
sub updateIfNeeded {
    my ($self) = @_;
        if (!$org::allbinary::business::init::InstallerInfo::hasRead) {
            $org::allbinary::business::init::InstallerInfo::hasRead = 1;
            $self->read();
            if (!defined($org::allbinary::business::init::InstallerInfo::userName) || !defined($org::allbinary::business::init::InstallerInfo::password)) {
                if ($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::init::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRELOADER})) {
                    $self->{logUtil}->putF("Failed", $self, "updateIfNeeded");
                }
            }
        }
}


# throws Exception
sub getUserName {
    my ($self) = @_;
        $self->updateIfNeeded();
        return $org::allbinary::business::init::InstallerInfo::userName;
}


# throws Exception
sub getPassword {
    my ($self) = @_;
        $self->updateIfNeeded();
        return $org::allbinary::business::init::InstallerInfo::password;
}


# throws Exception
sub isValid {
    my ($self, $userName, $password) = @_;
        $self->updateIfNeeded();
        if (defined($userName) && ($userName cmp $userName) == 0 && defined($password) && ($password cmp $password) == 0) {
            return 1;
        }
        return 0;
}

use org::allbinary::globals::PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::AbDataInputStream;
use org::allbinary::logic::io::AbDataOutputStream;
use org::allbinary::logic::io::AbFileLocalInputStream;
use org::allbinary::logic::io::DataOutputStreamFactory;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::security::crypt::DatabaseEncoder;
use org::allbinary::logic::system::security::crypt::WeakCrypt;

1;

