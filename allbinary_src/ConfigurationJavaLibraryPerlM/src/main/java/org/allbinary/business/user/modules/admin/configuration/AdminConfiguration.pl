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

package org::allbinary::business::user::modules::admin::configuration::AdminConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::modules::admin::configuration::AdminConfigurationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{contextConfigurationInterface} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of AdminConfiguration takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->{contextConfigurationInterface} = 'org::allbinary::business::context::configuration::ContextConfigurationInterfaceFactory'->getInstance()->getInstance($org::allbinary::business::user::modules::admin::configuration::AdminConfigurationData::CONTEXTNAME);
    return $self;
}


sub _new1 {
    my ($class, $request) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->getFormData('org::allbinary::logic::communication::http::request::RequestParams'->new($request)->toHashMap());
    return $self;
}


sub _new1 {
    my ($class, $storeHashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->getFormData($storeHashMap);
    return $self;
}


# throws Exception
sub getFormData {
    my ($self, $storeHashMap) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "getFormData");
        $self->setContextConfigurationInterface('org::allbinary::business::context::configuration::ContextConfiguration'->new($storeHashMap));
}


# throws Exception
sub write {
    my ($self) = @_;
        my $contextConfigurationDomDocumentMapping = 'org::allbinary::business::context::configuration::ContextConfigurationDomDocumentMapping'->new($self->getContextConfigurationInterface());
        my $cryptFileWriter = 'org::allbinary::logic::control::crypt::file::CryptFileWriter'->new('org::allbinary::business::context::configuration::ContextConfigurationData'->getInstance()->{UNCRYPTED_EXTENSION}, 'org::allbinary::business::context::configuration::ContextConfigurationData'->getInstance()->{ENCRYPTED_EXTENSION});
        $cryptFileWriter->write('org::allbinary::business::context::configuration::ContextConfigurationPathUtil'->getAbPath($org::allbinary::business::user::modules::admin::configuration::AdminConfigurationData::CONTEXTNAME), $contextConfigurationDomDocumentMapping->toXmlDoc());
}


sub getContextConfigurationInterface {
    my ($self) = @_;
        return $self->{contextConfigurationInterface};
}


sub setContextConfigurationInterface {
    my ($self, $contextConfigurationInterface) = @_;
        $self->{contextConfigurationInterface} = $contextConfigurationInterface;
}

use java::util::HashMap;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::context::configuration::ContextConfiguration;
use org::allbinary::business::context::configuration::ContextConfigurationData;
use org::allbinary::business::context::configuration::ContextConfigurationDomDocumentMapping;
use org::allbinary::business::context::configuration::ContextConfigurationInterface;
use org::allbinary::business::context::configuration::ContextConfigurationInterfaceFactory;
use org::allbinary::business::context::configuration::ContextConfigurationPathUtil;
use org::allbinary::logic::communication::http::request::RequestParams;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::crypt::file::CryptFileWriter;
use org::allbinary::string::CommonStrings;
use org::allbinary::business::user::modules::admin::configuration::AdminConfigurationInterface;
use org::allbinary::business::user::modules::admin::configuration::AdminConfigurationData;

1;

