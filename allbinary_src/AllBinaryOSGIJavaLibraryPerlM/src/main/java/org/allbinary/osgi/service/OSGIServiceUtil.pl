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

package org::allbinary::osgi::service::OSGIServiceUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::osgi::service::OSGIServiceUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::osgi::service::OSGIServiceUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getServicesObjectVector {
    my ($self, $bundleContext, $serviceReferences) = @_;
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        if (defined($serviceReferences)) {
            my $size = scalar(@{$serviceReferences});
            $self->{logUtil}->putF("Service References: " . $size, $self, "getServicesObjectVector");
            for (my $index = 0; $index < $size; $index++) {
                my $serviceReference = $serviceReferences->[$index];
                if (defined($serviceReference)) {
                    my $osgiServiceInterface = $bundleContext->getService($serviceReference);
                    if (!defined($osgiServiceInterface)) {
                        die ("No Service For Reference");
                    }
                    $vector->add($osgiServiceInterface);
                }
            }
        }
        return $vector;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::osgi::framework::BundleContext;
use org::osgi::framework::ServiceReference;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::osgi::OSGIServiceInterface;

1;

