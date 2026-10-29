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

package org::allbinary::logic::communication::log::XmlRpcRemoteLogClient;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::xmlrpc::XmlRpcAbeClient';


sub _init_fields {
    my ($self) = @_;
    $self->{noCrypt} = 'org::allbinary::logic::system::security::crypt::jcehelper::NoCrypt'->new();
}


sub new {
    my ($class, $clientInfo) = @_;
    my $self = $class->SUPER::new($clientInfo, "SSLLogServ.logUtil");
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


# throws Exception
sub get {
    my ($self, $anyType) = @_;
        try {
            my $param = 'org::allbinary::util::BasicArrayListD'->new();
            my $serverUrl = $self->getClientInfo()->getLicenseServer($self->getServer());
            my $index = rindex($serverUrl, "/");
            $serverUrl = substr($serverUrl, 0, ($index + 1) - (0)) . "logservssl.php";
            my $xmlRpcClient = 'org::apache::xmlrpc::XmlRpcClient'->new($serverUrl);
            $self->setClient($xmlRpcClient);
            $xmlRpcClient->setBasicAuthentication(undef, undef);
            my $hashtable = $anyType;
            $param->add($hashtable);
            my $result = $xmlRpcClient->execute($self->getRemoteMethod(), $param, $self->{noCrypt});
            print('org::allbinary::string::CommonLabels'->getInstance()->{RESULT_} + 'org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE} . $result->toString(), "\n");
            return $result;
        } catch ($e) {
            print("IOException Trying Other Servers", "\n");
            if (!("" . $e)->startsWith($self->{HOST_NOT_RESOLVED})) {
                return $self->tryAnother($anyType);
            } else {
                die ($self->{HOST_NOT_RESOLVED_MSG});
            }
        }
}

# use java::io::IOException;
use org::apache::xmlrpc::XmlRpcClient;
use org::apache::xmlrpc::XmlRpcException;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::communication::xmlrpc::XmlRpcAbeClient;
use org::allbinary::logic::system::security::crypt::jcehelper::NoCrypt;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::util::ABHashtable;
use java::lang::System;

1;

