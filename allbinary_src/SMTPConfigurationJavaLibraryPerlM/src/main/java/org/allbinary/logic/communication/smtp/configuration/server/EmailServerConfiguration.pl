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

package org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{accountName} = undef;
    $self->{password} = undef;
    $self->{smtpServer} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    die "No constructor of EmailServerConfiguration takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::logic::communication::smtp::configuration::server::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::configuration::server::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF($commonStrings->{START}, $self, $commonStrings->{CONSTRUCTOR});
        }
        $self->setSmtpServer('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::logic::communication::smtp::configuration::server::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::configuration::server::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF($commonStrings->{START}, $self, "EmailServerConfiguration(HashMap)");
        }
        $self->setAccountName($hashMap->get($org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationData::ACCOUNT));
        $self->setPassword($hashMap->get($org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationData::PASSWORD));
        $self->setSmtpServer($hashMap->get($org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationData::SERVER));
        $self->log();
    return $self;
}


sub _new3 {
    my ($class, $account, $password, $server) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::logic::communication::smtp::configuration::server::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::configuration::server::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF($commonStrings->{START}, $self, "EmailServerConfiguration(HashMap)");
        }
        $self->setAccountName($account);
        $self->setPassword($password);
        $self->setSmtpServer($server);
        $self->log();
    return $self;
}


sub setSmtpServer {
    my ($self, $value) = @_;
        $self->{smtpServer} = $value;
}


sub getSmtpServer {
    my ($self) = @_;
        return $self->{smtpServer};
}


sub getAccountName {
    my ($self) = @_;
        return $self->{accountName};
}


sub setAccountName {
    my ($self, $accountName) = @_;
        $self->{accountName} = $accountName;
}


sub getPassword {
    my ($self) = @_;
        return $self->{password};
}


sub setPassword {
    my ($self, $password) = @_;
        $self->{password} = $password;
}


sub log {
    my ($self) = @_;
        if ($org::allbinary::logic::communication::smtp::configuration::server::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::configuration::server::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            $self->{logUtil}->putF($self->toString(), $self, "EmailServerConfiguration");
        }
}


sub toString {
    my ($self) = @_;
        return "Email Server Configuration:\n" . "Smtp Server: \n" . $self->getSmtpServer() . "\nAccount Name: " . $self->getAccountName() . "\nPassword: " . $self->getPassword();
}

use java::util::HashMap;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationInterface;
use org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationData;

1;

