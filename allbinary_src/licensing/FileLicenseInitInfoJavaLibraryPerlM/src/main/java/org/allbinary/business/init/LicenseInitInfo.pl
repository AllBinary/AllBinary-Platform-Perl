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

package org::allbinary::business::init::LicenseInitInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{id} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{serverVector} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getLicenseId {
    my ($self) = @_;
        return $self->{id};
}


sub getServer {
    my ($self, $index) = @_;
        return $self->{serverVector}->{objectArray}->[$index];
}


sub getNumberOfServers {
    my ($self) = @_;
        return $self->{serverVector}->size();
}


sub setLicenseId {
    my ($self, $value) = @_;
        $self->{id} = $value;
}


sub clearServers {
    my ($self) = @_;
        $self->{serverVector} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub setServer {
    my ($self, $value, $index) = @_;
        $self->{serverVector}->addAt($index, $value);
}


sub addServer {
    my ($self, $value) = @_;
        $self->{serverVector}->add($value);
}


sub getServerList {
    my ($self) = @_;
        return $self->{serverVector};
}


sub setServerList {
    my ($self, $servers) = @_;
        if ('org::allbinary::debug::DebugFactory'->getInstance() == 'org::allbinary::debug::NoDebug'->getInstance()) {
            $self->{serverVector} = $servers;
        }
}

use org::allbinary::debug::DebugFactory;
use org::allbinary::debug::NoDebug;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

