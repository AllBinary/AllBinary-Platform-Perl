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

package org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigAndManipulatorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigAndManipulatorFactoryBase';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigAndManipulatorFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance_j0 {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigAndManipulatorFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
    return $self;
}


# throws Exception
sub getInstance_j3_1 {
    my ($self, $abeClientInformation, $transformInfoInterface, $objectConfigFileAbPath) = @_;
        try {
            my $data = 'org::allbinary::logic::control::crypt::file::CryptFileReader'->new(java::lang::Object::jstatic('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigAndManipulatorFactory', 'TransformInfoObjectConfigData')->getInstance()->{UNCRYPTED_EXTENSION}, java::lang::Object::jstatic('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigAndManipulatorFactory', 'TransformInfoObjectConfigData')->getInstance()->{ENCRYPTED_EXTENSION})->get($objectConfigFileAbPath);
            return $self->getInstance($abeClientInformation, $transformInfoInterface, 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($data));
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Could Not Load Object Config", __PACKAGE__->getInstance(), $self->{commonStrings}->{GET_INSTANCE}, $e);
            }
            die $e;
        }
}


# throws Exception
sub getInstance_j2 {
    my ($self, $abeClientInformation, $transformInfoInterface) = @_;
        try {
            my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
            if (defined($transformInfoInterface) && !$stringValidationUtil->isEmpty($transformInfoInterface->getStoreName())) {
                return 'org::allbinary::logic::visual::transform::info::objectConfig::GenericStoreTransformInfoObjectConfig'->new($abeClientInformation, $transformInfoInterface);
            } else {
                return 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfig'->new($transformInfoInterface);
            }
        } catch ($e) {
            my $error = "Failed To Get Instance: ";
            if (defined($transformInfoInterface)) {
                $error = $error . $transformInfoInterface->getName();
            }
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, __PACKAGE__->getInstance(), $self->{commonStrings}->{GET_INSTANCE}, $e);
            }
            die $e;
        }
}


# throws Exception
sub getInstance_j3_2 {
    my ($self, $abeClientInformation, $transformInfoInterface, $document) = @_;
        try {
            my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
            if (defined($transformInfoInterface) && !$stringValidationUtil->isEmpty($transformInfoInterface->getStoreName())) {
                return 'org::allbinary::logic::visual::transform::info::objectConfig::GenericStoreTransformInfoObjectConfig'->new($abeClientInformation, $transformInfoInterface, $document);
            } else {
                return 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfig'->new($transformInfoInterface, $document);
            }
        } catch ($e) {
            my $error = "Failed To Get Instance: ";
            if (defined($transformInfoInterface)) {
                $error = $error . $transformInfoInterface->getName();
            }
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, __PACKAGE__->getInstance(), "getInstance(document)", $e);
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
    return $invocant->getInstance_j3_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY')) && (!defined($arguments[2]) || (ref($arguments[2]) && ref($arguments[2]) ne 'ARRAY'));
    return $invocant->getInstance_j3_2(@arguments);
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::data::tree::dom::document::DomDocumentHelper ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::control::crypt::file::CryptFileReader ();
use org::allbinary::logic::io::path::AbPath ();
use org::allbinary::logic::string::StringValidationUtil ();
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface ();
use org::allbinary::logic::visual::transform::info::TransformInfoInterface ();
use org::w3c::dom::Document ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypes ();
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfig ();
use org::allbinary::logic::visual::transform::info::objectConfig::GenericStoreTransformInfoObjectConfig ();

1;

