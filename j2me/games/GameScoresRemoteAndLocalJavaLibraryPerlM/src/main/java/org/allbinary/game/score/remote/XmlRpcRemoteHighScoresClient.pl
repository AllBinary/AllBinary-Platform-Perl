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

package org::allbinary::game::score::remote::XmlRpcRemoteHighScoresClient;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::xmlrpc::XmlRpcAbeClient';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{page} = undef unless exists $self->{page};
}


sub new {
    my ($class, $clientInfo, $page, $remoteMethod) = @_;
    my $self = $class->SUPER::new($clientInfo, $remoteMethod);
    _init_fields($self);
        # super(...) made $self above
        $self->{page} = $page;
        $self->setServer(0);
    return $self;
}


# throws Exception
sub get {
    my ($self, $anyType, $cryptInterface) = @_;
        try {
            my $param = 'org::allbinary::util::BasicArrayListD'->new();
            my $serverUrl = $self->getClientInfo()->getLicenseServer($self->getServer());
            my $index = rindex($serverUrl, "/");
            $serverUrl = substr($serverUrl, 0, ($index + 1) - (0)) . $self->{page};
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append(java::lang::Object::jstatic('org::allbinary::game::score::remote::XmlRpcRemoteHighScoresClient', 'TRYING'));
            $stringBuffer->appendint(int($self->getServer()));
            $stringBuffer->append(java::lang::Object::jstatic('org::allbinary::game::score::remote::XmlRpcRemoteHighScoresClient', 'SEP'));
            $stringBuffer->append($serverUrl);
            $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{GET});
            my $xmlRpcClient = 'org::apache::xmlrpc::XmlRpcClient'->new($serverUrl);
            $self->setClient($xmlRpcClient);
            $xmlRpcClient->setBasicAuthentication('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            my $hashtable = $anyType;
            $self->{logUtil}->putF(java::lang::Object::jstatic('org::allbinary::game::score::remote::XmlRpcRemoteHighScoresClient', 'CLIENT_INFO') . $hashtable->toString(), $self, $self->{commonStrings}->{GET});
            $param->add($hashtable);
            my $result = $xmlRpcClient->executeWithCrypt($self->getRemoteMethod(), $param, $cryptInterface);
            $self->{logUtil}->putF(java::lang::Object::jstatic('org::allbinary::game::score::remote::XmlRpcRemoteHighScoresClient', 'RESULT') . $result->toString(), $self, $self->{commonStrings}->{GET});
            $self->{isOnline} = 1;
            return $result;
        } catch ($e) {
            $self->{logUtil}->put(java::lang::Object::jstatic('org::allbinary::game::score::remote::XmlRpcRemoteHighScoresClient', 'TRYING_OTHER_SERVERS') + 'org::allbinary::logic::java::exception::ExceptionUtil'->getInstance()->getStackTrace($e), $self, $self->{commonStrings}->{GET}, $e);
            if (!("" . $e)->startsWith(java::lang::Object::jstatic('org::allbinary::game::score::remote::XmlRpcRemoteHighScoresClient', 'HOST_NOT_RESOLVED'))) {
                return $self->tryAnother($anyType);
            } else {
                die (java::lang::Object::jstatic('org::allbinary::game::score::remote::XmlRpcRemoteHighScoresClient', 'HOST_NOT_RESOLVED_MSG'));
            }
        }
}

use java::lang::Object ();
use org::allbinary::logic::string::StringUtil ();
# use java::io::IOException ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();
use org::allbinary::init::crypt::jcehelper::CryptInterface ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::communication::xmlrpc::XmlRpcAbeClient ();
use org::allbinary::logic::java::exception::ExceptionUtil ();
use org::allbinary::logic::string::StringMaker ();
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface ();
use org::allbinary::util::ABHashtable ();
use org::apache::xmlrpc::XmlRpcClient ();
use org::apache::xmlrpc::XmlRpcException ();

1;

