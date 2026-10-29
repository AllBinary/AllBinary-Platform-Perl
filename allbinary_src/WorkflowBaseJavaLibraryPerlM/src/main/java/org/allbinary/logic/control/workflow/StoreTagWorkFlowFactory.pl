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

package org::allbinary::logic::control::workflow::StoreTagWorkFlowFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::control::workflow::StoreTagWorkFlowFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::control::workflow::StoreTagWorkFlowFactory::instance;
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
    my ($self, $abeClientInformation, $propertiesHashMap, $pageContext) = @_;
        try {
            my $workFlowClassName = $propertiesHashMap->get($org::allbinary::business::DynamicObjectData::NAME);
            if ($org::allbinary::logic::control::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::control::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORY})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Creating WorkFlow: ");
                $stringBuffer->append($workFlowClassName);
                $stringBuffer->append("->");
                $stringBuffer->append(ref($org::allbinary::logic::control::workflow::StoreTagWorkFlowFactory::instance));
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $commonStrings->{GET_INSTANCE});
            }
            my $params = [(undef) x (2)];
            my $classes = [(undef) x (2)];
            $classes->[0] = ref($propertiesHashMap);
            $classes->[1] = 'org::allbinary::logic::system::loader::AbeFactory'->getInstance()->getClass($abeClientInformation, "javax.servlet.jsp.PageContext");
            $params->[0] = $propertiesHashMap;
            $params->[1] = $pageContext;
            return 'org::allbinary::logic::system::loader::AbeFactory'->getInstance()->getInstance($abeClientInformation, $workFlowClassName, $classes, $params);
        } catch ($e) {
            if ($org::allbinary::logic::control::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::control::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORYERROR})) {
                my $workFlowClassName = $propertiesHashMap->get($org::allbinary::business::DynamicObjectData::NAME);
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Error Creating WorkFlow: ");
                $stringBuffer->append($workFlowClassName);
                $stringBuffer->append("->");
                $stringBuffer->append(ref($org::allbinary::logic::control::workflow::StoreTagWorkFlowFactory::instance));
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($stringBuffer->toString(), $self, $commonStrings->{GET_INSTANCE}, $e);
            }
            die $e;
        }
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::DynamicObjectData;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::loader::AbeFactory;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::string::CommonStrings;

1;

