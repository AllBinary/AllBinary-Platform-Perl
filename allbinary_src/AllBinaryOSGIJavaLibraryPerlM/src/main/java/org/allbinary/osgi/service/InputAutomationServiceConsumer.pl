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

package org::allbinary::osgi::service::InputAutomationServiceConsumer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{osgiServiceUtil} = 'org::allbinary::osgi::service::OSGIServiceUtil'->getInstance();
    $self->{registryName} = undef;
    $self->{bundleContext} = undef;
    $self->{osgiServiceVisitorInterface} = undef;
}


sub new {
    my ($class, $registryName, $bundleContext, $osgiServiceVisitorInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setRegistryName($registryName);
        $self->setBundleContext($bundleContext);
        $self->setOsgiServiceVisitorInterface($osgiServiceVisitorInterface);
    return $self;
}


# throws Exception
sub process {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{PROCESS});
        my $vector = $self->{osgiServiceUtil}->getServicesObjectVector($self->getBundleContext(), $self->getServiceReferences());
        $self->{logUtil}->putF("Processing " . $vector->size() . " Services", $self, $self->{commonStrings}->{PROCESS});
        my $size = $vector->size();
        my $osgiServiceInterface = undef;
        for (my $index = 0; $index < $size; $index++) {
            $osgiServiceInterface = $vector->get($index);
            if (!$self->getOsgiServiceVisitorInterface()->visit($osgiServiceInterface)) {
                die ("Unable to process service: " . $osgiServiceInterface);
            }
        }
}


# throws Exception
sub getServiceReferences {
    my ($self) = @_;
        return $self->getBundleContext()->getServiceReferences($self->getRegistryName(), undef);
}


sub getBundleContext {
    my ($self) = @_;
        return $self->{bundleContext};
}


sub setBundleContext {
    my ($self, $aBundleContext) = @_;
        $self->{bundleContext} = $aBundleContext;
}


sub getRegistryName {
    my ($self) = @_;
        return $self->{registryName};
}


sub setRegistryName {
    my ($self, $registryName) = @_;
        $self->{registryName} = $registryName;
}


sub getOsgiServiceVisitorInterface {
    my ($self) = @_;
        return $self->{osgiServiceVisitorInterface};
}


sub setOsgiServiceVisitorInterface {
    my ($self, $osgiServiceVisitorInterface) = @_;
        $self->{osgiServiceVisitorInterface} = $osgiServiceVisitorInterface;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::osgi::framework::BundleContext;
use org::osgi::framework::ServiceReference;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::osgi::OSGIServiceInterface;
use org::allbinary::osgi::OSGIServiceVisitorInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::osgi::service::OSGIServiceUtil;

1;

