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

package org::allbinary::logic::control::workflow::NewWorkFlowFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::control::workflow::NewWorkFlowFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance_j0 {
    my ($class) = @_;
        return $org::allbinary::logic::control::workflow::NewWorkFlowFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


# throws Exception, LicensingException
sub getInstance_j3 {
    my ($self, $abeClientInformation, $hashMap, $pageContext) = @_;
        try {
            my $className = $hashMap->get($org::allbinary::business::DynamicObjectData::NAME);
            my $params = [(undef) x (2)];
            my $classes = [(undef) x (2)];
            $classes->[0] = ref($hashMap);
            $classes->[1] = 'org::allbinary::logic::system::loader::AbeFactory'->getInstance()->getClass($abeClientInformation, "javax.servlet.jsp.PageContext");
            $params->[0] = $hashMap;
            $params->[1] = $pageContext;
            my $anyType = 'org::allbinary::logic::system::loader::AbeFactory'->getInstance()->getInstance($abeClientInformation, $className, $classes, $params);
            return 'org::allbinary::logic::control::workflow::WorkFlowWrapper'->new($anyType);
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORYERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "getInstance(HashMap)", $e);
            }
            die $e;
        }
}


# throws Exception, LicensingException
sub getInstance_j2 {
    my ($self, $abeClientInformation, $className) = @_;
        try {
            my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
            if (defined($className) && ($className cmp $stringUtil->{EMPTY_STRING}) != 0) {
                my $anyType = 'org::allbinary::logic::system::loader::AbeFactory'->getInstance()->getInstance($abeClientInformation, $className, undef, undef);
                return 'org::allbinary::logic::control::workflow::WorkFlowWrapper'->new($anyType);
            } else {
                die ("No WorkFlow ClassName");
            }
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORYERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
            }
            die $e;
        }
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->getInstance_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->getInstance_j2(@arguments) if scalar(@arguments) == 2;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use java::util::HashMap ();
# use javax::servlet::jsp::PageContext ();
use org::allbinary::business::DynamicObjectData ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::string::StringUtil ();
use org::allbinary::logic::system::loader::AbeFactory ();
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface ();
use org::allbinary::logic::system::security::licensing::LicensingException ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypes ();

1;

