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

package org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigNoManipulationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigNoManipulationFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance_j0 {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigNoManipulationFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


# throws Exception
sub getInstance_j2 {
    my ($self, $transformInfoInterface, $objectConfigFileAbPath) = @_;
        try {
            my $transformInfoObjectConfigData = java::lang::Object::jstatic('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigNoManipulationFactory', 'TransformInfoObjectConfigData')->getInstance();
            my $data = 'org::allbinary::logic::control::crypt::file::CryptFileReader'->new($transformInfoObjectConfigData->{UNCRYPTED_EXTENSION}, $transformInfoObjectConfigData->getInstance()->{ENCRYPTED_EXTENSION})->get($objectConfigFileAbPath);
            return 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfig'->new($transformInfoInterface, 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($data));
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Could Not Load Object Config", $self, $commonStrings->{GET_INSTANCE}, $e);
            }
            die $e;
        }
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->getInstance_j2(@arguments) if scalar(@arguments) == 2;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::data::tree::dom::document::DomDocumentHelper ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::control::crypt::file::CryptFileReader ();
use org::allbinary::logic::io::path::AbPath ();
use org::allbinary::logic::visual::transform::info::TransformInfoInterface ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypes ();
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfig ();

1;

