# 
# AllBinary Open License Version 1 
# Copyright (c) 2019 AllBinary 
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

package org::allbinary::android::AndroidServicesUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::android::AndroidServicesUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{resourceUtil} = 'org::allbinary::data::resource::ResourceUtil'->getInstance();
    $self->{SERVICE_LIMIT_MAX} = 1000;
    $self->{IS_SERVICE_RUNNING} = "isServiceRunning";
    $self->{SERVICE_NOT_FOUND_RUNNING} = "Service not found Running: ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::android::AndroidServicesUtil::instance;
}


sub isServiceRunning {
    my ($self, $name) = @_;
        my $activityManager = $self->{resourceUtil}->getContext()->getSystemService($android::content::Context::ACTIVITY_SERVICE);
        my $runningServicesList = $activityManager->getRunningServices($self->{SERVICE_LIMIT_MAX});
        my $runningServiceInfo = undef;
        my $serviceComponent = undef;
        my $serviceName = undef;
        my $size = $runningServicesList->size();
        for (my $index = 0; $index < $size; $index++) {
            $runningServiceInfo = $runningServicesList->get($index);
            $serviceComponent = $runningServiceInfo->{service};
            $serviceName = $serviceComponent->toString();
            if (index($serviceName, $name) >= 0) {
                return 1;
            }
        }
        $self->{logUtil}->putF($self->{SERVICE_NOT_FOUND_RUNNING} . $name, $self, $self->{IS_SERVICE_RUNNING});
        return 0;
}

# use java::util::List;
use android::app::ActivityManager;
use android::app::ActivityManager::RunningServiceInfo;
use android::content::ComponentName;
use android::content::Context;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::logic::communication::log::LogUtil;

1;

