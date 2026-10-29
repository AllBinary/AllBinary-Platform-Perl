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

package org::allbinary::logic::communication::xmlrpc::XmlRpcAbeClient;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $isOnline = 1;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{remoteMethod} = undef;
    $self->{clientInfo} = undef;
    $self->{client} = $org::apache::xmlrpc::NullXmlRpcHandler::NULL_XML_RPC_HANDLER;
    $self->{server} = undef;
    $self->{start} = 0;
    $self->{maxServers} = 0;
    $self->{isDone} = undef;
    $self->{START_SERVER} = "Start With Server #";
    $self->{TRYING} = "Trying Server #";
    $self->{SEP} = 'org::allbinary::string::CommonLabels'->getInstance()->{COLON_SEP};
    $self->{CLIENT_INFO} = "Client Info: \n";
    $self->{RESULT} = 'org::allbinary::string::CommonLabels'->getInstance()->{RESULT_} + 'org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE};
    $self->{INVALID} = "License data is Invalid Trying Other Servers";
    $self->{EXCEPTION_IN_CLIENT} = "Exception in client";
    $self->{SERVER_REPORTED_ERROR} = "Server reported error";
    $self->{UNKNOWN_ERROR} = "Unknown License Retrieval Failure";
    $self->{TRYING_OTHER_SERVERS} = "IOException Trying Other Servers";
    $self->{HOST_NOT_RESOLVED_MSG} = "Not Trying Again Since Host Unresolved";
    $self->{HOST_NOT_RESOLVED} = "Host is unresolved";
    $self->{myRandomFactory} = 'org::allbinary::game::rand::MyRandomFactory'->getInstance();
}


sub new {
    my ($class, $clientInfo, $remoteMethod) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{remoteMethod} = $remoteMethod;
        $self->{clientInfo} = $clientInfo;
        if ($clientInfo->getNumberOfLicenseServers() > 1) {
            $self->{maxServers} = $clientInfo->getNumberOfLicenseServers() - 2;
            $self->{start} = $self->{myRandomFactory}->getAbsoluteNextInt($self->{maxServers}) + 1;
        } elsif ($clientInfo->getNumberOfLicenseServers() == 1) {
            $self->{maxServers} = 0;
            $self->{start} = 0;
        }
        $self->{isDone} = 0;
        $self->{server} = $self->{start};
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{START_SERVER});
        $stringBuffer->appendint($self->getServer());
        $stringBuffer->append($self->{SEP});
        $stringBuffer->append($clientInfo->getLicenseServer($self->getServer()));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR});
    return $self;
}


# throws Exception
sub get {
    my ($self, $anyType) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log($self->{commonStrings}->{NOT_IMPLEMENTED}, $self);
        return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
}


# throws Exception
sub tryAnother {
    my ($self, $anyType) = @_;
        if ($self->getServer() < $self->getMaxServers()) {
            $self->setServer($self->getServer() + 1);
        } else {
            $self->setServer(0);
        }
        if ($self->getServer() != $self->getStart() && !$self->isIsDone()) {
            return $self->get($anyType);
        } else {
            $self->setIsDone(1);
        }
        die ("Tried All Servers But Still Failed");
}


sub getClientInfo {
    my ($self) = @_;
        return $self->{clientInfo};
}


sub getClient {
    my ($self) = @_;
        return $self->{client};
}


sub setClient {
    my ($self, $client) = @_;
        $self->{client} = $client;
}


sub getServer {
    my ($self) = @_;
        return $self->{server};
}


sub setServer {
    my ($self, $server) = @_;
        $self->{server} = $server;
}


sub getStart {
    my ($self) = @_;
        return $self->{start};
}


sub setStart {
    my ($self, $start) = @_;
        $self->{start} = $start;
}


sub getMaxServers {
    my ($self) = @_;
        return $self->{maxServers};
}


sub setMaxServers {
    my ($self, $maxServers) = @_;
        $self->{maxServers} = $maxServers;
}


sub isIsDone {
    my ($self) = @_;
        return $self->{isDone};
}


sub setIsDone {
    my ($self, $isDone) = @_;
        $self->{isDone} = $isDone;
}


sub getRemoteMethod {
    my ($self) = @_;
        return $self->{remoteMethod};
}

use org::allbinary::game::rand::MyRandomFactory;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::apache::xmlrpc::NullXmlRpcHandler;
use org::apache::xmlrpc::XmlRpcClient;
use org::apache::xmlrpc::XmlRpcHandler;

1;

