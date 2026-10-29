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

package org::allbinary::logic::control::workflow::DbWorkFlowFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::control::workflow::DbWorkFlowFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::control::workflow::DbWorkFlowFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception, LicensingException
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $abeClientInformation, $hashMap) = @_;
        try {
            my $className = $hashMap->get($org::allbinary::business::DynamicObjectData::NAME);
            my $params = [(undef) x (1)];
            my $classes = [(undef) x (1)];
            $classes->[0] = ref($hashMap);
            $params->[0] = $hashMap;
            my $anyType = 'org::allbinary::logic::system::loader::AbeFactory'->getInstance()->getInstance($abeClientInformation, $className, $classes, $params);
            return 'org::allbinary::logic::control::workflow::WorkFlowWrapper'->new($anyType);
        } catch ($e) {
            if ($org::allbinary::logic::control::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::control::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORYERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "getInstance(HashMap)", $e);
            }
            die $e;
        }
}

use java::util::HashMap;
use org::allbinary::business::DynamicObjectData;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::loader::AbeFactory;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::control::workflow::WorkFlowWrapper;

1;

