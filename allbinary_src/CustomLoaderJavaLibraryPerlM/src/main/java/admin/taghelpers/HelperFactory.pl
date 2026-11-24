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
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


# throws LicensingException
sub getInstance_j5_1 {
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
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORYERROR})) {
                $logUtil->put($error, $factoryName . "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", $e);
            }
            die $e;
        }
}


# throws LicensingException
sub getInstance_j5_2 {
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
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORYERROR})) {
                my $error = "Failed To Get Instance Args: HashMap=" . $hashMap->toString() . " PageContext=" . $pageContext;
                $logUtil->put($error, $factoryName . "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", $e);
            }
            die $e;
        }
}


# throws LicensingException
sub getInstance_j6 {
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
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORYERROR})) {
                my $error = "Failed To Get Instance Args: HashMap=" . $hashMap->toString() . " PageContext=" . $pageContext;
                $logUtil->put($error, $factoryName . "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", $e);
            }
            die $e;
        }
}


# throws LicensingException
sub getInstance_j3 {
    my ($class, $abeClientInformation, $factoryName, $className) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        try {
            my $anyType = 'org::allbinary::logic::system::loader::AbeFactory'->getInstance()->getInstance($abeClientInformation, $className);
            return $anyType;
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORYERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $logUtil->put($commonStrings->{EXCEPTION}, $factoryName . "->HelperFactory", "getInstance(String, String, HashMap, PageContext)", $e);
            }
            die $e;
        }
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j5(@arguments) if scalar(@arguments) == 5;
    return $invocant->getInstance_j6(@arguments) if scalar(@arguments) == 6;
    return $invocant->getInstance_j3(@arguments) if scalar(@arguments) == 3;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

sub getInstance_j5 {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j5_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && !ref($arguments[1]) && !ref($arguments[2]) && (!defined($arguments[3]) || (ref($arguments[3]) && ref($arguments[3]) ne 'ARRAY')) && (!defined($arguments[4]) || (ref($arguments[4]) && ref($arguments[4]) ne 'ARRAY'));
    return $invocant->getInstance_j5_2(@arguments);
}

use java::lang::Object ();
use java::util::HashMap ();
# use javax::servlet::http::HttpServletRequest ();
# use javax::servlet::jsp::PageContext ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::system::loader::AbeFactory ();
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface ();
use org::allbinary::logic::system::security::licensing::LicensingException ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypes ();

1;

