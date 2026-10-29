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

package org::allbinary::business::context::configuration::ContextConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::context::configuration::ContextConfigurationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{emailServerConfigurationInterface} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of ContextConfiguration takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "ContextConfiguration");
        $self->setEmailServerConfigurationInterface('org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfiguration'->new());
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "ContextConfiguration(HashMap)");
        $self->setEmailServerConfigurationInterface('org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfiguration'->new($hashMap));
    return $self;
}


sub getEmailServerConfigurationInterface {
    my ($self) = @_;
        return $self->{emailServerConfigurationInterface};
}


sub setEmailServerConfigurationInterface {
    my ($self, $emailServerConfigurationInterface) = @_;
        $self->{emailServerConfigurationInterface} = $emailServerConfigurationInterface;
}

use java::util::HashMap;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfiguration;
use org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::business::context::configuration::ContextConfigurationInterface;

1;

