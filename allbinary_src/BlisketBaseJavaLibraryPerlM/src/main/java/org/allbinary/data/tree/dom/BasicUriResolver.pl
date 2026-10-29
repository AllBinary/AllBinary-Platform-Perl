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

package org::allbinary::data::tree::dom::BasicUriResolver;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::xml::transform::URIResolver';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{uriResolverStrings} = 'org::allbinary::data::tree::dom::URIResolverStrings'->getInstance();
    $self->{extension} = undef;
}


sub new {
    my ($class, $extension) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{extension} = $extension;
    return $self;
}


sub getExtension {
    my ($self) = @_;
        return $self->{extension};
}


# throws TransformerException
sub resolve {
    my ($self, $href, $base) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getMainPath());
            $stringBuffer->append('org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH});
            $stringBuffer->append($href);
            my $abPath = 'org::allbinary::logic::io::path::AbFilePath'->new($stringBuffer->toString());
            if ($org::allbinary::data::tree::dom::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::dom::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{XMLLOGGING})) {
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append($self->{uriResolverStrings}->{ATTEMPT});
                $stringBuffer->append($href);
                $stringBuffer->append($self->{uriResolverStrings}->{BASE});
                $stringBuffer->append($base);
                $stringBuffer->append($self->{uriResolverStrings}->{NEW_PATH});
                $stringBuffer->append($abPath->toString());
                $stringBuffer->append($self->{uriResolverStrings}->{NOTE});
                $stringBuffer->append('org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH});
                $stringBuffer->append($self->{uriResolverStrings}->{URL_GLOBAL});
                $stringBuffer->append($self->{uriResolverStrings}->{REQUIRED_EXTENSION});
                $stringBuffer->append($self->{extension});
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{uriResolverStrings}->{RESOLVE});
            }
            return 'javax::xml::transform::stream::StreamSource'->new('org::allbinary::logic::control::crypt::file::CryptFileReader'->new('org::allbinary::logic::visual::transform::info::template::TransformInfoTemplateData'->getInstance()->{UNCRYPTED_EXTENSION}, 'org::allbinary::logic::visual::transform::info::template::TransformInfoTemplateData'->getInstance()->{ENCRYPTED_EXTENSION})->getInputStream($abPath));
        } catch ($e) {
            die $e;
        }
}


sub toString {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getMainPath());
            $stringBuffer->append('org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH});
            $stringBuffer->append($self->{uriResolverStrings}->{IMPORT_URL});
            return $stringBuffer->toString();
        } catch ($e) {
            return "BasicUriResolver - Does not work without webapp path should be changed";
        }
}

# use javax::xml::transform::Source;
# use javax::xml::transform::TransformerException;
# use javax::xml::transform::URIResolver;
# use javax::xml::transform::stream::StreamSource;
use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::crypt::file::CryptFileReader;
use org::allbinary::logic::io::path::AbFilePath;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::transform::info::template::TransformInfoTemplateData;
use org::allbinary::data::tree::dom::URIResolverStrings;

1;

