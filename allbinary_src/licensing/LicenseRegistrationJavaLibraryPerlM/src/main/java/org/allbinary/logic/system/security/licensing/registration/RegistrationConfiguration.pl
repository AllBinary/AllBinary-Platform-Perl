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

package org::allbinary::logic::system::security::licensing::registration::RegistrationConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::logic::system::security::licensing::registration::RegistrationConfiguration'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{registrationCode} = "No Registration Code";
    $self->{NAME} = "registrationid";
    $self->{FILE} = "Registration.dat";
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        try {
            if ('org::allbinary::logic::io::file::FileFactory'->getInstance()->isFile($self->{FILE})) {
                $self->read();
            } else {
                $self->write();
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{CONSTRUCTOR}, $e);
        }
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::security::licensing::registration::RegistrationConfiguration::SINGLETON;
}


# throws Exception
sub read {
    my ($self) = @_;
        my $fileInputStreamFactory = 'org::allbinary::logic::io::FileStreamFactory'->getInstance();
        my $fileInputStream = $fileInputStreamFactory->getFileInputStreamInstance('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $self->{FILE});
        my $dataInputStream = 'java::io::DataInputStream'->new($fileInputStream);
        $self->setRegistrationCode($dataInputStream->readUTF());
        'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append("Read Configuration: ")->append($self->toString())->toString(), $self, "read");
}


# throws Exception
sub write {
    my ($self) = @_;
        my $dataOutputStream = undef;
        try {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Write Configuration: ")->append($self->toString())->toString(), $self, "write");
            my $fileInputStreamFactory = 'org::allbinary::logic::io::FileStreamFactory'->getInstance();
            my $fileOutputStream = $fileInputStreamFactory->getFileOutputStreamInstance('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $self->{FILE});
            $dataOutputStream = 'org::allbinary::logic::io::AbDataOutputStream'->new($fileOutputStream);
            $dataOutputStream->writeUTF($self->getRegistrationCode());
            $dataOutputStream->flush();
        } catch ($exception) { die $exception; } finally {
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($dataOutputStream);
        }
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append("Registration Code: ")->append($self->getRegistrationCode())->toString();
}


sub setRegistrationCode {
    my ($self, $registrationCode) = @_;
        $self->{registrationCode} = $registrationCode;
}


sub getRegistrationCode {
    my ($self) = @_;
        return $self->{registrationCode};
}

# use java::io::DataInputStream;
# use java::io::InputStream;
# use java::io::OutputStream;
use org::allbinary::logic::io::AbDataOutputStream;
use org::allbinary::logic::io::FileStreamFactory;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::file::FileFactory;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;

1;

