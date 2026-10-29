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

package admin::taghelpers::HelperFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws LicensingException
sub getInstance {
    my ($class, $abeClientInformation, $factoryName, $className, $hashMap, $httpServletRequest) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        try {
            my $params = [(undef) x (2)];
            my $classes = [(undef) x (2)];
            my $abeFactory = 'org::allbinary::logic::system::loader::AbeFactory'->getInstance();
            $classes->[0] = ref($hashMap);
            $classes->[1] = $abeFactory->getClass($abeClientInformation, "javax.servlet.http.HttpServletRequest");
            $params->[0] = $hashMap;
            $params->[1] = $httpServletRequest;
            my $anyType = $abeFactory->getInstance($abeClientInformation, $className, $classes, $params);
            return $anyType;
        } catch ($e) {
            my $error = "Failed To Get Instance Args: HashMap=" . $hashMap->toString() . " HttpServletRequest=" . $httpServletRequest;
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORYERROR})) {
                $logUtil->put($error, $factoryName . "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", $e);
            }
            die $e;
        }
}


# throws LicensingException
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($class, $abeClientInformation, $factoryName, $className, $hashMap, $pageContext) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        try {
            my $params = [(undef) x (2)];
            my $classes = [(undef) x (2)];
            my $abeFactory = 'org::allbinary::logic::system::loader::AbeFactory'->getInstance();
            $classes->[0] = ref($hashMap);
            $classes->[1] = $abeFactory->getClass($abeClientInformation, "javax.servlet.jsp.PageContext");
            $params->[0] = $hashMap;
            $params->[1] = $pageContext;
            my $anyType = $abeFactory->getInstance($abeClientInformation, $className, $classes, $params);
            return $anyType;
        } catch ($e) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORYERROR})) {
                my $error = "Failed To Get Instance Args: HashMap=" . $hashMap->toString() . " PageContext=" . $pageContext;
                $logUtil->put($error, $factoryName . "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", $e);
            }
            die $e;
        }
}


# throws LicensingException
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($class, $abeClientInformation, $factoryName, $className, $hashMap, $specialhashMap, $pageContext) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        try {
            my $params = [(undef) x (3)];
            my $classes = [(undef) x (3)];
            my $abeFactory = 'org::allbinary::logic::system::loader::AbeFactory'->getInstance();
            $classes->[0] = ref($hashMap);
            $classes->[1] = ref($specialhashMap);
            $classes->[2] = $abeFactory->getClass($abeClientInformation, "javax.servlet.jsp.PageContext");
            $params->[0] = $hashMap;
            $params->[1] = $specialhashMap;
            $params->[2] = $pageContext;
            my $anyType = $abeFactory->getInstance($abeClientInformation, $className, $classes, $params);
            return $anyType;
        } catch ($e) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORYERROR})) {
                my $error = "Failed To Get Instance Args: HashMap=" . $hashMap->toString() . " PageContext=" . $pageContext;
                $logUtil->put($error, $factoryName . "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", $e);
            }
            die $e;
        }
}


# throws LicensingException
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($class, $abeClientInformation, $factoryName, $className) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        try {
            my $anyType = 'org::allbinary::logic::system::loader::AbeFactory'->getInstance()->getInstance($abeClientInformation, $className);
            return $anyType;
        } catch ($e) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORYERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $logUtil->put($commonStrings->{EXCEPTION}, $factoryName . "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", $e);
            }
            die $e;
        }
}

use java::util::HashMap;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::loader::AbeFactory;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::string::CommonStrings;

1;

