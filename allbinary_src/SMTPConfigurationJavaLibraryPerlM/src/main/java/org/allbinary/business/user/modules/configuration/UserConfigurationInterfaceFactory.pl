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

package org::allbinary::business::user::modules::configuration::UserConfigurationInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

our $configurationName = "DefaultUserConfiguration";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance_j1_1 {
    my ($class, $document) = @_;
        my $configurationNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode(java::lang::Object::jstatic('org::allbinary::business::user::modules::configuration::UserConfigurationInterfaceFactory', 'UserConfigurationData')->{NAME}, $document->getChildNodes());
        return 'org::allbinary::business::user::modules::configuration::UserConfigurationView'->new($configurationNode)->getUserConfigurationInterface();
}


# throws Exception
sub getInstance_j1_2 {
    my ($class, $userRole) = @_;
        my $abPath = 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getMainPath() + 'org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{USERCONFIGURATIONPATH}, $org::allbinary::business::user::modules::configuration::UserConfigurationInterfaceFactory::configurationName . $userRole->toString() . 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP} . java::lang::Object::jstatic('org::allbinary::business::user::modules::configuration::UserConfigurationInterfaceFactory', 'UserConfigurationData')->{UNCRYPTED_EXTENSION});
        my $documentString = 'org::allbinary::logic::control::crypt::file::CryptFileReader'->new(java::lang::Object::jstatic('org::allbinary::business::user::modules::configuration::UserConfigurationInterfaceFactory', 'UserConfigurationData')->{UNCRYPTED_EXTENSION}, java::lang::Object::jstatic('org::allbinary::business::user::modules::configuration::UserConfigurationInterfaceFactory', 'UserConfigurationData')->{ENCRYPTED_EXTENSION})->get($abPath);
        my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($documentString);
        return 'org::allbinary::business::user::modules::configuration::UserConfigurationInterfaceFactory'->getInstance($document);
}


# throws Exception
sub getInstance_j0 {
    my ($class) = @_;
        return 'org::allbinary::business::user::modules::configuration::UserConfiguration'->new();
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j1(@arguments) if scalar(@arguments) == 1;
    return $invocant->getInstance_j0(@arguments) if scalar(@arguments) == 0;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

sub getInstance_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j1_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->getInstance_j1_2(@arguments);
}

use java::lang::Object ();
use org::allbinary::business::user::role::UserRole ();
use org::allbinary::data::tree::dom::DomSearchHelper ();
use org::allbinary::data::tree::dom::document::DomDocumentHelper ();
use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS ();
use org::allbinary::globals::URLGLOBALS ();
use org::allbinary::logic::control::crypt::file::CryptFileReader ();
use org::allbinary::logic::io::path::AbPath ();
use org::allbinary::logic::io::path::AbPathData ();
use org::w3c::dom::Document ();
use org::w3c::dom::Node ();
use org::allbinary::business::user::modules::configuration::UserConfigurationView ();
use org::allbinary::business::user::modules::configuration::UserConfiguration ();

1;

