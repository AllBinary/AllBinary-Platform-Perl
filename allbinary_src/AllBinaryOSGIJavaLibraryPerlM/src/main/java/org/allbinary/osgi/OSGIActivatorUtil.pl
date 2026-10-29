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

package org::allbinary::osgi::OSGIActivatorUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub registerAsService {
    my ($class, $bundleContext, $anyType, $serviceName) = @_;
        'org::allbinary::osgi::OSGIActivatorUtil'->registerAsService($bundleContext, $anyType, $serviceName, 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable());
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub registerAsService {
    my ($class, $bundleContext, $anyType, $serviceName, $properties) = @_;
        my $serviceRegistration = $bundleContext->registerService($serviceName, $anyType, $properties);
        my $serviceReference = $serviceRegistration->getReference();
        $serviceReference = $bundleContext->getServiceReference($serviceName);
        if ($serviceReference == 'org::osgi::framework::NullServiceReferenceFactory'->getInstance()->{NULL_SERVICE_REFERENCE}) {
            die ("No Such Service Reference");
        }
}

use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABHashtable;
use org::osgi::framework::BundleContext;
use org::osgi::framework::NullServiceReferenceFactory;
use org::osgi::framework::ServiceReference;
use org::osgi::framework::ServiceRegistration;

1;

