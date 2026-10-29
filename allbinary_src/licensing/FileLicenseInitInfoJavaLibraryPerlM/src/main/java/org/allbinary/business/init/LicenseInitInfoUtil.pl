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

package org::allbinary::business::init::LicenseInitInfoUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::init::LicenseInitInfoUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
    $self->{INITFILENAME} = "licenseinitdata.dat";
    $self->{ABOUT} = "about";
    $self->{PRIVACY_POLICY} = "privacy_policy";
    $self->{filePath} = $self->{stringUtil}->{EMPTY_STRING};
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::init::LicenseInitInfoUtil::instance;
}


sub setFilePath {
    my ($self, $filePath) = @_;
        $self->{filePath} = $filePath;
}


# throws Exception
sub write {
    my ($self, $initData) = @_;
        if ($self->{filePath} eq $self->{stringUtil}->{EMPTY_STRING}) {
            $self->{filePath} = 'org::allbinary::globals::URLGLOBALS'->getMainPath() + 'org::allbinary::globals::PATH_GLOBALS'->getInstance()->{INIT_PATH};
        }
        try {
            my $tsUtil = 'org::allbinary::TsUtil'->getInstance();
            my $dataOutputStream = 'org::allbinary::logic::io::DataOutputStreamFactory'->getInstance()->getInstance($self->{filePath}, $self->{INITFILENAME});
            my $licenseIdCrypted = $tsUtil->getByteArray('org::allbinary::logic::system::security::crypt::WeakCrypt'->new(1)->encrypt($initData->getLicenseId()));
            $dataOutputStream->writeUTF('org::allbinary::logic::system::security::crypt::DatabaseEncoder'->encode($licenseIdCrypted));
            my $numberOfLicenseServers = $initData->getNumberOfServers();
            $dataOutputStream->writeInt($numberOfLicenseServers);
            my $licenseServerCrypted = undef;
            for (my $index = 0; $index < $numberOfLicenseServers; $index++) {
                $licenseServerCrypted = $tsUtil->getByteArray('org::allbinary::logic::system::security::crypt::WeakCrypt'->new(3)->encrypt($initData->getServer($index)));
                $dataOutputStream->writeUTF('org::allbinary::logic::system::security::crypt::DatabaseEncoder'->encode($licenseServerCrypted));
            }
        } catch ($e) {
            $self->{logUtil}->put("Command Failed: " . $self->{INITFILENAME}, $self, "write", $e);
            'org::allbinary::logic::io::FileStreamFactory'->getInstance()->delete($self->{filePath}, $self->{INITFILENAME});
            die $e;
        }
}


# throws Exception
sub read {
    my ($self) = @_;
        return $self->readAgain(0);
}


# throws Exception
sub readAgain {
    my ($self, $initializeCounter) = @_;
        my $METHOD_NAME = "readAgain";
        if ($self->{filePath} eq $self->{stringUtil}->{EMPTY_STRING}) {
            $self->{filePath} = 'org::allbinary::globals::URLGLOBALS'->getMainPath() + 'org::allbinary::globals::PATH_GLOBALS'->getInstance()->{INIT_PATH};
        }
        try {
            $self->{logUtil}->putF("LicenseInitInfo File: " . $self->{INITFILENAME}, $self, $METHOD_NAME);
            my $fileStreamFactory = 'org::allbinary::logic::io::FileStreamFactory'->getInstance();
            my $iFile = $fileStreamFactory->getFileInputStreamInstance($self->{filePath}, $self->{INITFILENAME});
            if (defined($iFile)) {
                my $iData = 'org::allbinary::logic::io::AbDataInputStream'->new($iFile);
                my $initInfo = 'org::allbinary::business::init::LicenseInitInfo'->new();
                my $decodedByteArray = 'org::allbinary::logic::system::security::crypt::DatabaseEncoder'->decode($iData->readUTF());
                my $licenseIdDecoded = pack("C*", @{$decodedByteArray});
                $initInfo->setLicenseId('org::allbinary::logic::system::security::crypt::WeakCrypt'->new(1)->decrypt($licenseIdDecoded));
                my $numberOfLicenseServers = $iData->readInt();
                my $NEXT_FILE = 'org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{NEXT})->append(" License Server From File: ")->toString();
                my $licenseServerDecoded = undef;
                for (my $index = 0; $index < $numberOfLicenseServers; $index++) {
                    $decodedByteArray = 'org::allbinary::logic::system::security::crypt::DatabaseEncoder'->decode($iData->readUTF());
                    $licenseServerDecoded = pack("C*", @{$decodedByteArray});
                    $initInfo->setServer('org::allbinary::logic::system::security::crypt::WeakCrypt'->new(3)->decrypt($licenseServerDecoded), $index);
                    $self->{logUtil}->putF($NEXT_FILE . $initInfo->getServer($index), $self, $METHOD_NAME);
                }
                return $initInfo;
            } else {
                die ("Could Not Load License InitInfo: " . $self->{INITFILENAME});
            }
        } catch ($e) {
            try {
                $self->{logUtil}->put("Command Failed: " . $self->{INITFILENAME}, $self, $METHOD_NAME, $e);
            } catch ($e2) {
                $self->{logUtil}->put("LicenseInitInfo Read Retry: " . $self->{INITFILENAME}, $self, "readAgain()", $e2);
            }
            die ("LicenseInitInfo Read Error: " . $self->{INITFILENAME});
        }
}


sub getFilePath {
    my ($self) = @_;
        return $self->{filePath};
}

use org::allbinary::TsUtil;
use org::allbinary::globals::PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::AbDataInputStream;
use org::allbinary::logic::io::AbDataOutputStream;
use org::allbinary::logic::io::AbFileInputStream;
use org::allbinary::logic::io::DataOutputStreamFactory;
use org::allbinary::logic::io::FileStreamFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::security::crypt::DatabaseEncoder;
use org::allbinary::logic::system::security::crypt::WeakCrypt;
use org::allbinary::string::CommonLabels;
use org::allbinary::business::init::LicenseInitInfo;

1;

