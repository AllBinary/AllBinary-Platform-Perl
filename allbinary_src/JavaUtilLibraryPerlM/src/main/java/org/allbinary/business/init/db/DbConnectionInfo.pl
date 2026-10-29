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

package org::allbinary::business::init::db::DbConnectionInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::init::db::DatabaseConnectionInfoInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{jdbcDriver} = undef;
    $self->{name} = undef;
    $self->{userName} = undef;
    $self->{password} = undef;
    $self->{schema} = undef;
    $self->{server} = undef;
    $self->{port} = undef;
    $self->{url} = undef;
    $self->{host} = undef;
    $self->{SCHEMA_SEP} = "://";
    $self->{USER_NAME_KEY} = "?user=";
    $self->{PASSWORD_KEY} = "&password=";
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub updateUrl {
    my ($self) = @_;
        $self->updateHost();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->getHost());
        $stringBuffer->append($self->getName());
        $stringBuffer->append($self->getUserNameKey());
        $stringBuffer->append($self->getUserName());
        $stringBuffer->append($self->getPasswordKey());
        $stringBuffer->append($self->getPassword());
        $self->{url} = $stringBuffer->toString();
}


sub getUrl {
    my ($self) = @_;
        return $self->{url};
}


sub getJdbcDriver {
    my ($self) = @_;
        return $self->{jdbcDriver};
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getUserName {
    my ($self) = @_;
        return $self->{userName};
}


sub getPassword {
    my ($self) = @_;
        return $self->{password};
}


sub updateHost {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->getSchema());
        $stringBuffer->append($self->{SCHEMA_SEP});
        $stringBuffer->append($self->getServer());
        if (defined($self->getPort()) && $self->getPort()->length() > 1) {
            $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{COLON});
            $stringBuffer->append($self->getPort());
        }
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        $self->{host} = $stringBuffer->toString();
}


sub getHost {
    my ($self) = @_;
        return $self->{host};
}


sub getSchema {
    my ($self) = @_;
        return $self->{schema};
}


sub getServer {
    my ($self) = @_;
        return $self->{server};
}


sub getPort {
    my ($self) = @_;
        return $self->{port};
}


sub setJdbcDriver {
    my ($self, $value) = @_;
        $self->{jdbcDriver} = $value;
}


sub setName {
    my ($self, $value) = @_;
        $self->{name} = $value;
        $self->updateUrl();
}


sub setUserName {
    my ($self, $value) = @_;
        $self->{userName} = $value;
        $self->updateUrl();
}


sub setPassword {
    my ($self, $value) = @_;
        $self->{password} = $value;
        $self->updateUrl();
}


sub setSchema {
    my ($self, $value) = @_;
        $self->{schema} = $value;
        $self->updateUrl();
}


sub setServer {
    my ($self, $value) = @_;
        $self->{server} = $value;
        $self->updateUrl();
}


sub setPort {
    my ($self, $value) = @_;
        $self->{port} = $value;
        $self->updateUrl();
}


sub getUserNameKey {
    my ($self) = @_;
        return $self->{USER_NAME_KEY};
}


sub getPasswordKey {
    my ($self) = @_;
        return $self->{PASSWORD_KEY};
}

use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::business::init::db::DatabaseConnectionInfoInterface;

1;

