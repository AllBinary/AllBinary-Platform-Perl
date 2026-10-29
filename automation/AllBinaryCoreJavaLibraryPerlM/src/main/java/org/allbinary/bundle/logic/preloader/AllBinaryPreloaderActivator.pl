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

package org::allbinary::bundle::logic::preloader::AllBinaryPreloaderActivator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::osgi::framework::BundleActivator';

our $context = undef;
our $CRYPT_REGISTRY_NAME = "bundle.abcs.logic.system.loader.CryptService";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getBundleContext {
    my ($class) = @_;
        return $org::allbinary::bundle::logic::preloader::AllBinaryPreloaderActivator::context;
}


# throws Exception
sub start {
    my ($self, $context) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "start");
            $org::allbinary::bundle::logic::preloader::AllBinaryPreloaderActivator::context = $context;
            $self->registerAsService();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "start", $e);
            die $e;
        }
}


# throws Exception
sub registerAsService {
    my ($self) = @_;
        my $properties = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
        my $serviceRegistration = $org::allbinary::bundle::logic::preloader::AllBinaryPreloaderActivator::context->registerService($CRYPT_REGISTRY_NAME, 'org::allbinary::bundle::logic::system::loader::CryptServiceFactory'->new(), $properties);
        my $serviceReference = $serviceRegistration->getReference();
        $serviceReference = $org::allbinary::bundle::logic::preloader::AllBinaryPreloaderActivator::context->getServiceReference($CRYPT_REGISTRY_NAME);
        if (!defined($serviceReference)) {
            die ("No Such Service Reference");
        }
}


# throws Exception
sub stop {
    my ($self, $context) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "stop");
}

use org::osgi::framework::BundleActivator;
use org::osgi::framework::BundleContext;
use org::osgi::framework::ServiceReference;
use org::osgi::framework::ServiceRegistration;
use org::allbinary::bundle::logic::system::loader::CryptServiceFactory;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;

1;

