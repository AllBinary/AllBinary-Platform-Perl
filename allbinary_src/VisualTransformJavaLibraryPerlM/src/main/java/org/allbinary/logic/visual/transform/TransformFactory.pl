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

package org::allbinary::logic::visual::transform::TransformFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::visual::transform::TransformFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub getInstance_j0 {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::TransformFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


# throws Exception
sub getInstance_j3_1 {
    my ($self, $abeClientInformation, $viewName, $ownerTransformInfoInterface) = @_;
        try {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORY})) {
                $self->{logUtil}->putF("Creating Transform: " . $viewName, $self, $self->{commonStrings}->{GET_INSTANCE});
            }
            my $ownerTransformInfoHttpInterface = $ownerTransformInfoInterface;
            my $transformInfoEntity = 'org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder'->getInstance();
            my $transformInfoInterface = $transformInfoEntity->get($viewName, $ownerTransformInfoHttpInterface->getPropertiesHashMap(), $ownerTransformInfoHttpInterface->getPageContext());
            if (!defined($transformInfoInterface)) {
                die ("No Such View In DB: " . $viewName);
            }
            $transformInfoInterface->setChild();
            my $anyType = 'org::allbinary::logic::visual::transform::info::TransformInfoObjectFactory'->getInstance()->getInstance($abeClientInformation, $transformInfoInterface);
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORY})) {
                $self->{logUtil}->putF("Created Transform: " . $viewName, $self, $self->{commonStrings}->{GET_INSTANCE});
            }
            return $anyType;
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{GET_INSTANCE}, $e);
            }
            die $e;
        }
}


# throws Exception
sub getInstance_j3_2 {
    my ($self, $abeClientInformation, $propertiesHashMap, $pageContext) = @_;
        try {
            my $transformInfoData = 'org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance();
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORY})) {
                $self->{logUtil}->putF("Creating Transform: " . $propertiesHashMap->get($transformInfoData->{NAME}), $self, $self->{commonStrings}->{GET_INSTANCE});
            }
            my $transformInfoEntity = 'org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder'->getInstance();
            my $transformInfoInterface = $transformInfoEntity->get($propertiesHashMap->get($transformInfoData->{NAME}), $propertiesHashMap, $pageContext);
            if (defined($transformInfoInterface)) {
                $transformInfoInterface->override($propertiesHashMap);
            } else {
                $transformInfoInterface = 'org::allbinary::logic::visual::transform::info::TransformInfoHttpFactory'->getInstance($propertiesHashMap, $pageContext);
            }
            my $anyType = 'org::allbinary::logic::visual::transform::info::TransformInfoObjectFactory'->getInstance()->getInstance($abeClientInformation, $transformInfoInterface);
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORY})) {
                $self->{logUtil}->putF("Created Transform: " . $propertiesHashMap->get($transformInfoData->{NAME}), $self, $self->{commonStrings}->{GET_INSTANCE});
            }
            return $anyType;
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORYERROR})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Failed To Get Instance: ");
                $stringBuffer->append($propertiesHashMap->get('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{NAME}));
                $stringBuffer->append("->TransformFactory");
                $self->{logUtil}->put($stringBuffer->toString(), $self, $self->{commonStrings}->{GET_INSTANCE}, $e);
            }
            die $e;
        }
}


# throws Exception
sub getInstance_j2 {
    my ($self, $abeClientInformation, $transformInfoInterface) = @_;
        try {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORY})) {
                $self->{logUtil}->putF("Creating Transform: " . $transformInfoInterface->getName(), $self, "getInstance(TransformInfoInterface)");
            }
            my $anyType = 'org::allbinary::logic::visual::transform::info::TransformInfoObjectFactory'->getInstance()->getInstance($abeClientInformation, $transformInfoInterface);
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORY})) {
                $self->{logUtil}->putF("Created Transform: " . $transformInfoInterface->getName(), $self, "getInstance(TransformInfoInterface)");
            }
            return $anyType;
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getInstance(TransformInfoInterface)", $e);
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

sub getInstance_j3 {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j3_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && !ref($arguments[1]) && (!defined($arguments[2]) || (ref($arguments[2]) && ref($arguments[2]) ne 'ARRAY'));
    return $invocant->getInstance_j3_2(@arguments);
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use java::util::HashMap ();
# use javax::servlet::jsp::PageContext ();
use org::allbinary::data::tables::transform::info::TransformInfoEntity ();
use org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::string::StringMaker ();
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface ();
use org::allbinary::logic::visual::transform::info::TransformInfoData ();
use org::allbinary::logic::visual::transform::info::TransformInfoHttpFactory ();
use org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface ();
use org::allbinary::logic::visual::transform::info::TransformInfoInterface ();
use org::allbinary::logic::visual::transform::info::TransformInfoObjectFactory ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypes ();

1;

