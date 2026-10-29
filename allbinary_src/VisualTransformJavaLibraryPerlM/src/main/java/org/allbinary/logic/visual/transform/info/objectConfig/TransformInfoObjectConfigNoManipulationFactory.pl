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

our $instance = 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigNoManipulationFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigNoManipulationFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $transformInfoInterface, $objectConfigFileAbPath) = @_;
        try {
            my $transformInfoObjectConfigData = 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance();
            my $data = 'org::allbinary::logic::control::crypt::file::CryptFileReader'->new($transformInfoObjectConfigData->{UNCRYPTED_EXTENSION}, $transformInfoObjectConfigData->getInstance()->{ENCRYPTED_EXTENSION})->get($objectConfigFileAbPath);
            return 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfig'->new($transformInfoInterface, 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($data));
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            if ($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Could Not Load Object Config", $self, $commonStrings->{GET_INSTANCE}, $e);
            }
            die $e;
        }
}

use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::crypt::file::CryptFileReader;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfig;

1;

