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

package org::allbinary::logic::communication::ftp::configuration::FtpConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::ftp::configuration::FtpConfigurationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{ftpServer} = undef;
    $self->{ftpPath} = undef;
    $self->{ftpUserName} = undef;
    $self->{ftpPassword} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of FtpConfiguration takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{ftpServer} = $hashMap->get($org::allbinary::logic::communication::ftp::configuration::FtpConfigurationData::SERVER);
        $self->{ftpPath} = $hashMap->get($org::allbinary::logic::communication::ftp::configuration::FtpConfigurationData::PATH);
        $self->{ftpUserName} = $hashMap->get($org::allbinary::logic::communication::ftp::configuration::FtpConfigurationData::USERNAME);
        $self->{ftpPassword} = $hashMap->get($org::allbinary::logic::communication::ftp::configuration::FtpConfigurationData::PASSWORD);
    return $self;
}


sub getServer {
    my ($self) = @_;
        return $self->{ftpServer};
}


sub getPath {
    my ($self) = @_;
        return $self->{ftpPath};
}


sub getUserName {
    my ($self) = @_;
        return $self->{ftpUserName};
}


sub getPassword {
    my ($self) = @_;
        return $self->{ftpPassword};
}


sub setServer {
    my ($self, $value) = @_;
        $self->{ftpServer} = $value;
}


sub setPath {
    my ($self, $value) = @_;
        $self->{ftpPath} = $value;
}


sub setUserName {
    my ($self, $value) = @_;
        $self->{ftpUserName} = $value;
}


sub setPassword {
    my ($self, $value) = @_;
        $self->{ftpPassword} = $value;
}

use java::util::HashMap;
use org::allbinary::logic::communication::ftp::configuration::FtpConfigurationInterface;
use org::allbinary::logic::communication::ftp::configuration::FtpConfigurationData;

1;

